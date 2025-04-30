# RedditTopPosts

This light-weight mobile app fetches and displays the top 25 posts from Reddit for a predefined list of categories. It has been built using modern Swift best practices and a clean architectural approach. It's designed for scalability, modularity, and testability.

## Purpose

This app is designed as a **reference implementation** for building scalable and modular iOS applications using modern development practices. It demonstrates how to:

- Structure an app for **scalability** and **maintainability**
- **Modularize code** into clearly separated components
- Maintain a **clean separation of concerns**

In addition, the app showcases the adoption of **latest iOS advancements**:

- Use of `SwiftData` as a modern alternative to `CoreData`
- Use of **Structured Concurrency** (`async/await`) instead of `GCD`
- Favors `SwiftUI` for building complex UI over `UIKit`

The app also emphasizes important architectural and testing patterns:

- **Dependency Injection** and **Inversion of Control** via a centralized container
- Implementation of the **MVVM** (Model-View-ViewModel) design pattern
- Use of **protocols to mock data** for unit testing and easier testing strategies

This project my attempt to demonstrate a clean, modern example of architecting SwiftUI apps that has scalability and maintainability baked into its ethos.


## Features
- Predefined Reddit categories
- Displays top 25 posts per category using a shared post layout
- Local database caching for faster load times
- Pull-to-refresh to fetch updated content from the Reddit API
- Clean MVVM architecture
- Dependency injection using a central DIContainer

## Architecture

The app follows a clean **MVVM (Model-View-ViewModel)** architecture pattern and is organized into clearly separated modules to ensure maintainability, testability, and scalability.

### Data Flow Overview

1. **View**  
   - Displays UI using **SwiftUI**.
   - Observes the `ViewModel` for state changes.
   - Triggers user interactions (e.g., selecting a category, pull-to-refresh).

2. **ViewModel**  
   - Created with a reference to the `DIContainer`.
   - Initializes a `PostItemsRepository` with `APIClientAPI` and category.
   - Retrieves data from the **local database (SwiftData)** on load.
   - Fetches data from the **network** only on pull-to-refresh.
   - Exposes UI-friendly state and handles business logic.

3. **Repository**  
   - Acts as a bridge between the **ViewModel**, **network**, and **local storage**.
   - Fetches and caches data accordingly.

4. **Network Layer**  
   - Implements an `APIClientAPI` protocol.
   - Uses `TopPostsEndpoint` to generate category-specific endpoints.
   - Handles REST API requests using modern **structured concurrency** (`async/await`).

5. **Local Storage**  
   - Built using **SwiftData**, Apple's new persistence framework.
   - Models represent Reddit post structure (e.g., `PostItemsModel`, `ChildrenModel`).

6. **Dependency Injection**  
   - A centralized `DIContainer` is used to inject dependencies at creation time.
   - Promotes **loose coupling** and **testability**.
   - Makes it easy to swap implementations (e.g., use mocks during tests).

## Getting Started

This project is built with **SwiftUI**, using **MVVM architecture**, **SwiftData**, and **async/await**. Follow the steps below to get it up and running on your local machine.

### Prerequisites

- Xcode 15 or later
- iOS 17 SDK or later
- macOS Ventura or later

---

## Run the App

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/RedditTopPosts.git

2. Open the project in Xcode:
   ```bash
   open RedditTopPosts/RedditTopPosts.xcodeproj

3. Select the target device or simulator.

4. Run the project:

## TODO

- [ ] Support dynamic category loading from Reddit API  
- [ ] Write unit tests for ViewModels and Repository  
- [ ] Implement dark mode support  
- [ ] Localization for additional languages  
- [ ] Add error handling and user-friendly messages  
- [ ] Add analytics for category and post engagement  

___

