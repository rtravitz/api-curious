require 'rails_helper'

describe "Profile" do
  context "instance variables" do
    it "responds to the expected instance variables" do
      VCR.use_cassette("profile_ivars") do
        user = User.new(token: ENV["github_test_token"], nickname: "rtravitz")
        profile = Profile.new(user)

        expect(profile.starred.first).to be_instance_of(Repository) 
        expect(profile.followers.first).to be_instance_of(Follow) 
        expect(profile.following.first).to be_instance_of(Follow) 
        expect(profile.basic_info).to be_instance_of(Hash) 
        expect(profile.events.first).to be_instance_of(Hash) 
        expect(profile.repos.first).to be_instance_of(Repository) 
      end
    end
  end

  context "methods" do
    before(:context)  do
      VCR.use_cassette("profile_methods") do
        user = User.new(token: ENV["github_test_token"], nickname: "rtravitz")
        @profile = Profile.new(user)
      end
    end

    context "#starred_count" do
      it "returns a count of starred repos" do
        expect(@profile.starred_count).to eq(2)
      end
    end

    context "#followers_count" do
      it "returns a count of followers" do
        expect(@profile.followers_count).to eq(3)
      end
    end

    context "#following_count" do
      it "returns a count of users the current user is following" do
        expect(@profile.following_count).to eq(3)
      end
    end

    context "#repositories_count" do
      it "returns a count of the users' repositories" do
        expect(@profile.repositories_count).to eq(23)
      end
    end
  end

  
end

