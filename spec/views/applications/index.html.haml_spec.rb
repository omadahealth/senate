require 'rails_helper'

RSpec.describe "applications/index", type: :view do
  before(:each) do
    assign(:applications, [
      Application.create!(
        :name => "Name",
        :uses_sidekiq => false,
        :uses_postgres => false,
        :uses_redis => false,
        :uses_ldap => false
      ),
      Application.create!(
        :name => "Name",
        :uses_sidekiq => false,
        :uses_postgres => false,
        :uses_redis => false,
        :uses_ldap => false
      )
    ])
  end

  it "renders a list of applications" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
