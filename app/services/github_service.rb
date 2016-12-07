class GithubService
  def initialize
    @base_url = "https://api.github.com"
  end

  def basic_info(user, target = nil)
    target = user.nickname unless target
    response = Faraday.get("#{@base_url}/users/#{target}?access_token=#{user.token}")
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

  def events(user)
    response = Faraday.get("#{@base_url}/users/#{user.nickname}/events?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def organizations(user, target = nil)
    target = user.nickname unless target
    response = Faraday.get("#{@base_url}/users/#{target}/orgs?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def repos(user, target = nil)
    target = user.nickname unless target
    response = Faraday.get("#{@base_url}/users/#{target}/repos?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

end
