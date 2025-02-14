
<div align="center">

# *"وَقُلْ رَبِّ زِدْنِي عِلْمًا"*

</div>

## Settings (Theming & Color Pallete and Localization) Flutter App Template

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

## Screenshots

### Ios
| System Default | English & Light | Arabic & Light |
|---|---|---|
| ![Screenshot](s2.png) | ![Screenshot](s1.png) | ![Screenshot](s3.png)  |
### Android
| System Default | English & Dark | Arabic & Light |
|---|---|---|
| ![Screenshot](Screenshot3.png) | ![Screenshot](Screenshot1.png) | ![Screenshot](Screenshot2.png)  |

---

## Color Palette

The app allows users to select from the following colors for personalization. These colors are used throughout the app interface for themes and highlights.

| Color Name | Preview              | Hex Code    |
|------------|----------------------|-------------|
| **Orange** | ![Orange](https://via.placeholder.com/20/FFA500?text=+) | `#FFA500` |
| **Blue**   | ![Blue](https://via.placeholder.com/20/007BFF?text=+)   | `#007BFF` |
| **Green**  | ![Green](https://via.placeholder.com/20/28A745?text=+)  | `#28A745` |
| **Red**    | ![Red](https://via.placeholder.com/20/DC3545?text=+)    | `#DC3545` |
| **Indigo** | ![Indigo](https://via.placeholder.com/20/3F51B5?text=+) | `#3F51B5` |
| **Purple** | ![Purple](https://via.placeholder.com/20/800080?text=+) | `#800080` |

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
 
## **Adding a New Color Palette**

To add a new color palette to the application, follow these steps:

### 1. **Add the New Color to the Enum**
In the `settings_cubit.dart` file, update the `ColorsPalleteState` enum by adding the new color. For example:
```dart
enum ColorsPalleteState { orange, blue, green, red, indigo, purple }
```
```dart

  ColorsPalleteState _getColorsStateFromString(String colors) {
    switch (colors) {
      case 'blue':
        return ColorsPalleteState.blue;
      case 'red':
        return ColorsPalleteState.red;
      case 'green':
        return ColorsPalleteState.green;
      case 'indigo':
        return ColorsPalleteState.indigo;
      case 'orange':
        return ColorsPalleteState.orange;
      case 'purple':                        <--- Add This Line
        return ColorsPalleteState.purple;   <--- Add This Line
      default:
        return ColorsPalleteState.orange;
    }
  }
```

### 2. **Define the New Color in the Palettes**
Update the `lightPalettes` and `darkPalettes` in the `ThemePalette` file to include the new color:

#### Light Palette
```dart
ColorsPalleteState.purple: ThemePaletteModel(
  primary: Colors.purple,
  secondary: Colors.purpleAccent,
  background: Color(0xFFECECEC), // Adjust as needed
  text: Color(0xFF2D2D2D), // Adjust as needed
  error: Color(0xFFE53935), // Adjust as needed
),
```

#### Dark Palette
```dart
ColorsPalleteState.purple: ThemePaletteModel(
  primary: Colors.purple,
  secondary: Colors.purpleAccent,
  background: Color(0xFF121212), // Adjust as needed
  text: Color(0xFFD1C4E9), // Adjust as needed
  error: Color(0xFFEF5350), // Adjust as needed
),
```

### 3. **Add the Color to the Theme Extensions**
In the `themeExtensions` map, add an entry for the new color:
```dart
ThemeModeState.light: {
  ...,
  ColorsPalleteState.purple: MyColors(primaryColor: Colors.purple),
},
ThemeModeState.dark: {
  ...,
  ColorsPalleteState.purple: MyColors(primaryColor: Colors.purple),
},
```

### 4. **Update the Color List**
In the `list_colors.dart` file, add the new color to the `color` list:
```dart
List<Color> colorPalette = [
  Colors.amber,
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.indigo,
  Colors.purple, // Add your new color
];
```

### 5. **Test the Color**
Run the application and verify:
- The color is selectable in the palette widget.
- The light and dark themes reflect the correct color scheme.

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
