class AddPrivateToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :private, :boolean
  end
end
