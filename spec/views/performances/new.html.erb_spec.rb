require 'spec_helper'

describe "performances/new.html.erb" do
  before(:each) do
    assign(:performance, stub_model(Performance,
      :station => "MyString",
      :kilometers => 1,
      :gallons => "9.99",
      :cost => "9.99",
      :cost_gallon => "9.99",
      :km_gallon => "9.99"
    ).as_new_record)
  end

  it "renders new performance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => performances_path, :method => "post" do
      assert_select "input#performance_station", :name => "performance[station]"
      assert_select "input#performance_kilometers", :name => "performance[kilometers]"
      assert_select "input#performance_gallons", :name => "performance[gallons]"
      assert_select "input#performance_cost", :name => "performance[cost]"
      assert_select "input#performance_cost_gallon", :name => "performance[cost_gallon]"
      assert_select "input#performance_km_gallon", :name => "performance[km_gallon]"
    end
  end
end
