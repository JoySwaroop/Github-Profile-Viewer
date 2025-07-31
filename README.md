# Github Profile Viewer 🧑‍💻

## What is this App All About

This is a simple SwiftUI app that fetches and displays a user's GitHub profile information. It connects to the GitHub API to get data like the user's avatar, bio, follower count, and account creation date, presenting it in a clean and modern user interface.

- **Dynamic Data Fetching**: Fetches real-time user data from the GitHub API.
- **Asynchronous Image Loading**: Uses `AsyncImage` to load the profile avatar efficiently.
- **Clean UI**: Presents the profile information in a straightforward and easy-to-read layout using SwiftUI.

## What I have learned

- **Asynchronous Programming with `async/await`**: I used `async` and `await` to handle network requests, making the code more readable and preventing UI freezes.
- **Error Handling**: Implemented robust error handling with `try/catch` and a custom `enum` for various network-related issues (invalid URL, invalid response, invalid data).
- **JSON Decoding**: I learned how to decode JSON data from the API response into a custom Swift `struct` using `Codable` and a `keyDecodingStrategy`.
- **SwiftUI Layouts**: I used `VStack` and `HStack` to arrange UI elements effectively and create a responsive design.
- **State Management**: I managed the app's state with the `@State` property wrapper to update the UI when new data is received.

## Demo


<img width="332" height="670" alt="Screenshot 2025-07-31 at 9 33 57 PM" src="https://github.com/user-attachments/assets/8992cadb-c651-4733-b6a7-0a86efc13041" />
