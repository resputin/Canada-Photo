class AddViewsToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :views, :integer, default: 1
  end
end
