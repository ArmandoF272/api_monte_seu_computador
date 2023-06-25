class CreatePlacaMaes < ActiveRecord::Migration[6.0]
  def change
    create_table :placa_maes do |t|
      t.string :nome
      t.integer :qtd_slots_memoria
      t.integer :total_memoria_suportado
      t.boolean :video_integrado

      t.timestamps
    end
  end
end
