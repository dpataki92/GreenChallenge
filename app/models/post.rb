class Post < ApplicationRecord

    belongs_to  :user
    belongs_to :group
    has_many :comments

    validates :title, presence: true
    validates :content, presence: true
    validates :title, length: { in: 5..25 }
    validates :content, length: { maximum: 100 }

end