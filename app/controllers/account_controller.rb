class AccountController < ApplicationController
  skip_authorization_check only: [:internship_template, :save_internship, :delete_avatar]
  before_action :authenticate_user!
  before_action :set_account
  load_and_authorize_resource class: "User", except: [:internship_template, :save_internship, :delete_avatar]

  before_action :ensure_student, only: [:internship_template, :save_internship]

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

  def internship_template
  end

  def save_internship
    if @account.update(internship_params)
      redirect_to account_path, notice: "Internship data saved successfully."
    else
      render :internship_template
    end
  end

  private

    def set_account
      @account = current_user
    end

    def ensure_student
      redirect_to account_path, alert: "Access denied." unless @account.role == "student"
    end

    def account_params
      params.require(:account).permit(allowed_params)
    end

    def internship_params
      params.require(:account).permit(
        :motivation_statement,
        :current_degree_program,
        :expected_graduation_year,
        :key_courses_and_projects,
        :academic_achievements,
        :preferred_duration,
        :on_site_or_remote,
        :planned_working_hours_per_week,
        :type_of_internship,
        :language_competences
      )
    end

    def allowed_params
      if @account.organization?
        [:avatar, :phone_number, :email_on_comment, :email_on_comment_reply, :newsletter,
        :description, organization_attributes: [:name, :responsible_name]]
      else
        [:avatar, :username, :public_activity, :public_interests, :email_on_comment,
        :email_on_comment_reply, :email_on_direct_message, :email_digest, :newsletter,
        :official_position_badge, :recommended_debates, :recommended_proposals,
        :description,
        # include internship fields in permitted params for students
        :motivation_statement,
        :current_degree_program,
        :expected_graduation_year,
        :key_courses_and_projects,
        :academic_achievements,
        :preferred_duration,
        :on_site_or_remote,
        :planned_working_hours_per_week,
        :type_of_internship,
        :language_competences]
      end
    end
end
