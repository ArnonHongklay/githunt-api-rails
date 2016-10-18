class ByUserLoader < GraphQL::Batch::Loader
  def initialize(model)
    @model = model
  end

  def perform(types)
    @model.where(username: usernames).each { |record| fulfill(record.username, record) }
    usernames.each { |username| fulfill(username, nil) unless fulfilled?(username) }
  end
end
