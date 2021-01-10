class UsersQueries {
  String getAll(String id) {
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

  String getUserById(String id) {
    return """
  {
  userById(id: "$id") {
        nick
        password
        id
    }
  }
  }
      """;
  }
}
