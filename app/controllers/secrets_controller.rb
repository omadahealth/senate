class SecretsController < LoggedInController # < ApplicationController
  before_action :load_secret, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @secrets = Secret.all
  end

  def show
    respond_with @secret
  end

  def new
    @secret = Secret.new
  end

  def edit
    respond_with @secret
  end

  def create
    @secret = Secret.new(secret_params)
    flash[:notice] = "Secret was successfully created." if @secret.save
    respond_with @secret
  end

  def update
    if @secret.update(secret_params)
      flash[:notice] = "Secret was successfully updated."
    end
    respond_with @secret
  end

  def destroy
    @secret.destroy
    flash[:notice] = "Secret was successfully destroyed."
    respond_with @secret
  end

  private

  def load_secret
    @secret = Secret.find(params[:id])
  end

  def secret_params
    params.require(:secret).permit(:application_environment_id, :key, :value)
  end
end
