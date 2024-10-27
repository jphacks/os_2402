import json

from fastapi import APIRouter, Request
from fastapi.responses import JSONResponse

import services.nlp.meetopen as meetopen
import services.nlp.meetclose as meetclose

router = APIRouter()

@router.post("/meetopen")
async def makeOpen(request: Request):
    # リクエストのデータを取得
    data = json.loads(await request.body())
    result = meetopen.makeOpen(data)
    return JSONResponse(
        status_code=200,
        content={"message": result}
    )

@router.post("/meetclose")
async def makeClose(request: Request):
    # リクエストのデータを取得
    data = json.loads(await request.body())
    result = meetclose.makeClose(data)
    return JSONResponse(
        status_code=200,
        content={"message": result}
    )