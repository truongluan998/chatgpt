# ChatGPT-App Project

A ChatGPT project created in flutter using BloC. ChatGPT supports both web and mobile, clone the appropriate branches mentioned below:

* For HTTPS: https://github.com/truongluan998/chatgpt.git (develop branch)
* For SSH: git@github.com:truongluan998/chatgpt.git (develop branch)

## Getting Started

ChatGPT-App uses OpenAI's API to do, uses Firebase Authentication to log in, Firebase Storage to store logins and chats. There are also some features such as notifications when the battery is low and the internet is disconnected while using ChatGPT-App.

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/truongluan998/chatgpt.git (develop branch)
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 3:**

Run project:

```
flutter run
```

## ChatGPT-App Features:

* Splash
* Home
* Routing
* Theme
* Dio
* Flutter Bloc (State Management)
* Firebase Authentication
* Firebase Storage
* Firebase Analytics
* Firebase Cloud Message
* Code Generation
* Check Status Battery
* Check Internet Connection
* Dependency Injection
* Localizations
* Unit test
* CI CD
* Import Private Plugins From Github

### Libraries & Tools Used

* [Dio](https://pub.dev/packages/dio)
* [easy_localization](https://pub.dev/packages/easy_localization)
* [global_configuration](https://pub.dev/packages/global_configuration)
* [get_it](https://pub.dev/packages/get_it)
* [auto_route](https://pub.dev/packages/auto_route)
* [line_icons](https://pub.dev/packages/line_icons)
* [json_serializable](https://pub.dev/packages/json_serializable)
* [json_annotation](https://pub.dev/packages/json_annotation)
* [basic_utils](https://pub.dev/packages/basic_utils)
* [flutter_bloc](https://pub.dev/packages/flutter_bloc)
* [fluttertoast](https://pub.dev/packages/fluttertoast)
* [responsive_framework](https://pub.dev/packages/responsive_framework)
* [freezed_annotation](https://pub.dev/packages/freezed_annotation)
* [flutter_lints](https://pub.dev/packages/flutter_lints)
* [after_layout](https://pub.dev/packages/after_layout)
* [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications)
* [flutter_native_timezone](https://pub.dev/packages/flutter_native_timezone)
* [firebase_core](https://pub.dev/packages/firebase_core)
* [firebase_auth](https://pub.dev/packages/firebase_auth)
* [cloud_firestore](https://pub.dev/packages/cloud_firestore)
* [firebase_messaging](https://pub.dev/packages/firebase_messaging)
* [firebase_analytics](https://pub.dev/packages/firebase_analytics)
* [build_runner](https://pub.dev/packages/build_runner)
* [freezed](https://pub.dev/packages/freezed)
* [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)
* [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
* [mocktail](https://pub.dev/packages/mocktail)
* [test](https://pub.dev/packages/test)
* [http_mock_adapter](https://pub.dev/packages/http_mock_adapter)
* [fake_cloud_firestore](https://pub.dev/packages/fake_cloud_firestore)
* [bloc_test](https://pub.dev/packages/bloc_test)
* [firebase_auth_mocks](https://pub.dev/packages/firebase_auth_mocks)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- assets
|- build
|- coverage
|- ios
|- lib
|- test
|- web
```

Here is the folder structure we have been using in this project

```
lib/
|- src/
    |- blocs/
    |- constants/
    |- models/
    |- routes/
    |- screens/
    |- services/
    |- theme/
    |- utils/
    |- app_dependencies.dart
    |- chatgpt.dart
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- src - Contains all the folders in the application.
2- blocs - Contains logic code to communicate between service and UI.
3- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `dimentions`, `api endpoints`, `preferences` and `strings`.
4- models - Contains all models to get and save data from BE.
5- routes - This file contains all the routes for your application.
6- screens - Contants all screens and widget. For example, Login Screen, button, textfield etc,...
7- services - Contains all the business logic that performs server related tasks such as retrieving data from BE, saving data, displaying notifications, etc..
8- theme - Contains Application color and theme. For example, text color, button color, text size, button style etc,...
9- utils - Contains the utilities/common functions of your application.
10- app_dependencies.dart - contains all the app's registered dependencies.
11- chatgpt.dart - The application level configurations are defined in this file i.e, theme, routes, title, etc,...
12- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, firebase, localization, app dependencies, orientation etc.
```
### Blocs

This directory contains all logic code to communicate between service and UI. A separate file is created for each type as shown in example below:

```
blocs/
|- authentication/
    |- authentiaction_cubit.dart
    |- authentication_state.dart
    |- authentication_state_freezed.dart
|- battery/
    |- check_battery_cubit.dart
    |- check_battery_state.dart
    |- check_battery_state_freezed.dart
|- chat/
    |- chat_cubit.dart
    |- chat_state.dart
    |- chat_state_freezed.dart
|- connectivity/
    |- connectivity_cubit.dart
    |- connectivity_state.dart
    |- connectivity_state_freezed.dart
|- bloc_dependencies.dart
```

### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
constants/
|- app_constants.dart
|- enum.dart
```

### Constants

This directory contains all models to get and save data from BE. A separate file is created for each type as shown in example below:

```
models/
|- auth/
    |- user_model.dart
    |- user_model.freezed.dart
    |- user_model.g.dart
|- model_chatgpt/
    |- request_model/
        |- chatgpt_request.dart
        |- chatgpt_request.g.dart
    |- respones_model/
        |- chatgpt_reply_reponse.dart
        |- chatgpt_reply_reponse.g.dart
        |- get_model_chatgpt_reponse.dart
        |- get_model_chatgpt_reponse.g.dart
    |- chat_model.dart
    |- chat_model.g.dart
|- model_dependencies.dart  
```