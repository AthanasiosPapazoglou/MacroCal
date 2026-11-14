# MacroCal

**MacroCal** is a cross-platform application that enables users to track their daily calory and nutritional intake. The app helps users manage their dietary habits by registering the quantities of the food products they consume on a daily basis and providing insights based on their personal biological profiles.

# [MacroCal Web](https://athanasiospapazoglou.github.io/MacroCal/)

## Features

- **Custom Profiles:** Create your biological profile to get a fully customized experience for yourself.
- **Food Logging:** Register the food products you consume on a regular or occasional basis.
- **Recipes:** Build your own dishes from the ingredients in your Food Bank, with the grams of each and an optional cooked weight, and log them by the grams you eat.
- **Caloric and Nutritional Tracking:** Monitor your daily intake of calories, proteins, dietary fiber, sugars, saturated fats, and salt.
- **Exercise Logging:** Record your exercise activities to adjust your caloric requirements and macronutrient thresholds.
- **Goal Setting:** Set and track your nutritional and caloric goals based on your health objectives. (In Progress)
- **History and Insights:** Archive a day from the Overview, then review your last 7 days, 30 days or all time: averages, goal adherence, a daily calories chart, your macro split, a logging streak and each archived day in detail.

## Getting Started

Follow these instructions to get a copy of MacroCal up and running on your local machine for development and testing purposes.

### Prerequisites

To develop and run the MacroCal application using Flutter, you need to set up your development environment. Below are the steps and tools required:

1. **Flutter SDK:**
   - Download and install the Flutter SDK from the official [Flutter website](https://flutter.dev/docs/get-started/install).
   - The project needs Flutter 3.47 or newer (Dart 3.13 or newer).
   - Follow the installation instructions for your operating system (Windows, macOS, or Linux).
   - After installation, add Flutter to your system path.

2. **Dart SDK:**
   - The Dart SDK is bundled with Flutter, so you don't need to install it separately.

3. **Android Studio:**
   - Download and install Android Studio from the [Android Studio website](https://developer.android.com/studio).
   - During installation, make sure to include the Android SDK and Android Virtual Device (AVD).
   - Set up an Android emulator or connect a physical Android device for testing.

4. **Xcode (macOS only):**
   - Download and install Xcode from the Mac App Store.
   - Open Xcode and agree to the license agreement.
   - Ensure you have the latest version of Xcode command-line tools:
     ```bash
     xcode-select --install
     ```

5. **CocoaPods (macOS only):**
   - CocoaPods is used for managing iOS dependencies.
     ```bash
     sudo gem install cocoapods
     ```

6. **Visual Studio Code (Optional):**
   - Download and install Visual Studio Code from the [VS Code website](https://code.visualstudio.com/).
   - Install the Flutter and Dart plugins for VS Code for a better development experience.

7. **Git:**
   - Ensure Git is installed on your machine to clone the repository.
   - Download Git from the official [Git website](https://git-scm.com/).

8. **Device Setup:**
   - **Android:** Enable USB debugging on your Android device or set up an Android emulator.
   - **iOS (macOS only):** Set up a physical iOS device or an iOS simulator.

### Installation

1. **Clone the Repository:**
    ```bash
    git clone https://github.com/AthanasiosPapazoglou/MacroCal.git
    cd MacroCal
    ```

2. **Install Dependencies:**
    ```bash
    flutter pub get
    ```

3. **Run the Application:**
    ```bash
    flutter run
    ```

    This will compile and run the app on an emulator or a physical device.

### Additional Setup for iOS (macOS only)

If you are developing on macOS, you need to set up additional tools for iOS development.

1. **Install Xcode:**
    - Download and install Xcode from the Mac App Store.
    - Open Xcode and agree to the license agreement.
    - Ensure you have the latest version of Xcode command-line tools:
      ```bash
      xcode-select --install
      ```

2. **Set Up CocoaPods:**
    - CocoaPods is used to manage iOS dependencies.
      ```bash
      sudo gem install cocoapods
      cd ios
      pod install
      cd ..
      ```

3. **Run the Application on iOS:**
    ```bash
    flutter run
    ```

### Additional Setup for Android

1. **Install Android Studio:**
    - Download and install Android Studio from [here](https://developer.android.com/studio).
    - Set up the Android emulator or connect a physical device.

2. **Configure Android Device:**
    - Ensure USB debugging is enabled on your device.
    - Connect your device via USB or start the Android emulator from Android Studio.

3. **Run the Application on Android:**
    ```bash
    flutter run
    ```

## Usage

1. **Create a Profile:**
    - Enter your personal information such as gender, weight, height, age, and activity level.
  
2. **Log Food:**
    - Add food items to your Food Bank by selecting from a database of common foods or entering custom foods.
    - Switch the Food Bank to Recipes to build a dish from your ingredients; enter its final weight if cooking changes it.
    - On the Consumption page, use the Ingredients | Recipes switch to log grams of either.
  
3. **Track Exercise:**
    - Record your daily exercise activities to adjust your caloric requirements.

4. **Archive the Day:**
    - Tap the save button on the Overview to store the day's intake in your history. Archiving is manual: a day you don't archive does not appear in the history.

5. **View Insights:**
    - Open the History tab to see your statistics and charts for a range, tap a day for its details, or delete it from there.

## Architecture

MacroCal uses a feature-first clean architecture with [bloc](https://bloclibrary.dev) cubits for state and [drift](https://drift.simonbinder.eu) (SQLite) for storage.

```
lib/
├── main.dart            # calls bootstrap()
├── bootstrap.dart       # composition root: database, repositories, use cases → App
├── app/                 # App widget, router (go_router), theme, tab shell
├── core/                # database, l10n, shared widgets, asset paths, plain-Dart helpers
└── features/
    ├── settings/        # language
    ├── profile/         # daily goals and body metrics
    ├── food_bank/       # ingredients and recipes: catalog, forms, details, barcode lookup (Open Food Facts)
    ├── today/           # overview, consumption of ingredients and recipes, exercise, archive day
    └── history/         # archived days, statistics, charts, day detail
        ├── domain/      # entities, repository interfaces, services; plain Dart only
        ├── data/        # drift and http implementations of the repositories
        └── presentation/# cubits, pages, widgets
```

Rules the code follows:

- **Dependencies point inward:** `presentation → domain ← data`. Domain code imports no Flutter, drift or http; `test/architecture_test.dart` enforces this.
- **Drift is the single source of truth.** Repositories expose streams, so every screen watching the same data updates on its own.
- **Cubits never call other cubits or use a `BuildContext`**, and widgets never call repositories directly.
- **Features don't import each other's `data/` or `presentation/`.** Shared needs go through domain interfaces.
- **`XPage` provides the cubit and `XView` builds the UI.** Only `LocaleCubit` and `OverviewCubit` live app-wide.
- **Generated code is committed** (`*.g.dart`, `*.freezed.dart`, `lib/core/l10n/gen/`), so a fresh checkout runs with a plain `flutter run`.

## Development commands

```bash
flutter analyze
```

```bash
flutter test
```

```bash
flutter test integration_test -d <device id>
```

```bash
dart run build_runner build
```

```bash
flutter gen-l10n
```

- `flutter test` runs the unit, widget and drift migration tests in `test/`.
- The `integration_test/` end-to-end test drives the real app on an in-memory database; run it on an iOS simulator or macOS (`flutter devices` lists the ids).
- Run `build_runner` after changing a drift table, a freezed class or a `json_serializable` DTO, and commit the output.
- Run `gen-l10n` after editing `lib/core/l10n/arb/app_en.arb` or `app_el.arb`. Every new string goes in both files.

## Adding a feature

1. Create `lib/features/<name>/{domain,data,presentation}`.
2. Add any tables in `lib/core/database/tables`, bump `schemaVersion` in `app_database.dart`, run `dart run drift_dev make-migrations`, and add a step-by-step migration with its test in `test/drift/`.
3. Add the repository interface (domain), its drift implementation (data), and the cubit, page and view (presentation).
4. Register the repository in `bootstrap.dart` and `App`, add the route in `lib/app/router`, and add the strings to both ARB files.
5. Add tests that mirror each layer under `test/features/<name>/`.

## Contributing

We welcome contributions from the community! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature-name`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature-name`).
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Legal Disclaimer

**MacroCal** is intended solely for informational and educational purposes and is not intended to be a substitute for professional medical advice, diagnosis, or treatment. The content provided by MacroCal, including but not limited to text, graphics, images, and other material, is for informational purposes only and should not be considered medical advice.

**Important Points:**
- Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition.
- Never disregard professional medical advice or delay in seeking it because of something you have read or accessed through MacroCal.
- If you think you may have a medical emergency, call your doctor, go to the emergency department, or call emergency services immediately.
- Reliance on any information provided by MacroCal is solely at your own risk.

**No Liability:**
- Under no circumstances shall the developers, contributors, or any parties involved in the creation, production, or delivery of MacroCal be liable for any direct, indirect, incidental, special, or consequential damages that result from the use of, or the inability to use, the app, including but not limited to, your reliance on any information obtained from MacroCal that results in mistakes, omissions, interruptions, deletion or corruption of files, viruses, delays in operation or transmission, or any failure of performance.
- You expressly acknowledge and agree that MacroCal and its developers are not responsible for the results of your decisions resulting from the use of the app, including but not limited to your choosing to seek or not seek professional medical care, or from choosing or not choosing specific treatment based on the app’s content.

**User Responsibility:**
- You agree to indemnify, defend, and hold harmless the developers, contributors, and any parties involved in the creation, production, or delivery of MacroCal from and against any and all claims, damages, costs, and expenses, including attorneys' fees, arising from or related to your use or misuse of the app.

By using MacroCal, you agree to the terms of this legal disclaimer. If you do not agree to these terms, please do not use the app.

## Contact

If you have any questions, feel free to contact us 
