monorepo/
├── apps/
│   ├── mobile/                # Flutter app
│   │   ├── lib/               # Source code
│   │   ├── test/              # Unit tests
│   │   ├── graphql/           # GraphQL queries/mutations & codegen config
│   │   ├── melos.yaml         # Melos configuration
│   │   ├── pubspec.yaml       # Flutter dependencies
│   │   └── analysis_options.yaml # Linting configuration
│   └── backend/               # Gin backend service
│       ├── cmd/               # Entrypoints for the app
│       ├── internal/          # Application-specific logic
│       ├── pkg/               # Reusable Go packages
│       ├── db/                # Database migrations & ORM setup
│       ├── graphql/           # GraphQL schema
│       ├── go.mod             # Go module dependencies
│       └── go.sum
├── services/
│   ├── machine-learning/      # FastAPI machine learning service
│   │   ├── app/               # Source code for FastAPI
│   │   ├── models/            # ML models and data processing
│   │   ├── requirements.txt   # Python dependencies
│   │   └── tests/             # Unit tests
├── infrastructure/            # Terraform for infrastructure
│   ├── main.tf                # Main Terraform configuration
│   ├── google-cloud/          # GCP-specific configuration
│   └── sakura-cloud/          # Sakura-specific configuration
├── packages/                  # Shared packages (e.g., UI components, utilities)
│   ├── ui_components/         # Shared UI components for Flutter
│   ├── utils/                 # Common utility functions
│   └── schema/                # Shared GraphQL schema if needed
└── .moon/                     # Moon configuration
    └── workspace.yml          # Moon workspace configuration
