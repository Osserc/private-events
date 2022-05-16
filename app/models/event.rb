class Event < ApplicationRecord

    validates :title, :location, :date, :description, presence: true
    validates :title, :location, length: { maximum: 30 }

    belongs_to :user

    has_many :participations, foreign_key: :attended_event_id
    has_many :attendees, through: :participations

    has_many :invitations, foreign_key: :invited_event_id
    has_many :invitees, through: :invitations

    has_many :favorites, foreign_key: :favorited_event_id
    has_many :favoriters, through: :favorites

    scope :current, -> { where("date > ?", Time.now) }
    scope :past, -> { where("date < ?", Time.now) }

end