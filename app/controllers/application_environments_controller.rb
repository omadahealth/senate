class ApplicationEnvironmentsController < LoggedInController # < ApplicationController
  before_action :load_application_environment, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @application_environments = ApplicationEnvironment.all
  end

  def show
    respond_with @application_environment
  end

  def new
    @application_environment = ApplicationEnvironment.new
  end

  def edit
    respond_with @application_environment
  end

  def create
    @application_environment = ApplicationEnvironment.new(application_environment_params)
    flash[:notice] = "Application environment was successfully created." if @application_environment.save
    respond_with @application_environment
  end

  def update
    if @application_environment.update(application_environment_params)
      flash[:notice] = "Application environment was successfully updated."
    end
    respond_with @application_environment
  end

  def destroy
    @application_environment.destroy
    flash[:notice] = "Application environment was successfully destroyed."
    respond_with @application_environment
  end

  private

  def load_application_environment
    @application_environment = ApplicationEnvironment.find(params[:id])
  end

  def application_environment_params
    params.require(:application_environment).permit(:application_id, :environment_id, :rails_env)
  end
end
