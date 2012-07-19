class SimulacaoProdutosController < ApplicationController
     include HTTParty

  # GET /simulacao_produtos
  # GET /simulacao_produtos.json
  def index
    @base = 'showroom'
    @entidade = 1
    @lista_final = Array.new
    @produtos = HTTParty.get("https://www.vpsa.com.br/estoque/rest/externo/#{@base}/#{@entidade}/produtos")
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
          prod.preco_vpsa = produto["preco"]
      
           todos.each do |simulacao|
        
               if simulacao.produto_vpsa_id == produto["id"] then
                   @encontrou = true
                 
                   
                   prod.ip = simulacao.ip
                   prod.aliquota_icms = simulacao.aliquota_icms
                   prod.icms = simulacao.icms
                   prod.outros_custos = simulacao.outros_custos
                   prod.preco_calculado = simulacao.preco_calculado
                   
                   prod.preco_compra = simulacao.preco_compra
                   
                   

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

    respond_to do |format|
      if @simulacao_produto.save
        format.html { redirect_to @simulacao_produto, notice: 'Simulacao produto was successfully created.' }
        format.json { render json: @simulacao_produto, status: :created, location: @simulacao_produto }
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
