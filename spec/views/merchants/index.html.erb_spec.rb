require 'spec_helper'

describe "merchants/index" do
  before(:each) do
    assign(:merchants, [
      stub_model(Merchant),
      stub_model(Merchant)
    ])
  end

  it "renders a list of merchants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
