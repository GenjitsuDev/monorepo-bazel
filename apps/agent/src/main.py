import emoji

from libs.shared.src.helpers import process_question


def ask_question(question: str):
    answer = process_question(question)

    return f"{emoji.emojize(':robot:')} {answer}"
