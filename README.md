# C.T Recipe Finder App

So this is a flutter application that uses **TheMealDB API** to search for meals, display recipe details (with ingredients, instructions, and images).. also providing a sleek scroll-to-reveal detail page.

---

## 📂 Project Structure
lib/
├── data/
│ ├── models/ # Data models (Meal, Category, etc.)
│ ├── datasource/ # API services (Dio HTTP requests to TheMealDB)
│ └── repositories/ # Repository implementations (fetch & parse API data)
│
├── domain/
│ ├── entities/ # Core business entities (MealEntity, etc.)
│ ├── repositories/ # Abstract repository interfaces
│ └── usecases/ # Application use cases (SearchMeals, GetMealDetails, etc.)
│
├── presentation/
│ ├── pages/ # Screens & views (Meal Search, Meal Details)
│ ├── providers/ # Riverpod providers for state management
│ └── widgets/ # Reusable UI components
│
└── main.dart # App entry point


## Features

- Search recipes by keyword
- View thumbnails and brief info
- Detailed recipe view


---

## 🧠 State Management Logic (Clean Architecture + Riverpod)

This app follows **Clean Architecture** principles:

1. **Presentation Layer**
   - Contains UI widgets, pages, and Riverpod providers.
   - **Providers** trigger use cases from the domain layer and expose data to the UI.
   - Example:  
     `mealSearchProvider` calls the `SearchMeals` use case when a user searches.

2. **Domain Layer**
   - Holds **Entities** (pure business models) and **Use Cases**.
   - Use cases contain the core business logic and call the abstract repository interfaces.
   - Example:  
     `SearchMeals` → uses `MealRepository` interface to fetch data.

3. **Data Layer**
   - Implements the repository interfaces from the domain layer.
   - Uses **Dio** in the datasource classes to call TheMealDB API.
   - Converts raw JSON → data models → domain entities.

**Flow:**


**Install dependencies**
git clone git clone https://github.com/YOUR_USERNAME/flutter-recipe-app.git

flutter pub get
Run on Android/iOS

flutter run
Run on Web

flutter config --enable-web
flutter run -d chrome
