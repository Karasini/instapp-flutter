import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/users/domain/models/user.dart';
import 'package:instapp/modules/users/domain/repository/user_repository.dart';
import 'package:instapp/modules/users/infrastructure/api/graphQLConfiguration.dart';
import 'package:instapp/modules/users/infrastructure/api/users_queries.dart';

@Singleton()
class UserRepositoryImpl implements UserRepository {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  Future<User> getUserById(String id) async {
    UsersQueries queryMutation = UsersQueries();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: queryMutation.getUserById(id),
      ),
    );

    var resultJson = result.data["userById"];
    var nick = resultJson["nick"];
    var userId = resultJson["id"];

    return User(userId, nick, "", "");
  }
}
