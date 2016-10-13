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
  field :postedBy, !UserType, property: :poster
  field :createdAt, !types.Float, property: :created_at
  field :score, !types.Int, nil
  field :comments, types[CommentType]
  field :commentCount, !types.Int
  field :id, !types.Int
  field :vote, !VoteType do
    resolve -> (entry, _, ctx) {
      if (ctx[:user])
        entry.vote_by(ctx[:user])
      else
        OpenStruct.new(vote_value: 0)
      end
    }
  end
end
