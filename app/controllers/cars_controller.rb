class CarsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :getMyCar
  def show
    @performances = current_user.performances.page(params[:page]).per(5)
  end  
  def edit
  end
  def update
    @car.update_attributes(params[:car])
    @performances = current_user.performances.page(params[:page]).per(5)
    render "show"
  end
  def getMyCar
    @car = current_user.car
    @state_car = "active"
  end
end