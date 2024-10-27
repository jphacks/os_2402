# Debugging Guide

This document provides a structured approach to troubleshoot common issues that may arise during the development of this project. Ensure to follow each step in the order presented to identify and resolve the issue effectively.

---

## 1. General Tips

- **Check Logs**: Always inspect logs for errors. Use debug logs by setting the environment variable `DEBUG=true`.
- **Clear Cache**: Clear any cached data that may be outdated.
- **Environment Variables**: Confirm that all required environment variables are set correctly.

---

## 2. Common Issues

### Frontend (Flutter/Dart)

#### Issue: App Crashes or Fails to Build

- **Cause**: Dependency issues or missing files.
- **Solution**:
  1. Run `flutter clean` to clear any cached builds.
  2. Run `flutter pub get` to fetch the dependencies.
  3. If using GraphQL, ensure `graphql_codegen` is executed to generate client files.

#### Issue: State Not Updating

- **Cause**: State management conflict (e.g., Riverpod not updating).
- **Solution**:
  1. Check if the state provider or notifier is correctly implemented.
  2. Ensure that `flutter_hooks` and `graphql_flutter` are not conflicting by reviewing the widget lifecycle.

---

### Backend (Gin/Go)

#### Issue: API Returns 500 Error

- **Cause**: Server-side error or unhandled exception.
- **Solution**:
  1. Check logs using `gin-gonic` debug logs.
  2. Verify database migrations with `atlas` and ensure models are synced.
  3. Test individual endpoints using `curl` or Postman.

#### Issue: Database Migration Fails

- **Cause**: Incompatible schema or missing permissions.
- **Solution**:
  1. Run `atlas migrate diff` to view differences.
  2. Confirm PostgreSQL credentials and permissions.
  3. Re-run `ent generate` if model definitions have changed.

---

### Machine Learning (FastAPI/Python)

#### Issue: ML Model Load Error

- **Cause**: Model path issue or environment variable misconfiguration.
- **Solution**:
  1. Confirm model files are in the correct directory.
  2. Check if `pickle` files are correctly formatted.
  3. Use `Cloud Natural Language` logs for insights on issues.

#### Issue: GraphQL Endpoint Fails

- **Cause**: FastAPI setup or GraphQL schema issues.
- **Solution**:
  1. Ensure that the GraphQL schema is shared correctly between frontend and backend.
  2. Check for API key and endpoint configurations for Vertex AI.

---

### Infrastructure (Terraform / DevSecOps)

#### Issue: Terraform Apply Fails

- **Cause**: Incorrect configuration or outdated provider.
- **Solution**:
  1. Run `terraform init` to initialize.
  2. Confirm resource quotas and API availability in Google Cloud and Sakura Cloud.
  3. Verify all configuration files for syntax errors.

#### Issue: GitHub Actions Failing

- **Cause**: CICD pipeline misconfiguration.
- **Solution**:
  1. Check the workflow files under `.github/workflows/`.
  2. Ensure formatting, linting, and test scripts are correctly referenced.
  3. Re-run jobs with debug logs enabled.

---

### 3. Additional Resources

- [Flutter Debugging Guide](https://flutter.dev/docs/testing/debugging)
- [Gin Framework Troubleshooting](https://github.com/gin-gonic/gin#troubleshooting)
- [FastAPI Troubleshooting](https://fastapi.tiangolo.com/tutorial/debugging/)
- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)

---

Happy debugging!
