class User < ApplicationRecord
    enum user_type: [:admin, :regular]
    has_secure_password
    has_many :time_track
end
