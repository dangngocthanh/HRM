class UsersProjectsController < ApplicationController
  before_action :check_role

  def index
    p session[:id]
    @users = UsersProject.where(project_id: session[:id])
  end

end
