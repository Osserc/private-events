class Favorite < ApplicationRecord

    belongs_to :favoriter, class_name: "User"
    belongs_to :favorited_event, class_name: "Event"

end
