class QueryMutation {
  String getAll() {
    return """
query GetAllUser {
 users {
    edges{
      node{        
        nick
        password
        id
      }
    }
  }
}
    """;
  }
}
