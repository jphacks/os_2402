# Project Setup Guide

This document provides step-by-step instructions for setting up the project locally or in a development environment.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Environment Setup](#environment-setup)
3. [Component Setup](#component-setup)
   - Frontend
   - Backend
   - Machine Learning
4. [Running the Project](#running-the-project)
5. [Troubleshooting](#troubleshooting)

## Prerequisites

Before beginning, ensure you have the following tools installed:

- **Git**: Version control for cloning the repository
- **Docker**: For containerized development
- **Terraform**: Infrastructure management
- **Flutter**: Frontend SDK for Dart applications
- **Go**: Backend programming language
- **Python**: For machine learning components
- **Google Cloud CLI**: (Optional) For direct interaction with Google Cloud services

## Environment Setup

### 1. Clone the Repository

```bash
git clone https://github.com/your-organization/your-repo.git
cd your-repo
```

### 2. Install Dependencies

Run the following commands to install dependencies for each component:

```bash
# Frontend
flutter pub get

# Backend
go mod tidy

# Machine Learning
poetry install
```

### 3. Configure Environment Variables

Create `.env` files in each component's directory based on the provided `env.example` templates.

## Component Setup

### Frontend (Flutter/Dart)

1. Install Flutter SDK following the [Flutter installation guide](https://flutter.dev/docs/get-started/install)
2. Run setup commands:

   ```bash
   flutter clean
   flutter pub get
   flutter pub run graphql_codegen
   ```

### Backend (Gin/Go)

1. Install Go following the [Go installation guide](https://golang.org/doc/install)
2. Set up the database:

   ```bash
   # Initialize PostgreSQL database using Atlas
   atlas migrate apply
   ```

3. Run the backend server:

   ```bash
   go run main.go
   ```

### Machine Learning (FastAPI/Python)

1. Install Python requirements:

   ```bash
   pip install -r requirements.txt
   ```

2. Configure model paths:
   - Place pre-trained models in the specified directory
   - Or set paths in the `.env` file

3. Run the FastAPI server:

   ```bash
   uvicorn main:app --reload
   ```

## Running the Project

### Option 1: Using Docker Compose

Start all services in parallel:

```bash
docker-compose up
```

### Option 2: Manual Startup

Start each component individually in separate terminals:

1. Start the frontend server
2. Start the backend server
3. Start the ML service
4. Verify connections via the GraphQL schema

## Troubleshooting

If you encounter any issues during setup:

1. Refer to `debugging.md` for common problems and solutions
2. Check component-specific logs
3. Verify all environment variables are properly set
4. Ensure all required ports are available and not in use
