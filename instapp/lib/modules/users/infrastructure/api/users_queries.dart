class UsersQueries {
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
