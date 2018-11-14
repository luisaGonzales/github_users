# GraphQL Code Challenge

----
## Description

### Summary
GraphQL Code Challenge is an app for Android, that allows you to search github users and view their repositories.

This android app is developed with [Flutter](https://flutter.io/), a Google's mobile app SDK for crafting native interfaces.
For GraphQL implementation, is using the [graphql_flutter](https://github.com/zino-app/graphql-flutter) dependency. Also, the [Github GraphQL Api](https://developer.github.com/v4/).

### Usage
To use this app, first needs the **apiToken** from GitHub.
[Here](https://docs.cachethq.io/v1.0/docs/github-oauth-token) is a very useful guide to generate it.

Once you have your personal **apiToken**, navigate inside this project to [networks.dart](https://github.com/luisaGonzales/github_users/blob/master/lib/utils/networks.dart) archive and paste it.

    import 'package:graphql_flutter/graphql_flutter.dart';
    ...

    final Client customClient = Client(
     endPoint: 'https://api.github.com/graphql',
     cache: InMemoryCache(),
     apiToken: '<GITHUB_PERSONAL_ACCESS_TOKEN>'
    );

Save it, and run:

    > flutter run

And *voila* the app will run.

----
## Assumptions

About the design, it could be a lot of screens displaying information; so the limits of text lines have been respected.

## Design
The [Material Components widgets](https://flutter.io/docs/reference/widgets/material) has been used for this propose.

Search users


![Design1](https://github.com/luisaGonzales/github_users/blob/master/assets/design1.jpeg?raw=true)

Repositories


![Design2](https://github.com/luisaGonzales/github_users/blob/master/assets/design2.jpeg?raw=true)
