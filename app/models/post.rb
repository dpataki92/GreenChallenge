class Post < ApplicationRecord

    has_many :comments
    belongs_to :user
    belongs_to :group
    

    validates :title, presence: true
    validates :content, presence: true
    validates :title, length: { in: 5..50 }
    validates :content, length: { maximum: 300 }

end