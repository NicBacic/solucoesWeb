require 'rails_helper'

RSpec.describe "StopTimes", type: :request do
  describe "GET /stop_times" do
    it "works! (now write some real specs)" do
      get stop_times_path
      expect(response).to have_http_status(200)
    end
  end
end
