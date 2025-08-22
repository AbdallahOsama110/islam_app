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
## 🎬 Project Demo

<div align="center">
  <a href="https://www.youtube.com/watch?v=SXGznyurGGU" target="_blank">
    <img src="https://drive.google.com/uc?export=view&id=1oYVUM0p0EwcqjbixOKiJp1Gf4cxnud0K" alt="InterVysor Demo Video" width="100%">
  </a>
</div>

---

## 📱 Screenshots

<div align="center">
  <table>
    <tr>
      <td align="center">Onboarding</td>
      <td align="center">Home</td>
      <td align="center">Quran</td>
      <td align="center">Surah</td>
      <td align="center">Verse Option</td>
    </tr>
    <tr>
      <td align="center" width="20%"><img src="https://drive.google.com/uc?export=view&id=1kER5lH0MqHtXXMrpAv2jQH8QGQSEGRMw" width="200"></td>
      <td align="center" width="20%"><img src="https://drive.google.com/uc?export=view&id=1k7xG2qTUtxocJjgWraF9bnTS-cq-tSJY" width="200"></td>
      <td align="center" width="20%"><img src="https://drive.google.com/uc?export=view&id=1k1Z4NPA1GuHaLP7yEm3gQKRgZk0KWK8r" width="200"></td>
      <td align="center" width="20%"><img src="https://drive.google.com/uc?export=view&id=1k7vfpNHnjSodJ59Ehf7bR-6ulX4bdP9F" width="200"></td>
      <td align="center" width="20%"><img src="https://drive.google.com/uc?export=view&id=1kEF0LpmnVbJy1Tz7lO-gc-w7j4dD0x5t" width="200"></td>
    </tr>
  </table>
  <table>
    <tr>
      <td align="center">Qibla</td>
      <td align="center">Tasbih & Azkar</td>
      <td align="center">Azkar Categories</td>
      <td align="center">Azkar</td>
      <td align="center">Zekr Details</td>
    </tr>
    <tr>
      <td align="center" width="20%"><img src="https://drive.google.com/uc?export=view&id=1jxlTU1WIXptcu0u-ixUnniIEIlJx7auV" width="200"></td>
      <td align="center" width="20%"><img src="https://drive.google.com/uc?export=view&id=1kB08gjmgFuZWKmgGUctGwHxvuB7rjXbk" width="200"></td>
      <td align="center" width="20%"><img src="https://drive.google.com/uc?export=view&id=1k5SImpbsE9OiEV-CVbrU8KmuvGY9nbSA" width="200"></td>
      <td align="center" width="20%"><img src="https://drive.google.com/uc?export=view&id=1k0RFLe2FzpqBbsv86DEN27w8VASuA9_y" width="200"></td>
      <td align="center" width="20%"><img src="https://drive.google.com/uc?export=view&id=1k1uTi7QdosRRL_i5pzbOAJOe5l1_CI7q" width="200"></td>
    </tr>
  </table>
</div>
<img src="https://drive.google.com/uc?export=view&id=1CbcryM0I9_k1dKBeerT6VJXQOVVXWSST" alt="InterVysor Demo Video" width="100%">

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
