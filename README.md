
# App Router Structure Example (SwiftUI)

This project demonstrates a modular and scalable app routing structure in SwiftUI. It is designed to handle:

* Centralized navigation
* Tab-based layout
* Stack-based navigation
* Deep linking
* Programmatic navigation

---

## 🧠 Architecture Overview

The routing system uses the following core components:

### 1. `AppRouter` (ObservableObject)

A centralized navigation controller that holds all navigation states:

* Current tab
* Path stack per tab
* Presented modals or sheets

### 2. `AppRoute` (Enum)

An enum representing all routes in the app, including:

```swift
enum AppRoute: Hashable {
    case home
    case profile(userID: String)
    case settings
    case detail(itemID: String)
}
```

### 3. `RouterView` (View)

Responsible for rendering the correct view based on the current `AppRoute`.

### 4. `MainTabView` (View)

Contains all tabs with individual `NavigationStack` instances:

* Home
* Profile
* Settings

---

## 🚀 Features

* ✅ **Custom Navigation Handling**
* ✅ **Programmatic Navigation**
* ✅ **Dynamic Path Updates**
* ✅ **Deep Linking**
* ✅ **Environment Injection for Navigation**

---

## 📁 Folder Structure

```
AppRouterStructureExample/
├── AppRouter/
│   ├── AppRouter.swift
│   ├── AppRoute.swift
│   └── RouterView.swift
├── Views/
│   ├── HomeView.swift
│   ├── ProfileView.swift
│   ├── SettingsView.swift
│   └── DetailView.swift
├── Tabs/
│   ├── MainTabView.swift
│   └── TabItem.swift
├── Utils/
│   └── Extensions.swift
└── AppRouterStructureExampleApp.swift
```

---

## 🛍️ Usage Example

```swift
@EnvironmentObject var router: AppRouter

Button("Go to Profile") {
    router.push(.profile(userID: "123"))
}
```

To handle deep linking:

```swift
.onOpenURL { url in
    if let route = AppRoute(from: url) {
        router.navigate(to: route)
    }
}
```

---

## 🔗 Deep Linking Format

* `myapp://profile/123`
* `myapp://detail/item456`
* `myapp://settings`

Make sure to register supported URL schemes in your `Info.plist`.

---

## 🥺 Requirements

* Swift 5.9+
* iOS 16.0+
* Xcode 15+

---

## 👨‍💻 Contribution

Feel free to fork and extend this example. Suggestions and PRs are welcome!

---

## 📄 License

MIT License


## ☕ Support

If you found this helpful, consider supporting me by

<a href="https://buymeacoffee.com/mohamed.a.raouf" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>


