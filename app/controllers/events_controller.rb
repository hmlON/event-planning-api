class EventsController < ApplicationController
  before_action :doorkeeper_authorize!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1.json
  def show; end

  # GET /events/new
  def new
    @event = Event.new
  end

  # POST /events.json
  def create
    @event = Event.new(event_params)

    if @event.save
      render :show, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1.json
  def update
    if @event.update(event_params)
      render :show, status: :ok, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1.json
  def destroy
    @event.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:user_id, :time, :place, :description)
  end
end
