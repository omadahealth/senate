require 'rails_helper'

describe SecretsController, type: :controller do
  let!(:secret) { create :secret }

  # This should return the minimal set of params required to create a valid
  # model.  As you add validations to your model, be sure to adjust the
  # attributes here as well.
  let(:valid_secret_params) {
    skip("Add a hash of attributes valid for your model")
  }
  let(:invalid_secret_params) {
    skip("Add a hash of attributes invalid for your model")
  }

  context "logged in" do
    let(:user) { create :user }
    before { sign_in user }

    describe "GET index" do
      subject { get :index }
  
      it { subject ; expect(assigns(:secrets)).to eq [secret] }
    end
  
    describe "GET show" do
      subject { get :show, id: secret.to_param }
      before { subject }

      it { expect(assigns :secret).to eq secret }
    end
  
    describe "GET new" do
      subject { get :new }
      before { subject }

      it { expect(assigns :secret).to be_a_new(Secret) }
      it { expect(response).to render_template "new" }
    end
  
    describe "GET edit" do
      subject { get :edit, id: secret.to_param }
      before { subject }

      it { expect(assigns :secret).to eq secret }
      it { expect(response).to render_template "edit" }
    end
  
    describe "POST create" do
      subject { post :create, secret: secret_params }

      describe "with valid params" do
        let(:secret_params) { valid_secret_params }

        it { expect { subject }.to change(Secret, :count).by(1) }

        describe "and" do
          before { subject }
          it { expect(assigns :secret).to be_a Secret }
          it { expect(assigns :secret).to be_persisted }
          it { expect(response).to redirect_to Secret.last }
        end
      end
  
      describe "with invalid params" do
        let(:secret_params) { invalid_secret_params }
        before { subject }

        it { expect(assigns(:secret)).to be_a_new Secret }
        it { expect(response).to render_template("new") }
      end
    end
  
    describe "PUT update" do
      subject { patch :update, id: secret.to_param, secret: secret_params }

      describe "with valid params" do
        let(:secret_params) { valid_secret_params }

        it "updates the requested secret" do
          allow(Secret).to receive(:find).and_return(secret)
          expect(secret).to receive(:update).with(secret_params)
          subject
        end

        describe "and" do
          before { subject }

          it { expect(assigns :secret).to eq secret }
          it { expect(response).to redirect_to secret }
        end
      end

      describe "with invalid params" do
        let(:secret_params) { invalid_secret_params }
        before { subject }

        it { expect(assigns :secret).to eq secret }
        it { expect(response).to render_template("edit") }
      end
    end
  
    describe "DELETE destroy" do
      subject { delete :destroy, id: secret.to_param }

      it { expect { subject }.to change(Secret, :count).by(-1) }
      it { subject ; expect(response).to redirect_to secrets_url }
    end
  end
end
