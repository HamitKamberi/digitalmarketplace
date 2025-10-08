class AssociatedPartnersController < ApplicationController
  skip_authorization_check only: [:index]

    def index
      @users = User.includes(:organization).where("users.role = ? OR organizations.id IS NOT NULL", :stakeholder).left_joins(:organization).distinct
    end
end
