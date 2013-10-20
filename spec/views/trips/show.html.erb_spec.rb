require 'spec_helper'

describe "trips/show" do
  before(:each) do
    @trip = assign(:trip, stub_model(Trip,
      :car_driver_id => 1,
      :destination_id => 2,
      :note => "Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Note/)
  end
end
