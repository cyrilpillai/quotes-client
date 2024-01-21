# Quotify App

A cross platform app built in Flutter that displays memorable quotes. 

Checkout the [website](https://quotify.cyrilpillai.com/) or download the mobile installables from [here](https://github.com/cyrilpillai/quotes-client/releases).


![Mockup](/assets/images/mockup.png)

## Features

1. **Quotes:** Add/Edit quotes as per your. Browse through the entire collection of memorable quotes presented in an elegant and user-friendly interface.
   
2. **Search Quotes:** Looking for a specific quote? Use the search feature to quickly find quotes based on keywords or phrases.
   
3. **Author Pie Chart:** Gain insights into the distribution of quotes across various authors through an interactive pie chart.
   
4. **Leaderboard:** Discover the most prolific authors by exploring the leaderboard, which ranks them based on the number of quotes attributed to each.
   
5. **Random Quote:** Get a dose of entertainment with a random quote feature, perfect for those moments when you want an entertaining surprise.
   
6. **Dark Mode:** Switch to the dark side if you see fit.

## Screenshots

![Light Theme](/assets/images/light_screenshots.png)

![Dark Theme](/assets/images/dark_screenshots.png)

## Technologies Used

The app utilizes the following key technologies

1. **Clean Architecture:** The Quotify app is built on Clean Architecture principles, separating the application into distinct layers: presentation, domain, and data. This architectural approach promotes modularity, testability, and a clear separation of concerns.

2. **State Management with BLoC:** For efficient state management, the app employs the BLoC (Business Logic Component) pattern. [BLoC](https://bloclibrary.dev/#/) facilitates a clear separation of business logic from the UI, making the codebase more maintainable and testable.

3. **Dependency Injection:** Dependency injection is achieved through the use of two libraries: [GetIt](https://pub.dev/packages/get_it) and [Injectable](https://pub.dev/packages/injectable). GetIt is a simple yet powerful service locator for Dart and Flutter, while Injectable provides a convenient and code-generation-based approach to dependency injection. This combination ensures a clean and organized dependency management system.

4. **Networking with Dio:** The app relies on [Dio](https://pub.dev/packages/dio) for efficient and flexible networking. Dio is a powerful HTTP client for Dart and Flutter, offering features like interceptors, FormData handling, and request/response transformation. It allows seamless integration with backend services to fetch and display quotes.

## Getting Started

Follow these steps to get the Quotify app up and running on your local machine:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/cyrilpillai/quotes-client.git
   ```

2. **Navigate to the Project Directory:**
   ```bash
   cd quotes-client
   ```

3. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the App:**
   ```bash
   flutter run
   ```

## Contributions

Contributions to PDFree are welcome! If you would like to contribute, please follow these steps:

1. Fork the repository.

2. Create a new branch for your feature or bug fix:

   ```bash
   git checkout -b feature/your-feature-name
   ```

3. Make your changes and commit them:

   ```bash
   git commit -m "Add your commit message"
   ```

4. Push your changes to your forked repository:

   ```bash
   git push origin feature/your-feature-name
   ```

5. Open a pull request on the main repository.

Please ensure that your code adheres to the existing code style and includes appropriate tests.

## License
```
Copyright 2022 Cyril Pillai

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
``````
