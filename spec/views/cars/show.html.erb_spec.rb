require 'spec_helper'

describe "cars/show" do
  before(:each) do
    @car = assign(:car, stub_model(Car,
      :model => "Model",
      :plate => "Plate"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Model/)
    rendered.should match(/Plate/)
  end
end
