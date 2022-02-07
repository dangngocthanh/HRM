class ProjectsController < ApplicationController
  before_action :isAdmin, only: [:create, :new]
  before_action :admin_or_PM, only: [:change_leader, :done_project]
  before_action :check_role

  def index
    user = current_user
    if user.role.role_name_id == 4
      @projects = UsersProject.where(user_id: user.id)
    else
      if user.role.role_name_id < 4
        @projects = Project.where(department_id: session[:department_id])
      end
    end
  end

  def change_leader
    @project_id = params[:id]
    @users = UsersDepartment.where(department_id: session[:department_id])
    @leader = []
    @users.each do |user|
      @leader.push(User.find(user.user_id))
    end
    project = Project.find(params[:id])
    @current_leader = User.find(project.user_id)
  end

  def update_leader
    @project_change = Project.find(params[:id])
    @project_change.update(user_id: params['project']['user_id'])
  end

  def new
    @departments = Department.all
    @project = Project.new
  end

  def create
    department_id = params['project']['department_id']
    @department = Department.find(department_id)
    user_id = @department.user_id
    @project = Project.new(name: params['project']['name'], department_id: department_id, user_id: user_id, status: false)
    if @project.save
      add_user_to_users_projects(user_id)
    end
  end

  def users_projects_detail
    session[:id] = params[:id]
    redirect_to users_projects_path
  end

  def done_project
    @project = Project.find(params[:id])
    @project.update(status: true)
    @project.save
    redirect_to action: :index
  end

  private

  def admin_or_PM
    user = current_user
    if user.role.role_name_id == 1 || user.role.role_name_id == 3
    else
      redirect_to action: :index
    end
  end

  def add_user_to_users_projects(user_id)
    id = Project.all.order('id desc')
    id = id.limit(1)
    id = id[0].id
    @users_project = UsersProject.new(user_id: user_id, project_id: id)
    if @users_project.save
      redirect_to action: :index
    end
  end

end
