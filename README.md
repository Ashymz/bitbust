# bitbust

A test project which deals basically with crypto assets.

Setting Up the Notification Service
To trigger notification from the backend :

How it Works
Token Management:
When a user logs in or registers, the app should send the device's FCM token to the backend.
The backend stores this token in the user's record.
Sending Notifications:
When you need to notify a user, the backend retrieves the user's FCM token.
The backend constructs a notification payload and sends it to FCM.
FCM delivers the notification to the user's device.





Brief Documentation on what ive done so far
I've implemented several features in this Flutter app, including authentication, fetching and displaying necessary user data, and saving it to local storage. Below are brief descriptions of each feature along with setup instructions:

Authentication
I've integrated user authentication using Provided API. Users can sign up, log in, and reset their passwords securely.

Setup Instructions:

Update the baseUrl constant in the constants.dart file to point to your server's base URL if necessary.
Fetching and Displaying User Data
I've implemented functionality to fetch necessary user data from backend endpoints and display it in the app's UI. This can include user profiles, preferences, or any other relevant information.

Setup Instructions:

Define endpoints on your backend server to retrieve user data.
Use Flutter's HTTP client (e.g., http package) to make GET requests to these endpoints.
Parse the JSON response and populate the UI with the fetched user data.
Saving Data to Local Storage
To enhance performance and enable offline access, I've included functionality to save fetched user data to local storage using Flutter's shared_preferences or sqflite plugin.

Setup Instructions:

Add the shared_preferences or  to your pubspec.yaml file.
Serialize the fetched user data into a suitable format (e.g., JSON).
Save the serialized data to local storage after successful fetching.
Retrieve and deserialize the stored data for offline access when needed.
Setting up Firebase Push Notification
To enable Firebase push notifications in the app:

Setup Instructions:

Set up Firebase Cloud Messaging (FCM) in your Firebase project.
Follow the Firebase Cloud Messaging documentation to integrate FCM with your Flutter app.
Handle incoming notifications in your app by implementing the necessary logic in the firebase_messaging package handlers.
