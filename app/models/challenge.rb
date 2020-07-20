class Challenge < ApplicationRecord

    has_many :commitments
    has_many :users, through: :commitments
    has_many :group_challenges
    has_many :groups, through: :group_challenges

    validates :title, presence: true
    validates :description, presence: true
    validates :description, length: { maximum: 1000 }

end