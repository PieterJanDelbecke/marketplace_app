class BookingsController < ApplicationController
    before_action :authenticate_user!
    before-action :set_item

    def index
    end

    def new
        @booking = Booking.new
    end

    def create
        user = current_user
        @booking = @item.add_user(user)
        redirect_to root_path
    end

    
    
    
    private 
    
    def bookings_params
        params.require(:booking).permit(:item_id)
    end


end
