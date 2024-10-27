import os
from datetime import datetime

import pickle
import vertexai
from vertexai.generative_models import GenerativeModel, ChatSession
from google.cloud import language_v1
from fastapi import APIRouter, Request
from fastapi.responses import JSONResponse

import core.config as config

router = APIRouter()
PROJECT_ID = config.PROJECT_ID
LOCATION = config.LOCATION
print(PROJECT_ID)
MODEL = GenerativeModel(
    "gemini-1.5-flash-002",
    system_instruction=[f"{config.INSTRUCTION_DIARY}"])
vertexai.init(project=PROJECT_ID, location=LOCATION)
client = language_v1.LanguageServiceClient()

def makeClose(data):
    # 現在時刻を取得
    dt = datetime.now()
    # datetime型から文字列に変換
    datetime_str = dt.strftime("%Y%m%d")
    # ユーザIDを取得
    userid = data["userid"]
    #ファイル名指定
    #USERFILE = f"{userid}_{datetime_str}.pkl"
    USERFILE = "会話識別番号_006.pkl"
    
    if os.path.exists(USERFILE):
        with open(USERFILE, 'rb') as f:
            load_data = pickle.load(f)
            chat = MODEL.start_chat(history=load_data)
            text_content = getChatResponse(chat, "1日の日記を作成してください")
            score, magnitude = sentiment_analysis(text_content)
            return {
                "diary": text_content,
                "score": score,
                "magnitude": magnitude
            }
    else: 
        return "ファイルが存在しません"

# チャットの応答を取得
def getChatResponse(chat: ChatSession, prompt: str) -> str:
    response = chat.send_message(prompt)
    return response.text

# テキストの感情分析
def sentiment_analysis(text_content):
    document = language_v1.types.Document(
        content=text_content, type_=language_v1.types.Document.Type.PLAIN_TEXT
    )
    sentiment = client.analyze_sentiment(
        request={"document": document}
    ).document_sentiment
    return sentiment.score, sentiment.magnitude