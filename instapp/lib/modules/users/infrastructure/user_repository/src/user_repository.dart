import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/users/domain/models/user.dart';

import 'models/models.dart';

@Singleton()
class UserRepository {
  UserDto _user;
  final String getTasksQuery = """
query GetAllUser {
  a: users {
    edges{
      node{        
        nick
        password
        id
      }
    }
    pageInfo{
      hasNextPage
      hasPreviousPage
      startCursor
    }
  }
}
""";

  Future<User> getUserById(String id) async {}

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(uri: 'http://10.0.2.2:3000'),
    ),
  );
}
