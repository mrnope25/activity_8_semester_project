# A Machine Learning-Based Skin Condition Classification and Screening System Using Imaging Analysis and User-Reported Symptoms

## Summary
This project is a web-based system that will help users screen common skin conditions. Users will upload a skin image and enter their symptoms, and the system will use machine learning-based imaging analysis together with the reported symptoms to give a preliminary classification. The system is for **screening support only** and does not replace a medical diagnosis from a licensed health professional.

**Activity 9 scope:** the Activity 8 Flutter Web project is extended with a Symptom Report form (`report_form_screen.dart`), reusable `AppButton` / `AppTextField` widgets, and four UI states (Loading, Success, Empty, Error). Submissions are **simulated** with a 3-second delay and an in-memory list. The machine learning model, image upload, REST API, and PostgreSQL database are **not yet implemented**.

## Current stack
| Layer | Status |
|---|---|
| Flutter Web / Dart (client UI) | Implemented (starter project + report form) |
| Git + GitHub (version control) | Implemented |
| REST API (instructor-approved backend) | Planned only (report submit is simulated) |
| PostgreSQL (database) | Planned only |
| Machine learning model (image classification) | Planned only |

## Run locally
Requirements: Flutter SDK, Google Chrome, and Git.

```
git clone https://github.com/mrnope25/activity_8_semester_project.git
cd semester_project
flutter pub get
flutter run -d chrome
```

Run all commands from the project root (the folder that contains `pubspec.yaml`). The app opens on the Home screen.

- **Open Login** goes to the Login placeholder.
- **Open Symptom Report** goes to the report form (`/report`).

### How to trigger each UI state
| State | Steps |
|---|---|
| Validation | Submit with empty or short fields; field-level messages appear. |
| Loading | Fill in valid fields and press **Submit Report**; the button is disabled for about 3 seconds. |
| Success | Let a valid submission finish without ticking **Simulate failure**. |
| Empty | Open the report screen before any report is submitted. |
| Error | Tick **Simulate failure**, submit valid fields, then press **Retry**. |

Press `Ctrl + C` in the terminal to stop the app.

## Project structure
```
lib/
├── main.dart                   # Entry point
├── app.dart                    # MaterialApp setup, theme, routes
├── screens/                    # home_screen.dart, login_screen.dart, report_form_screen.dart
├── widgets/                    # app_button.dart, app_text_field.dart (shared)
├── services/                   # Future API clients
├── models/                     # Future data models
├── routes/                     # Future routing helpers
└── constants/                  # App-wide constants (no secrets)
```

## Checkpoints
- Activity 8: Date October 13, 2026 | Commit: 862b764 ("Initial Flutter Web project")
- Activity 9: Commit: ______ ("Add report form and Flutter UI states")
