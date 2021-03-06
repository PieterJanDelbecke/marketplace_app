class ItemsController < ApplicationController
    before_action :authenticate_user!, only: %i[new edit destroy]
    before_action :set_item, only: %i[ show edit update destroy ]
 

    def landings_page
    end

    # GET /items
    def index
      @items = Item.all
    end
  
    # GET /items/1 
    def show
    end
  
    # GET /items/new
    def new
      @item = Item.new
    end
  
    # GET /items/1/edit
    def edit
        authorize @item
    rescue Pundit::NotAuthorizedError
        redirect_to root_path, alert: "you are not authorized to edit this item" 
    end
  
    # POST /items or /items.json
    def create
      @item = current_user.items.new(item_params)
      respond_to do |format|
        if @item.save
          format.html { redirect_to @item, notice: "Item was successfully created." }
          format.json { render :show, status: :created, location: @item }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /items/1 or /items/1.json
    def update
        authorize @item
    rescue Pundit::NotAuthorizedError
        redirect_to root_path, alert: "you are not authorized to edit this item" 
    else
      respond_to do |format|
        if @item.update(item_params)
          format.html { redirect_to @item, notice: "Item was successfully updated." }
          format.json { render :show, status: :ok, location: @item }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /items/1 or /items/1.json
    def destroy
        authorize @item
    rescue Pundit::NotAuthorizedError
        redirect_to root_path, alert: "you are not authorized to destroy this item" 
    else
      @item.destroy
      respond_to do |format|
        format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_item
        @item = Item.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def item_params
        params.require(:item).permit(:name, :description, :price, :new, :sold, :user_id, :picture)
      end

end
