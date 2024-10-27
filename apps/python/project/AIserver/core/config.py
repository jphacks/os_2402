from dotenv import load_dotenv
load_dotenv()

import os

PROJECT_ID = os.getenv('PROJECT_ID')
LOCATION = os.getenv('LOCATION')
INSTRUCTION_MEET = os.getenv('INSTRUCTION_MEET')
INSTRUCTION_DIARY = os.getenv('INSTRUCTION_DIARY')