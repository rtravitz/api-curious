class GithubService
  def initialize
    @base_url = "https://api.github.com"
  end

  def basic_info(user)
    response = Faraday.get("#{@base_url}/users/#{user.nickname}?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def starred(user)
    response = Faraday.get("#{@base_url}/user/starred?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def followers(user)
    response = Faraday.get("#{@base_url}/user/followers?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def following(user)
    response = Faraday.get("#{@base_url}/user/following?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
