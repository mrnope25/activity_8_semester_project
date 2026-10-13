# A Machine Learning-Based Skin Condition Classification and Screening System Using Imaging Analysis and User-Reported Symptoms

## Summary
This project is a web-based system that will help users screen common skin conditions. Users will upload a skin image and enter their symptoms, and the system will use machine learning-based imaging analysis together with the reported symptoms to give a preliminary classification. The system is for **screening support only** and does not replace a medical diagnosis from a licensed health professional.

**Activity 8 scope:** this checkpoint only contains the initialized Flutter Web project, the organized `lib/` structure, and the starter Home and Login screens. The machine learning model, image upload, symptom form, REST API, and database are **not yet implemented**.

## Current stack
| Layer | Status |
|---|---|
| Flutter Web / Dart (client UI) | Implemented (starter project) |
| Git + GitHub (version control) | Implemented |
| REST API (instructor-approved backend) | Planned only |
| PostgreSQL (database) | Planned only |
| Machine learning model (image classification) | Planned only |

## Run locally
Requirements: Flutter SDK, Google Chrome, and Git.

```
git clone https://github.com/mrnope25/activity_8_semester_project.git
cd activity_8_semester_project
flutter pub get
flutter run -d chrome
```

Run all commands from the project root (the folder that contains `pubspec.yaml`). The app opens in Chrome with the Home screen. Click **Open Login** to go to the Login screen. Press `Ctrl + C` in the terminal to stop the app.

## Project structure
```
lib/
├── main.dart        # Entry point
├── app.dart         # MaterialApp setup, theme, routes
├── screens/         # home_screen.dart, login_screen.dart
├── widgets/         # app_button.dart, app_text_field.dart
├── services/        # Future API clients
├── models/          # Future data models
├── routes/          # Future routing helpers
└── constants/       # App-wide constants (no secrets)
```

## First checkpoint
Date: October 13, 2026 | Commit: __________
