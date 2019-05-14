class AddImageToRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :image, :blob
  end
end
