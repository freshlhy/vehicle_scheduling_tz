require 'spec_helper'

describe "cars/edit" do
  before(:each) do
    @car = assign(:car, stub_model(Car,
      :model => "MyString",
      :plate => "MyString"
    ))
  end

  it "renders the edit car form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cars_path(@car), :method => "post" do
      assert_select "input#car_model", :name => "car[model]"
      assert_select "input#car_plate", :name => "car[plate]"
    end
  end
end
