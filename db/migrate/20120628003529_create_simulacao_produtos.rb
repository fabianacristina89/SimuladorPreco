class CreateSimulacaoProdutos < ActiveRecord::Migration
  def change
    create_table :simulacao_produtos do |t|
      t.decimal :preco_compra
      t.decimal :icms
      t.decimal :ipi
      t.decimal :outros_impostos
      t.decimal :comissao
      t.decimal :frete
      t.decimal :outros_custos
      t.integer :produto_vpsa_id
      t.decimal :preco_vpsa
      t.decimal :preco_calculado

      t.timestamps
    end
  end
end
