class BookingsController < ApplicationController
    before_action :authenticate_user!

    def index
        # all bookings and items are loaded from the database and assigne to @bookings and @items
        @bookings = Booking.all
        @items = Item.all
    end

    def new
        # assig the params of current item to id, this coming from the order confirmation page
        id = params[:current_item]
        @current_item = Item.find(id)
    end

    def create
        #params of the item are being recieved from the confirm page
        @confirmed_item = params[:confirmed_item]
        #new booking created with the foreign keys of user_id and item_id
        @booking = Booking.create(user_id: current_user.id , item_id: @confirmed_item)
        Item.find(@confirmed_item).update_attribute(:sold, 1)
        
        #redirect to the payment page, currently just a confirm page
        redirect_to new_payment_path
    end

    
    
    
    private 
        # foreign key params breing whitelisted
    def bookings_params
        params.require(:booking).permit(:item_id, :user_id)
    end


end
