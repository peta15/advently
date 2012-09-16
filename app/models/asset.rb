class Asset < ActiveRecord::Base
  belongs_to :tour
  has_attached_file :asset, 
    :styles => { :medium => "480x320>", :thumb => "120x80#" },
    :storage => :s3,
    :bucket => 'mt_tour_photos',
    :s3_credentials => {
      :access_key_id     => ENV['S3_KEY'] || 'AKIAI2NA3VW5VFWYNGNQ',
      :secret_access_key => ENV['S3_SECRET'] || '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'  
    }
end
