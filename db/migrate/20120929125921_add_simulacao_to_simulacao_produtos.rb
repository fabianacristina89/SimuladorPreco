class AddSimulacaoToSimulacaoProdutos < ActiveRecord::Migration
  def change
  	change_table :simulacao_produtos do |t|
      t.references :simulacao
    end
    add_index :simulacao_produtos, :simulacao_id
  end


end
