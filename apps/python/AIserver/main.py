from fastapi import FastAPI
import uvicorn

import api.diary as diary
import api.meet as meet

app = FastAPI()

app.include_router(diary.router)
app.include_router(meet.router)

if __name__ == "__main__":
    uvicorn.run(app, port=8000, log_level="debug")
