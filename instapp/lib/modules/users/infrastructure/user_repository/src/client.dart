import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Config {
  static final HttpLink httpLink = HttpLink(
    uri: 'http://192.168.123.105:5000/graphql',
  );

  static String _accessToken =
      "eyJhbGciOiJSUzI1NiIsImtpZCI6IjNCMkQ3QUFCMjE0NzgzNzNCRTVCOTg4RTAyRTRGRDFGIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2MDk2MTg0NTAsImV4cCI6MTYwOTYyMjA1MCwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MDAwIiwiYXVkIjoiaW5zdGFwcEFwaSIsImNsaWVudF9pZCI6ImNsaWVudF9tb2JpbGUiLCJzdWIiOiJiZWE2MWZkZC1hNzgzLTQ5MGYtODkwOS02NDIzZWM2NzcwNDAiLCJhdXRoX3RpbWUiOjE2MDk2MTg0NTAsImlkcCI6ImxvY2FsIiwibmljayI6InRlc3QiLCJlbWFpbCI6InRlc3RAdGVzdC50ZXN0IiwianRpIjoiMTA1NkE5OTdBOEJDRjQyODkzNTY3N0ZDMTNDNzFBNjAiLCJpYXQiOjE2MDk2MTg0NTAsInNjb3BlIjpbImluc3RhcHBBcGkiLCJvcGVuaWQiLCJvZmZsaW5lX2FjY2VzcyJdLCJhbXIiOlsiZm9ybXMiXX0.F-qFJ7xs1hIFjurqn25aOTonIyDPrt1AZI4ReegKlPFimtlxqVuu-Su4074bAdUuvUXf6AN8CPVF3oZy-XO3ebqNDGF69aDzYRPL0gqG3k8ZtqLJNRCH_fGPl0L5MEOFw2kLqK3QD4yn5tcwrWIKmbeJvuL2ljZDPFnXkyRs1Owg-Acy8XISrrNws8na_4tjSKD_DXM9n7SJ6EXnkJur_y6e2k1bsP--0lbLem-Xg0RKNwaWGYpOJC6-uK7Ltk6ZkxaamruyNXWbS3U9dG7Q5o1yEC6gZtpFb7-1gAx94WprE6AjVmqtUYCAoixIVPaITGPP1K9II3p3GLo0v0ecag";
  static final AuthLink authLink = AuthLink(getToken: () => _accessToken);

  static final Link link = authLink.concat(httpLink);
  static String token;

  static ValueNotifier<GraphQLClient> initailizeClient(String token) {
    _accessToken = token;
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
        link: link,
      ),
    );
    return client;
  }
}