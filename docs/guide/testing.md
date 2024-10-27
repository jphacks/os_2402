# Testing Guide

This document outlines the testing practices, tools, and procedures to ensure comprehensive coverage and quality assurance across all components.

---

## Table of Contents

- [Testing Guide](#testing-guide)
  - [Table of Contents](#table-of-contents)
  - [Testing Strategy](#testing-strategy)
  - [Testing Tools](#testing-tools)
  - [Testing Procedures](#testing-procedures)
    - [Frontend (Flutter/Dart)](#frontend-flutterdart)
      - [1. **Unit Tests**: Located in `test/`. Run with](#1-unit-tests-located-in-test-run-with)
      - [2. **Integration Tests**: Set up using `flutter_driver`. Run with](#2-integration-tests-set-up-using-flutter_driver-run-with)
    - [Backend (Gin/Go)](#backend-gingo)
      - [1. **Unit Tests**: Located in each module under pkg/. Run with](#1-unit-tests-located-in-each-module-under-pkg-run-with)
      - [2. **Integration Tests**: Test API endpoints using `httptest` and verify database interactions](#2-integration-tests-test-api-endpoints-using-httptest-and-verify-database-interactions)
    - [Machine Learning (FastAPI/Python)](#machine-learning-fastapipython)
      - [1. Unit Tests: Use pytest for FastAPI endpoints and model functions](#1-unit-tests-use-pytest-for-fastapi-endpoints-and-model-functions)
      - [2. Mock Testing: Mock external services like Cloud Natural Language and Vertex AI to simulate responses](#2-mock-testing-mock-external-services-like-cloud-natural-language-and-vertex-ai-to-simulate-responses)
  - [CI/CD Integration](#cicd-integration)
  - [Best Practices](#best-practices)

---

## Testing Strategy

This project uses a layered testing approach:

- **Unit Tests**: Validate individual functions and methods.
- **Integration Tests**: Ensure components work together correctly.
- **End-to-End (E2E) Tests**: Simulate real user flows and test the entire system.

## Testing Tools

- **Frontend**: Flutter’s built-in testing tools, `flutter_test`, and integration testing.
- **Backend**: Go’s `testing` package for unit and integration tests, `httptest` for HTTP-related testing.
- **Machine Learning**: `pytest` for FastAPI components, with model validation and mock testing for ML predictions.

## Testing Procedures

### Frontend (Flutter/Dart)

#### 1. **Unit Tests**: Located in `test/`. Run with

```bash
flutter test
```

#### 2. **Integration Tests**: Set up using `flutter_driver`. Run with

```bash
flutter drive --target=test_driver/app.dart
```

### Backend (Gin/Go)

#### 1. **Unit Tests**: Located in each module under pkg/. Run with

```bash
go test ./...
```

#### 2. **Integration Tests**: Test API endpoints using `httptest` and verify database interactions

### Machine Learning (FastAPI/Python)

#### 1. Unit Tests: Use pytest for FastAPI endpoints and model functions

```bash
pytest
```

#### 2. Mock Testing: Mock external services like Cloud Natural Language and Vertex AI to simulate responses

## CI/CD Integration

Tests are integrated into the CI/CD pipeline via GitHub Actions:

- Pre-push Hooks: Run unit tests and linting.
- Pre-deployment: Run integration and E2E tests.
- Post-deployment: Smoke tests to verify production health.

## Best Practices

- Test Coverage: Aim for 80% coverage across components.
- Data Isolation: Use separate test databases and mock data.
- Mock External Services: To isolate and test internal logic without relying on external dependencies.

For more details on testing standards, refer to the component-specific guides.
