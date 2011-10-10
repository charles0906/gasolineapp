class PerformancesController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def index
    if params[:station]
      @performances = Performance.where( :station=> params[:station].to_s).page(params[:page]).per(5)
      @performances_by_user = Performance.where( :station=> params[:station].to_s).group(:user_id)
      myhash= @performances_by_user.size
      users=Array.new
      values=Array.new
      myhash.each {|key, value| 
      users << key
      values << value }
      @user = User.find(myhash.key(values.max))
      graphic_averiges_cost
      render "station"
    elsif params[:user]
      @performances = Performance.where(:user_id=> params[:user]).page(params[:page]).per(5)
      render "user"
    elsif params[:car]
      @performances = Performance.where(:user_id=> params[:car]).page(params[:page]).per(5)
      graphic_averiges_km
      render "car"
    end
  end
  
  def new
    @performance = Performance.new
    @state_me = "active"
  end

  def create
    @performance = current_user.performances.new(params[:performance])
    if @performance.save
       @performance.user.car.update_attributes(:odometer=>@performance.user.car.odometer+@performance.kilometers)
      redirect_to profile_path
    else
      render "new"
    end
  end
  
  def graphic_averiges_cost
    averiges_cost_gallon = GoogleVisualr::DataTable.new 
    averiges_cost_gallon.new_column('string', 'Date' )
    averiges_cost_gallon.new_column('number', '$/gallon')

    # Add Rows and Values
    @performances.each  do |perfomance|
    averiges_cost_gallon.add_rows([
      [perfomance.date_p.to_s, perfomance.cost_gallon.to_f],
    ])
     end
    option_cost = { width: 420, height: 240, title: 'Costs ($/Gal)' }
    @graphic_averige_cost_gallon  = GoogleVisualr::Interactive::AreaChart.new(averiges_cost_gallon, option_cost)
  end 
  
  def graphic_averiges_km
    averiges_km_gallon = GoogleVisualr::DataTable.new 
    averiges_km_gallon.new_column('string', 'Date' )
    averiges_km_gallon.new_column('number', 'Km/gallon')
    # Add Rows and Values
    @performances.each  do |perfomance|
    averiges_km_gallon.add_rows([
      [perfomance.date_p.to_s, perfomance.km_gallon.to_f],
    ])
     end
    option_km = { width: 420, height: 240, title: 'Performance (KM/Gal)' }
    @graphic_averige_km_gallon  = GoogleVisualr::Interactive::AreaChart.new(averiges_km_gallon, option_km) 
  end
end
