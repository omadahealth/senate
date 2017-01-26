require 'rails_helper'

describe ApplicationEnvironmentsController, type: :controller do
  let!(:application_environment) { create :application_environment }

  # This should return the minimal set of params required to create a valid
  # model.  As you add validations to your model, be sure to adjust the
  # attributes here as well.
  let(:valid_application_environment_params) {
    skip("Add a hash of attributes valid for your model")
  }
  let(:invalid_application_environment_params) {
    skip("Add a hash of attributes invalid for your model")
  }

  context "logged in" do
    let(:user) { create :user }
    before { sign_in user }

    describe "GET index" do
      subject { get :index }
  
      it { subject ; expect(assigns(:application_environments)).to eq [application_environment] }
    end
  
    describe "GET show" do
      subject { get :show, id: application_environment.to_param }
      before { subject }

      it { expect(assigns :application_environment).to eq application_environment }
    end
  
    describe "GET new" do
      subject { get :new }
      before { subject }

      it { expect(assigns :application_environment).to be_a_new(ApplicationEnvironment) }
      it { expect(response).to render_template "new" }
    end
  
    describe "GET edit" do
      subject { get :edit, id: application_environment.to_param }
      before { subject }

      it { expect(assigns :application_environment).to eq application_environment }
      it { expect(response).to render_template "edit" }
    end
  
    describe "POST create" do
      subject { post :create, application_environment: application_environment_params }

      describe "with valid params" do
        let(:application_environment_params) { valid_application_environment_params }

        it { expect { subject }.to change(ApplicationEnvironment, :count).by(1) }

        describe "and" do
          before { subject }
          it { expect(assigns :application_environment).to be_a ApplicationEnvironment }
          it { expect(assigns :application_environment).to be_persisted }
          it { expect(response).to redirect_to ApplicationEnvironment.last }
        end
      end
  
      describe "with invalid params" do
        let(:application_environment_params) { invalid_application_environment_params }
        before { subject }

        it { expect(assigns(:application_environment)).to be_a_new ApplicationEnvironment }
        it { expect(response).to render_template("new") }
      end
    end
  
    describe "PUT update" do
      subject { patch :update, id: application_environment.to_param, application_environment: application_environment_params }

      describe "with valid params" do
        let(:application_environment_params) { valid_application_environment_params }

        it "updates the requested application_environment" do
          allow(ApplicationEnvironment).to receive(:find).and_return(application_environment)
          expect(application_environment).to receive(:update).with(application_environment_params)
          subject
        end

        describe "and" do
          before { subject }

          it { expect(assigns :application_environment).to eq application_environment }
          it { expect(response).to redirect_to application_environment }
        end
      end

      describe "with invalid params" do
        let(:application_environment_params) { invalid_application_environment_params }
        before { subject }

        it { expect(assigns :application_environment).to eq application_environment }
        it { expect(response).to render_template("edit") }
      end
    end
  
    describe "DELETE destroy" do
      subject { delete :destroy, id: application_environment.to_param }

      it { expect { subject }.to change(ApplicationEnvironment, :count).by(-1) }
      it { subject ; expect(response).to redirect_to application_environments_url }
    end
  end
end
