class Api::RoomsController < Api::BaseApiController
	def index
		rooms = Room.all
		response_success rooms: rooms
	end

	def show
		room = Room.find_by id: params[:id]
		users = User.joins(:user_rooms).where "room_id = ?", room.id
		response_success room: room.as_json(include: :users)
	end
end
