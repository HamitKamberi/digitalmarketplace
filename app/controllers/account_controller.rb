class AccountController < ApplicationController
  skip_authorization_check on: :delete_avatar
  before_action :authenticate_user!
  before_action :set_account
  load_and_authorize_resource class: "User", except: [:delete_avatar]

  def show
  end

  def update
    if @account.update(account_params)
      redirect_to account_path, notice: t("flash.actions.save_changes.notice")
    else
      @account.errors.delete(:organization)
      render :show
    end
  end

  def delete_avatar
    if @account.avatar.attached?
      @account.avatar.purge
      redirect_to account_path, notice: "Avatar removed"
    else
      redirect_to account_path, alert: "No avatar found"
    end
  end

  private

    def set_account
      @account = current_user
    end

    def account_params
      params.require(:account).permit(allowed_params)
    end

    def allowed_params
      if @account.organization?
        [:avatar,:phone_number, :email_on_comment, :email_on_comment_reply, :newsletter,
        :description, organization_attributes: [:name, :responsible_name]]
      else
        [:avatar, :username, :public_activity, :public_interests, :email_on_comment,
        :email_on_comment_reply, :email_on_direct_message, :email_digest, :newsletter,
        :official_position_badge, :recommended_debates, :recommended_proposals,
        :description]
      end
    end
end
