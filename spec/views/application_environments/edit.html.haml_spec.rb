require 'rails_helper'

RSpec.describe "application_environments/edit", type: :view do
  before(:each) do
    @application_environment = assign(:application_environment, ApplicationEnvironment.create!(
      :application_id => 1,
      :environment_id => 1,
      :rails_env => "MyString"
    ))
  end

  it "renders the edit application_environment form" do
    render

    assert_select "form[action=?][method=?]", application_environment_path(@application_environment), "post" do

      assert_select "input#application_environment_application_id[name=?]", "application_environment[application_id]"

      assert_select "input#application_environment_environment_id[name=?]", "application_environment[environment_id]"

      assert_select "input#application_environment_rails_env[name=?]", "application_environment[rails_env]"
    end
  end
end
