module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	
  	identified_by :current_user

  	def conncet
  	  self.current_user = find_verifieed_user
  	end


  	private

  	def find_verified_user
  	  if verified_user = User.find_by(id: cookies.encrypted[:user_id])
  	  	verified_user
  	  else
  	  	reject_unautorized_connection
  	  end
  	end

  end
end
