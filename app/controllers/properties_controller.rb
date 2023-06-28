class PropertiesController < ApplicationController
  def index; end
  
  def show; end
  
  def new 
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @progress = 0
    if @property.save
      redirect_to(controller: 'property_form_steps' , property_id: (@property.id).to_param)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
  end

  def destroy; end

  private
  def property_params
    params.require(:property).permit(:property_type, :stay_area, :total_guest_capacity, :total_room, :total_bed, :total_bathroom, :description, :rule_list, :house_name, :street_name, :city, :state, :pincode, :country_name, :price, :user_id, {images: []}, facility: [])
  end
end
