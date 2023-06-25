class CreatePlacaVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :placa_videos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
