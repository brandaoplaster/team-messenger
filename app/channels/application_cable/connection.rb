module ApplicationCable
  class Connection < ActionCable::Connection::Base

    protected

    def find_verified_user
      if verified_user = User.find_by(id: cookies.signed['user.id'])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
