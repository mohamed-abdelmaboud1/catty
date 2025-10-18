# 🐱 Catty App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-Private-red)
![Version](https://img.shields.io/badge/Version-1.0.0-green)

A beautiful and modern Flutter application for cat enthusiasts to discover, explore, and favorite their beloved cat breeds.

</div>

---

## 📋 Overview

**Catty** is a cross-platform mobile application built with Flutter that allows users to explore a comprehensive collection of cat breeds, view stunning cat images in a gallery, and save their favorite cats. The app features a modern UI design with smooth animations, responsive layouts, and clean architecture principles.

### 🎯 Main Goals

- **Discover Cat Breeds**: Browse through various cat breeds with detailed information about their characteristics, temperament, and origin.
- **Gallery Experience**: View high-quality cat images in an organized grid layout with search functionality.
- **Favorites Management**: Save and manage your favorite cat breeds and images for quick access.
- **User-Friendly Interface**: Enjoy a smooth, intuitive, and visually appealing user experience with modern design patterns.

---

## ✨ Features

### Core Functionality

- 🏠 **Home Screen** - Welcome banner, featured cats, popular breeds, and discovery sections
- 🖼️ **Gallery View** - Grid-based image gallery with search and refresh capabilities
- ❤️ **Favorites** - Save and manage your favorite cat breeds and images
- 🔍 **Search** - Find specific cat breeds quickly using the search functionality
- 🎨 **Modern UI** - Beautiful gradient designs, smooth animations, and responsive layouts

### Technical Features

- 📱 **Cross-Platform** - Runs on Android, iOS, Web, Windows, Linux, and macOS
- 🏗️ **Clean Architecture** - Feature-based structure with separation of concerns
- 🔄 **State Management** - BLoC pattern for predictable state management
- 🌐 **API Integration** - RESTful API integration with Dio and Retrofit
- 💾 **Local Storage** - Secure storage for user preferences and cached data
- 🎭 **Animations** - Smooth page transitions and UI animations
- 📐 **Responsive Design** - Adaptive layouts using flutter_screenutil
- 🧪 **Testing** - Comprehensive unit, widget, and integration tests

### Additional Features

- 🌓 **Theme Support** - Custom color schemes and typography
- 📦 **Dependency Injection** - GetIt for service locator pattern
- 🔐 **Secure Storage** - Flutter Secure Storage for sensitive data
- 📝 **Logging** - Pretty logging for debugging and monitoring
- 🖼️ **Image Caching** - Cached network images for better performance
- ♻️ **State Persistence** - Hydrated BLoC for state persistence

---

## 🏗️ Project Structure

```
catty/
│
├── android/                          # Android-specific files
├── ios/                              # iOS-specific files
├── web/                              # Web-specific files
├── windows/                          # Windows-specific files
├── linux/                            # Linux-specific files
├── macos/                            # macOS-specific files
│
├── assets/                           # Static assets
│   ├── fonts/                        # Custom fonts (Raleway)
│   └── images/                       # App images and icons
│
├── lib/                              # Main application code
│   ├── main.dart                     # Application entry point
│   ├── catty_app.dart                # Root app widget
│   │
│   ├── core/                         # Core functionality
│   │   ├── api/                      # API configuration and interceptors
│   │   │   ├── api_interceptors.dart
│   │   │   └── dio_module.dart
│   │   ├── cache/                    # Caching mechanisms
│   │   ├── constant/                 # App constants
│   │   ├── cubit/                    # Global cubits
│   │   ├── di/                       # Dependency injection
│   │   │   └── service_locator.dart
│   │   ├── enums/                    # App enumerations
│   │   ├── errors/                   # Error handling
│   │   ├── extensions/               # Dart extensions
│   │   ├── helper/                   # Helper functions
│   │   ├── routing/                  # Navigation setup
│   │   │   ├── app_router.dart
│   │   │   └── routes.dart
│   │   ├── theme/                    # App theming
│   │   ├── utils/                    # Utilities
│   │   │   ├── app_colors.dart
│   │   │   ├── app_images.dart
│   │   │   └── app_styles.dart
│   │   └── widgets/                  # Reusable widgets
│   │       ├── custom_image.dart
│   │       └── scaffold_with_nav_bar.dart
│   │
│   └── features/                     # Feature modules
│       │
│       ├── splash/                   # Splash & onboarding
│       │   └── presentation/
│       │       ├── views/
│       │       │   ├── splash_view.dart
│       │       │   └── get_started_view.dart
│       │       └── widgets/
│       │
│       ├── home/                     # Home feature
│       │   ├── data/                 # Data layer
│       │   ├── domain/               # Domain layer
│       │   └── presentation/         # Presentation layer
│       │       ├── views/
│       │       │   └── home_view.dart
│       │       └── widgets/
│       │           ├── welcome_banner.dart
│       │           ├── cat_explorer_logo.dart
│       │           ├── discover_section.dart
│       │           ├── stats_cards_section.dart
│       │           ├── featured_cats_section.dart
│       │           ├── popular_breeds_section.dart
│       │           ├── perfect_match_banner.dart
│       │           ├── cat_grid_card.dart
│       │           └── network_image_with_fallback.dart
│       │
│       ├── gallery/                  # Gallery feature
│       │   ├── data/                 # Data layer
│       │   │   ├── models/
│       │   │   │   ├── cat_image_model.dart
│       │   │   │   └── breed_model.dart
│       │   │   └── repositories/
│       │   │       └── gallery_repo_impl.dart
│       │   ├── domain/               # Domain layer
│       │   │   └── repositories/
│       │   │       └── gallery_repo.dart
│       │   └── presentation/         # Presentation layer
│       │       ├── cubit/
│       │       │   ├── gallery_cubit.dart
│       │       │   └── gallery_state.dart
│       │       ├── pages/
│       │       │   └── gallery_view.dart
│       │       └── widgets/
│       │           ├── gallery_app_bar.dart
│       │           ├── gallery_search_bar.dart
│       │           └── gallery_grid.dart
│       │
│       └── favorite/                 # Favorite feature
│           └── presentation/
│               ├── pages/
│               │   └── favorite_view.dart
│               └── widgets/
│                   ├── favorite_app_bar.dart
│                   ├── favorite_empty_state.dart
│                   └── favorite_grid.dart
│
├── test/                             # Test files
│   ├── features/
│   │   └── gallery/
│   │       ├── presentation/
│   │       │   ├── cubit/
│   │       │   │   └── gallery_cubit_test.dart
│   │       │   ├── widgets/
│   │       │   │   ├── gallery_app_bar_test.dart
│   │       │   │   ├── gallery_search_bar_test.dart
│   │       │   │   └── gallery_grid_test.dart
│   │       │   └── pages/
│   │       │       └── gallery_view_test.dart
│   │       ├── helpers/
│   │       │   └── test_data.dart
│   │       ├── gallery_integration_test.dart
│   │       ├── README.md
│   │       └── TEST_SUMMARY.md
│   └── widget_test.dart
│
├── pubspec.yaml                      # Dependencies and assets
├── analysis_options.yaml             # Dart analyzer settings
└── README.md                         # This file
```

---

## 📸 Screenshots

### Home Screen

![Home Screen - Top](screenshots/home_top.png)
_Welcome banner with gradient design and cat explorer branding_

![Home Screen - Stats](screenshots/home_stats.png)
_Statistics cards showing breeds, images, and favorites count_

![Home Screen - Featured](screenshots/home_featured.png)
_Featured cats section with beautiful grid layout_

![Home Screen - Breeds](screenshots/home_breeds.png)
_Popular breeds list with detailed information_

### Gallery Screen

![Gallery View](screenshots/gallery.png)
_Grid-based gallery with search functionality and refresh option_

![Gallery Search](screenshots/gallery_search.png)
_Search bar for finding specific cat breeds_

### Favorites Screen

![Favorites](screenshots/favorites.png)
_User's saved favorite cats in a grid layout_

![Favorites Empty State](screenshots/favorites_empty.png)
_Empty state with helpful guidance when no favorites saved_

### Navigation

![Bottom Navigation](screenshots/navigation.png)
_Bottom navigation bar with Home, Gallery, and Favorites tabs_

---

## 🔀 Git Workflow

This project follows a **Feature Branch Workflow** with multiple parallel feature branches:

### Branch Structure

```
main (51c88eb - production-ready code)
  │
  ├── develop (1 day ago - integration branch)
  │
  ├── feature/gallery (26 minutes ago - ACTIVE)
  │   └── Latest: feat: Add comprehensive tests for Gallery feature
  │
  ├── feature/home (1 day ago)
  │   └── Latest: feat: Add new widgets for cat exploration and enhance UI
  │
  ├── feature/splash (1 day ago)
  │   └── Latest: Refactor logo components to use constants for border radius
  │
  └── feature/project-structure (1 day ago)
      └── Latest: Setup project structure and base architecture
```

### Branch Naming Convention

- **Feature branches**: `feature/feature-name` (e.g., `feature/gallery`, `feature/home`, `feature/splash`)
- **Bug fixes**: `bugfix/bug-description` (e.g., `bugfix/fix-search-crash`)
- **Hotfixes**: `hotfix/critical-issue` (e.g., `hotfix/login-error`)

### Active Branches

| Branch                      | Status         | Last Commit | Description                        |
| --------------------------- | -------------- | ----------- | ---------------------------------- |
| `main`                      | 🟢 Stable      | 51c88eb     | Production-ready code              |
| `develop`                   | 🔄 Integration | 1 day ago   | Merge point for features           |
| `feature/gallery`           | ⚡ **ACTIVE**  | 26 min ago  | Gallery view with tests (619ddcb)  |
| `feature/home`              | ✅ Ready       | 1 day ago   | Home screen with widgets (e53a0e7) |
| `feature/splash`            | ✅ Ready       | 1 day ago   | Splash & onboarding (7694e1d)      |
| `feature/project-structure` | ✅ Complete    | 1 day ago   | Base architecture (9352eec)        |


- `test`: Adding tests (e.g., `test(gallery): add comprehensive widget tests`)
- `chore`: Build/tooling changes (e.g., `chore: update dependencies`)


### Development Workflow Explanation

This project uses a **parallel feature development** approach:

1. **Base Setup** (`feature/project-structure`)

   - Initial project architecture established
   - Core folder structure created
   - Base dependencies configured

2. **Parallel Feature Development**

   - Multiple features developed simultaneously
   - Each feature branch is independent
   - `feature/gallery` ← Currently active with tests
   - `feature/home` ← UI components complete
   - `feature/splash` ← Onboarding ready

3. **Integration via develop branch**

   - Features merge into `develop` for testing
   - Integration issues resolved in `develop`
   - Stable releases promoted to `main`

4. **Pull Request Process**
   - PRs reviewed before merging
   - Automated tests must pass
   - Code quality checks enforced
   - Example: PR #4 merged features into develop

---

## 📄 License

This project is private and not licensed for public use.

---

## 👨‍💻 Author

**Mohamed Abdelmaboud**

- GitHub: [@mohamed-abdelmaboud1](https://github.com/mohamed-abdelmaboud1)

---

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Cat API for providing cat breed data
- Open source community for the excellent packages

---

<div align="center">

Made with ❤️ and Flutter

**⭐ Star this repository if you find it helpful!**

</div>
