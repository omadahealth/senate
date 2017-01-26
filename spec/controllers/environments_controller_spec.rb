require 'rails_helper'

describe EnvironmentsController, type: :controller do
  let!(:environment) { create :environment }

  # This should return the minimal set of params required to create a valid
  # model.  As you add validations to your model, be sure to adjust the
  # attributes here as well.
  let(:valid_environment_params) {
    skip("Add a hash of attributes valid for your model")
  }
  let(:invalid_environment_params) {
    skip("Add a hash of attributes invalid for your model")
  }

  context "logged in" do
    let(:user) { create :user }
    before { sign_in user }

    describe "GET index" do
      subject { get :index }
  
      it { subject ; expect(assigns(:environments)).to eq [environment] }
    end
  
    describe "GET show" do
      subject { get :show, id: environment.to_param }
      before { subject }

      it { expect(assigns :environment).to eq environment }
    end
  
    describe "GET new" do
      subject { get :new }
      before { subject }

      it { expect(assigns :environment).to be_a_new(Environment) }
      it { expect(response).to render_template "new" }
    end
  
    describe "GET edit" do
      subject { get :edit, id: environment.to_param }
      before { subject }

      it { expect(assigns :environment).to eq environment }
      it { expect(response).to render_template "edit" }
    end
  
    describe "POST create" do
      subject { post :create, environment: environment_params }

      describe "with valid params" do
        let(:environment_params) { valid_environment_params }

        it { expect { subject }.to change(Environment, :count).by(1) }

        describe "and" do
          before { subject }
          it { expect(assigns :environment).to be_a Environment }
          it { expect(assigns :environment).to be_persisted }
          it { expect(response).to redirect_to Environment.last }
        end
      end
  
      describe "with invalid params" do
        let(:environment_params) { invalid_environment_params }
        before { subject }

        it { expect(assigns(:environment)).to be_a_new Environment }
        it { expect(response).to render_template("new") }
      end
    end
  
    describe "PUT update" do
      subject { patch :update, id: environment.to_param, environment: environment_params }

      describe "with valid params" do
        let(:environment_params) { valid_environment_params }

        it "updates the requested environment" do
          allow(Environment).to receive(:find).and_return(environment)
          expect(environment).to receive(:update).with(environment_params)
          subject
        end

        describe "and" do
          before { subject }

          it { expect(assigns :environment).to eq environment }
          it { expect(response).to redirect_to environment }
        end
      end

      describe "with invalid params" do
        let(:environment_params) { invalid_environment_params }
        before { subject }

        it { expect(assigns :environment).to eq environment }
        it { expect(response).to render_template("edit") }
      end
    end
  
    describe "DELETE destroy" do
      subject { delete :destroy, id: environment.to_param }

      it { expect { subject }.to change(Environment, :count).by(-1) }
      it { subject ; expect(response).to redirect_to environments_url }
    end
  end
end
