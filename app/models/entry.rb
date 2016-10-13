class Entry < ActiveRecord::Base
  has_many :votes

  def self.for_feed(type)
    if (type == 'NEW')
      order(created_at: :desc)
    elsif (type == 'TOP')
      order(score: :desc)
    else
      throw "NOT A FEED TYPE: #{type}"
    end
  end

  def score
    0
  end

  def comments
    Comment.where(repository_name: repository_name)
  end

  def commentCount
    comments.count
  end

  def vote_by(user)
    votes.where(username: user.login).first || OpenStruct.new(vote_value: 0)
  end
end
