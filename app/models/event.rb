class Event < ApplicationRecord

    validates :title, :location, :date, :description, presence: true
    belongs_to :user
end
