class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @projects = @user.projects
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to dashboard_path, notice: "プロフィールを更新しました"
    else
      @projects = @user.projects
      render :show, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :slug, :email)
  end
end
