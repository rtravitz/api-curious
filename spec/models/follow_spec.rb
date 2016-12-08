require 'rails_helper'

describe "Follow" do

  before :each do
    @follow = generate_follow
  end

  context "instance variables" do
    it "responds to url" do
      expect(@follow.url).to eq("test.com")
    end

    it "responds to image" do
      expect(@follow.image).to eq("test_image.jpg")
    end

    it "responds to login" do
      expect(@follow.login).to eq("rtravitz")
    end
  end

  context "methods" do
    context ".user_followers" do
      it "builds a set of people who follow the user as Follow objects" do
        VCR.use_cassette("user_followers") do
          followers = Follow.user_followers(user)

          expect(followers).to be_instance_of(Array)
          expect(followers.first).to be_instance_of(Follow)
        end
      end
    end

    context ".user_following" do
      it "builds a set of people who follow the user as Follow objects" do
        VCR.use_cassette("user_following") do
          followers = Follow.user_following(user)

          expect(followers).to be_instance_of(Array)
          expect(followers.first).to be_instance_of(Follow)
        end
      end
    end
  end
end

def generate_follow
  attributes = {html_url: "test.com",
                avatar_url: "test_image.jpg",
                login: "rtravitz"}

  Follow.new(attributes)
end

def user
  User.new(token: ENV["github_test_token"], nickname: "rtravitz")
end
