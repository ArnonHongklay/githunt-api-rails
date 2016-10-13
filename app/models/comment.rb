class Comment < ActiveRecord::Base
  scope :by, -> (user) { where(posted_by: user.login) }

  def poster
    User.find_by_login(posted_by)
  end
end
