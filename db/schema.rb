# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_06_25_125926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "memoria_rams", force: :cascade do |t|
    t.string "modelo"
    t.integer "tamanho"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pedido_memoria_rams", force: :cascade do |t|
    t.bigint "pedido_id", null: false
    t.bigint "memoria_ram_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["memoria_ram_id"], name: "index_pedido_memoria_rams_on_memoria_ram_id"
    t.index ["pedido_id"], name: "index_pedido_memoria_rams_on_pedido_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.bigint "placa_mae_id", null: false
    t.bigint "processador_id", null: false
    t.bigint "placa_video_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
    t.index ["placa_mae_id"], name: "index_pedidos_on_placa_mae_id"
    t.index ["placa_video_id"], name: "index_pedidos_on_placa_video_id"
    t.index ["processador_id"], name: "index_pedidos_on_processador_id"
  end

  create_table "placa_maes", force: :cascade do |t|
    t.string "nome"
    t.integer "qtd_slots_memoria"
    t.integer "total_memoria_suportado"
    t.boolean "video_integrado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "placa_videos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "processadores_suportados", force: :cascade do |t|
    t.string "marca"
    t.bigint "placa_mae_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["placa_mae_id"], name: "index_processadores_suportados_on_placa_mae_id"
  end

  create_table "processadors", force: :cascade do |t|
    t.string "modelo"
    t.string "marca"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pedido_memoria_rams", "memoria_rams"
  add_foreign_key "pedido_memoria_rams", "pedidos"
  add_foreign_key "pedidos", "clientes"
  add_foreign_key "pedidos", "placa_maes"
  add_foreign_key "pedidos", "placa_videos"
  add_foreign_key "pedidos", "processadors"
  add_foreign_key "processadores_suportados", "placa_maes"
end
