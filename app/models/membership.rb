class Membership < ApplicationRecord
    belongs_to :user
    belongs_to :group

    validates :membership_type, inclusion: { in: ["creator", "simple"] }

    scope :created, -> { where(membership_type: "creator") }
end