require 'rails_helper'

RSpec.describe "stops/show", type: :view do
  before(:each) do
    @stop = assign(:stop, Stop.create!(
      :stop_id => 2,
      :stop_name => "Stop Name",
      :stop_desc => "Stop Desc",
      :stop_lat => 3,
      :stop_lon => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Stop Name/)
    expect(rendered).to match(/Stop Desc/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
