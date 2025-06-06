# 🕌 Islamic App

A modern Flutter application designed to assist Muslims in their daily spiritual routines with a smooth, responsive experience across mobile and tablet devices.

## ✨ Features

- 🔥 Splash & Onboarding Screens
- 🕰️ Accurate Prayer Times (based on user location)
- 🔔 Prayer Notification Reminders
- 📖 Full Quran (with offline audio playback)
- 🔖 Bookmarking to save your Quran reading progress
- 🧭 Qibla Direction Compass
- 📿 Digital Tasbih for Dhikr
- 🗒️ Azkar Collection (morning, evening, after prayer, etc.)
- 🌙 Hijri Date Support
- 📱 Responsive UI for phones and tablets

---

## 🛠️ Built With

| Area                    | Package / Tool                       |
|-------------------------|--------------------------------------|
| Architecture            | MVVM, Cubit State Management         |
| Routing                 | `go_router`                          |
| Location Services       | `geolocator`, `geocoding`            |
| Prayer Times            | `adhan`                              |
| Prayer Notifications    | `flutter_local_notifications`, `android_alarm_manager_plus` |
| Quran & Audio           | `quran`, `audioplayers`              |
| UI & Responsiveness     | `sizer`, `flutter_svg`, `google_fonts` |
| Localization            | `flutter_localizations`, `intl`, `arabic_numbers` |
| Hijri Calendar          | `jhijri`                             |
| Qibla Direction         | `flutter_qiblah`, `google_maps_flutter` |
| State Management        | `flutter_bloc`         |
| Asset Generation        | `flutter_gen_runner`                 |
| Permission Handling     | `permission_handler`                 |

---

## 📂 Folder Structure

```bash
lib/
├── core/
│   ├── utils/                   # Common services and helpers
│   │   ├── app_router.dart
│   │   ├── bloc_observer.dart
│   │   ├── cache_helper.dart
│   │   ├── constants.dart
│   │   ├── light_theme.dart
│   │   ├── notification_service.dart
│   │   ├── prayer_service.dart
│   │   └── toast_message.dart
│   └── widgets/                # Shared reusable widgets
│
├── features/
│   ├── azkar/                  
│   ├── home/                   
│   ├── layout/                 
│   ├── onboarding/             
│   ├── others/                 
│   ├── qibla/                  
│   ├── quran/                  
│   ├── splash/                 
│   └── tasbih/                 
│
├── gen/                        # Generated assets (flutter_gen)
├── generated/                  # Auto-generated localization files
├── l10n/                       # Localization configurations
├── app.dart                    # App root widget
└── main.dart                   # Entry point
```

---

## 🚀 Getting Started

### Requirements
- Flutter SDK: **>=3.24.3**
- Dart SDK: **>=3.5.3**
- Android/iOS emulator or physical device

### Installation

1. **Clone the repo**
   ```bash
   git clone https://github.com/AbdallahOsama110/islam_app.git
2. **Get packages**
   ```bash
   flutter pub get
3. **Run the app**
   ```bash
   flutter run

---
### 🙌 Teamwork
Special thanks to [Ahmed Ibrahim](https://github.com/AhmedIbrahim2003) for the great teamwork and contributions to this project!
