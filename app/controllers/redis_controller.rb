class RedisController < LoggedInController # < ApplicationController
  before_action :load_redi, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @redis = Redi.all
  end

  def show
    respond_with @redi
  end

  def new
    @redi = Redi.new
  end

  def edit
    respond_with @redi
  end

  def create
    @redi = Redi.new(redi_params)
    flash[:notice] = "Redi was successfully created." if @redi.save
    respond_with @redi
  end

  def update
    if @redi.update(redi_params)
      flash[:notice] = "Redi was successfully updated."
    end
    respond_with @redi
  end

  def destroy
    @redi.destroy
    flash[:notice] = "Redi was successfully destroyed."
    respond_with @redi
  end

  private

  def load_redi
    @redi = Redi.find(params[:id])
  end

  def redi_params
    params.require(:redi).permit(:application_environment_id, :user, :password, :host, :port, :db)
  end
end
