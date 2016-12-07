class Repository
  def initialize(attributes)
    @language = attributes[:language]
    @stargazers_count = attributes[:stargazers_count]
    @forks_count = attributes[:forks_count]
    @updated = attributes[:updated_at]
    @description = attributes[:description]
    @name = attributes[:name]
    @url = attributes[:html_url]
  end

  def self.user_repositories(user)
    service = GithubService.new    
    service.repos(user).map do |repo_hash|
      Repository.new(repo_hash)
    end
  end
end
