Octokit.configure do |c|
  c.client_id = ENV['GITHUB_CLIENT_ID']
  c.client_secret = ENV['GITHUB_CLIENT_SECRET']
end

stack = Faraday::RackBuilder.new do |builder|
  builder.use Faraday::HttpCache, serializer: Marshal, shared_cache: false
  builder.use Octokit::Response::RaiseError
  builder.adapter Faraday.default_adapter
end
Octokit.middleware = stack
