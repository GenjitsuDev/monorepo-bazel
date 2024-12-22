import uvicorn
from fastapi import FastAPI

from apps.agent.src.main import ask_question
from apps.scraper.src.main import scrape_website


app = FastAPI(title="FastAPI")


@app.get("/scraper")
async def scrape_website(url: str):
    result = await scrape_website(url)
    return {"url": url, "result": result}


@app.get("/agent")
async def ask_question(question: str):
    result = await ask_question(question)
    return {"result": result}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=5005)
