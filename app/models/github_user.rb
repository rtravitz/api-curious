class GithubUser
  attr_reader :name, :login, :image

  def initialize(attributes)
    @name = attributes[:name]
    @login = attributes[:login]
    @image = attributes[:avatar_url]
  end

  def self.load_basic_info(user)
    service = GithubService.new
    info_hash = service.basic_info(user)
    GithubUser.new(info_hash)
  end

end
