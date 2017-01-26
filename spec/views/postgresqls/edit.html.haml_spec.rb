require 'rails_helper'

RSpec.describe "postgresqls/edit", type: :view do
  before(:each) do
    @postgresql = assign(:postgresql, Postgresql.create!(
      :application_environment_id => 1
    ))
  end

  it "renders the edit postgresql form" do
    render

    assert_select "form[action=?][method=?]", postgresql_path(@postgresql), "post" do

      assert_select "input#postgresql_application_environment_id[name=?]", "postgresql[application_environment_id]"
    end
  end
end
