require 'rails_helper'

RSpec.describe "stop_times/index", type: :view do
  before(:each) do
    assign(:stop_times, [
      StopTime.create!(
        :trip_id => "Trip",
        :stop_id => 2,
        :stop_sequence => 3
      ),
      StopTime.create!(
        :trip_id => "Trip",
        :stop_id => 2,
        :stop_sequence => 3
      )
    ])
  end

  it "renders a list of stop_times" do
    render
    assert_select "tr>td", :text => "Trip".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
