require 'spec_helper'

describe "performances/index.html.erb" do
  before(:each) do
    assign(:performances, [
      stub_model(Performance,
        :station => "Station",
        :kilometers => 1,
        :gallons => "9.99",
        :cost => "9.99",
        :cost_gallon => "9.99",
        :km_gallon => "9.99"
      ),
      stub_model(Performance,
        :station => "Station",
        :kilometers => 1,
        :gallons => "9.99",
        :cost => "9.99",
        :cost_gallon => "9.99",
        :km_gallon => "9.99"
      )
    ])
  end

  it "renders a list of performances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Station".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
