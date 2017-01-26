require 'rails_helper'

RSpec.describe "redis/index", type: :view do
  before(:each) do
    assign(:redis, [
      Redi.create!(
        :application_environment_id => 2
      ),
      Redi.create!(
        :application_environment_id => 2
      )
    ])
  end

  it "renders a list of redis" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
