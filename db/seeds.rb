repos = [
  {
    repository_name: 'apollostack/apollo-client',
    posted_by: 'stubailo',
  },
  {
    repository_name: 'apollostack/apollo-server',
    posted_by: 'helfer',
  },
  {
    repository_name: 'meteor/meteor',
    posted_by: 'tmeasday',
  },
  {
    repository_name: 'twbs/bootstrap',
    posted_by: 'Slava',
  },
  {
    repository_name: 'd3/d3',
    posted_by: 'Slava',
  },
  {
    repository_name: 'angular/angular.js',
    posted_by: 'Slava',
  },
  {
    repository_name: 'facebook/react',
    posted_by: 'Slava',
  },
  {
    repository_name: 'jquery/jquery',
    posted_by: 'Slava',
  },
  {
    repository_name: 'airbnb/javascript',
    posted_by: 'Slava',
  },
  {
    repository_name: 'facebook/react-native',
    posted_by: 'Slava',
  },
  {
    repository_name: 'torvalds/linux',
    posted_by: 'Slava',
  },
  {
    repository_name: 'daneden/animate.css',
    posted_by: 'Slava',
  },
  {
    repository_name: 'electron/electron',
    posted_by: 'Slava',
  },
  {
    repository_name: 'docker/docker',
    posted_by: 'Slava',
  },
]

Entry.destroy_all
Vote.destroy_all

repos.each_with_index do |repo, i|
  Entry.create(
    created_at: Time.now - i * 1000,
    updated_at: Time.now - i * 1000,
    repository_name: repo[:repository_name],
    posted_by: repo[:posted_by]
  )
end

Vote.create(
  entry: Entry.where(repository_name: repos[0][:repository_name]).first,
  vote_value: 1,
  username: 'stubailo'
)
Vote.create(
  entry: Entry.where(repository_name: repos[0][:repository_name]).first,
  vote_value: 1,
  username: 'tmeasday'
)
Vote.create(
  entry: Entry.where(repository_name: repos[1][:repository_name]).first,
  vote_value: 1,
  username: 'tmeasday'
)
