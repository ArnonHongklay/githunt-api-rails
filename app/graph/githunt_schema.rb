GithuntSchema = GraphQL::Schema.define(query: QueryType, mutation: MutationType)

GithuntSchema.query_execution_strategy = GraphQL::Batch::ExecutionStrategy
GithuntSchema.mutation_execution_strategy = GraphQL::Batch::MutationExecutionStrategy

Rails.application.config.optics_agent.instrument_schema(GithuntSchema)
