class CreateSimulacaoProdutos < ActiveRecord::Migration
  def change
    create_table :simulacao_produtos do |t|
      t.decimal :preco_compra
      t.decimal :aliquota_icms
      t.decimal :ip
      t.decimal :st
      t.decimal :outros_custos
      t.decimal :icms
      t.integer :produto_vpsa_id
      t.decimal :preco_vpsa
      t.decimal :preco_calculado

      t.timestamps
    end
  end
end
