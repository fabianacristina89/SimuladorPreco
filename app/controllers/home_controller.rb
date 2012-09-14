class HomeController < ApplicationController
  def index
  	if usuario_logado
  		redirect_to :controller=>'simulacao_produtos', :action => 'index'
  	else
  		redirect_to :controller=>'oauth', :action => 'authorization'
  	end
  end

  def usuario
    session[:usuario]
  end
  
  def usuario_logado
    !usuario.nil?
  end
end
