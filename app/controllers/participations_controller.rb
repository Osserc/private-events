class ParticipationsController < ApplicationController
    before_action :set_event
    before_action :authenticate_user!

    def register
        if @event.invite_only == false || (@event.invite_only == true && @event.invitees.include?(current_user))
            @participation = @event.participations.create(attendee:current_user)
            if @participation.save
                redirect_to "#{(params[:path])}", notice: "You are registered!"
            else
                redirect_to "#{(params[:path])}", alert: "Registration failed!"
            end
        else
            redirect_to "#{(params[:path])}", alert: "You are not invited to this event."
        end
    end

    def unregister
        @event.participations.find_by(attendee_id:current_user.id).destroy
        redirect_to "#{(params[:path])}", notice: "Registration canceled."
    end

    def set_event
        @event = Event.find(params[:event])
    end

end