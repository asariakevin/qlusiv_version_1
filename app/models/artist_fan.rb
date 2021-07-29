class ArtistFan < ApplicationRecord
  belongs_to :fan
  belongs_to :artist
end
