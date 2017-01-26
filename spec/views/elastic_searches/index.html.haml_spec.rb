require 'rails_helper'

RSpec.describe "elastic_searches/index", type: :view do
  before(:each) do
    assign(:elastic_searches, [
      ElasticSearch.create!(
        :application_environment_id => 2
      ),
      ElasticSearch.create!(
        :application_environment_id => 2
      )
    ])
  end

  it "renders a list of elastic_searches" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
