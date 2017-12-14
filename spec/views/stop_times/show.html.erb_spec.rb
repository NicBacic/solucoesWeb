require 'rails_helper'

RSpec.describe "stop_times/show", type: :view do
  before(:each) do
    @stop_time = assign(:stop_time, StopTime.create!(
      :trip_id => "Trip",
      :stop_id => 2,
      :stop_sequence => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Trip/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
