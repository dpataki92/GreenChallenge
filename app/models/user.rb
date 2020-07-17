class User < ApplicationRecord
    has_secure_password

    has_many :commitments
    has_many :memberships
    has_many :challenges, through: :commitments
    has_many :groups, through: :memberships
    has_many :posts
    has_many :comments
    
    validates :name, presence: true
    validates :email, presence: true, format: /.+@.+\.{1}.{2,}/
    validates :email, uniqueness: true

end