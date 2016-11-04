GithuntSchema = GraphQL::Schema.define(query: QueryType, mutation: MutationType)
# Rails.application.config.optics_agent.instrument_schema(GithuntSchema)

GithuntSchema.query_execution_strategy = GraphQL::Batch::ExecutionStrategy
GithuntSchema.mutation_execution_strategy = GraphQL::Batch::MutationExecutionStrategy
