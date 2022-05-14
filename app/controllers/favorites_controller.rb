class FavoritesController < ApplicationController
    before_action :set_event
    before_action :authenticate_user!

    def add_to_favorites
        @favorite = @event.favorites.create(favoritor:current_user)
        if @favorite.save
            redirect_to "#{(params[:path])}", notice: "Event added to favorites."
        else
            redirect_to "#{(params[:path])}", alert: "Could not add to favorites."
        end
    end

    def remove_from_favorites
        @event.favorites.find_by(favoritor_id:current_user.id).destroy
        redirect_to "#{(params[:path])}", notice: "Event removed from favorites."
    end

    def set_event
        @event = Event.find(params[:event])
    end

end