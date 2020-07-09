class Group < ApplicationRecord

    has_many :users, through: :memberships
    has_many :memberships
    has_many :posts
    has_and_belongs_to_many :challenges

end