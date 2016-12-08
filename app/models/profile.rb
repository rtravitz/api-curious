class Profile
  attr_reader :events, :starred, :followers,
              :following, :basic_info, :repos

  def initialize(user)
    service = GithubService.new
    @starred = Repository.starred_repositories(user)
    @followers = Follow.user_followers(user)
    @following = Follow.user_following(user)
    @basic_info = service.basic_info(user)
    @events = service.events(user)
    @repos = Repository.user_repositories(user)
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

  def repositories_count
    @repos.count
  end

end
