class ProjectsController < ApplicationController

  def index
    @projects = Project.all.includes(:project_type, :user).order(created_at: "DESC").limit(9)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to root_path, notice: 'プロジェクトが作成されました'
    else
      render :new
    end
  end

  def edit
  end

  def show
    @project = Project.find(params[:id])
  end

  private
  def project_params
    params.require(:project).permit(:title, :heading_movie, :content_html, :content_image, :targeted_amount, :deadline, :project_type_id).merge(user_id: current_user.id)
  end

end
