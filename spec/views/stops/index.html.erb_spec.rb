require 'rails_helper'

RSpec.describe "stops/index", type: :view do
  before(:each) do
    assign(:stops, [
      Stop.create!(
        :stop_id => 2,
        :stop_name => "Stop Name",
        :stop_desc => "Stop Desc",
        :stop_lat => 3,
        :stop_long => 4
      ),
      Stop.create!(
        :stop_id => 2,
        :stop_name => "Stop Name",
        :stop_desc => "Stop Desc",
        :stop_lat => 3,
        :stop_long => 4
      )
    ])
  end

  it "renders a list of stops" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Stop Name".to_s, :count => 2
    assert_select "tr>td", :text => "Stop Desc".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
