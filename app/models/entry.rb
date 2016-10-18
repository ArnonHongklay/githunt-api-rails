class Entry < ActiveRecord::Base
  has_many :votes

  def self.for_feed(type)
    if (type == 'NEW')
      order(created_at: :desc)
    elsif (type == 'TOP')
      # ?
      order(created_at: :desc)
      # order(score: :desc)
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
    ByUserLoader.for(Vote).load(user.login)
    # votes.by(user).first || OpenStruct.new(vote_value: 0)
  end

  def vote(user, vote_value)
    votes.by(user).destroy_all
    votes.by(user).create(vote_value: vote_value)
  end

  def comment(user, content)
    comments.by(user).create(content: content)
  end

  def poster
    OpenStruct.new(Octokit.user(posted_by).to_hash)
  end

  def repository
    repo = OpenStruct.new(Octokit.repository(repository_name).to_hash)
    repo.owner = OpenStruct.new(repo.owner.to_hash)
    repo
  end
end
