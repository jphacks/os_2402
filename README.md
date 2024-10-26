# サンプル（プロダクト名）

[![IMAGE ALT TEXT HERE](https://jphacks.com/wp-content/uploads/2024/07/JPHACKS2024_ogp.jpg)](https://www.youtube.com/watch?v=DZXUkEj-CSI)

## 製品概要

### 背景(製品開発のきっかけ、課題等）

### 製品説明（具体的な製品の説明）

### 特長

#### 1. 特長1

#### 2. 特長2

#### 3. 特長3

### 解決出来ること

### 今後の展望

### 注力したこと（こだわり等）

*
*

## 開発技術

### 活用した技術

#### API・データ

*
*

#### フレームワーク・ライブラリ・モジュール

*
*

#### デバイス

*
*

### 独自技術

#### ハッカソンで開発した独自機能・技術

* 独自で開発したものの内容をこちらに記載してください
* 特に力を入れた部分をファイルリンク、またはcommit_idを記載してください。

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
