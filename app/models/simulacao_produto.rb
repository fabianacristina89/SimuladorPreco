class SimulacaoProduto < ActiveRecord::Base
  
   
  
  attr_accessible :existe, :preco_compra, :icms, :ipi, :outros_impostos, :comissao, :frete, :outros_custos, :preco_calculado, :preco_vpsa, :produto_vpsa_id, :descricao 

 
end
