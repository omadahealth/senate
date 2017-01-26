class PostgresqlsController < LoggedInController # < ApplicationController
  before_action :load_postgresql, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @postgresqls = Postgresql.all
  end

  def show
    respond_with @postgresql
  end

  def new
    @postgresql = Postgresql.new
  end

  def edit
    respond_with @postgresql
  end

  def create
    @postgresql = Postgresql.new(postgresql_params)
    flash[:notice] = "Postgresql was successfully created." if @postgresql.save
    respond_with @postgresql
  end

  def update
    if @postgresql.update(postgresql_params)
      flash[:notice] = "Postgresql was successfully updated."
    end
    respond_with @postgresql
  end

  def destroy
    @postgresql.destroy
    flash[:notice] = "Postgresql was successfully destroyed."
    respond_with @postgresql
  end

  private

  def load_postgresql
    @postgresql = Postgresql.find(params[:id])
  end

  def postgresql_params
    params.require(:postgresql).permit(:application_environment_id, :user, :password, :host, :port, :database)
  end
end
