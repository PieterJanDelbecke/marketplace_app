class ApplicationController < ActionController::Base
    include Pundit
    before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :set_current_item

  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, detail_attributes: [:first_name, :last_name, :street_number, :street_name, :suburb, :postcode, :state, :phone_number] ])
    end
  end
  