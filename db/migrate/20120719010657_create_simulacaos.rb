class CreateSimulacaos < ActiveRecord::Migration
  def change
    create_table :simulacaos do |t|
      t.decimal :total_despesas
      t.decimal :total_receitas
      t.decimal :margem_lucro
      t.string :base

      t.timestamps
    end
  end
end
