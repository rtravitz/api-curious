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

  context "#basic_info" do
    xit "returns a hash of basic biographical information" do
      info = @service.basic_info(@user)

      expect(info.class).to eq(Hash)
      expect(info[:avatar_url]).to eq("https://avatars.githubusercontent.com/u/12074778?v=3")
      expect(info[:name]).to eq("Ryan Travitz")
    end
  end

  context "#events" do
    it "returns a hash of events for the user" do
      events = @service.events(@user)

      expect(events.class).to eq(Array)
      expect(events.first).to have_key(:type)
    end
  end

  context "#organizations" do
    it "returns organizations for the given user" do
      orgs = @service.organizations(@user, "jcasimir")

      expect(orgs.class).to eq(Array)
      expect(orgs.first).to have_key(:login)
    end
  end
end
