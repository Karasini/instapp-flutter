import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

import 'models/models.dart';

@Singleton()
class UserRepository {
  UserDto _user;
  final String getTasksQuery = """
query {
  allTodos {
    id,
    title,
    completed
  }
}
""";

  Future<UserDto> getUserById(String id) async {}

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(uri: 'http://10.0.2.2:3000'),
    ),
  );
}
