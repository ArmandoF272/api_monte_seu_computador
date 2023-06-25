class CreateProcessadoresSuportados < ActiveRecord::Migration[6.0]
  def change
    create_table :processadores_suportados do |t|
      t.string :marca
      t.references :placa_mae, null: false, foreign_key: true

      t.timestamps
    end
  end
end
