class Dashboard
  attr_reader :basic_info

  def initialize(user)
    service = GithubService.new
    @basic_info = service.basic_info(user)
  end
end
