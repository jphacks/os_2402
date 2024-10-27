# Frequently Asked Questions (FAQ)

This document answers frequently asked questions to help streamline your development process and address common concerns.

---

## 1. General Questions

**Q: How do I configure environment variables?**
A: Environment variables can be configured in a `.env` file at the root of the project or through your CI/CD settings for production. Ensure sensitive values are encrypted or kept secure.

**Q: What testing frameworks are used in this project?**
A: We use:

- **Frontend**: Flutter’s built-in testing for unit tests and integration.
- **Backend**: Go’s `testing` package with additional frameworks as needed.
- **Machine Learning**: `pytest` for FastAPI components and model testing.

---

## 2. Frontend (Flutter/Dart)

**Q: How do I run the app locally?**
A: Run `flutter run` from the terminal. For specific device emulation, specify the device using `flutter run -d <device_id>`.

**Q: How do I generate GraphQL client files?**
A: Run `graphql_codegen` in the CLI, and ensure all queries and mutations are updated in the schema.

---

## 3. Backend (Gin/Go)

**Q: How do I set up the PostgreSQL database?**
A: Run the `atlas migrate` command for migration and use `ent.` ORM to set up and manage your database models.

**Q: What do I do if I encounter a 500 server error?**
A: Check logs for specific error messages. The most common issues involve database connections or unhandled exceptions.

---

## 4. Machine Learning (FastAPI/Python)

**Q: How do I load the ML models?**
A: Models are loaded from specified directories set in environment variables. Ensure the model path and file format (`pickle` format for conversation data) are correct.

**Q: How do I use Cloud Natural Language for sentiment analysis?**
A: Verify your API keys and endpoints, then send requests using FastAPI functions designed to handle the Cloud Natural Language API.

---

## 5. Infrastructure (Terraform / Google Cloud)

**Q: How do I deploy infrastructure changes?**
A: Use `terraform apply` after verifying your changes with `terraform plan`. Ensure all cloud permissions are set, and any sensitive data is secured.

**Q: What happens if my GitHub Actions pipeline fails?**
A: Check your `.github/workflows` directory for misconfigurations, ensure all secrets are correctly configured, and review logs to identify the cause.

---

## 6. Additional Resources

- [Flutter FAQ](https://flutter.dev/docs/resources/faq)
- [Gin Framework FAQ](https://github.com/gin-gonic/gin#faq)
- [FastAPI FAQ](https://fastapi.tiangolo.com/help-fastapi-faq/)
- [Terraform FAQ](https://developer.hashicorp.com/terraform/faq)

---

Feel free to reach out if your question isn't covered here!
