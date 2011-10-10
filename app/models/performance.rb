class Performance < ActiveRecord::Base
  belongs_to :user
  validates :station, :presence => true
  validates :date_p, :presence => true
  validates :station, :presence => true
  validates :kilometers, :presence => true, :numericality =>true
  validates :gallons, :presence => true , :numericality =>true 
  validates :cost, :presence => true, :numericality => true
  validate :my_current_day
  
  STATIONS= %w{Petromil Movil Texaco Esso}
   before_create :calculateOverages, :formatNumbers
   
   private
   def calculateOverages
      self.cost_gallon= (self.cost/self.gallons).round(3)
      self.km_gallon= (self.kilometers/self.gallons).round(3)
   end
   def my_current_day
     if self.date_p > Date.today
       errors.add(:date_p, "can't be in the future")
     end
   end
end
