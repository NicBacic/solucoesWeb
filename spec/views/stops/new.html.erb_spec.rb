require 'rails_helper'

RSpec.describe "stops/new", type: :view do
  before(:each) do
    assign(:stop, Stop.new(
      :stop_id => 1,
      :stop_name => "MyString",
      :stop_desc => "MyString",
      :stop_lat => 1,
      :stop_lon => 1
    ))
  end

  it "renders new stop form" do
    render

    assert_select "form[action=?][method=?]", stops_path, "post" do

      assert_select "input[name=?]", "stop[stop_id]"

      assert_select "input[name=?]", "stop[stop_name]"

      assert_select "input[name=?]", "stop[stop_desc]"

      assert_select "input[name=?]", "stop[stop_lat]"

      assert_select "input[name=?]", "stop[stop_lon]"
    end
  end
end
