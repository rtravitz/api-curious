class Event
  include ActionView::Helpers::DateHelper

  attr_reader :type, :repo, :repo_url, :created, :payload

  def initialize(attributes)
    @type     = attributes[:type]
    @repo     = attributes[:repo][:name]
    @repo_url = attributes [:repo][:url]
    @payload  = attributes [:payload]
    @created  = attributes[:created_at]
  end

  def number_of_commits_in_push
    payload[:size]
  end

  def created_ago_in_words
    "#{time_ago_in_words(created)} ago"
  end

  def self.user_events(user)
    service = GithubService.new
    service.events(user).map do |events_hash|
      Event.new(events_hash) 
    end
  end

end
