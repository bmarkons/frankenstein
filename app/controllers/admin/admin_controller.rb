class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  protected

  def check_admin
    ActionController::RoutingError.new("Not found") unless current_user.admin?
  end
end
