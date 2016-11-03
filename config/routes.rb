# To replicate people that reference schemas outside of just their controllers.
# This means the schema will load and instrument at startup time, not first-request time.
GithuntSchema

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  root to: redirect("/graphiql")
  resources :graphql
end
