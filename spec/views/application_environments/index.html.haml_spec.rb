require 'rails_helper'

RSpec.describe "application_environments/index", type: :view do
  before(:each) do
    assign(:application_environments, [
      ApplicationEnvironment.create!(
        :application_id => 2,
        :environment_id => 3,
        :rails_env => "Rails Env"
      ),
      ApplicationEnvironment.create!(
        :application_id => 2,
        :environment_id => 3,
        :rails_env => "Rails Env"
      )
    ])
  end

  it "renders a list of application_environments" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Rails Env".to_s, :count => 2
  end
end
