class SimulacaoProduto < ActiveRecord::Base
  attr_accessible :existe, :aliquota_icms, :icms, :ip, :outros_custos, :preco_calculado, :preco_compra, :preco_vpsa, :produto_vpsa_id, :st,:descricao 
end