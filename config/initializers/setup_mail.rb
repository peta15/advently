ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "advently.com",
  :user_name            => "contact@advently.com",
  :password             => "jfZ3F89da",
  :authentication       => "plain",
  :enable_starttls_auto => true
}