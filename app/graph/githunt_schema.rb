agent = Rails.application.config.optics_agent
GithuntSchema = GraphQL::Schema.define do
  query QueryType
  mutation MutationType
  agent.instrument self
end
agent.instrument_schema(GithuntSchema, no_middleware: true)
