# 🧭 Safarni 

Safarni is a **Flutter-based travel application** that helps users **search, book, and manage flights**, with **map-based tracking** to enhance trip planning and overall travel experience.

The app is built with **clean, scalable architecture** and modern Flutter best practices, focusing on performance, maintainability, and user experience.

---
📸 Screenshots

Below are some screenshots showcasing key parts of the Safarni application:

📌 Make sure to place the images inside a screenshots/ folder in the root of the repository.

## ✨ Features

* ✈️ **Flight Search & Booking**
* 🗺️ **Interactive Map Integration** for trip tracking
* 🏨 **Hotel & Accommodation Browsing**
* 🚗 **Car Rental Support**
* 📍 **Real-time Location Services**
* 🌐 **API Integration** for dynamic data
* 🔄 **State Management with Bloc/Cubit**
* 🧠 **Clean Architecture** (Data, Domain, Presentation)
* 💾 **Local Caching using Shared Preferences**
* 🚦 **Connectivity Handling (Online / Offline)**

---

## 🛠️ Tech Stack

* **Framework:** Flutter (Dart)
* **State Management:** Bloc / Cubit
* **Architecture:** Clean Architecture
* **Networking:** Dio
* **Maps & Location:** flutter_map, geolocator, latlong2
* **Routing:** go_router
* **Dependency Injection:** get_it
* **Local Storage:** shared_preferences
* **Error Handling:** Either & Failure pattern (dartz)

---

## 🧱 Project Architecture

The project follows **Clean Architecture**:

```
lib/
├── core/          # Shared utilities, constants, errors
├── data/          # Data sources & repositories implementation
├── domain/        # Entities, use cases, repository contracts
├── presentation/  # UI, Cubits/Blocs, Screens & Widgets
```

This structure ensures:

* High testability
* Clear separation of concerns
* Easy scalability and maintenance

---



* The project is under continuous improvement


