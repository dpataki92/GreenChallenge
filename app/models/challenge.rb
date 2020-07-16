class Challenge < ApplicationRecord

    has_many :commitments
    has_many :users, through: :commitments
    has_and_belongs_to_many :groups

    validates 


end