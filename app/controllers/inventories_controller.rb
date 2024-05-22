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

  def destroy
    @inventory = Inventory.find(params[:id]) # Fetch the inventory item
    @inventory.destroy # Destroy the inventory item
    redirect_to inventories_path, notice: "Item was successfully deleted"
  end
  
  
  private
  
  def inventory_params
    params.permit(:quantity, :name)
  end
end
