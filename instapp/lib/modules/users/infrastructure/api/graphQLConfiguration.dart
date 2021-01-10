import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {
  static String _accessToken =
      "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjNCMkQ3QUFCMjE0NzgzNzNCRTVCOTg4RTAyRTRGRDFGIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2MDk4NzA5NDcsImV4cCI6MTYwOTg3NDU0NywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MDAwIiwiYXVkIjoiaW5zdGFwcEFwaSIsImNsaWVudF9pZCI6ImNsaWVudF9tb2JpbGUiLCJzdWIiOiJiZWE2MWZkZC1hNzgzLTQ5MGYtODkwOS02NDIzZWM2NzcwNDAiLCJhdXRoX3RpbWUiOjE2MDk4NzA5NDcsImlkcCI6ImxvY2FsIiwibmljayI6InRlc3QiLCJlbWFpbCI6InRlc3RAdGVzdC50ZXN0IiwianRpIjoiNTVDMjI4RkREQTMwNTM1MEMxMzk4RDVBMUVFMzU5RUQiLCJpYXQiOjE2MDk4NzA5NDcsInNjb3BlIjpbImluc3RhcHBBcGkiLCJvcGVuaWQiLCJvZmZsaW5lX2FjY2VzcyJdLCJhbXIiOlsiZm9ybXMiXX0.BoCeD44_Y_y-iyxhSHbua7JwntQp-sQRmArQIqWW0sn8kmYMIhKwlMnCSKtl0txEQRgc0Z-oCV2-QNlQBjZ82E0ezijyFWYYXUJWvKhXkNWrj-BPoFq_5VfZlX_X0NYvZl0DxsD_Qm9OJpKc5VXNE-692jRRYH3rHq5zTRN5gkXQ9NNigFMQfZvFcvowd3XWemqn6fjTxbVApbJE6CoL-TyIvLtFRTNZ1VW4Jg5WyKDScik-OEVmY5HAJtTtRG2eDgdxkyxTOgISBebZv2IALy_w54Br7kAfk87PrIhZy-hgKBSSvviLcCjIucat_ehhiDIDf0MXaXtClgaoQ6lEhA";
  static final HttpLink httpLink = HttpLink(
    uri: 'https://api.instapp.pl/:5000/graphql',
  );

  static final AuthLink authLink = AuthLink(
    getToken: () async => _accessToken,
  );

  static final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: link,
    );
  }
}
