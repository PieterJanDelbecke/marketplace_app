class BookingsController < ApplicationController
    before_action :authenticate_user!
    # before_action :set_current_item

    def index
        @bookings = Booking.all
        @items = Item.all
    end

    def new
        id = params[:current_item]
        @current_item = Item.find(id)
    end

    def create
        # puts params
        @confirmed_item = params[:confirmed_item]
        @booking = Booking.create(user_id: current_user.id , item_id: @confirmed_item)
        Item.find(@confirmed_item).update_attribute(:sold, 1)
        
        redirect_to new_payment_path
    end

    
    
    
    private 
    
    def bookings_params
        params.require(:booking).permit(:item_id, :user_id)
    end

    # def set_current_item
    #     @current_item = Item.last
    # end


end
