person_type = GraphQL::ObjectType.define do
  name "Person"
  field :firstName do
    type types.String
    resolve -> (obj, args, ctx) { sleep(0.100); return 'Tom' }
  end
  field :lastName do
    type types.String
    resolve -> (obj, args, ctx) { sleep(0.100); return 'Coleman' }
  end
end
query_type = GraphQL::ObjectType.define do
  name 'Query'
  field :person do
    type person_type
    resolve -> (obj, args, ctx) { sleep(0.050); return {} }
  end
end

GithuntSchema = GraphQL::Schema.new(query: query_type)
