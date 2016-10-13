class Vote < ActiveRecord::Base
  belongs_to :entry

  scope :by, -> (user) { where(username: user.login) }
end
