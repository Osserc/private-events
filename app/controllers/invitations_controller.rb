class InvitationsController < ApplicationController
    before_action :set_event
    before_action :authenticate_user!

    def generate_invite_list
        @event.invitations.empty? ? flash[:notice] = "Invites sent." : flash[:notice] = "Invits updated"
        @event.invitations.destroy_all

        params[:invitees].each do | invitee |
            @event.invitations.create(invitee:invitee)
        end
        redirect_to "#{(params[:path])}"
    end

    def set_event
        @event = Event.find(params[:event])
    end

end