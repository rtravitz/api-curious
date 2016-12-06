require 'rails_helper'

describe "A user can login with Github OAuth" do
  context "A visit visits the root and clicks login" do
    before :each do
      Capybara.app = ApiCurious::Application
    end

    it "they are logged in to their dashboard" do
      visit "/"
      expect(page.status_code).to eq(200)

      click_link "Login"
      expect(page).to have_content("Ryan")
      expect(page).to have_content("Logout")
    end
  end

  def stub_omniauth
  end
end
