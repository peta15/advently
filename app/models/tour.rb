class Tour < ActiveRecord::Base
  
  # title         string
  # location      string
  # description   string
  # user_limit    integer
  # price         float
  # from_date     timestamp
  # to_date       timestamp
  
  attr_accessible :title, :location, :description, :user_limit, :price, :from_date, :to_date, :assets_attributes, :meetup_location
  belongs_to :user
  has_many :members,            :dependent => :destroy
  has_many :assets
  has_many :users, :through => :members
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  validates :title,       :presence => true
  validates :location,    :presence => true, :length => { :maximum => 4000  }
  validates :description, :presence => true, :length => { :maximum => 40000 }
  validates :user_id,     :presence => true
  
  default_scope :order => 'tours.created_at DESC'
end
