# type Vote {
#   vote_value: Int!
# }
VoteType = GraphQL::ObjectType.define do
  name "Vote"

  field :vote_value, !types.Int
end
