class PortfoliosController < ApplicationController
  def show
    @user = User.find_by!(slug: params[:slug])
    @projects = @user.projects
  end

  def detail
    @user = User.find_by!(slug: params[:slug])
    @project = @user.projects.find(params[:project_id])
  end
end
