# type Repository {
#   name: String!
#   full_name: String!
#   description: String
#   html_url: String!
#   stargazers_count: Int!
#   open_issues_count: Int
#
#   # We should investigate how best to represent dates
#   created_at: String!
#
#   owner: User
# }
RepositoryType = GraphQL::ObjectType.define do
  name "Repository"

  field :name, !types.String
  field :full_name, !types.String
  field :description, types.String
  field :html_url, !types.String
  field :stargazers_count, !types.Int
  field :open_issues_count, !types.Int
  field :created_at, !types.String

  field :owner, UserType
end
