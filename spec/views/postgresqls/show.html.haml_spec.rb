require 'rails_helper'

RSpec.describe "postgresqls/show", type: :view do
  before(:each) do
    @postgresql = assign(:postgresql, Postgresql.create!(
      :application_environment_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
