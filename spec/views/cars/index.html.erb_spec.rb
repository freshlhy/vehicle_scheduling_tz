require 'spec_helper'

describe "cars/index" do
  before(:each) do
    assign(:cars, [
      stub_model(Car,
        :model => "Model",
        :plate => "Plate"
      ),
      stub_model(Car,
        :model => "Model",
        :plate => "Plate"
      )
    ])
  end

  it "renders a list of cars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "Plate".to_s, :count => 2
  end
end
