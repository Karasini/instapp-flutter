import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {
  static String _accessToken =
      "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjNCMkQ3QUFCMjE0NzgzNzNCRTVCOTg4RTAyRTRGRDFGIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2MDk3OTYwMTIsImV4cCI6MTYwOTc5OTYxMiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MDAwIiwiYXVkIjoiaW5zdGFwcEFwaSIsImNsaWVudF9pZCI6ImNsaWVudF9tb2JpbGUiLCJzdWIiOiJiZWE2MWZkZC1hNzgzLTQ5MGYtODkwOS02NDIzZWM2NzcwNDAiLCJhdXRoX3RpbWUiOjE2MDk3OTYwMTIsImlkcCI6ImxvY2FsIiwibmljayI6InRlc3QiLCJlbWFpbCI6InRlc3RAdGVzdC50ZXN0IiwianRpIjoiOEZCRjE3QzFDM0EyQ0VBQ0FDRjZGRTAxNTcxMDY0QTEiLCJpYXQiOjE2MDk3OTYwMTIsInNjb3BlIjpbImluc3RhcHBBcGkiLCJvcGVuaWQiLCJvZmZsaW5lX2FjY2VzcyJdLCJhbXIiOlsiZm9ybXMiXX0.acou7LNcgOTVuqYCMn5ZqYVX7bfTtIQlRWhvOf1OZaGm5ZCt7_uJ9juNarkpoUW1b-yFhe9ckgZNMUzQ6zcOksspYE3W0GFZ2zzeeDdTjRPrI9fb5gLRoDI-AIpXbjo3JHTYxVHEZ5aeZpfIyz1prileAjG44SLT9iRurC0aG9RiL5h16eAdoSQ2pzt6XkQBf5TIJduKVFkCaWJKDO0AWFK0octaCp6k1Q7LR1dlI49OiDpoiRxR3-WrLMeuSElDRIDmWTPdSzYUFvLb_yFYEq4bAgjomS5B20lHnB2pjQq2Fak-5ct13NRyNykUGKYiRBr8SYeQKM18TRpquyF9iQ";
  static final HttpLink httpLink = HttpLink(
    uri: 'http://192.168.123.105:5000/graphql',
  );

  static final AuthLink authLink = AuthLink(
    getToken: () async => _accessToken,
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
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
