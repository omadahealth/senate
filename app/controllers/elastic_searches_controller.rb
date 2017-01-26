class ElasticSearchesController < LoggedInController # < ApplicationController
  before_action :load_elastic_search, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @elastic_searches = ElasticSearch.all
  end

  def show
    respond_with @elastic_search
  end

  def new
    @elastic_search = ElasticSearch.new
  end

  def edit
    respond_with @elastic_search
  end

  def create
    @elastic_search = ElasticSearch.new(elastic_search_params)
    flash[:notice] = "Elastic search was successfully created." if @elastic_search.save
    respond_with @elastic_search
  end

  def update
    if @elastic_search.update(elastic_search_params)
      flash[:notice] = "Elastic search was successfully updated."
    end
    respond_with @elastic_search
  end

  def destroy
    @elastic_search.destroy
    flash[:notice] = "Elastic search was successfully destroyed."
    respond_with @elastic_search
  end

  private

  def load_elastic_search
    @elastic_search = ElasticSearch.find(params[:id])
  end

  def elastic_search_params
    params.require(:elastic_search).permit(:application_environment_id, :user, :password, :host, :port)
  end
end
