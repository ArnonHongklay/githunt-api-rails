class Repository
  # XXX totally bogus right now
  def self.find_by_repository_name(repository_name)
    OpenStruct.new(
      name: repository_name,
      full_name: repository_name,
      description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      html_url: 'http://somewhere.com',
      stargazers_count: 123,
      open_issues_count: 345,
      created_at: '1234',

      owner: User.default
    )
  end
end
