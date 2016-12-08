require 'rails_helper'

describe "Repository" do
  include ActionView::Helpers::DateHelper

  before :each do
    @repo = generate_repo
  end

  context "instance variables" do
    it "responds to a lanuage" do
      expect(@repo.language).to eq("Ruby")
    end

    it "responds to stargazers count" do
      expect(@repo.stargazers_count).to eq(1)
    end
    
    it "responds to forks count" do
      expect(@repo.forks_count).to eq(1)
    end
    
    it "responds to updated" do
      expect(@repo.updated).to eq("2016-12-07 23:59:15 -0700")
    end
    
    it "responds to description" do
      expect(@repo.description).to eq("description")
    end
    
    it "responds to name" do
      expect(@repo.name).to eq("fun-repo")
    end
    
    it "responds to url" do
      expect(@repo.url).to eq("test.com")
    end
    
    it "responds to full name" do
      expect(@repo.full_name).to eq("test/fun-repo")
    end
  end

  context "methods" do
    context ".user_repositories" do
      it "builds a set of repositories belonging to a user" do
        VCR.use_cassette("user_repositories") do
          repos = Repository.user_repositories(user)

          expect(repos).to be_instance_of(Array)
          expect(repos.first).to be_instance_of(Repository)
        end
      end
    end

    context ".stared_repositories" do
      it "builds a set of repositories belonging to a user" do
        VCR.use_cassette("starred_repositories") do
          repos = Repository.starred_repositories(user)

          expect(repos).to be_instance_of(Array)
          expect(repos.first).to be_instance_of(Repository)
        end
      end
    end

    context "#updated_ago_in_words" do
      it "returns the distance in time in English" do
        repo = generate_repo
        expected = "#{time_ago_in_words(repo.updated)} ago"

        expect(repo.updated_ago_in_words).to eq(repo.updated_ago_in_words)
      end
    end
  end
  
end

def generate_repo
  attributes = {language: "Ruby",
                stargazers_count: 1,
                forks_count: 1,
                updated_at: "2016-12-07 23:59:15 -0700",
                description: "description",
                name: "fun-repo",
                html_url: "test.com",
                full_name: "test/fun-repo"}

  Repository.new(attributes)
end

def user
  User.new(token: ENV["github_test_token"], nickname: "rtravitz")
end

