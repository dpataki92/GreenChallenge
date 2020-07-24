class User < ApplicationRecord
    has_secure_password

    has_many :commitments
    has_many :memberships
    has_many :challenges, through: :commitments
    has_many :groups, through: :memberships
    has_many :posts
    has_many :comments
    has_many :lists
    
    validates :name, presence: true
    validates :email, presence: true, format: /.+@.+\.{1}.{2,}/
    validates :email, uniqueness: true

    def newsfeed
        arr = []
        self.groups.each do |g|
            g.posts.each do |p|
                arr << p
            end
        end
        arr.sort {|a,b| b.created_at <=> a.created_at}
    end

end