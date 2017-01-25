class InvitesController < ApplicationController
  # before_action :doorkeeper_authorize!
  before_action :set_invite, only: [:show, :update, :destroy]

  # GET /invites.json
  def index
    @invites = Invite.all
  end

  # GET /invites/1.json
  def show; end

  # POST /invites.json
  def create
    @invite = Invite.new(invite_params)

    if @invite.save
      render :show, status: :created, location: @invite
    else
      render json: @invite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /invites/1.json
  def destroy
    @invite.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_invite
    @invite = Invite.find(params[:id])
  end

  def invite_params
    params.require(:invite).permit(:sender_id, :event_id, :email, :token)
  end
end
