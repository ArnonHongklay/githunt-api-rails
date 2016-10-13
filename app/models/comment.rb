class Comment < ActiveRecord::Base
  scope :by, -> (user) { where(posted_by: user.login) }
end
