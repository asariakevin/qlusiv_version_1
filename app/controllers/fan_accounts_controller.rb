class FanAccountsController < ApplicationController

  before_action :set_fan

  def show

  end

  private 
  def set_fan
    @fan = Fan.find(params[:fan_id])
  end
end
