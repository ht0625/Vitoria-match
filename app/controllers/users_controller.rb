class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @invites = @user.invites.all.order(created_at: "DESC")
    redirect_to invites_path, notice: "アクセス権限がありません！" if @user.id != current_user.id
  end
end
