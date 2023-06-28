class Property < ApplicationRecord
  attr_accessor :current_step

  acts_as_taggable_on :rules
  belongs_to :user
  mount_uploaders :images, ImageUploader

  enum property_type: { house: 0, apartment: 1, barn: 2, boat: 3, cabin: 4, castle: 5, cave: 6, container: 7, dammuso: 8, dome: 9, earth_home: 10, farm: 11, guest_house: 12, hotel: 13, houseboat: 14, minsu: 15, riad: 16, ryokan: 17, tent:18, tower: 19, treehouse: 20}
  enum stay_area: { entire_place: 0, room: 1, shared_room: 2 }

  validates :property_type, :stay_area, :total_guest_capacity, :total_room, :total_bed, :total_bathroom, presence: true, on: [:create, :update]
  validates :facility, inclusion: { in: %w(Wifi Tv Kitchen Washer Free\ parking Paid\ parking Ac Pool Hot\ tub Piano Excercise\ equipment First\ aid\ kit Nothing), message: "%{value} is not allowed"}, if: -> { current_step?(:facility) }
  validates :description, presence: true, if: -> { current_step?(:about_place) }
  validates :house_name, :street_name, :city, :state, :pincode, :country_name, presence: true, if: -> { current_step?(:address_for_place) }
  validates :images, presence: true, if: -> { current_step?(:upload_image) }
  validates :price, comparison: { less_than_or_equal_to: 800000, message: "must be betwenn 500 to 800000" }, if: -> { current_step?(:make_best_price) } 

  def current_step?(step_key)
    current_step == step_key
  end
end
