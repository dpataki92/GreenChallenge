class Challenge < ApplicationRecord

    has_many :commitments
    has_many :users, through: :commitments
    has_and_belongs_to_many :groups

    validates :title, presence: true
    validates :description, presence: true
    validates :description, length: { maximum: 500 }

end