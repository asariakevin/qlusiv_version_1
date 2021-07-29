class ArtistProfilesController < ApplicationController
  
  def index
    @profiles = ArtistProfile.all
  end
end
