require 'rails_helper'

RSpec.describe "elastic_searches/edit", type: :view do
  before(:each) do
    @elastic_search = assign(:elastic_search, ElasticSearch.create!(
      :application_environment_id => 1
    ))
  end

  it "renders the edit elastic_search form" do
    render

    assert_select "form[action=?][method=?]", elastic_search_path(@elastic_search), "post" do

      assert_select "input#elastic_search_application_environment_id[name=?]", "elastic_search[application_environment_id]"
    end
  end
end
