from pydantic import AnyHttpUrl

from libs.shared.src.helpers import fetch_data


def scrape_website(url: AnyHttpUrl):
    return fetch_data(url)
