class EventsController < ApplicationController
  before_action :doorkeeper_authorize!
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events.json
  def index
    @events = if params[:due].present?
                Event.due(params[:due])
              elsif params[:interval].present?
                Event.interval(parse_interval)
              else
                @events = Event.all
              end
  end

  # GET /events/1.json
  def show; end

  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.users << current_user

    if @event.save
      render :show, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1.json
  def update
    if @event.update(event_params)
      @event.create_activity :update, owner: current_user
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
    params.require(:event).permit(:time, :place, :description, :attachments)
  end

  def parse_interval
    params[:interval].slice(0, params[:interval].length-1)
                     .to_i
                     .days
  end
end
