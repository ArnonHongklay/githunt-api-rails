# type Query {
#   # For the home page, the offset arg is optional to get a new page of the feed
#   feed(type: FeedType!, offset: Int, limit: Int): [Entry]
#
#   # For the entry page
#   entry(repoFullName: String!): Entry
#
#   # To display the current user on the submission page, and the navbar
#   currentUser: User
# }

QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :feed do
    type types[EntryType]

    argument :type, !FeedTypeType
    argument :offset, types.Int
    argument :limit, types.Int

    resolve -> (_, args, _) do
      Entry.for_feed(args[:type])
        .offset(args[:offset] || 0)
        .limit(args[:limit] || 10)
        .all
    end
  end

  field :entry do
    type EntryType

    argument :repoFullName, !types.String

    resolve -> (_, args, _) do
      Entry.where(repository_name: args[:repoFullName]).first
    end
  end

  field :currentUser do
    type UserType
    resolve -> (_, _, ctx) { ctx[:user] }
  end
end
