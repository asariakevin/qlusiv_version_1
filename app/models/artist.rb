class Artist < ApplicationRecord
  has_one  :artist_profile
  has_many :posts
  has_many :projects
  has_many :artist_fans
  has_many :fans , through: :artist_fans
end
