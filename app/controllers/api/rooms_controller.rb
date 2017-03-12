class Api::RoomsController < Api::BaseApiController
	def index
		rooms = Room.all
		response_success rooms: rooms
	end
end
