class Simulacao < ActiveRecord::Base
  attr_accessible :base, :margem_lucro, :total_despesas, :total_receitas
end
