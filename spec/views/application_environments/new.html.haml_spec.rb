require 'rails_helper'

RSpec.describe "application_environments/new", type: :view do
  before(:each) do
    assign(:application_environment, ApplicationEnvironment.new(
      :application_id => 1,
      :environment_id => 1,
      :rails_env => "MyString"
    ))
  end

  it "renders new application_environment form" do
    render

    assert_select "form[action=?][method=?]", application_environments_path, "post" do

      assert_select "input#application_environment_application_id[name=?]", "application_environment[application_id]"

      assert_select "input#application_environment_environment_id[name=?]", "application_environment[environment_id]"

      assert_select "input#application_environment_rails_env[name=?]", "application_environment[rails_env]"
    end
  end
end
