class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :username, presence: true, length: { maximum: 20 }

  has_many :events, dependent: :destroy

  has_many :participations, foreign_key: :attendee_id
  has_many :attended_events, through: :participations

  has_many :invitations, foreign_key: :invitee_id
  has_many :invited_events, through: :invitations

  has_many :favorites, foreign_key: :favoriter_id
  has_many :favorited_events, through: :favorites

end
