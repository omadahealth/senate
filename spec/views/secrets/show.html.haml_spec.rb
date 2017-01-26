require 'rails_helper'

RSpec.describe "secrets/show", type: :view do
  before(:each) do
    @secret = assign(:secret, Secret.create!(
      :application_environment_id => 2,
      :key => "Key",
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Key/)
    expect(rendered).to match(/Value/)
  end
end
