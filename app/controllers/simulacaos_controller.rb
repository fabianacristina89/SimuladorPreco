class SimulacaosController < ApplicationController
  # GET /simulacaos
  # GET /simulacaos.json
  def index
    @simulacaos = Simulacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @simulacaos }
    end
  end

  # GET /simulacaos/1
  # GET /simulacaos/1.json
  def show
    @simulacao = Simulacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @simulacao }
    end
  end
  def cnpj_empresa
    session[:usuario][:cnpj_empresa]
  end
  # GET /simulacaos/new
  # GET /simulacaos/new.json
  def new
    @simulacao = Simulacao.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @simulacao }
    end
  end

  # GET /simulacaos/1/edit
  def edit
    @simulacao = Simulacao.find(params[:id])
  end

  # POST /simulacaos
  # POST /simulacaos.json
  def create
    @simulacao = Simulacao.new(params[:simulacao])
    @simulacao.base = cnpj_empresa
    respond_to do |format|
      if @simulacao.save
        format.html { redirect_to @simulacao, notice: 'Simulacao was successfully created.' }
        format.json { render json: @simulacao, status: :created, location: @simulacao }
      else
        format.html { render action: "new" }
        format.json { render json: @simulacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /simulacaos/1
  # PUT /simulacaos/1.json
  def update
    @simulacao = Simulacao.find(params[:id])
    @simulacao.base = cnpj_empresa
    respond_to do |format|
      if @simulacao.update_attributes(params[:simulacao])
        format.html { redirect_to @simulacao, notice: 'Simulacao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @simulacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simulacaos/1
  # DELETE /simulacaos/1.json
  def destroy
    @simulacao = Simulacao.find(params[:id])
    @simulacao.destroy

    respond_to do |format|
      format.html { redirect_to simulacaos_url }
      format.json { head :no_content }
    end
  end
end
