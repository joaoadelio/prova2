class AddUserToAdvertisement < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisements, :user_id, :integer
  end
end
