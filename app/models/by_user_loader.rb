class ByUserLoader < GraphQL::Batch::Loader
  def initialize(model)
    @model = model
  end

  def perform(usernames)
    puts "performing by_user.#{@model} [#{usernames}]"
    @model.where(username: usernames).each { |record| fulfill(record.username, record) }
    puts "done by_user.#{@model} [#{usernames}]"
    usernames.each { |username| fulfill(username, nil) unless fulfilled?(username) }
  end
end
