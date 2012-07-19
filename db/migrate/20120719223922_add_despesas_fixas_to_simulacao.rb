class AddDespesasFixasToSimulacao < ActiveRecord::Migration
  def change
    add_column :simulacaos, :despesas_fixas, :decimal
  end
end
