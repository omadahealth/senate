require 'rails_helper'

RSpec.describe "postgresqls/index", type: :view do
  before(:each) do
    assign(:postgresqls, [
      Postgresql.create!(
        :application_environment_id => 2
      ),
      Postgresql.create!(
        :application_environment_id => 2
      )
    ])
  end

  it "renders a list of postgresqls" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
