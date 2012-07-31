class SimulacaoProdutosController < ApplicationController
     
     include ActionView::Helpers::NumberHelper

     require 'yaml'
     caches_action :listar_produtos_vpsa

  # GET /simulacao_produtos
  # GET /simulacao_produtos.json
  def listar_produtos_vpsa(base, entidade)

    if(Rails.cache.read('cache.ProdutoVpsa') == nil)
      retorno = HTTParty.get("https://www.vpsa.com.br/estoque/rest/externo/#{base}/#{entidade}/produtos") 
      Rails.cache.write('cache.ProdutoVpsa', retorno.to_yaml)
      puts("cacheado#{Rails.cache.read('cache.ProdutoVpsa')}")
    end

    YAML::load(Rails.cache.read('cache.ProdutoVpsa'))
     
  end

  def index
    @base = 'base24'
    @entidade = 1
    @lista_final = Array.new
    @produtos = listar_produtos_vpsa(@base, @entidade);
   


    todos = SimulacaoProduto.all
    
    @simulacao  = Simulacao.last
    if @simulacao == nil
      @simulacao = Simulacao.new
    end
    @simulacao.base = @base
    
    
    
     @produtos.each do |produto|
          encontrou = false;
          prod = SimulacaoProduto.new
          prod.descricao = produto["descricao"]
          prod.produto_vpsa_id = produto["id"]
          prod.preco_vpsa =  number_to_currency(produto["preco"], :unit => "", :separator => ",", :delimiter => ".")
         
      
           todos.each do |simulacao|
        
               if simulacao.produto_vpsa_id == produto["id"] then
                   @encontrou = true
                 
                   
                   prod.ipi = simulacao.ipi
                   prod.icms = simulacao.icms
                   prod.outros_impostos = simulacao.outros_impostos
                   prod.comissao = simulacao.comissao
                   prod.frete= simulacao.frete
                   prod.outros_custos = simulacao.outros_custos
                   prod.preco_compra = simulacao.preco_compra
                   
                   prod.preco_calculado = calcular_preco(prod, @simulacao)
                   puts(prod.preco_compra)
                   

               end
        
          end
      prod.existe = encontrou
      @lista_final << prod
      
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @simulacao_produtos }
    end
  end
  def calcular_preco (simulacao_produto, simulacao)
      markup =  100 - 
                   (simulacao_produto.icms.to_f + simulacao_produto.ipi.to_f + simulacao_produto.outros_impostos.to_f + simulacao_produto.frete.to_f + 
                   simulacao_produto.comissao.to_f + simulacao_produto.outros_custos.to_f + simulacao.despesas_fixas.to_f + simulacao.margem_lucro.to_f)
      number_to_currency(simulacao_produto.preco_compra.to_f / (markup / 100), :unit => "", :separator => ",", :delimiter => ".") 

  end
  def atualizar_valor
     @produtos.each do |produto|
        prod.preco_calculado = calcular_preco(prod, @simulacao)
    end
  end
  # GET /simulacao_produtos/1
  # GET /simulacao_produtos/1.json
  def show
    @simulacao_produto = SimulacaoProduto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @simulacao_produto }
    end
  end

  # GET /simulacao_produtos/new
  # GET /simulacao_produtos/new.json
  def new
    @simulacao_produto = SimulacaoProduto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @simulacao_produto }
    end
  end



  # GET /simulacao_produtos/1/edit
  def edit
    @simulacao_produto = SimulacaoProduto.find(params[:id])
  end

  # POST /simulacao_produtos
  # POST /simulacao_produtos.json
  def create
    
    prod = params[:simulacao_produto];
  
    @simulacao_produto = SimulacaoProduto.new(prod)

    puts("Valor icms = #{@simulacao_produto.icms}")

    respond_to do |format|
      if @simulacao_produto.save
        format.html { redirect_to @simulacao_produto, notice: 'Simulacao produto was successfully created.' }
        format.json { render json: @simulacao_produto, status: :created, location: @simulacao_produto }
        #atualizar_valor
      else
        format.html { render action: "new" }
        format.json { render json: @simulacao_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_simulacao
    
    prod = params[:simulacao];
  
    @simulacao = Simulacao.new(prod)

    respond_to do |format|
      if @simulacao.save
        format.html { redirect_to @simulacao_produto, notice: 'Simulacao produto was successfully created.' }
        format.json { render json: @simulacao_produto, status: :created, location: @simulacao_produto }
      else
        format.html { render action: "new" }
        format.json { render json: @simulacao_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /simulacao_produtos/1
  # PUT /simulacao_produtos/1.json
  def update
    @simulacao_produto = SimulacaoProduto.find(params[:id])
    
    respond_to do |format|
      if @simulacao_produto.update_attributes(params[:simulacao_produto])
        format.html { redirect_to @simulacao_produto, notice: 'Simulacao produto was successfully updated.' }
        format.json { head :no_content }
        #atualizar_valor
      else
        format.html { render action: "edit" }
        format.json { render json: @simulacao_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simulacao_produtos/1
  # DELETE /simulacao_produtos/1.json
  def destroy
    @simulacao_produto = SimulacaoProduto.find(params[:id])
    @simulacao_produto.destroy

    respond_to do |format|
      format.html { redirect_to simulacao_produtos_url }
      format.json { head :no_content }
    end
  end
end
