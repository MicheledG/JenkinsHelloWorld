from logging import getLogger, INFO
from random import choice
import json

logger = getLogger()
logger.setLevel(INFO)

GREETINGS_DATABASE = [
    "hi",
    "hello",
    "good morning",
    "good afternoon",
    "good evening",
    "good night",
    "bye",
    "ciao",
    "buongiorno",
    "buonasera",
    "buonanotte",
]


def lambda_handler(event, context):
    """
    Lambda entry point

    :param event:
    :param context:
    :return:
    """
    logger.info("Received event: %s", json.dumps(event, indent=2))
    random_greeting = choice(GREETINGS_DATABASE)
    logger.info("Chosen greeting: %s", random_greeting)
    response = {
        "statusCode": 200,
        "body": json.dumps({"randomGreeting": random_greeting}),
    }
    return response
