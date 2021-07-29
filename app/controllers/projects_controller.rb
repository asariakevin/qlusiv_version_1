class ProjectsController < ApplicationController
  

  before_action :set_artist

  def index
    @projects = @artist.projects
  end

  private 
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
end
