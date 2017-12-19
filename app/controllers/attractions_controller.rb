class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    else
      redirect_to '/'
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to @attraction
  end

  def ride
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    flash[:notice] = @ride.take_ride
    redirect_to user_path(@ride.user)
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
