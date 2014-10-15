require 'rails_helper'

RSpec.describe "AwardTypes", :type => :request do
  describe "GET /award_types" do
    it "works!" do
      get award_types_path
      expect(response).to have_http_status(200)
    end
  end
end
