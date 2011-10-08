class Car < ActiveRecord::Base
  belongs_to :user
  validates :make, :presence => true
  validates :model, :presence => true
  validates :odometer, :presence => true, :numericality => true
  validates :user_id,  :uniqueness => true
  # paperclip
  has_attached_file :photo, :styles => { :medium => "300x200>", :thumb => "200x100>" },
                    :url  => "/assets/cars/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/cars/:id/:style/:basename.:extension"
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png','image/jpg']
  #end paperclip
  
end
