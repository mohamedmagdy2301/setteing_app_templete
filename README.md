
<div align="center">

# *"وَقُلْ رَبِّ زِدْنِي عِلْمًا"*

</div>

# Settings (Theming and Localization) Flutter App Template

This Flutter app demonstrates how to implement **dynamic theming** and **localization** using the **BLoC** state management library and **SharedPreferences** for persistent storage. Users can switch between light, dark, and system themes, as well as select their preferred app language.

---

## Features

- **Dynamic Theming:**
  - Light Mode
  - Dark Mode
  - System Default Theme

- **Dynamic Localization:**
  - English
  - Arabic
  - System Default Locale

- **Color Palette Selection:**
  - Customizable color options for the app interface

- **State Management:**
  - BLoC (Cubit) for managing theme and localization states

- **Persistent Preferences:**
  - SharedPreferences to save user settings locally

---

## Project Structure

```plaintext
lib/
├── core/
│   ├── themes/
│   │   └── list_colors.dart       # List of available colors for the app
│   ├── widgets/
│       └── build_circle_color_widget.dart # UI for color selection
├── features/
│   └── settings/
│       ├── presentation/
│       │   ├── cubit/
│       │   │   ├── settings_cubit.dart  # Cubit for managing theme and locale settings
│       │   │   ├── settings_state.dart  # State representation for SettingsCubit
│       │   └── settings_screen.dart     # UI for settings screen
├── language/
│   ├── app_localizations.dart           # Localization helper
│   ├── app_localizations_setup.dart     # Localization setup and configurations
│   ├── lang_keys.dart                   # Keys for translatable strings
└── main.dart                            # Main entry point of the app
```

---

## Color Palette

The app allows users to select from the following colors for personalization. These colors are used throughout the app interface for themes and highlights.

| Color Name | Preview              | Hex Code    |
|------------|----------------------|-------------|
| **Orange** | ![Orange](https://via.placeholder.com/20/FFA500?text=+) | `#FFA500` |
| **Blue**   | ![Blue](https://via.placeholder.com/20/007BFF?text=+)   | `#007BFF` |
| **Green**  | ![Green](https://via.placeholder.com/20/28A745?text=+)  | `#28A745` |
| **Red**    | ![Red](https://via.placeholder.com/20/DC3545?text=+)    | `#DC3545` |

To customize these colors or add new ones, update the `list_colors.dart` file and the corresponding `ColorsState` in the `settings_cubit.dart`.

---

## Implementation Details

### 1. State Management
- **SettingsCubit** (in `settings_cubit.dart`) manages the app's theme, locale, and color states.
- It interacts with **SharedPreferences** to persist user preferences across app launches.

### 2. UI Components
- **SettingsScreen** (in `settings_screen.dart`) provides a user-friendly interface for selecting theme, language, and color preferences.
- Utilizes `BlocBuilder` to rebuild the UI whenever settings are updated.

### 3. Localization
- **AppLocalizations**: Provides translations for the selected language.
- **AppLocalizationsSetup**: Configures supported locales and localization delegates.

### 4. Persistent Storage
- **SharedPreferences** is used to store the user's selected theme, language, and color.

---

## How to Run the App

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd <repository-folder>
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

---

## How to Use the App

1. Launch the app on an emulator or physical device.
2. Navigate to the **Settings Screen**.
3. Select:
   - A theme (Light, Dark, or System Default).
   - A language (English, Arabic, or System Default).
   - A color for personalization.
4. Changes are applied immediately and persist across app launches.

---

## Dependencies

Add the following dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.0
  shared_preferences: ^2.1.1
```

---

## Supported Locales

- **English** (`en`)
- **Arabic** (`ar`)
- **System Default Locale** (based on the device's language settings)

---

## Supported Themes

- **Light Theme**: Default light mode.
- **Dark Theme**: Default dark mode.
- **System Default**: Automatically adapts to the system theme.

---

## Contributing

We welcome contributions! Follow these steps to contribute:

1. **Fork the repository** and clone it to your local machine.
2. **Create a new branch**:
   ```bash
   git checkout -b feature-branch
   ```
3. **Make changes** and commit them:
   ```bash
   git commit -m "Add new feature"
   ```
4. **Push your changes**:
   ```bash
   git push origin feature-branch
   ```
5. **Create a pull request** to merge your changes.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

## Contact

For any questions or inquiries, feel free to reach out:

- **GitHub:** [mohamedmagdy2301](https://github.com/mohamedmagdy2301)
- **Email:** [mohammedmego15@gmail.com](mailto:mohammedmego15@gmail.com)
