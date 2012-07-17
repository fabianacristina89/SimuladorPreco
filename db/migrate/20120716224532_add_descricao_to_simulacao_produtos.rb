class AddDescricaoToSimulacaoProdutos < ActiveRecord::Migration
  def change
    add_column :simulacao_produtos, :descricao, :string
  end
end
