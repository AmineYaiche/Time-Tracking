class User < ApplicationRecord
  enum user_type: [:admin, :regular]
  has_secure_password
  has_many :time_track
  validates :username, presence: true, length: {maximum: 30}, uniqueness: true
  validates :password, presence: true, length: {minimum: 6, maximum:30}
  validates :user_type, presence: true

  # Returns the hash digest
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def admin?
    return self.user_type == 'admin'
  end

  # Add or update a time track of a user given the page and the time spent.
  def add_track(page, time)
    track = self.time_track.find_by(page: page)
    if track.nil?
      track = TimeTrack.new
      track.time = time
      track.user = self
      track.page = page
    else
      track.time += time
    end
    track.save
  end
end
