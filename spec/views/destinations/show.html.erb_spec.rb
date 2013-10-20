require 'spec_helper'

describe "destinations/show" do
  before(:each) do
    @destination = assign(:destination, stub_model(Destination,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
