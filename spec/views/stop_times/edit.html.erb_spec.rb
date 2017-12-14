require 'rails_helper'

RSpec.describe "stop_times/edit", type: :view do
  before(:each) do
    @stop_time = assign(:stop_time, StopTime.create!(
      :trip_id => "MyString",
      :stop_id => 1,
      :stop_sequence => 1
    ))
  end

  it "renders the edit stop_time form" do
    render

    assert_select "form[action=?][method=?]", stop_time_path(@stop_time), "post" do

      assert_select "input[name=?]", "stop_time[trip_id]"

      assert_select "input[name=?]", "stop_time[stop_id]"

      assert_select "input[name=?]", "stop_time[stop_sequence]"
    end
  end
end
