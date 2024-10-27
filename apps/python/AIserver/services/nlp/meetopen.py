import os
from datetime import datetime

import pickle
import vertexai
from vertexai.generative_models import GenerativeModel, ChatSession
from fastapi import APIRouter, Request
from fastapi.responses import JSONResponse

import core.config as config

router = APIRouter()
PROJECT_ID = config.PROJECT_ID
LOCATION = config.LOCATION
print(PROJECT_ID)
MODEL = GenerativeModel(
    "gemini-1.5-flash-002",
    system_instruction=[f"{config.INSTRUCTION_MEET}"])
vertexai.init(project=PROJECT_ID, location=LOCATION)

def makeOpen(data):
    # 現在時刻を取得
    dt = datetime.now()
    # datetime型から文字列に変換
    datetime_str = dt.strftime("%Y%m%d")
    # ユーザIDを取得
    userid = data["userid"]
    # ユーザーからの会話を取得
    if data["conversation"] == "":
        conversation = f"今は{datetime_str}です。会話を始めてください"
    else: 
        conversation = data["conversation"]
    #ファイル名指定
    USERFILE = f"{userid}_{datetime_str}.pkl"
    #ファイルあるとき
    if os.path.exists(USERFILE):
        with open(USERFILE, 'rb') as f:
            load_data = pickle.load(f)
            chat = MODEL.start_chat(history=load_data)
            text = getChatResponse(chat, conversation)
            history = chat._history
            with open(USERFILE, 'wb') as f:
                pickle.dump(history, f)
            
            return text
    else: 
        chat = MODEL.start_chat()
        text = getChatResponse(chat, conversation)
        history = chat._history
        with open(USERFILE, 'wb') as f:
            pickle.dump(history, f)
        
        return text
    
def getChatResponse(chat: ChatSession, prompt: str) -> str:
    response = chat.send_message(prompt)
    return response.text