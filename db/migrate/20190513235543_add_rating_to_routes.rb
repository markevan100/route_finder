class AddRatingToRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :rating, :string
    add_column :routes, :stars, :float
    add_column :routes, :pitch, :integer
    add_column :routes, :lat, :float
    add_column :routes, :lng, :float
  end
end
