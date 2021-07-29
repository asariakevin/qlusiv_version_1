class AddArtistImageUriToArtistFans < ActiveRecord::Migration[6.0]
  def change
    add_column :artist_fans, :artist_image_uri, :string
    add_column :artist_fans, :number_of_projects, :integer
    add_column :artist_fans, :number_of_posts, :integer
    add_column :artist_fans, :number_of_messages, :integer
  end
end
