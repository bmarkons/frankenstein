class Admin::UsersController < Admin::AdminController
  before_action :set_manager, only: [:toggle_block_manager]
  before_action :set_managers

  def index
  end

  def toggle_block_manager
    @manager.blocked = !@manager.blocked
    @manager.save
    render :index
  end

  private

  def set_manager
    @manager = User.find(params[:id])
  end

  def set_managers
    @managers = User.where(type: "manager")
  end
end
