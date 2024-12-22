import requests


def fetch_data(url: str) -> str:
    """Fetch raw HTML data from a URL."""
    response = requests.get(url)
    response.raise_for_status()
    return response.text


def process_question(question: str) -> str:
    """Mock function to process a question. In reality, could call OpenAI APIs."""
    # For simplicity, just echo the question back
    return f"You asked: {question}"
