class CreateAdvertisements < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisements do |t|
      t.string :titulo
      t.string :descricao

      t.float :preco
      t.integer :visualizacao

      t.timestamps
    end
  end
end
