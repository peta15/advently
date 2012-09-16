if Rails.env == "production"
  Rails.application.config.middleware.use OmniAuth::Builder do  
    provider :facebook, '152954741450534', '8629c31f674c6f27815a71748343feb0', :scope => 'email'
  end
else # Rails.env == "development"  
  Rails.application.config.middleware.use OmniAuth::Builder do  
    provider :facebook, '178282862241908', 'd1f59d3fd16519951996d1b6371695d1', :scope => 'email', :client_options => {:ssl => {:verify => false}}
  end
end
  

