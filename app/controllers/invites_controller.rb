class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    @q = Invite.ransack(params[:q])
    @invites = @q.result(distinct: true)
  end

  def new
    @invite = Invite.new
  end

  def create
    @invite = current_user.invites.build(invite_params)
    if @invite.save
      redirect_to invites_path,notice: "募集を登録しました！"
    else
      render  :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @invite.update(invite_params)
     redirect_to invite_path(@invite.id), notice: "募集を編集しました！"
    else
     render :edit
    end
  end

  def destroy
    @invite.destroy
    redirect_to invites_path, notice:"募集を削除しました！"
  end

  private
  def set_invite
    @invite = Invite.find(params[:id])
  end

  def invite_params
    params.require(:invite).permit(:match_day, :place, :detail, :status, :user_id, :team_id)
  end
end
