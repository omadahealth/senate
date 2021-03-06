require 'rails_helper'

RSpec.describe "applications/edit", type: :view do
  before(:each) do
    @application = assign(:application, Application.create!(
      :name => "MyString",
      :uses_sidekiq => false,
      :uses_postgres => false,
      :uses_redis => false,
      :uses_ldap => false
    ))
  end

  it "renders the edit application form" do
    render

    assert_select "form[action=?][method=?]", application_path(@application), "post" do

      assert_select "input#application_name[name=?]", "application[name]"

      assert_select "input#application_uses_sidekiq[name=?]", "application[uses_sidekiq]"

      assert_select "input#application_uses_postgres[name=?]", "application[uses_postgres]"

      assert_select "input#application_uses_redis[name=?]", "application[uses_redis]"

      assert_select "input#application_uses_ldap[name=?]", "application[uses_ldap]"
    end
  end
end
