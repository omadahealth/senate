require 'rails_helper'

describe ElasticSearchesController, type: :controller do
  let!(:elastic_search) { create :elastic_search }

  # This should return the minimal set of params required to create a valid
  # model.  As you add validations to your model, be sure to adjust the
  # attributes here as well.
  let(:valid_elastic_search_params) {
    skip("Add a hash of attributes valid for your model")
  }
  let(:invalid_elastic_search_params) {
    skip("Add a hash of attributes invalid for your model")
  }

  context "logged in" do
    let(:user) { create :user }
    before { sign_in user }

    describe "GET index" do
      subject { get :index }
  
      it { subject ; expect(assigns(:elastic_searches)).to eq [elastic_search] }
    end
  
    describe "GET show" do
      subject { get :show, id: elastic_search.to_param }
      before { subject }

      it { expect(assigns :elastic_search).to eq elastic_search }
    end
  
    describe "GET new" do
      subject { get :new }
      before { subject }

      it { expect(assigns :elastic_search).to be_a_new(ElasticSearch) }
      it { expect(response).to render_template "new" }
    end
  
    describe "GET edit" do
      subject { get :edit, id: elastic_search.to_param }
      before { subject }

      it { expect(assigns :elastic_search).to eq elastic_search }
      it { expect(response).to render_template "edit" }
    end
  
    describe "POST create" do
      subject { post :create, elastic_search: elastic_search_params }

      describe "with valid params" do
        let(:elastic_search_params) { valid_elastic_search_params }

        it { expect { subject }.to change(ElasticSearch, :count).by(1) }

        describe "and" do
          before { subject }
          it { expect(assigns :elastic_search).to be_a ElasticSearch }
          it { expect(assigns :elastic_search).to be_persisted }
          it { expect(response).to redirect_to ElasticSearch.last }
        end
      end
  
      describe "with invalid params" do
        let(:elastic_search_params) { invalid_elastic_search_params }
        before { subject }

        it { expect(assigns(:elastic_search)).to be_a_new ElasticSearch }
        it { expect(response).to render_template("new") }
      end
    end
  
    describe "PUT update" do
      subject { patch :update, id: elastic_search.to_param, elastic_search: elastic_search_params }

      describe "with valid params" do
        let(:elastic_search_params) { valid_elastic_search_params }

        it "updates the requested elastic_search" do
          allow(ElasticSearch).to receive(:find).and_return(elastic_search)
          expect(elastic_search).to receive(:update).with(elastic_search_params)
          subject
        end

        describe "and" do
          before { subject }

          it { expect(assigns :elastic_search).to eq elastic_search }
          it { expect(response).to redirect_to elastic_search }
        end
      end

      describe "with invalid params" do
        let(:elastic_search_params) { invalid_elastic_search_params }
        before { subject }

        it { expect(assigns :elastic_search).to eq elastic_search }
        it { expect(response).to render_template("edit") }
      end
    end
  
    describe "DELETE destroy" do
      subject { delete :destroy, id: elastic_search.to_param }

      it { expect { subject }.to change(ElasticSearch, :count).by(-1) }
      it { subject ; expect(response).to redirect_to elastic_searches_url }
    end
  end
end
