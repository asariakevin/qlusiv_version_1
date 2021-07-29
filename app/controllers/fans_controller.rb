class FansController < ApplicationController

  before_action :set_fan

  def subscriptions

    @subscribed_artist_id_from_union_table = ArtistFan.where(fan_id: params[:fan_id])
    #@subscribed_artists = Artist.find(@subscribed_artist_id_from_union_table)
    @subscribed_artists = []
    @subscribed_artist_id_from_union_table.each do |artist_fan_union|
      @subscribed_artists << Artist.find(artist_fan_union.artist_id)
    end

    respond_to do |format|
      format.html
      format.json { render json: @subscribed_artist_id_from_union_table }
    end

  end

  def my_collection
    @my_collection = []
    fan_projects = @fan.fan_projects
    fan_projects.each do |fan_project|
      @my_collection << Project.find(fan_project.project_id)
    end
    
  end


  private 
  def set_fan
    if params[:fan_id]
      @fan = Fan.find(params[:fan_id])
    else 
      @fan = []
    end
  end

end
