class SimulacaoProduto < ActiveRecord::Base
  
   include ActionView::Helpers::NumberHelper
  
  attr_accessible :existe, :preco_compra, :icms, :ipi, :outros_impostos,:comissao ,
                  :frete, :outros_custos, :preco_calculado,
                  :preco_vpsa, :produto_vpsa_id,:descricao 
                  
                  def preco_compra
                    number_to_currency(attributes['preco_compra'], :unit => "", :separator => ",", :delimiter => ".");
                  end
                  def icms
                    number_to_currency(attributes['icms'], :unit => "", :separator => ",", :delimiter => ".");
                  end
                  
                  
                  def ipi
                    number_to_currency(attributes['ipi'], :unit => "", :separator => ",", :delimiter => ".");
                  end
                  
                  def outros_impostos
                    number_to_currency(attributes['outros_impostos'], :unit => "", :separator => ",", :delimiter => ".");
                  end
                  
                  def comissao
                    number_to_currency(attributes['comissao'], :unit => "", :separator => ",", :delimiter => ".");
                  end
                  
                  def frete
                    number_to_currency(attributes['frete'], :unit => "", :separator => ",", :delimiter => ".");
                  end
                  
                  def outros_custos
                    number_to_currency(attributes['outros_custos'], :unit => "", :separator => ",", :delimiter => ".");
                  end
                  
                  def preco_vpsa
                    number_to_currency(attributes['preco_vpsa'], :separator => ",", :delimiter => ".");
                  end
                  
                  def preco_calculado
                   number_to_currency(attributes['preco_calculado'], :separator => ",", :delimiter => ".");
                  end

 
end
