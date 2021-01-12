class User < ActiveRecord::Base

  has_secure_password
  validates :firstname, presence: true, length: { minimum: 3 }
  validates :lastname, presence: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      @user = user
    else 
      @user = nil
    end 
  end 
end
