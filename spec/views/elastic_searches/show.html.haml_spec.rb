require 'rails_helper'

RSpec.describe "elastic_searches/show", type: :view do
  before(:each) do
    @elastic_search = assign(:elastic_search, ElasticSearch.create!(
      :application_environment_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
