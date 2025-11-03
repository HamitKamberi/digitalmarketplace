class Admin::DebatesController < Admin::BaseController
  include FeatureFlags
  include CommentableActions
  include HasOrders

  feature_flag :debates

  has_orders %w[created_at]

  def show
    @debate = Debate.find(params[:id])
  end

  def destroy
    @debate = Debate.find(params[:id])
    @debate.destroy
    redirect_to admin_debates_path, notice: "Internship deleted"
  end

  private

    def resource_model
      Debate
    end
end
