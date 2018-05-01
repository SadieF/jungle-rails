class User < ActiveRecord::Base

  has_many :reviews


  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :first_name, presence: true
  validates :last_name, presence: true



  has_secure_password
  validates :password_digest, presence: true, length: {minimum: 3}
  validates :password, presence: true


end
