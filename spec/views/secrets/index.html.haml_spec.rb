require 'rails_helper'

RSpec.describe "secrets/index", type: :view do
  before(:each) do
    assign(:secrets, [
      Secret.create!(
        :application_environment_id => 2,
        :key => "Key",
        :value => "Value"
      ),
      Secret.create!(
        :application_environment_id => 2,
        :key => "Key",
        :value => "Value"
      )
    ])
  end

  it "renders a list of secrets" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Key".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
