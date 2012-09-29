# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120929125921) do

  create_table "simulacao_produtos", :force => true do |t|
    t.decimal  "preco_compra"
    t.decimal  "icms"
    t.decimal  "ipi"
    t.decimal  "outros_impostos"
    t.decimal  "comissao"
    t.decimal  "frete"
    t.decimal  "outros_custos"
    t.integer  "produto_vpsa_id"
    t.decimal  "preco_vpsa"
    t.decimal  "preco_calculado"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "descricao"
    t.boolean  "existe"
    t.integer  "simulacao_id"
  end

  add_index "simulacao_produtos", ["simulacao_id"], :name => "index_simulacao_produtos_on_simulacao_id"

  create_table "simulacaos", :force => true do |t|
    t.decimal  "total_despesas"
    t.decimal  "total_receitas"
    t.decimal  "margem_lucro"
    t.string   "base"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.decimal  "despesas_fixas"
  end

end
