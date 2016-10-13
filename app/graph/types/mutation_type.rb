# type Mutation {
#   # Submit a new repository
#   submitRepository(repoFullName: String!): Entry
#
#   # Vote on a repository
#   vote(repoFullName: String!, type: VoteType!): Entry
#
#   # Comment on a repository
#   submitComment(repoFullName: String!, commentContent: String!): Comment
# }

MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :submitRepository do
    type EntryType

    argument :repoFullName, !types.String
  end

  field :vote do
    type EntryType

    argument :repoFullName, !types.String
    argument :type, !VoteTypeType
  end

  field :submitComment do
    type CommentType

    argument :repoFullName, !types.String
    argument :commentContent, !types.String
  end
end
