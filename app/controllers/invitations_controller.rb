class InvitationsController < ApplicationController
    before_action :set_event
    before_action :authenticate_user!
    before_action :deny_not_organizer, only: %i[ generate_invite_list ]

    def generate_invite_list
        params[:invitees].delete_if(&:blank?)
        @event.invitations.empty? ? flash[:notice] = "Invites sent." : flash[:notice] = "Invite list updated."
        @event.invitations.destroy_all

        params[:invitees].each do | invitee |
            @event.invitations.create(invitee:User.find(invitee))
        end

        if @event.invitations.each { | invitation | invitation.save }
            redirect_to "#{(params[:path])}"
        else
            flash.delete[:notice]
            redirect_to "#{(params[:path])}", alert: "Could not generate invite list."
        end
    end

    def set_event
        @event = Event.find(params[:event])
    end

    def deny_not_organizer
        unless current_user.id == @event.user_id
          flash[:alert] = "You are not this event's creator."
          redirect_to event_url(@event)
        end
    end

end