require 'rails_helper'

RSpec.describe "postgresqls/new", type: :view do
  before(:each) do
    assign(:postgresql, Postgresql.new(
      :application_environment_id => 1
    ))
  end

  it "renders new postgresql form" do
    render

    assert_select "form[action=?][method=?]", postgresqls_path, "post" do

      assert_select "input#postgresql_application_environment_id[name=?]", "postgresql[application_environment_id]"
    end
  end
end
