# MESMER App

MESMER Digital Coaching and Monitoring Mobile Platform.

## Core Technologies
- **Framework**: Flutter (`>=3.0.0`)
- **State Management**: Riverpod (`flutter_riverpod`)
- **Routing**: GoRouter (`go_router`)
- **Database (Local/Offline-First)**: Isar (`isar`, `isar_flutter_libs`)
- **Backend & Authentication**: Supabase (`supabase_flutter`)
- **Push Notifications**: Firebase (`firebase_core`, `firebase_messaging`)

## Prerequisites
Before you begin, ensure you have the following installed and set up on your machine:
*   [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
*   An IDE such as [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).
*   A [Supabase](https://supabase.com/) account and project (for backend functionality).
*   A connected physical device or a running emulator/simulator.

## Getting Started: Clone, Configure, and Run

### 1. Clone the Repository
Open your terminal and clone the repository to your local machine, then navigate to the project directory:

```bash
git clone <YOUR_REPOSITORY_URL>
cd mesmer-app
```
*(Note: Replace `<YOUR_REPOSITORY_URL>` with the actual URL of your Git repository).*

### 2. Install Dependencies
Run the following command to fetch and install all the necessary packages defined in `pubspec.yaml`:

```bash
flutter pub get
```

### 3. Generate Required Code
This project relies on code generation packages like `isar_generator` (for database schemas) and `json_annotation` (for API models). You **must** run the build runner to generate the `.g.dart` files before launching the app:

```bash
dart run build_runner build -d
```
*(The `-d` flag stands for `delete-conflicting-outputs` and safely overwrites previous generated files).*

### 4. Setup Configuration (Supabase)
The app securely connects to Supabase. You need to configure it with your project's credentials.

1. Open the Supabase config file at `lib/core/config/supabase_config.dart`.
2. Replace the values for `url` and `anonKey` with your own Supabase project details. Find these in your Supabase Dashboard under **Settings -> API**.
3. Storage: Make sure to create the required Storage Buckets in your Supabase project:
   - `evidence`
   - `documents`
   - `profiles`
   
**Example `lib/core/config/supabase_config.dart`:**
```dart
class SupabaseConfig {
  SupabaseConfig._();

  static const String url = 'YOUR_SUPABASE_URL';
  static const String anonKey = 'YOUR_SUPABASE_ANON_KEY';
  
  static const String evidenceBucket = 'evidence';
  static const String documentsBucket = 'documents';
  static const String profilesBucket = 'profiles';
}
```

### 5. Setup Configuration (Firebase Push Notifications)
If you intend to use the push notification features:
1. Create a Firebase project.
2. Register your Android and iOS applications to the Firebase project.
3. Place your generated `google-services.json` in the `android/app/` folder, and `GoogleService-Info.plist` in the `ios/Runner/` folder.

### 6. Run the Application
With the setup complete, you are now ready to launch the app! Run the following command:

```bash
flutter run
```

---

## Troubleshooting

If you encounter issues during installation or running:
1. Run `flutter doctor` to ensure your environment is healthy and dependencies (like Android SDK or Xcode) are correctly configured.
2. If you see errors related to missing `.g.dart` files or `Isar` methods, ensure you ran the `build_runner` command from step 3 successfully.
3. Clean the project and rebuild if you face unexpected cache issues:
   ```bash
   flutter clean
   flutter pub get
   dart run build_runner build -d
   ```
