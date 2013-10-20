require 'spec_helper'

describe "trips/edit" do
  before(:each) do
    @trip = assign(:trip, stub_model(Trip,
      :car_driver_id => 1,
      :destination_id => 1,
      :note => "MyString"
    ))
  end

  it "renders the edit trip form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => trips_path(@trip), :method => "post" do
      assert_select "input#trip_car_driver_id", :name => "trip[car_driver_id]"
      assert_select "input#trip_destination_id", :name => "trip[destination_id]"
      assert_select "input#trip_note", :name => "trip[note]"
    end
  end
end
