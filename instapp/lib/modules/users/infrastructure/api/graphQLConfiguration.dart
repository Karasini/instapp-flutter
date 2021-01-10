import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {
  static String _accessToken =
      "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjNCMkQ3QUFCMjE0NzgzNzNCRTVCOTg4RTAyRTRGRDFGIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2MTAyOTYxOTksImV4cCI6MTYxMDI5OTc5OSwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MDAwIiwiYXVkIjoiaW5zdGFwcEFwaSIsImNsaWVudF9pZCI6ImNsaWVudF9tb2JpbGUiLCJzdWIiOiJiZWE2MWZkZC1hNzgzLTQ5MGYtODkwOS02NDIzZWM2NzcwNDAiLCJhdXRoX3RpbWUiOjE2MTAyOTYxOTgsImlkcCI6ImxvY2FsIiwibmljayI6InRlc3QiLCJlbWFpbCI6InRlc3RAdGVzdC50ZXN0IiwianRpIjoiQTU0M0IyMEU0QUM5MDVEMTE2NzhDQTIyODE2NUI5Q0EiLCJpYXQiOjE2MTAyOTYxOTksInNjb3BlIjpbImluc3RhcHBBcGkiLCJvcGVuaWQiLCJvZmZsaW5lX2FjY2VzcyJdLCJhbXIiOlsiZm9ybXMiXX0.lNqRw-NShXZtX5R-RxTKrk7PNupz8srD6jHSurJVk6Ad7AvoUB-jNNOBnX6i249wQp4jjiMLekupPQI0UsdyGhqGKjL-YQYh2frAo81DVZ7BRDUGgEbSysYsWi0YYzw4p4ISJG7AkmT_Yr-EBuuKDV2L3719gWe3em7V8oPa6xcJqUGDNChr2-6P3ZeIujZoKNmmCgzb8wDX-r_h7PlFJMiDHIs7SbzTnplTusWNEnrcuaI8r8kT28x4D6jHlg_FFPd3SdeNoMPJgzVduSbfLIxRkL_-TEDWE7zhp7y0F__Ao-FEqLlIGHxfnot50OZdElU3CfWRRajzZvMy-1MIOg";
  static final HttpLink httpLink = HttpLink(
    uri: 'http://192.168.123.105:5000/graphql',
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
