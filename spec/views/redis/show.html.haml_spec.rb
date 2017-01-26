require 'rails_helper'

RSpec.describe "redis/show", type: :view do
  before(:each) do
    @redi = assign(:redi, Redi.create!(
      :application_environment_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
