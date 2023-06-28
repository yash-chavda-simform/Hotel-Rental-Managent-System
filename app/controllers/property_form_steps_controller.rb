class PropertyFormStepsController < ApplicationController
  include Wicked::Wizard
  steps :place_type, :facility, :about_place, :address_for_place, :upload_image, :make_best_price

  def show
    unless params[:property_id].blank?
      session[:property_id] = params[:property_id]
    end

    case step
    when :place_type
      @prev = Rails.application.routes.recognize_path(request.referrer)
      if @prev[:controller] == "properties"
        skip_step
      end
    end

    set_progress
    set_property
    render_wizard
  end

  def update
    set_progress
    @property.current_step = step
    @property.update(property_params)
    render_wizard @property
  end

  private

  def property_params
    params.require(:property).permit(:property_type, :stay_area, :total_guest_capacity, :total_room, :total_bed, :total_bathroom, :description, :rule_list, :house_name, :street_name, :city, :state, :pincode, :country_name, :price, :user_id, images: [], facility: [])
  end

  def set_property
    @property = Property.find(session[:property_id])
  end

  def set_progress
    set_property
    if current_step?(:place_type)
      @progress = 0
    elsif current_step?(:facility)
      @progress = 1
    elsif current_step?(:about_place)
      @progress = 2
    elsif current_step?(:address_for_place)
      @progress = 3
    elsif current_step?(:upload_image)
      @progress = 4
    elsif current_step?(:make_best_price)
      @progress = 5
    end
  end
end
