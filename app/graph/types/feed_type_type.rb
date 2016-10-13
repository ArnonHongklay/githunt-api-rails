# enum FeedType {
#   HOT
#   NEW
#   TOP
# }
FeedTypeType = GraphQL::EnumType.define do
  name "FeedType"

  value "HOT"
  value "NEW"
  value "TOP"
end
