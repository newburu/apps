class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [ :edit, :update, :destroy ]

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to dashboard_path, notice: "プロジェクトを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to dashboard_path, notice: "プロジェクトを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to dashboard_path, notice: "プロジェクトを削除しました", status: :see_other
  end

  private

  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :url, :image_data)
  end
end
