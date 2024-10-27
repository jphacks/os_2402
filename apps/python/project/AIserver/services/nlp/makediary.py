import os
import json
from datetime import datetime

import pickle
import vertexai
from vertexai.generative_models import GenerativeModel, ChatSession
from fastapi import APIRouter, Request

import core.config as config

PROJECT_ID = config.PROJECT_ID
LOCATION = config.LOCATION
print(PROJECT_ID)
MODEL = GenerativeModel(
    "gemini-1.5-flash-002",
    system_instruction=[f"{config.INSTRUCTION_DIARY}"])
vertexai.init(project=PROJECT_ID, location=LOCATION)

def makeDiary(data):
    # 現在時刻を取得
    dt = datetime.now()
    # datetime型から文字列に変換
    datetime_str = dt.strftime("%Y%m%d")
    # ユーザIDを取得
    userid = data["userid"]
    # ユーザーからの会話を取得
    conversation = data["conversation"]
    # ユーザーIDと日付から会話履歴ファイルを特定
    #USERFILE = f"{userid}_{datetime_str}.pkl"
    # テスト用
    USERFILE = "会話識別番号_006.pkl"
    
    chat = MODEL.start_chat(history=getPickleData(USERFILE))
    result = getChatResponse(chat, conversation)
    return result
    
def getChatResponse(chat: ChatSession, prompt: str) -> str:
    response = chat.send_message(prompt)
    return response.text

def getPickleData(userfile):
    with open(userfile, 'rb') as f:
        load_data = pickle.load(f)
        return load_data