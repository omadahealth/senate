require 'rails_helper'

RSpec.describe User, type: :model do

  describe "associations" do
    # it { should belong_to(:model) }
    # it { should have_many(:othermodels) }
    # Add .class_name(SomeClass) if the class does not match the attribute name
  end

  describe "validations" do
    # shoulda-matchers is installed, so you can:
    # it { should validate_presence_of :some_attr }
    # https://github.com/thoughtbot/shoulda-matchers has a full list of matchers.
  end

  describe "validations" do
    it { should validate_presence_of :username }
  end
end
