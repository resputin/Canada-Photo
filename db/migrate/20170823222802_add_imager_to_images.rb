class AddImagerToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :imager, :string
  end
end
