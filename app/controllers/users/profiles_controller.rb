class Users::ProfilesController < ApplicationController
before_filter :authenticate_user!
  def show
      @user=current_user
      @state_me="active"
      @performances = current_user.performances.last(5)
      @averige_cost_gallon =  current_user.performances.sum(:cost_gallon)/@performances.size
      @averige_km_gallon =  current_user.performances.sum(:km_gallon)/@performances.size
      graphic_averiges
  end
  
  def graphic_averiges
    averiges_cost_gallon = GoogleVisualr::DataTable.new 
    averiges_cost_gallon.new_column('string', 'Date' )
    averiges_cost_gallon.new_column('number', '$/gallon')

    averiges_km_gallon = GoogleVisualr::DataTable.new 
    averiges_km_gallon.new_column('string', 'Date' )
    averiges_km_gallon.new_column('number', 'Km/gallon')
    # Add Rows and Values
    @performances.each  do |perfomance|
    averiges_cost_gallon.add_rows([
      [perfomance.date_p.to_s, perfomance.cost_gallon.to_f],
    ])
    averiges_km_gallon.add_rows([
      [perfomance.date_p.to_s, perfomance.km_gallon.to_f],
    ])
     end
    option_cost = { width: 420, height: 240, title: 'Costs ($/Gal)' }
    option_km = { width: 420, height: 240, title: 'Performance (KM/Gal)' }
    @graphic_averige_cost_gallon  = GoogleVisualr::Interactive::AreaChart.new(averiges_cost_gallon, option_cost)
    @graphic_averige_km_gallon  = GoogleVisualr::Interactive::AreaChart.new(averiges_km_gallon, option_km) 
  end

end
