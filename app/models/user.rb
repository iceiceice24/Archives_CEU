class User < ApplicationRecord
    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true
    
    has_secure_password
    has_many :toy, dependent: :destroy
end