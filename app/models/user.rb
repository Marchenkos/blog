class User < ApplicationRecord
  validates_presence_of :username, :email, :password
  validates :username, uniqueness: true
  validate :password_complexity

  devise :validatable, password_length: 8..30

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  def password_complexity
    if password.present? && !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&=])[A-Za-z\d@$!%*?&=]{8,}$/)
      errors.add :password, "must contain at least one digit, one lowercase letter, one uppercase letter, and one special character"
    end
  end
end
