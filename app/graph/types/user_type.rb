# # Uses exact field names from GitHub for simplicity
# type User {
#   login: String!
#   avatar_url: String!
#   html_url: String!
# }

UserType = GraphQL::ObjectType.define do
  name "User"

  field :login, !types.String
  field :avatar_url, !types.String
  field :html_url, !types.String
end
