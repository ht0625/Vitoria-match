class InvitesController < ApplicationController
  def index
    @invites = Invite.all
  end
end
