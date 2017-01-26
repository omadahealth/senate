require 'rails_helper'

describe PostgresqlsController, type: :controller do
  let!(:postgresql) { create :postgresql }

  # This should return the minimal set of params required to create a valid
  # model.  As you add validations to your model, be sure to adjust the
  # attributes here as well.
  let(:valid_postgresql_params) {
    skip("Add a hash of attributes valid for your model")
  }
  let(:invalid_postgresql_params) {
    skip("Add a hash of attributes invalid for your model")
  }

  context "logged in" do
    let(:user) { create :user }
    before { sign_in user }

    describe "GET index" do
      subject { get :index }
  
      it { subject ; expect(assigns(:postgresqls)).to eq [postgresql] }
    end
  
    describe "GET show" do
      subject { get :show, id: postgresql.to_param }
      before { subject }

      it { expect(assigns :postgresql).to eq postgresql }
    end
  
    describe "GET new" do
      subject { get :new }
      before { subject }

      it { expect(assigns :postgresql).to be_a_new(Postgresql) }
      it { expect(response).to render_template "new" }
    end
  
    describe "GET edit" do
      subject { get :edit, id: postgresql.to_param }
      before { subject }

      it { expect(assigns :postgresql).to eq postgresql }
      it { expect(response).to render_template "edit" }
    end
  
    describe "POST create" do
      subject { post :create, postgresql: postgresql_params }

      describe "with valid params" do
        let(:postgresql_params) { valid_postgresql_params }

        it { expect { subject }.to change(Postgresql, :count).by(1) }

        describe "and" do
          before { subject }
          it { expect(assigns :postgresql).to be_a Postgresql }
          it { expect(assigns :postgresql).to be_persisted }
          it { expect(response).to redirect_to Postgresql.last }
        end
      end
  
      describe "with invalid params" do
        let(:postgresql_params) { invalid_postgresql_params }
        before { subject }

        it { expect(assigns(:postgresql)).to be_a_new Postgresql }
        it { expect(response).to render_template("new") }
      end
    end
  
    describe "PUT update" do
      subject { patch :update, id: postgresql.to_param, postgresql: postgresql_params }

      describe "with valid params" do
        let(:postgresql_params) { valid_postgresql_params }

        it "updates the requested postgresql" do
          allow(Postgresql).to receive(:find).and_return(postgresql)
          expect(postgresql).to receive(:update).with(postgresql_params)
          subject
        end

        describe "and" do
          before { subject }

          it { expect(assigns :postgresql).to eq postgresql }
          it { expect(response).to redirect_to postgresql }
        end
      end

      describe "with invalid params" do
        let(:postgresql_params) { invalid_postgresql_params }
        before { subject }

        it { expect(assigns :postgresql).to eq postgresql }
        it { expect(response).to render_template("edit") }
      end
    end
  
    describe "DELETE destroy" do
      subject { delete :destroy, id: postgresql.to_param }

      it { expect { subject }.to change(Postgresql, :count).by(-1) }
      it { subject ; expect(response).to redirect_to postgresqls_url }
    end
  end
end
