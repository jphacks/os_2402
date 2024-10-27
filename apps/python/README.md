# Machine Learning

This directory contains a machine learning backend using FastAPI/Python.
Leverage Cloud Natural Language and Vertex AI to perform a variety of natural language processing and generation tasks.

## Directory structure

```shell
.
├── project
│   ├── {project_name}
│   │   ├── main.py                        # FastAPI entry point
│   │   ├── api
│   │   │   ├── endpoints                  # Define each API endpoint
│   │   │   │   ├── __init__.py
│   │   │   │   ├── text_analysis.py       # Natural language processing API endpoints
│   │   │   │   └── model_inference.py     # Model inference API endpoint
│   │   │   └── dependencies.py            # Dependencies common to each endpoint
│   │   ├── services
│   │   │   ├── nlp                        # Natural language processing related processing
│   │   │   │   ├── __init__.py
│   │   │   │   ├── preprocessing.py       # Text preprocessing logic
│   │   │   │   └── sentiment_analysis.py  # Implementation of sentiment analysis function
│   │   │   └── model                      # Model inference related processing
│   │   │       ├── __init__.py
│   │   │       ├── load_model.py          # Loading and preparing the model
│   │   │       └── inference.py           # Implement inference processing
│   │   ├── core
│   │   │   ├── config.py                  # Environment settings, API key and endpoint settings
│   │   │   └── utils.py                   # common utility functions
│   │   └── models                         # ML model save directory
│   │       ├── model_v1.pkl               # Model data saved with pickle
│   │       └── tokenizer.pkl              # Preprocessed tokenizer
│   └── __init__.py
├── pyproject.toml                         # Poetry settings file
├── poetry.toml                            # Poetry project file
├── poetry.lock
└── README.md

```

## Libraries

- [FastAPI](https://fastapi.tiangolo.com/fastapi-cli/)
- [Pickle](https://docs.python.org/3/library/pickle.html)

## App overview

The machine learning side of the app is built with FastAPI and Python and provides AI capabilities using natural language processing and generative models.
It defines various API endpoints and is designed to be called from the application side.

## How to start development

```shell
moon setup
```

The `mooo setup` command will install the required Dart packages, such as Mise and Poetry.

## ToDo list required after creating a new repository using this template

1. Setting environment variables: Create an `.env` file and set various API keys and endpoints
2. Connection confirmation with external services (Vertex AI and Cloud Natural Language)
3. Prepare training data and import pre-trained models if necessary

## How to create a new package

If the project name and the output directory name of the package are the same,
`--project-name` can be omitted.

```shell
# Package
flutter create -t package packages/{directory_name} --project-name {project_name}
# App
flutter create --org jp.co.altive services/{directory_name} --project-name {project_name}
```
