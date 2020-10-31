class Commitment < ApplicationRecord
    belongs_to :user
    belongs_to :challenge

    validates :regularity, inclusion: { in: ["daily", "occasional"] }
end