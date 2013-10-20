require 'spec_helper'

describe "destinations/index" do
  before(:each) do
    assign(:destinations, [
      stub_model(Destination,
        :name => "Name"
      ),
      stub_model(Destination,
        :name => "Name"
      )
    ])
  end

  it "renders a list of destinations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
