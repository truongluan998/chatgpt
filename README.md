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

* Chat with ChatGPT API
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


### Project Architecture in project

[Untitled Diagram.drawio.pdf](https://github.com/truongluan998/chatgpt/files/11036252/Untitled.Diagram.drawio.pdf)

<img width="891" alt="Screenshot 2023-03-22 at 11 37 25" src="https://user-images.githubusercontent.com/63274798/226803515-596abb69-0064-424f-b2bc-73ef331b7051.png">

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
6- screens - Contains all screens and widget. For example, Login Screen, button, textfield etc,...
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

### Models

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

### Routes

This file contains all the routes for your application. A separate file is created for each type as shown in example below:

```
routes/
|- app_router.dart
|- app_router.gr.dart
|- auth_guard.dart
```

### Screens

this file contains all screens and widget. For example, Login Screen, button, textfield etc,.... A separate file is created for each type as shown in example below:

```
screens/
|- auth/
    |- widget
        |- login_with_social_button.dart
    |- sign_in_page.dart
    |- sign_up_page.dart
|- home/
    |- home_page.dart
|- profile/
    |- widgets
        |- custon_column_infor_profile.dart
        |- vertical_divider_profile.dart
    |- profile_page.dart
|- widgets/
    |- app_elevated_button.dart
    |- app_message_widget.dart
    |- app_text.dart
    |- app_text_form_field.dart
    |- avatar_chat_widget.dart
    |- blur_loading.dart
```

### Services

Contains all the business logic that performs server related tasks such as retrieving data from BE, saving data, displaying notifications, etc... A separate file is created for each type as shown in example below:

```
services/
|- base/
    |- base_service.dart
|- chatgpt/
    |- chatgpt_service.dart
|- firebase/
    |- auth/
        |- auth_service.dart
        |- auth_service_impl.dart
    |- fcm/
        |- notification_service.dart
        |- notification_service_impl.dart
|- service_dependencies.dart
```

### Theme

Contains Application color and theme. For example, text color, button color, text size, button style etc,... A separate file is created for each type as shown in example below:

```
theme/
|- app_color.dart
|- app_theme.dart
```

### Utils

Contains the utilities/common functions of your application. A separate file is created for each type as shown in example below:

```
utils/
|- network/
    |- interceptor.dart
|- app_configuration.dart
|- show_toast.dart
|- validator.dart
```

### Unit Test and Widget Test

Running unit test and widget test will ensure that our code will still run properly even if in the future we add features or modify its existing features. A separate file is created for each type as shown in example below:

```
test/
|- mock_data/
    |- firebase_cloud.dart
    |- mock_data_reponse_model_chatgpt.dart
    |- mocl_data_reponse_reply_chatgpt.dart
|- unit_test/
    |- blocs/
        |- auth/ 
            |- authentication_cubit_test.dart
        |- battery/
            |- check_battery_cubit_test.dart
        |- connectivity/
            |- connectivity_cubit_test.dart
    |- service/
        |- base_service_test.dart
        |- chatgpt_service_test.dart
        |- firebase_messaging_test.dart
        |- firebase_service_test.dart
    |- utils/
        |- interceptor_chatgpt_test.dart
        |- validate_test.dart
|- widget_test/
    |- auth/
        |- login_with_social_button_test.dart
        |- sign_in_page_test.dart
        |- sign_up_page_test.dart
    |- home/
        |- home_page_test.dart
    |- profile/
        |- custom_column_infor_profile_test.dart
        |- profile_page_test.dart
        |- vertical_divider_profile_test.dart
    |- widget/
        |- app_elevated_button_test.dart
        |- app_mesage_widget_test.dart
        |- app_text_form_field_test.dart
        |- app_text_test.dart
        |- avatar_chat_widget_test.dart
        |- blur_loading_test.dart
|- coverage_generate_file.dart
```

**Coverage Test**

Check the coverage of test:

Open file execute_unit_tests.sh -> click run at line 1

<img width="743" alt="Screenshot 2023-03-22 at 09 20 18" src="https://user-images.githubusercontent.com/63274798/226788014-1b21fcab-2e0a-457d-b0a8-9b2e194f901b.png">


### CI CD

CI/CD is simply understood as the continuous working process and automation of the software. For continuous testing, the CI CD needs to be integrated into the software development lifecycle.

**How to CI CD works in project**

```
Step 1: Create pull request for branch develop -> CI CD run
Step 2: Run job Code analysis and testing -> Pass all test -> run step 3
Step 3: Run job Build ChatGPT
```

## Conclusion

This is a safe project, no code leaks are allowed.

Thank you to everyone who has worked hard to contribute to the project, and Mr. Son for his enthusiastic support and guidance.

Thank you.
