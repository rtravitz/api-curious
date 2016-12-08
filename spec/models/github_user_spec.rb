require 'rails_helper'

describe "GithubUser" do
  before :each  do
    attributes = {name: "test_name", login: "test_login", avatar_url: "test_url"}
    @github_user = GithubUser.new(attributes)
  end

  context "instance variables" do
    it "responds to name" do
      expect(@github_user.name).to eq("test_name") 
    end

    it "responds to login" do
      expect(@github_user.login).to eq("test_login")
    end

    it "responds to image" do
      expect(@github_user.image).to eq("test_url")
    end
  end

  context "methods" do
    context ".load_basic_info" do
      it "builds a GithubUser based on a hash of basic info data" do
        VCR.use_cassette("load_basic_info") do
          user = User.new(token: ENV["github_test_token"], nickname: "rtravitz")
          github_user = GithubUser.load_basic_info(user)

          expect(github_user).to be_instance_of(GithubUser)
          expect(github_user.name).to eq("Ryan Travitz")
        end
      end
    end
  end


end
