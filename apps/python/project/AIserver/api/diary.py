import json

from fastapi import APIRouter, Request
from fastapi.responses import JSONResponse

import services.nlp.makediary as makediary

router = APIRouter()

@router.post("/diary")
async def diary(request: Request):
    data = json.loads(await request.body())
    result = makediary.makeDiary(data)
    return JSONResponse(
        status_code=200,
        content={"message": result}
    )