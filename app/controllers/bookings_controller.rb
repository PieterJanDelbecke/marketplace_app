class BookingsController < ApplicationController
    before_action :authenticate_user!
    # before_action :set_current_item

    def index
    end

    def new
        # @current_item = params[current_item]
        @booking = Booking.new
    end

    def create
        puts params
        @current_item = params[:current_item]
        @booking = Booking.create(user_id: current_user.id , item_id: @current_item)
        # byebug
        redirect_to root_path
    end

    
    
    
    private 
    
    def bookings_params
        params.require(:booking).permit(:item_id, :user_id)
    end

    # def set_current_item
    #     @current_item = Item.last
    # end


end
