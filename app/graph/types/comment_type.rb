# type Comment {
#   postedBy: User!
#   createdAt: Float! # Actually a date
#   content: String!
#   repoName: String!
# }
CommentType = GraphQL::ObjectType.define do
  name "Comment"

  field :id, !types.Int
  field :postedBy, !UserType, property: :poster
  field :createdAt, !types.Float, property: :created_at
  field :content, !types.String
  field :repoName, !types.String, property: :repository_name
end
