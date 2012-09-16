class ToursController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  before_filter :authorized_user, :only => [:destroy, :edit, :update]

  def index
    @tours = Tour.all    
  end
  
  def show
    @tour = Tour.find(params[:id])
  end
  
  # Enables a member to join a tour. Send the tour creator an email.
  def join
    Member.create(:user_id => current_user.id, :tour_id => params[:id])
    @tour = Tour.find(params[:id])
    
    if @tour.user
      TourMailer.joined_tour_confirmation(@tour.user, current_user, @tour).deliver
      redirect_to current_user, :flash => { :success => "Joined tour!" }
    else
      redirect_to root_path, :flash => { :success => "Sorry. There was a problem joining this tour." }
    end
  end
  
  def edit
    @tour = Tour.find(params[:id])
    1.times { @tour.assets.build }
  end
  
  def update
    @tour = Tour.find(params[:id])
    if @tour.update_attributes(params[:tour])
      redirect_to @tour.user, :flash => { :success => "Tour updated." }
    else
      redirect_to root_path, :flash => { :success => "Sorry. Tour could not be updated." }
    end    
  end
  
  def new
    @title = "New Tour"
    if signed_in?      
      @tour = Tour.new
      1.times { @tour.assets.build }
    end    
  end
  
  def create
    @tour = current_user.tours.build(params[:tour])
    if @tour.save
      redirect_to @tour.user, :flash => { :success => "Tour created!" }
    else
      render 'pages/home'
    end
  end

  def destroy
    @tour.destroy
    redirect_to current_user, :flash => { :success => "Tour deleted" }
  end
  
  private
  
    def authorized_user
      @tour = current_user.tours.find_by_id(params[:id])
      redirect_to root_path if @tour.nil?
    end
  
end