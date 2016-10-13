class User
  # XXX totally bogus right now
  def self.find_by_login(login)
    OpenStruct.new(
      login: login,
      avatar_url: 'https://avatars1.githubusercontent.com/u/132554?v=3&s=466',
      html_url: 'https://github.com/tmeasday'
    )
  end

  def self.default
    find_by_login('tmeasday')
  end
end
