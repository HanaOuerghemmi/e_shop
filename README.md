# e_shop

This Flutter project uses SOLID and Clean Architecture principles to keep the codebase organized and easy to work with. It separates different parts of the code, making it simpler to understand and modify.

## Project Structure

This project follows Clean Architecture principles, dividing the codebase into three layers:

## Architecture
1. **Presentation Layer**: Contains UI components and business logic related to UI. It utilizes BLoC pattern for state management and separates UI from business logic.

2. **Domain Layer**: Contains business logic and domain entities. It is independent of any external libraries or frameworks.

3. **Data Layer**: Manages data retrieval and storage. It interacts with external data sources such as APIs or databases, and maps them to domain entities.

This separation allows for easier testing, maintenance, and scalability.

## Usage

```
git clone https://github.com/HanaOuerghemmi/e_shop.git
```

RUN
```
flutter pub get
```
```
flutter run
```

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to improve this project.
features
│────featuresName
│   │ 
│   │── data/
│   │   ├── datasources/# Data 
│   │   │   Layer datasources (API, database, etc.)
│   │   ├── models/# Data models
│   │   ├── repositories/# Data layer repositories
│   │   └── test/# Unit and widget tests
│   ├── domain/
│   │   ├── entities/# Domain entities
│   │   ├── repositories/# Abstract domain repositories
│   │   ├── usecases/# Domain use cases
│   │   └── test/# Unit and widget tests
│   │
│   ├── presentation/
│   │   ├── pages/               # UI pages
│   │   ├── widgets/             # Reusable UI widgets
│   │   ├── blocs/               # Business Logic Components (BLoCs)
│   │   └── test/                # Unit and widget tests