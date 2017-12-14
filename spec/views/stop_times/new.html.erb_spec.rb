require 'rails_helper'

RSpec.describe "stop_times/new", type: :view do
  before(:each) do
    assign(:stop_time, StopTime.new(
      :trip_id => "MyString",
      :stop_id => 1,
      :stop_sequence => 1
    ))
  end

  it "renders new stop_time form" do
    render

    assert_select "form[action=?][method=?]", stop_times_path, "post" do

      assert_select "input[name=?]", "stop_time[trip_id]"

      assert_select "input[name=?]", "stop_time[stop_id]"

      assert_select "input[name=?]", "stop_time[stop_sequence]"
    end
  end
end
