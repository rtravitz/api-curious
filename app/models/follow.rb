class Follow
  attr_reader :url, :image, :login

  def initialize(attributes)
    @url = attributes[:html_url]
    @image = attributes[:avatar_url]
    @login = attributes[:login]
  end

  def self.user_followers(user)
    service = GithubService.new
    service.followers(user).map do |follower_hash|
      Follow.new(follower_hash)
    end
  end

  def self.user_following(user)
    service = GithubService.new
    service.following(user).map do |follower_hash|
      Follow.new(follower_hash)
    end
  end
end
