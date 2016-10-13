# type Entry {
#   repository: Repository!
#   postedBy: User!
#   createdAt: Float! # Actually a date
#   score: Int!
#   comments: [Comment]! # Should this be paginated?
#   commentCount: Int!
#   id: Int!
#   vote: Vote!
# }

EntryType = GraphQL::ObjectType.define do
  name "Entry"

  field :repository, !RepositoryType
  field :postedBy, !UserType
  field :createdAt, !types.Float
  field :score, !types.Int
  field :comments, types[CommentType]
  field :commentCount, !types.Int
  field :id, !types.Int
  field :vote, !VoteType
end
