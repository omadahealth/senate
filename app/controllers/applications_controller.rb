class ApplicationsController < LoggedInController # < ApplicationController
  before_action :load_application, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @applications = Application.all
  end

  def show
    respond_with @application
  end

  def new
    @application = Application.new
  end

  def edit
    respond_with @application
  end

  def create
    @application = Application.new(application_params)
    flash[:notice] = "Application was successfully created." if @application.save
    respond_with @application
  end

  def update
    if @application.update(application_params)
      flash[:notice] = "Application was successfully updated."
    end
    respond_with @application
  end

  def destroy
    @application.destroy
    flash[:notice] = "Application was successfully destroyed."
    respond_with @application
  end

  private

  def load_application
    @application = Application.find(params[:id])
  end

  def application_params
    params.require(:application).permit(:name, :uses_sidekiq, :uses_postgres, :uses_redis, :uses_ldap)
  end
end
