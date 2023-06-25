class CreatePedidoMemoriaRams < ActiveRecord::Migration[6.0]
  def change
    create_table :pedido_memoria_rams do |t|
      t.references :pedido, null: false, foreign_key: true
      t.references :memoria_ram, null: false, foreign_key: true

      t.timestamps
    end
  end
end
