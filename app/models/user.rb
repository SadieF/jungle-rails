class User < ActiveRecord::Base

  has_many :reviews


  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :first_name, presence: true
  validates :last_name, presence: true



  has_secure_password
  validates :password_digest, presence: true, length: {minimum: 3}
  validates :password, presence: true

  def authenticate_with_credentials(email, password)
    if (email && password)
      email = self.email.strip.downcase unless self.email.nil?
     User.create(first_name: "first", last_name: "last", email: email, password: password)
    else
      nil
    end
  end


end
