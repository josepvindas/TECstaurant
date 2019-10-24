class User < ApplicationRecord
    has_secure_password
   
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true
    validates :usertypeid, presence: true
    validates :username, presence: true, uniqueness: true
  end