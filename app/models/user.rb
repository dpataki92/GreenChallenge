class User < ApplicationRecord
    has_secure_password

    has_many :challenges, through: :commitments
    has_many :commitments
    has_many :groups, through: :memberships
    has_many :posts, through: :memberships
    has_many :comments, through: :memberships
    has_many :memberships


end