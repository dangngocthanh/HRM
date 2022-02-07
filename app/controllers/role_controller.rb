class RoleController < ApplicationController
  before_filter :authenticate_user,:isAdmin
  before_action :check_role


end
