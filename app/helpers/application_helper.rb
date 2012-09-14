module ApplicationHelper
  def usuario
    session[:usuario]
  end
  
  def usuario_logado?
    !usuario.nil?
  end
end
