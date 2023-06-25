class CreateMemoriaRams < ActiveRecord::Migration[6.0]
  def change
    create_table :memoria_rams do |t|
      t.string :modelo
      t.integer :tamanho

      t.timestamps
    end
  end
end
