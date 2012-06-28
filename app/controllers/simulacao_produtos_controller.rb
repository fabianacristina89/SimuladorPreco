class SimulacaoProdutosController < ApplicationController
     include HTTParty

  # GET /simulacao_produtos
  # GET /simulacao_produtos.json
  def index
    @simulacao_produtos = SimulacaoProduto.all
    @produtos = HTTParty.get("https://www.vpsa.com.br/estoque/rest/externo/showroom/1/produtos")

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
    @simulacao_produto = SimulacaoProduto.new(params[:simulacao_produto])

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
