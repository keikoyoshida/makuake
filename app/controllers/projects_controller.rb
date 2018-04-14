class ProjectsController < ApplicationController

  def index
    @projects = Project.all.includes(:project_type, :user, :category).order(created_at: "DESC").limit(9)
    @projects.each do |project|
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(project_params)
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
    params.require(:project)
          .permit(:title, :heading_movie, :content_html, { content_images: [] }, :targeted_amount, :deadline, :project_type_id, :category_id, { tag_ids: [] })
  end

end
