# # Type of vote
# enum VoteType {
#   UP
#   DOWN
#   CANCEL
# }
VoteTypeType = GraphQL::EnumType.define do
  name "VoteType"

  value "UP"
  value "DOWN"
  value "CANCEL"
end
