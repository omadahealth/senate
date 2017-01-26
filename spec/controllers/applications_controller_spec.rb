require 'rails_helper'

describe ApplicationsController, type: :controller do
  let!(:application) { create :application }

  # This should return the minimal set of params required to create a valid
  # model.  As you add validations to your model, be sure to adjust the
  # attributes here as well.
  let(:valid_application_params) {
    skip("Add a hash of attributes valid for your model")
  }
  let(:invalid_application_params) {
    skip("Add a hash of attributes invalid for your model")
  }

  context "logged in" do
    let(:user) { create :user }
    before { sign_in user }

    describe "GET index" do
      subject { get :index }
  
      it { subject ; expect(assigns(:applications)).to eq [application] }
    end
  
    describe "GET show" do
      subject { get :show, id: application.to_param }
      before { subject }

      it { expect(assigns :application).to eq application }
    end
  
    describe "GET new" do
      subject { get :new }
      before { subject }

      it { expect(assigns :application).to be_a_new(Application) }
      it { expect(response).to render_template "new" }
    end
  
    describe "GET edit" do
      subject { get :edit, id: application.to_param }
      before { subject }

      it { expect(assigns :application).to eq application }
      it { expect(response).to render_template "edit" }
    end
  
    describe "POST create" do
      subject { post :create, application: application_params }

      describe "with valid params" do
        let(:application_params) { valid_application_params }

        it { expect { subject }.to change(Application, :count).by(1) }

        describe "and" do
          before { subject }
          it { expect(assigns :application).to be_a Application }
          it { expect(assigns :application).to be_persisted }
          it { expect(response).to redirect_to Application.last }
        end
      end
  
      describe "with invalid params" do
        let(:application_params) { invalid_application_params }
        before { subject }

        it { expect(assigns(:application)).to be_a_new Application }
        it { expect(response).to render_template("new") }
      end
    end
  
    describe "PUT update" do
      subject { patch :update, id: application.to_param, application: application_params }

      describe "with valid params" do
        let(:application_params) { valid_application_params }

        it "updates the requested application" do
          allow(Application).to receive(:find).and_return(application)
          expect(application).to receive(:update).with(application_params)
          subject
        end

        describe "and" do
          before { subject }

          it { expect(assigns :application).to eq application }
          it { expect(response).to redirect_to application }
        end
      end

      describe "with invalid params" do
        let(:application_params) { invalid_application_params }
        before { subject }

        it { expect(assigns :application).to eq application }
        it { expect(response).to render_template("edit") }
      end
    end
  
    describe "DELETE destroy" do
      subject { delete :destroy, id: application.to_param }

      it { expect { subject }.to change(Application, :count).by(-1) }
      it { subject ; expect(response).to redirect_to applications_url }
    end
  end
end
