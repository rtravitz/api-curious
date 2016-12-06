class GithubService
  def initialize
    @base_url = "https://api.github.com"
  end

  def image(user)
    response = Faraday.get("#{@base_url}/users/#{user.nickname}?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)[:avatar_url]
  end

  def starred(user)
    response = Faraday.get("#{@base_url}/user/starred?access_token=#{user.token}")
    parsed = JSON.parse(response.body)
  end

  def followers(user)
    response = Faraday.get("#{@base_url}/user/followers?access_token=#{user.token}")
    parsed = JSON.parse(response.body)
  end

  def following(user)
    response = Faraday.get("#{@base_url}/user/following?access_token=#{user.token}")
    parsed = JSON.parse(response.body)
  end
end
