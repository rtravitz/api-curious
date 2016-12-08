require 'rails_helper'

describe "Profile" do
  context "instance variables" do
    it "starred is an array of starred repositories" do
      profile = generate_profile

      expect(profile).to respond_to(starred)
      expect(profile.starred.first).to be_instance_of(Repository) 
    end
  end

  
end

