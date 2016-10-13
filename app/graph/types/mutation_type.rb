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

    resolve -> (_, args, ctx) {
      user = ctx[:user]
      throw 'Must be logged in to submit a repository.' unless user

      Entry.create(
        posted_by: user.username,
        repository_name: args[:repoFullName]
      )
    }
  end

  field :vote do
    type EntryType

    argument :repoFullName, !types.String
    argument :type, !VoteTypeType

    resolve -> (_, args, ctx) {
      user = ctx[:user]
      throw 'Must be logged in to vote.' unless user

      entry = Entry.where(repository_name: args[:repoFullName]).first
      entry.vote(user, args[:type])
      entry.reload

      entry
    }
  end

  field :submitComment do
    type CommentType

    argument :repoFullName, !types.String
    argument :commentContent, !types.String

    resolve -> (_, args, ctx) {
      user = ctx[:user]
      throw 'Must be logged in to submit a comment.' unless user

      entry = Entry.where(repository_name: args[:repoFullName]).first
      entry.comment(user, args[:commentContent])
    }
  end
end
