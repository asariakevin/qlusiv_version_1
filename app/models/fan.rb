class Fan < ApplicationRecord
  has_one  :fan_account
  has_one  :fan_profile
  has_many :fan_projects
  has_many :artist_fans 
  has_many :artists , through: :artist_fans
end
