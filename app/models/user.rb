class User < ApplicationRecord
  validates :username, :email, :password, presence: true
  validates :username, uniqueness: true
  validate :password_complexity

  has_many :reviews, dependent: :nullify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  private

  def password_complexity
    if password.present? && !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&=])[A-Za-z\d@$!%*?&=]{8,}$/)
      errors.add :password, I18n.t('errors.models.password.complexity')
    end
  end
end
