# # Type of vote
# enum VoteType {
#   UP
#   DOWN
#   CANCEL
# }
VoteTypeType = GraphQL::EnumType.define do
  name "VoteType"

  value "UP", value: 1
  value "DOWN", value: -1
  value "CANCEL", value: 0
end
