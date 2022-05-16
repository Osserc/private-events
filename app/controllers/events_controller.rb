class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new create edit update destroy ]
  before_action :kick_out_outsider, only: %i[ edit update destroy ]
  before_action :check_private_access, only: %i[ show ]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = current_user.events.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :location, :date, :description, :private, :invite_only)
    end

    def check_organizer
      if user_signed_in?
        return true if current_user.id == @event.user_id
        return false
      else
        return false
      end
    end

    def kick_out_outsider
      unless check_organizer
        flash[:alert] = "You are not this event's creator."
        redirect_to event_url(@event)
      end
    end

    def check_private_access
      if check_private 
        unless check_organizer || check_invited
          flash[:alert] = "You do not have permission to view this event."
          redirect_back(fallback_location: root_path)
        end
      end
    end

    def check_private
      return true if @event.private == true
      return false
    end

    def check_invited
      return true if @event.invitees.include?(current_user)
      return false
    end

end
