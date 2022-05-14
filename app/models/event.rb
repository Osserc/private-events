class Event < ApplicationRecord

    validates :title, :location, :date, :description, presence: true

    belongs_to :user

    has_many :participations, foreign_key: :attended_event_id
    has_many :attendees, through: :participations

end