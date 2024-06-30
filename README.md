# Flutter Project README

This Flutter project showcases a clean architecture approach with Riverpod for state management, internationalization using il10n (flutter_gen), and utilization of hooks for enhanced widget management. The architecture used is Riverpod architectur with a controller-service-repo pattern. Below is an overview of the project structure, features, and setup instructions.

Brief project description goes here.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine.
- [Visual Studio Code](https://code.visualstudio.com/) (recommended) or any IDE of your choice.
- [Git](https://git-scm.com/) for version control.

### Installing

   Clone the repository to your local machine using Git:
   git clone https://github.com/Zuhayr553/Uni-Wien-Application

   ### Install dependencies:   
   flutter pub get

   ### Run the Application:
   Ensure a Windows desktop device or emulator is connected.

   ### Run the app using the following command: 
   flutter run -d windows
   or also ctrl+f5 but ensure windows device is selected in bottom left

  ### Debugging:
   Use VS Code\'s debugging tools to set breakpoints, inspect variables, and debug your Flutter app running on Windows.

   ### Building Release Version:
   To build a release version of your app for Windows, use:
   flutter build windows


## Features

1. **Splash Screen**
   - The SplashScreen widget serves as the initial screen upon launching the application.
   - Features:
     - **Animation:** Utilizes animation controllers for smooth visual transitions.
     - **Delayed Navigation:** Automatically navigates to the HomePage after a brief delay.
     - **Localization:** Displays localized text using AppLocalizations for multilingual support.
     - **Theming:** Applies consistent theme styles via FluentTheme for a cohesive visual experience.

2. **Task Manager**
   - Manages tasks where users can add, delete, and view tasks locally.
   - Features:
     - **State Management:** Uses Riverpod for managing task state.
     - **Add Task:** Users can add new tasks through an interactive dialog.
     - **Delete Task:** Confirmation dialog prompts users before deleting a task.

3. **Home Page**
   - Displays dynamic charts and statistics using generated fake data.
   - Features:
     - **Chart Widgets:** Includes different types of charts with sample data to show statistics.

4. **Settings**
   - Allows users to configure language preferences and theme settings.
   - Features:
     - **Language Switching:** Supports internationalization (IL10n) for multiple languages.
     - **Theme Toggle:** Easily toggle between dark mode and light mode using Fluent UI.

5. **Internationalization (IL10n)**
   - Supports localization for multiple languages within the app.
   - Features:
     - **Localized Strings:** Manages localized text using Flutter's IL10n package.
     - **Dynamic Language Switching:** Changes language instantly without restarting the app.

6. **Hooks**
   - Utilizes Flutter hooks for managing state and lifecycle within functional components.
   - Features:
     - **Simplified State Management:** Enhances readability and maintainability of widget logic.

### UI and Theming

- **Fluent UI:** Utilizes Fluent UI for consistent and visually appealing user interface components.
- **Theming:** Applies Fluent UI's theming capabilities throughout the app for a cohesive and branded look.

### Additional Features

- **Context Extensions:** Enhances functionality using custom context extensions for streamlined access to features like navigation and localization.
- **Logger Package:** Implements logging using the logger package for debugging and error tracking.
- **Export Modules:** Organizes code using export modules to maintain a clean project structure and improve code readability.

### Code Generation with flutter gen-l10n

**Localization Management:** Uses flutter gen-l10n for generating Dart code from ARB files. Add or modify strings in ARB files (lib/l10n) and run flutter gen-l10n to update localized strings across the app. Generated code includes access methods for localized strings and supports dynamic language switching.

## Additional Technologies

- **Routing:** Utilizes go_router for routing within the application.
- **Local Data Storage:** Uses shared_preferences for storing local data such as user preferences, like dark mode settings.

## Project Structure 
 The project follows a modular structure with separation of concerns and clean architecture principles.
 I have used a feature first project structure and every feature has a presentation(pages), domain(models) and data(providers) in this case adhering to clean code principles.




