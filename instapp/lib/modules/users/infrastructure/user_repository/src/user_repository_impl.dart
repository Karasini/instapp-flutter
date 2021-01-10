import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/users/domain/models/user.dart';
import 'package:instapp/modules/users/domain/repository/user_repository.dart';
import 'package:instapp/modules/users/infrastructure/api/users_queries.dart';
import 'package:instapp/modules/users/presentation/graph.dart';

@Singleton()
class UserRepositoryImpl implements UserRepository {
  Future<User> getUserById(String id) async {
    UsersQueries queryMutation = UsersQueries();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: queryMutation.getUserById(id),
      ),
    );
  }
}
