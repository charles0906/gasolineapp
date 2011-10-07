class User < ActiveRecord::Base
  has_one :car
  has_many :performances
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :car_attributes 
  validates_associated :car
  accepts_nested_attributes_for :car
  
end
