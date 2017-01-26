class EnvironmentsController < LoggedInController # < ApplicationController
  before_action :load_environment, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @environments = Environment.all
  end

  def show
    respond_with @environment
  end

  def new
    @environment = Environment.new
  end

  def edit
    respond_with @environment
  end

  def create
    @environment = Environment.new(environment_params)
    flash[:notice] = "Environment was successfully created." if @environment.save
    respond_with @environment
  end

  def update
    if @environment.update(environment_params)
      flash[:notice] = "Environment was successfully updated."
    end
    respond_with @environment
  end

  def destroy
    @environment.destroy
    flash[:notice] = "Environment was successfully destroyed."
    respond_with @environment
  end

  private

  def load_environment
    @environment = Environment.find(params[:id])
  end

  def environment_params
    params.require(:environment).permit(:name, :consul_dc)
  end
end
