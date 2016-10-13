class Comment < ActiveRecord::Base
  scope :by, -> (user) { where(posted_by: user.login) }

  def poster
    OpenStruct.new(Octokit.user(posted_by).to_hash)
  end
end
