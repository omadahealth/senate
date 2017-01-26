require 'rails_helper'

describe RedisController, type: :controller do
  let!(:redi) { create :redi }

  # This should return the minimal set of params required to create a valid
  # model.  As you add validations to your model, be sure to adjust the
  # attributes here as well.
  let(:valid_redi_params) {
    skip("Add a hash of attributes valid for your model")
  }
  let(:invalid_redi_params) {
    skip("Add a hash of attributes invalid for your model")
  }

  context "logged in" do
    let(:user) { create :user }
    before { sign_in user }

    describe "GET index" do
      subject { get :index }
  
      it { subject ; expect(assigns(:redis)).to eq [redi] }
    end
  
    describe "GET show" do
      subject { get :show, id: redi.to_param }
      before { subject }

      it { expect(assigns :redi).to eq redi }
    end
  
    describe "GET new" do
      subject { get :new }
      before { subject }

      it { expect(assigns :redi).to be_a_new(Redi) }
      it { expect(response).to render_template "new" }
    end
  
    describe "GET edit" do
      subject { get :edit, id: redi.to_param }
      before { subject }

      it { expect(assigns :redi).to eq redi }
      it { expect(response).to render_template "edit" }
    end
  
    describe "POST create" do
      subject { post :create, redi: redi_params }

      describe "with valid params" do
        let(:redi_params) { valid_redi_params }

        it { expect { subject }.to change(Redi, :count).by(1) }

        describe "and" do
          before { subject }
          it { expect(assigns :redi).to be_a Redi }
          it { expect(assigns :redi).to be_persisted }
          it { expect(response).to redirect_to Redi.last }
        end
      end
  
      describe "with invalid params" do
        let(:redi_params) { invalid_redi_params }
        before { subject }

        it { expect(assigns(:redi)).to be_a_new Redi }
        it { expect(response).to render_template("new") }
      end
    end
  
    describe "PUT update" do
      subject { patch :update, id: redi.to_param, redi: redi_params }

      describe "with valid params" do
        let(:redi_params) { valid_redi_params }

        it "updates the requested redi" do
          allow(Redi).to receive(:find).and_return(redi)
          expect(redi).to receive(:update).with(redi_params)
          subject
        end

        describe "and" do
          before { subject }

          it { expect(assigns :redi).to eq redi }
          it { expect(response).to redirect_to redi }
        end
      end

      describe "with invalid params" do
        let(:redi_params) { invalid_redi_params }
        before { subject }

        it { expect(assigns :redi).to eq redi }
        it { expect(response).to render_template("edit") }
      end
    end
  
    describe "DELETE destroy" do
      subject { delete :destroy, id: redi.to_param }

      it { expect { subject }.to change(Redi, :count).by(-1) }
      it { subject ; expect(response).to redirect_to redis_url }
    end
  end
end
