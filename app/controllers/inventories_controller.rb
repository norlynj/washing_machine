class InventoriesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
  end
  
  
  def create
    @inventory = Inventory.new(inventory_params)
    
    if @inventory.save
      redirect_to inventories_path, notice: "Item was successfully added"
    else
      redirect_to inventories_path, alert: "Item creation failed"
    end
  end

  def update
    @inventory = Inventory.find_by(id: params[:id])
    
    if @inventory.update(inventory_params)
      redirect_back(fallback_location: root_path, notice: 'Inventory quantity updated successfully.')
    else
      flash.now[:alert] = 'Failed to update inventory quantity.'
      render :edit
    end
  end
  

  def edit
    @inventory = Inventory.find(params[:id])
  end  

  def destroy
    @inventory = Inventory.find(params[:id]) # Fetch the inventory item
    @inventory.destroy # Destroy the inventory item
    redirect_to inventories_path, notice: "Item was successfully deleted"
  end
  
  private
  
  def inventory_params
    params.require(:inventory).permit(:quantity)
  end

end
