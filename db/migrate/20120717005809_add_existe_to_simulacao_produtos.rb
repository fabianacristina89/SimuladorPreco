class AddExisteToSimulacaoProdutos < ActiveRecord::Migration
  def change
    add_column :simulacao_produtos, :existe, :boolean
  end
end
