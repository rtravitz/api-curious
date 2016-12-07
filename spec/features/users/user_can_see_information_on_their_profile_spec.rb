require 'rails_helper'

describe "A user can see information on their profile page" do
  context "A logged in user visits their profile page" do
    xit "They can see basic profile information" do
      user = User.new(token: ENV["github_test_token"]) 
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit "/rtravitz"

      expect(page).to have_content("Ryan Travitz")
      expect(page).to have_content("1")
      expect(page).to have_content("3")
      expect(page).to have_content("2")
    end
  end
end
