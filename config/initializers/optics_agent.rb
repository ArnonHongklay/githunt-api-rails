optics_agent = OpticsAgent::Agent.new
optics_agent.configure do
  schema GithuntSchema
  debug true
end
Rails.application.config.middleware.use optics_agent.rack_middleware
