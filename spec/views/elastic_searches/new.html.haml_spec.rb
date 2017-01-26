require 'rails_helper'

RSpec.describe "elastic_searches/new", type: :view do
  before(:each) do
    assign(:elastic_search, ElasticSearch.new(
      :application_environment_id => 1
    ))
  end

  it "renders new elastic_search form" do
    render

    assert_select "form[action=?][method=?]", elastic_searches_path, "post" do

      assert_select "input#elastic_search_application_environment_id[name=?]", "elastic_search[application_environment_id]"
    end
  end
end
