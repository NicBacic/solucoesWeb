require 'rails_helper'

RSpec.describe "stops/edit", type: :view do
  before(:each) do
    @stop = assign(:stop, Stop.create!(
      :stop_id => 1,
      :stop_name => "MyString",
      :stop_desc => "MyString",
      :stop_lat => 1,
      :stop_long => 1
    ))
  end

  it "renders the edit stop form" do
    render

    assert_select "form[action=?][method=?]", stop_path(@stop), "post" do

      assert_select "input[name=?]", "stop[stop_id]"

      assert_select "input[name=?]", "stop[stop_name]"

      assert_select "input[name=?]", "stop[stop_desc]"

      assert_select "input[name=?]", "stop[stop_lat]"

      assert_select "input[name=?]", "stop[stop_long]"
    end
  end
end
