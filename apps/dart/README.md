# Flutter App

This is the code for a mobile web application using Flutter/Dart.
It uses an MVVM architecture and uses Melos for module management, GraphQL communication, and state management.

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
├── mason.yaml
├── pubspec.yaml
└── README.md
```

## Libraries

- [Melos](https://melos.invertase.dev/)
- [Flutter](https://flutter.dev/)
- [GraphQL](https://graphql.org/)
- [Widgetbook](https://www.widgetbook.io/)

## Packages overview

### `themes`

This package is responsible for the appearance of ThemeData and other appearance-related data used in Flutter apps.

### `util`

This package stores general-purpose functions that are too small to be cut out into a stand-alone package.

## App overview

### `services/{app_name}_app`

This is a template app package for Flutter apps.
It comes with dev, stg, and prod environments set up.

Change the app ID or app name to start building it as a separate app right away.

## How to start development

```shell
moon setup
```

The `mooo setup` command will install the required Dart packages, such as Mise and Melos.

## ToDo list required after creating a new repository using this template

1. Replace Bundle ID (Package name) with your App ID.
  `jp.co.altive.fat` -> `your.domain.id`
2. Change `appName` in `{flavor}.env` to your app name.
3. Create a project in Firebase.
4. Create an Android app, download `google-services.json`, and place it in `android/app/src/{dev or stg or prod}`.
5. Create an iOS app, download `GoogleService-Info.plist`, and place it in `ios/{dev or stg or prod}`.
6. Modify `googleReversedClientId` in `dart_defines/{dev, stg, prod}.env` to match the contents of each `GoogleService-Info.plist`.

## How to create a new package

If the project name and the output directory name of the package are the same,
`--project-name` can be omitted.

```shell
# Package
flutter create -t package packages/{directory_name} --project-name {project_name}
# App
flutter create --org jp.co.altive services/{directory_name} --project-name {project_name}
```

## Firebase SDK version for iOS

[mise.toml](mise.toml) manages the SDK version you wish to specify.

↓ For the latest version, click here.
<https://github.com/invertase/firestore-ios-sdk-frameworks/releases>
