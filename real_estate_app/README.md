# PrimeEstate - Real Estate Flutter App

A premium, production-ready Real Estate app built with Flutter, Firebase, and Provider. It features role-based access (User, Seller, Admin), modular architecture, reusable widgets, and light/dark themes using Google Fonts (Poppins & Montserrat).

## Quick start

1. Ensure Flutter SDK is installed.
2. Get packages:
   ```bash
   flutter pub get
   ```
3. Configure Firebase (strongly recommended):
   - Install FlutterFire CLI and run:
     ```bash
     dart pub global activate flutterfire_cli
     flutterfire configure
     ```
   - This will generate `lib/firebase_options.dart` with real values.
4. Run the app:
   ```bash
   flutter run
   ```

The included `lib/firebase_options.dart` contains placeholders so the project compiles even before configuring Firebase. Replace it with the generated file for real backend connectivity.

## Project structure

See `lib/` for modular folders: `config`, `models`, `services`, `providers`, `screens`, `widgets`, and `utils`.