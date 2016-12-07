class Profile
  attr_reader :starred, :followers, :following, :basic_info
  def initialize(user)
    service = GithubService.new
    @starred = service.starred(user)
    @followers = service.followers(user)
    @following = service.following(user)
    @basic_info = service.basic_info(user)
    @events = service.events(user)
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
