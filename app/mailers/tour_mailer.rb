class TourMailer < ActionMailer::Base
  default :from => "contact@advently.com"
  
  def joined_tour_confirmation(tour_host_user, user, tour)
    @tour_host = tour_host_user
    @user = user
    @tour = tour
    # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{tour_host_user.name} <#{tour_host_user.email}>", :subject => "A wonderful person signed up for your tour!")
  end

end
