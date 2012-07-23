class Simulacao < ActiveRecord::Base
	include ActionView::Helpers::NumberHelper

  attr_accessible :base, :margem_lucro,  :total_despesas, :total_receitas, :despesas_fixas

   def margem_lucro
	    number_to_currency(attributes['margem_lucro'], :unit => "", :separator => ",", :delimiter => ".");
	  end
	def total_despesas
	    number_to_currency(attributes['total_despesas'], :unit => "", :separator => ",", :delimiter => ".");
	end
	def total_receitas
	    number_to_currency(attributes['total_receitas'], :unit => "", :separator => ",", :delimiter => ".");
	end
	def despesas_fixas
	    number_to_currency(attributes['despesas_fixas'], :unit => "", :separator => ",", :delimiter => ".");
	end
end
