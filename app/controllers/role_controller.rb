class RoleController < ApplicationController
  before_filter :authenticate_user,:isAdmin


end
