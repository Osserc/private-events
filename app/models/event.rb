class Event < ApplicationRecord

    validates :title, :location, :date, :description, presence: true

    belongs_to :user

    has_many :participations, foreign_key: :attended_event_id
    has_many :attendees, through: :participations

    scope :current, -> { where("date > ?", Time.now) }
    scope :past, -> { where("date < ?", Time.now) }

end