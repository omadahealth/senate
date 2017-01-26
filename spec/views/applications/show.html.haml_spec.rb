require 'rails_helper'

RSpec.describe "applications/show", type: :view do
  before(:each) do
    @application = assign(:application, Application.create!(
      :name => "Name",
      :uses_sidekiq => false,
      :uses_postgres => false,
      :uses_redis => false,
      :uses_ldap => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
