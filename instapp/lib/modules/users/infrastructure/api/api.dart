import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'http://localhost:5000/graphql'),
  ),
);

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
