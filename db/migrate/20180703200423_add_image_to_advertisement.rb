class AddImageToAdvertisement < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisements, :imagens, :json
  end
end
