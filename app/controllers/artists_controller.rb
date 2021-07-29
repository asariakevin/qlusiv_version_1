class ArtistsController < ApplicationController

  before_action :set_artist, only: [:show, :profile,:support, :projects]
  before_action :is_there_a_fan?
  
  def index
    @artists = Artist.all
  end

  def show

  end

  def subscribe 
    @artist = Artist.find(params[:artist_id])
    @artist.artist_fans.create(fan_id: params[:fan_id],
                               artist_name: @artist.artist_profile.name,
                               artist_image_uri: @artist.artist_profile.image_url,
                               number_of_projects: 0,
                               number_of_messages: 0,
                               number_of_posts: 0
                              
                              )
    redirect_to fan_subscriptions_path(@fan)
    
  end

  def profile

    @profile = @artist.artist_profile


    respond_to do |format|
      format.html
      format.json { render json: @profile }
    end

  end

  def posts

  end

  def projects 
    @projects = @artist.projects
    respond_to do |format|
      format.html
      format.json { render json: @projects }
    end

  end

  # called when an fan supports an artist
  def support
    # get the project
    # get the fan
    # check whether the fan has more or equal money than support
    # if so support it else throw error
    @project = Project.find(params[:project_id])

    if @fan.fan_account.balance >= @project.support
      @fan.fan_projects.create(project_id: @project.id)
      number_of_current_supports = @project.supports
      @project.update(supports: number_of_current_supports + 1)
      # add one to the number of supports
      redirect_to fan_subscriptions_path(@fan)
    else 
      redirect_to artist_fan_projects_path(@artist)
    end
    

  end


  def explore 
    # check for any filters or tags
    @artists = Artist.all
    @creator_short_profiles = []

    @artists.each do |artist|
      artist_profile = artist.artist_profile 
      @creator_short_profiles << CreatorShortProfile.new(
        artist.id,
        artist_profile.image_url,
        artist_profile.name,
        0,0)
    end
    respond_to do |format|
      format.html
      format.json { render json: @creator_short_profiles }
    end

  end

  private 
  def set_artist
    @artist = Artist.find(params[:id])
  end

  def is_there_a_fan?
    if params[:fan_id]
      @fan = Fan.find(params[:fan_id])
    else 
      @fan = nil 
    end
  end
end

class CreatorShortProfile 
  attr_accessor :creator_id
  attr_accessor :image_url
  attr_accessor :name
  attr_accessor :number_of_followers
  attr_accessor :number_of_plays

  def initialize(creator_id, image_url, name, followers, plays )
    @creator_id = creator_id
    @image_url = image_url 
    @name = name 
    @number_of_followers = followers 
    @number_of_plays = plays
    
  end
end

class CreatorProfile 
  attr_accessor :id
  attr_accessor :creator_id
  attr_accessor :image_url
  attr_accessor :name
  attr_accessor :bio
  attr_accessor :city
  attr_accessor :number_of_followers
  attr_accessor :number_of_plays
  attr_accessor :tag
end
