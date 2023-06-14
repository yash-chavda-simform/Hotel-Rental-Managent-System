class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :phone_no, :gender, :driving_license_no, :date_of_birth, presence: true, on: :update
  validates :phone_no, length: { is:10 }, on: :update
  validates :phone_no, numericality: true
  validates :driving_license_no, format: { with: /\A[A-Za-z0-9]{6,12}\z/, message: "Enter valid Driving License" }
  validates :date_of_birth, comparison: { less_than: Date.today, message: "date can not be today"}
  # validates :gender, inclusion: { in: %w(Male Female Others), message: "should be from this given category" }, on: :update
  after_create :assign_default_role

  rolify
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable

  def assign_default_role
    self.add_role(:tourist) if self.roles.blank?
  end
end
