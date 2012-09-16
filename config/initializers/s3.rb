require 'aws/s3'
AWS::S3::Base.establish_connection!(
  :access_key_id     => ENV['S3_KEY'] || 'AKIAI2NA3VW5VFWYNGNQ',
  :secret_access_key => ENV['S3_SECRET'] || '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'
)