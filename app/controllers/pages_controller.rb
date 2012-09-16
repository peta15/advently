class PagesController < ApplicationController

  def home
    @title = "Home"
    if signed_in?      
      @tour = Tour.new
      
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
    @tours = Tour.all
    
    @random_tour = nil
    if (Tour.count > 0)
      @random_tour = Tour.find(Tour.all.collect {|t| [ t.id ]}.sample.first.to_i)
      #@random_tour = Tour.find(3) if @random_tour.assets.count == 0   # Make sure the tour exists before adding this line back
    end
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
end
