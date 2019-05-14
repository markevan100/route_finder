class AddCommentsToRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :old_comment, :text
    add_column :routes, :new_comment, :text
  end
end
