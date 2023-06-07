class User < ApplicationRecord
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
