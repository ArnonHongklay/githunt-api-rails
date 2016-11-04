class GithubLoader < GraphQL::Batch::Loader
  def initialize(method)
    @method = method
  end

  def perform(ids)
    puts "performing #{ids}"

    results = Parallel.map(ids) do |id|
      result = Octokit.send(@method, id)
      [id, OpenStruct.new(result.to_h)]
    end

    results.each do |result|
      key, value = result
      fulfill(key, value)
    end
  end
end
