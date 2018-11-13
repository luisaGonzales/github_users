//body querys
String searchUsers = """
 query SearchUsers(\$user: String!){
  search(query: \$user, type: USER, first: 10) {
    edges {
      node {
        ... on User {
          name
          avatarUrl
          location
          login
        }
      }
    }
  }
}""".replaceAll('\n', ' ');


String getRepositories = """
  query GetRepositories(\$login: String!){
  user(login: \$login ) {
    repositories(first: 20, orderBy: {field: PUSHED_AT, direction: DESC}) {
      edges {
        node {
          name
          description
          pullRequests {
            totalCount
          }
        }
      }
    }
  }
}""".replaceAll('\n', ' ');