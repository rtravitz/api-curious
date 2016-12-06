require 'rails_helper'

describe "BasicInformationService" do
  context "#starred" do
    it "returns the number of starred repos for a user" do
      starred = BasicInformationService.starred(user) 

    end
  end
end
