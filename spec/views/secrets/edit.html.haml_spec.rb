require 'rails_helper'

RSpec.describe "secrets/edit", type: :view do
  before(:each) do
    @secret = assign(:secret, Secret.create!(
      :application_environment_id => 1,
      :key => "MyString",
      :value => "MyString"
    ))
  end

  it "renders the edit secret form" do
    render

    assert_select "form[action=?][method=?]", secret_path(@secret), "post" do

      assert_select "input#secret_application_environment_id[name=?]", "secret[application_environment_id]"

      assert_select "input#secret_key[name=?]", "secret[key]"

      assert_select "input#secret_value[name=?]", "secret[value]"
    end
  end
end
