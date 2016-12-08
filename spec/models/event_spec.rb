require 'rails_helper'

describe "Event" do
  before :each do
		VCR.use_cassette("event_ivars") do
			@user = User.new(token: ENV["github_test_token"], nickname: "rtravitz")
			service = GithubService.new
			hash = service.events(@user)
			@event = Event.new(hash.first) 
		end
  end

  context "instance variables" do
    it "responds to type" do
			expect(@event.type).to eq("PushEvent")
    end

		it "responds to repo" do
      expect(@event.repo).to eq("rtravitz/api-curious")
		end

    it "responds to repo_url" do
      expect(@event.repo_url).to eq("https://api.github.com/repos/rtravitz/api-curious")
    end

    it "responds to payload" do
      expect(@event.payload).to be_instance_of(Hash)
      expect(@event.payload[:size]).to eq(3)
    end

    it "responds to created" do
      expect(@event.created).to eq("2016-12-08T17:30:25Z")
    end
    
  end

  context "methods" do
    context "#user_events" do
      it "builds a set of events belonging to a user" do
        VCR.use_cassette("user_events") do
          events = Event.user_events(@user)
          
          expect(events).to be_instance_of(Array)
          expect(events.first).to be_instance_of(Event)
        end
      end
    end

    context ".number_of_commits_in_push" do
      it "returns the number of commits in a push" do
        expect(@event.number_of_commits_in_push).to eq(3)
      end
    end
  end
  
end
