class List < ApplicationRecord
    serialize :completed_challenges

    belongs_to :user

    scope :recent, -> { order(created_at: :desc) }
end