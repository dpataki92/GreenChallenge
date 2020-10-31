class Group < ApplicationRecord
    has_many :memberships
    has_many :posts
    has_many :users, through: :memberships
    has_many :group_challenges
    has_many :challenges, through: :group_challenges

    validates :name, presence: true
    validates :description, presence: true
    validates :description, length: {maximum: 1500}

    scope :recent, -> { order(created_at: :desc) }
end