class Comment < ApplicationRecord

    belongs_to :post
    belongs_to :user

    validates :content, presence: true
    validates :content, length: { maximum: 100 }

    scope :recent, -> { order(created_at: :desc) }

end