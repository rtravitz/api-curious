class Repository
  include ActionView::Helpers::DateHelper

  attr_reader :language, :stargazers_count, :forks_count, :updated,
              :description, :name, :url, :full_name

  def initialize(attributes)
    @language = attributes[:language]
    @stargazers_count = attributes[:stargazers_count]
    @forks_count = attributes[:forks_count]
    @updated = attributes[:updated_at]
    @description = attributes[:description]
    @name = attributes[:name]
    @url = attributes[:html_url]
    @full_name = attributes[:full_name]
  end

  def self.user_repositories(user)
    service = GithubService.new    
    service.repos(user).map do |repo_hash|
      Repository.new(repo_hash)
    end
  end

  def self.starred_repositories(user)
    service = GithubService.new
    service.starred(user).map do |repo_hash|
      Repository.new(repo_hash)
    end
  end

  def updated_ago_in_words
    "#{time_ago_in_words(updated)} ago"
  end
end
