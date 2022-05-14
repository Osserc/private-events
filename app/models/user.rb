class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :username, presence: true

  has_many :events, dependent: :destroy
  has_many :participations, foreign_key: :attendee_id
  has_many :attended_events, through: :participations

end
