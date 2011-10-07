class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to profile_path
    else
      @performances = Performance.last(10)
      @cheapest_cost_gal = Performance.first(:conditions => {:cost_gallon => Performance.minimum(:cost_gallon)})
      @best_km_gallon = Performance.first(:conditions => {:km_gallon => Performance.maximum(:km_gallon)})
      most_vehil_performances =  Performance.all
      @most_vehil = most_vehil_performances.first
      most_vehil_performances.each do |performance|
       if (performance.cost_gallon/performance.km_gallon) < (@most_vehil.cost_gallon/ @most_vehil.km_gallon) 
         @most_vehil = performance
       end
      end
    end
  end
end
