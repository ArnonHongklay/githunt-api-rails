GithuntSchema = GraphQL::Schema.define(query: QueryType, mutation: MutationType)
Rails.application.config.optics_agent.instrument_schema(GithuntSchema)
