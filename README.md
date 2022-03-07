# RandomUserTechnicalTest

## Environment

- Xcode 13
- target: **iOS14**
- UI: **UIkit**

### Third part tools
- [GRDB](https://github.com/groue/GRDB.swift) - A toolkit for SQLite databases
- [Kingfisher](https://github.com/onevcat/Kingfisher) - A library for downloading and caching images from the web

## Architecture

It's a MVVM architecture with Clean Architecture for the business part.
I choose MVVM because I think this architure is the most famous in the IT community and can be understand by many people.
It's not too simple like MVC and not too complex like VIPER.

The project is divided in three parts:
- `data` - layer to provide data from datasources like database or API
- `domain` - layer to manage the business logic of the app
- `presentation` - layer to display datas through screens

![diagram](https://user-images.githubusercontent.com/56483550/156462813-38a29c18-b75e-479a-b4e0-7a3155c2cdfc.png)

> Arrows describe data flow between the different layers

### UsersUseCase

It's the keystone, it contains Business logic for managing datas from `data`layer and provide it to `presentation` layer.

Its main role is to provide users whatever the sources.
To do it, it fetch Users from the API then save them in database.
In case of a network error, it fetch users from database.

### UserRemoteRepository

Dedicated to delivery User datas from an API

### UserLocalRepository

Dedicated to delivery and to put User datas in a database

### RemoteDataProvider

Generic provider to delivery data from the API, could be reuse for others data types

### LocalDataProvider

Generic provider to delivery data from the databse, could be reuse for others data types

### UsersViewModel

This ViewModel bring presentation's datas to the screen.
The view know only this part and ignore other elements.

## Good practices

- Dependency injection by using `init` to pass object's instances to a class/struct
- Dependency inversion by using protocol in the init instead of concrete types
- Mainly using `struct` instead of `class` to avoid inheritance and using reference when It's not mandatory
- Using generics to avoid duplicate code

## Commits strategy

My commits stategy is to make a commit for one task with a clear description.
This description should explain the whole commit's content.


## Further

Many things are still to be done:

- Implement a Coordinator to manage the navigation between screens
- Put a default View with a message when no users was found
- Unit tests for all `data` and `domain` objects: at this moment, I tested only `UsersUseCase` just for showing an example.
- Make refresh datas in TableView better and smooth.
- Using `Swinject` instead of home solution for manage dependencies.
