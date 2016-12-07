require 'rails_helper'

describe "A user can login with Github OAuth" do
  context "A visit visits the root and clicks login" do
    before :each do
      Capybara.app = ApiCurious::Application
    end

    it "they are logged in to their dashboard" do
      visit "/"
      stub_omniauth
      expect(page.status_code).to eq(200)

      click_link "Sign in"
      expect(page.status_code).to eq(200)
    end
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      {
        provider: 'github',
        uid: "123",
        info: {
          email: "rtravitz@gmail.com",
          name: "Ryan",
          image: "test_image_link"
        },
        credentials: {
          token: "pizza"
        }, 
        extra: {
          raw_info: {
            login: "rtravitz" 
          } 
        }
      } 
    )
  end
end
