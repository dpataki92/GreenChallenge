class List < ApplicationRecord
    serialize :completed_challenges

    belongs_to :user

end