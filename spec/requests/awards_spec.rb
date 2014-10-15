require 'rails_helper'

RSpec.describe "Awards", :type => :request do
  describe "GET /awards" do
    it "works!" do
      get awards_path
      expect(response).to have_http_status(200)
    end
  end
end
