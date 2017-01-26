require 'rails_helper'

RSpec.describe Redi, type: :model do

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

   describe "#update_consul" do
    subject do
      described_class.new(**model_attributes).update_consul
    end

    let(:application) { Application.new name: "foobar" }
    let(:environment) { Environment.new name: "test", consul_dc: "dc1" }
    let(:application_environment) { ApplicationEnvironment.new application: application, environment: environment }
    let(:model_attributes) { { user: "foobar", password: "asdfasdf", host: "localhost", db: 0, port: 6379, application_environment: application_environment } }

    before do
      Diplomat.configuration.url = 'http://localhost:8500'
    end

    it { is_expected.to be_a OpenStruct }


    it "should set all the model attributes into consul" do
      pruned_attributes = model_attributes.reject { |k,v| k.to_s == 'application_environment' }
      pruned_attributes.each do |k,v|
        expect(Diplomat::Kv.get(application_environment.chroot+'/redis/'+k.to_s)).to eq v.to_s
      end
    end
  end
end
