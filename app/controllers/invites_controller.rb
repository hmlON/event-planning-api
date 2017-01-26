class InvitesController < ApplicationController
  before_action :doorkeeper_authorize!
  before_action :set_invite, only: [:show, :update, :destroy]
  before_action :require_invite_ownership, only: [:show, :create, :destroy]

  # GET /invites.json
  def index
    @invites = current_user.invitations + current_user.sent_invites
  end

  # GET /invites/1.json
  def show; end

  # POST /invites.json
  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id

    if @invite.save
      @invite.recipient.events << @invite.event
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
    params.require(:invite).permit(:event_id, :email, :token)
  end

  def require_invite_ownership
    head :forbidden unless (current_user == invite.sender) || (current_user == invite.recipient)
  end
end
