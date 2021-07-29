class PostsController < ApplicationController

  before_action :set_artist 

  def index
    @posts =  @artist.posts.all
  end

  private 
  def set_artist 
    @artist = Artist.find(params[:artist_id])
  end
end
