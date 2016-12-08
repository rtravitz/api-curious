require 'rails_helper'
include ActionView::Helpers::DateHelper

describe "A user visits the profile page" do
  before (:each) do
    VCR.use_cassette("profile_information") do
      @user = User.new(token: ENV["github_test_token"], nickname: "rtravitz") 
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit "/rtravitz"
    end
  end

  it "They can see basic profile information" do
    expect(page).to have_content("Ryan Travitz")
    expect(page).to have_content("rtravitz")
  end

  it "They can see their starred repositories" do
    within "#stars"  do
      expect(page).to have_content("rtravitz/rails-engine")
      expect(page).to have_content("rtravitz/api-curious")
      expect(page).to have_content("Ruby")

      date_ago = "#{time_ago_in_words("2016-12-06T20:56:41Z")} ago"
      expect(page).to have_content(date_ago)
    end
  end

  it "They can see their followers" do
    within "#followers" do
      expect(page).to have_content("JStans12")
      expect(page).to have_content("dshinzie")
    end
  end

  it "They can see the people they follow" do
    within "#following" do
      expect(page).to have_content("JStans12")
      expect(page).to have_content("dshinzie")
    end
  end

  it "They can see their repositories" do
    within "#repositories" do
      expect(page).to have_content("rails-engine")
      expect(page).to have_content("Credit-Check")
      expect(page).to have_content("Ruby")

      date_ago = "#{time_ago_in_words("2016-12-06T20:56:41Z")} ago"
      expect(page).to have_content(date_ago)
    end
  end

end
