class Member < ActiveRecord::Base
  
  belongs_to :tour
  belongs_to :user
  
  validates_uniqueness_of :user_id, :scope => :tour_id
  
end
