require 'rails_helper'

RSpec.describe "application_environments/show", type: :view do
  before(:each) do
    @application_environment = assign(:application_environment, ApplicationEnvironment.create!(
      :application_id => 2,
      :environment_id => 3,
      :rails_env => "Rails Env"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Rails Env/)
  end
end
