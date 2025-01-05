<div align="center">

# *"وَقُلْ رَبِّ زِدْنِي عِلْمًا"*

</div>

# Settings (Theming and Localization) Flutter App template

This Flutter app demonstrates how to implement dynamic theming and localization using the **BLoC** state management library and shared preferences for persistent storage. Users can switch between light, dark, and system themes, as well as select their preferred app language.

## Features

- **Dynamic Theming:**
  - Light Mode
  - Dark Mode
  - System Default Theme

- **Dynamic Localization:**
  - English
  - Arabic
  - System Default Locale

- **State Management:**
  - BLoC (Cubit) for managing theme and localization states

- **Persistent Preferences:**
  - SharedPreferences to save user settings locally

## Project Structure

```plaintext
lib/
├── main.dart                # Main entry point of the app
├── settings_cubit.dart      # Cubit for managing theme and locale settings
├── settings_state.dart      # State representation for SettingsCubit
├── settings_screen.dart     # UI for settings screen
├── language/
│   ├── app_localizations.dart       # Localization helper
│   ├── app_localizations_setup.dart # Localization setup and configurations
│   ├── lang_keys.dart               # Keys for translatable strings
```

## Implementation Details

### 1. State Management
**SettingsCubit** in `settings_cubit.dart` is used to manage the app's theme and locale states. It interacts with `SharedPreferences` to persist user preferences.

### 2. UI Components
**SettingsScreen** in `settings_screen.dart` provides a user-friendly interface to select theme and language preferences. It uses `BlocBuilder` to rebuild the UI whenever settings are updated.

### 3. Localization
- **AppLocalizations**: Provides translation based on the selected language.
- **AppLocalizationsSetup**: Configures supported locales and localization delegates.

### 4. Persistent Storage
`SharedPreferences` is used to save the selected theme and language, ensuring that preferences persist across app launches.

## How to Run the App

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-folder>
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## How to Use the App

1. Launch the app on an emulator or physical device.
2. Navigate to the **Settings Screen**.
3. Select a theme (Light, Dark, or System Default).
4. Select a language (English, Arabic, or System Default).
5. Changes will immediately apply and persist across app launches.

## Dependencies

- **flutter_bloc:** State management library
- **shared_preferences:** For storing theme and locale preferences

Add these dependencies in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.0
  shared_preferences: ^2.1.1
```

## Supported Locales

- English (`en`)
- Arabic (`ar`)

System default locale is determined automatically based on the device's settings.

## Supported Themes

- **Light Theme:** Default light mode provided by Flutter.
- **Dark Theme:** Default dark mode provided by Flutter.
- **System Default:** Follows the system theme (light or dark).

## Customization

To add more themes or languages:

1. **Themes:**
   - Update `ThemeModeState` in `settings_cubit.dart`.
   - Add the new theme logic in `main.dart`.

2. **Languages:**
   - Add new keys in `lang_keys.dart`.
   - Update translation files in `app_localizations.dart`.
   - Add the new locale to `AppLocalizationsSetup.supportedLocales`.


## Contributing

We welcome contributions! Here’s how you can contribute to the project:

1. **Fork the repository** and clone it to your local machine.
2. **Create a new branch** for your feature or fix:
   ```bash
   git checkout -b feature-branch
   ```
3. **Make changes** and commit them:
   ```bash
   git commit -m "Add a new feature"
   ```
4. **Push** your changes to your fork:
   ```bash
   git push origin feature-branch
   ```
5. **Create a pull request** to merge your changes into the `main` branch of the original repository.


## Congratulations

You’ve successfully integrated `settings app template` App into your Flutter app! For more advanced features and customization options.

If you found this guide helpful, don’t forget to ⭐ star this repository on GitHub to show your support!

Thank you for reading!
## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or inquiries, feel free to reach out:

- **GitHub:** [mohamedmagdy2301](https://github.com/mohamedmagdy2301)
- **Email:** [mohammedmego15@gmail.com](mohammedmego15@gmail.com)


