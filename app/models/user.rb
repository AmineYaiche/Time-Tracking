class User < ApplicationRecord
  enum user_type: [:admin, :regular]
  has_secure_password
  has_many :time_track
  validates :username, presence: true, length: {maximum: 30}
  validates :password, presence: true, length: {minimum: 6, maximum:30}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def admin?
    return self.user_type == 'admin'
  end
end
