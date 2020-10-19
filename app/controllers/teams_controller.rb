class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.build(team_params)
    if @team.save
      redirect_to team_path(@team.id),notice: "チームを登録しました！"
    else
      render  :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @team.update(team_params)
     redirect_to team_path(@team.id), notice: "チームを編集しました！"
    else
     render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to new_team_path, notice:"チームを削除しました！"
  end

  private
  def team_params
    params.require(:team).permit(:name, { feature_ids: [] })
  end

  def set_team
    @team = Team.find(params[:id])
  end

end
