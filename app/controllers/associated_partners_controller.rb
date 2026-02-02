class AssociatedPartnersController < ApplicationController
  skip_authorization_check only: [:index]

  def index
    @roles = User.roles.keys
    @countries = ["Germany", "North Macedonia", "France", "Sweden", "Portugal", "Poland", "Latvia", "Spain", "Switzerland"]
    
    @selected_roles = params[:roles].present? ? params[:roles].split(",") : []
    @selected_countries = params[:countries].present? ? params[:countries].split(",") : []
    
    @users = filter_users
    @users = @users.page(params[:page]).per(10)
  end

  private

  def filter_users
    users = User.all
    users = users.where(role: @selected_roles) if @selected_roles.any?
    users = users.where(country: @selected_countries) if @selected_countries.any?
    users
  end
end
