module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
 
    def connect
      self.current_user = find_verified_user
    end

    private
      def find_verified_user
        if (user_id = request.session.fetch(:user_id))
          User.find_by(id: user_id)
        else
          reject_unauthorized_connection
        end
      end
  end
end