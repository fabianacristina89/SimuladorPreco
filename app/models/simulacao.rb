class Simulacao < ActiveRecord::Base
	include ActionView::Helpers::NumberHelper

  attr_accessible :base, :margem_lucro,  :total_despesas,
   :total_receitas, :despesas_fixas;

   
end
