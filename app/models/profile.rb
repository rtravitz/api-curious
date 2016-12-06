class Profile
  attr_reader :starred, :followers, :following, :image
  def initialize(user)
    service = GithubService.new
    @starred = service.starred(user)
    @followers = service.followers(user)
    @following = service.following(user)
    @image = service.image(user)
  end

  def starred_count
    @starred.count
  end

  def followers_count
    @followers.count
  end

  def following_count
    @following.count
  end
end
