require 'spec_helper'

describe "merchants/edit" do
  before(:each) do
    @merchant = assign(:merchant, stub_model(Merchant))
  end

  it "renders the edit merchant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", merchant_path(@merchant), "post" do
    end
  end
end
