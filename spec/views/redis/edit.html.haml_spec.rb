require 'rails_helper'

RSpec.describe "redis/edit", type: :view do
  before(:each) do
    @redi = assign(:redi, Redi.create!(
      :application_environment_id => 1
    ))
  end

  it "renders the edit redi form" do
    render

    assert_select "form[action=?][method=?]", redi_path(@redi), "post" do

      assert_select "input#redi_application_environment_id[name=?]", "redi[application_environment_id]"
    end
  end
end
