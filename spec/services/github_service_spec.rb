require 'rails_helper'

describe "GithubService" do
  before :each do
    @user = User.new(token: ENV["github_test_token"])
    @service = GithubService.new
  end

  context "#starred" do
    it "returns the starred repos for a user" do
      starred = @service.starred(@user) 

      expect(starred.class).to eq(Array)
      expect(starred.count).to eq(2)
      expect(starred.first).to have_key(:name)
    end
  end

  context "#followers" do
    it "returns the followers for a user" do
      followers = @service.followers(@user)

      expect(followers.class).to eq(Array)
      expect(followers.count).to eq(1)
      expect(followers.first).to have_key(:login)
    end
  end

  context "#following" do
    it "returns the accounts the user is following" do
      following = @service.following(@user)
      
      expect(following.class).to eq(Array)
      expect(following.count).to eq(3)
      expect(following.first).to have_key(:login)
    end
  end

  context "#image" do
    xit "returns the url of the user's profile image" do
      image = @service.image(@user)

      expect(image.class).to eq(String)
      expect(image).to eq("https://avatars.githubusercontent.com/u/12074778?v=3")
    end
  end
end
