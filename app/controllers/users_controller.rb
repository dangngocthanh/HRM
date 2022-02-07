class UsersController < ApplicationController
  before_action :check_role

  def show
    @user = User.find(params[:id])
  end
end
