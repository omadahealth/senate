require 'rails_helper'

RSpec.describe "secrets/new", type: :view do
  before(:each) do
    assign(:secret, Secret.new(
      :application_environment_id => 1,
      :key => "MyString",
      :value => "MyString"
    ))
  end

  it "renders new secret form" do
    render

    assert_select "form[action=?][method=?]", secrets_path, "post" do

      assert_select "input#secret_application_environment_id[name=?]", "secret[application_environment_id]"

      assert_select "input#secret_key[name=?]", "secret[key]"

      assert_select "input#secret_value[name=?]", "secret[value]"
    end
  end
end
