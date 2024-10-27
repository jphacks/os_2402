# Gin/Go

This directory contains the code for the backend server using Gin/Go.
It provides a GraphQL API in a modular monolith configuration.

## Directory structure

```shell
.
├── services
│   ├── {app_name}_app
│   │   ├── android
│   │   ├── ios
│   │   ├── assets
│   │   ├── dart_defines               # Dart defines for each environment
│   │   │   ├── {dev, stg, prod}.env
│   │   ├── lib
│   │   ├── test
│   │   ├── analysis_options.yaml
│   │   ├── build.yaml
│   │   ├── firebase.json
│   │   ├── flutter_launcher_icons-{dev, stg, prod}.yaml
│   │   ├── pubspec.yaml
│   │   └── slang.yaml
├── packages
│   ├── themes
│   └── util
├── melos.yaml
├── mise.toml
└── README.md
```

## Libraries

- [Melos](https://melos.invertase.dev/)
- [Mise](https://mise.jdx.dev/)
- [Gin](https://gin-gonic.com/)
- [ent](https://entgo.io/)
- [Atlas](https://atlasgo.io/)

## App overview

### `services/{service_name}`

This is a template app package for Flutter apps.
It comes with dev, stg, and prod environments set up.

Change the app ID or app name to start building it as a separate app right away.

## How to start development

```shell
moon setup
```

The `mooo setup` command will install the required Dart packages, such as Mise and Melos.

## ToDo list required after creating a new repository using this template

1. Create an environment variable configuration file in `.env` and set various keys for the database and API.
2. Update GraphQL schema and queries as needed
3. Add test cases including validation of API requests and responses

## How to create a new package

If the project name and the output directory name of the package are the same,
`--project-name` can be omitted.

```shell
# Package
flutter create -t package packages/{directory_name} --project-name {project_name}
# App
flutter create --org jp.co.altive services/{directory_name} --project-name {project_name}
```
