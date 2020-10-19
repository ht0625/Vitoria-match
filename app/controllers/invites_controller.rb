class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    @invites = Invite.all
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

  private

  def set_invite
    @invite = Invite.find(params[:id])
  end

  def invite_params
    params.require(:invite).permit(:match_day, :place, :detail, :status, :user_id, :team_id)
  end
end
