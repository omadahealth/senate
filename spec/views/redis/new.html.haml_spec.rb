require 'rails_helper'

RSpec.describe "redis/new", type: :view do
  before(:each) do
    assign(:redi, Redi.new(
      :application_environment_id => 1
    ))
  end

  it "renders new redi form" do
    render

    assert_select "form[action=?][method=?]", redis_path, "post" do

      assert_select "input#redi_application_environment_id[name=?]", "redi[application_environment_id]"
    end
  end
end
