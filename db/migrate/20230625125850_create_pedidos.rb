class CreatePedidos < ActiveRecord::Migration[6.0]
  def change
    create_table :pedidos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.references :placa_mae, null: false, foreign_key: true
      t.references :processador, null: false, foreign_key: true
      t.references :placa_video, null: false, foreign_key: true

      t.timestamps
    end
  end
end
