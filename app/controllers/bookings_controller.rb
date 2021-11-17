class BookingsController < ApplicationController
    before_action :authenticate_user!

    def index
    end

    def new
        # @item = Item.find(params[:id])
        @item = Item.last
        @booking = Booking.new
    end

    def create
        # user = current_user
        # @booking = @item.add_user(user)

        @booking = Booking.create(user_id: current_user.id , item_id: 21)
        redirect_to root_path
    end

    
    
    
    private 
    
    def bookings_params
        params.require(:booking).permit(:item_id, :user_id)
    end


end
