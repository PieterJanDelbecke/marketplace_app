class ApplicationController < ActionController::Base
    include Pundit
    before_action :configure_permitted_parameters, if: :devise_controller?

  
    protected
    
    # parameters for the attributes of the detail table being whitelited.
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, detail_attributes: [:first_name, :last_name, :street_number, :street_name, :suburb, :postcode, :state, :phone_number] ])
    end
  end
  