# TikTok

Clone TikTok with Flutter

## Features

- Authentication with Email & Password
- Uploading Videos with Caption
- Compressing Videos
- Generating Thumbnails Out of Video
- Displaying Videos with Caption
- Liking on Posts
- Commenting on Posts
- Liking the Comments
- Searching Users
- Following Users
- Displaying Followers, Following, Likes & Posts of User
- TikTok Like UI

## Tech Used

**Server**: Firebase Auth, Firebase Storage, Firebase Firestore

**Client**: Flutter

## Bloc

- It's the main stateful layer that keep all app's state and data.
- Data must keep in State class, not in bloc itself
- Bloc can handle all UI's business, such as proceed an user's action, control loading flow, change theme or update new language, ... All UIs that need update by state, it's responsible of Bloc
- Bloc is managed through by EventBus, control constructor and dispose, communicate between blocs by add event or listen state changes, and even for broadcast on global channel
- The naming convention to define Event and State class can reference [here](https://bloclibrary.dev/#/blocnamingconventions)
- State class **MUST** be extended by Equatable, but Event class.
- BaseBloc is advanced class of Bloc to handle some generic business such as show/hide app loading (locked loading), handle callApi with common error handling.
- Bloc key is required for all blocs, use Constants to define key.
- Bloc can reference to multiple services to handle business, but less is better.

Example of Bloc new instance:

```
BlocProvider<AuthenticationBloc>(create: (_) => AuthenticationBloc.instance());
```

Factory method for bloc constructor:

```
factory AuthenticationBloc.instance() {
  final key = Keys.Blocs.authenticationBloc;

  return EventBus().newBlocWithConstructor<AuthenticationBloc>(
    key,
    () => AuthenticationBloc(
      key,
      authenticationService: Provider().authenticationService,
    ),
  );
}
```

## Service

- It's the main layer to handle all data business
- It's a stateless layer, so it will be constructed on demand
- A service may contain many use-cases that belong to a same module or epic
- A service can communicate with other services
- All services **MUST** be defined with an interface (abstract class), bloc communicate with service through by the interface

## Theme

- Do not create new extension for ThemeData for any reason. Instead that, we AppThemeData extension to apply theme in UI.
- The theme data is based on Theme entity and will be updated accordingly
- The theme will be applied only in modules folder. Other widgets (in common package or widgets folder) don't apply theme data, it **MUST** support to customize theme if needed.

## Environment

- All configurations data **MUST** set in .evn files, includes configurations for UI layers, service layers, repository layers, and even for common package.
- Configs class, a singleton class is set for all packages that need to load configuration data
- For testing purpose, the configuration data should be passed as parameters in constructor of class instead of hard using.

## Config and run app

- Create Firebase Project
- Enable Firebase Authentication
- Make Firestore Rules
- Create environments folder

```
┌──────────────────────────────────┬────────────────────────────────────────────────────────────────────┐
├─ environments                    │  Setup all configs that based on the environment, using .env file  │
│  ├─ dev                          │  Development environment                                           │
│  │  ├─ .env                      │                                                                    │
│  │  ├─ google-services.json      │                                                                    │
│  │  └─ GoogleService-Info.plist  │                                                                    │
│  ├─ qc                           │  Testing environment                                               │
│  └─ prod                         │  Production environment                                            │
├─ lib                             │                                                                    │
└──────────────────────────────────┴────────────────────────────────────────────────────────────────────┘
```

- Run `flutter pub get`
- Run `make run` (setup environment & run)
