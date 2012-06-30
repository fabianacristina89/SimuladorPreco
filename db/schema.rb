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
#douglas

ActiveRecord::Schema.define(:version => 20120628003529) do

  create_table "simulacao_produtos", :force => true do |t|
    t.decimal  "preco_compra"
    t.decimal  "aliquota_icms"
    t.decimal  "ip"
    t.decimal  "st"
    t.decimal  "outros_custos"
    t.decimal  "icms"
    t.integer  "produto_vpsa_id"
    t.decimal  "preco_vpsa"
    t.decimal  "preco_calculado"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
