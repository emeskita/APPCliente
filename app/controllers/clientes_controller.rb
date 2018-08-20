class ClientesController < ApplicationController
  require 'correios-cep'

  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  # GET /clientes
  # GET /clientes.json
  def index
    if logged_in?
      @clientes = Cliente.all
    else
      redirect_to "/login"
    end
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
    
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'Cliente was successfully created.' }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: 'Cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: 'Cliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def buscacep
      # With "get" instance method
     
      finder = Correios::CEP::AddressFinder.new
      address = finder.get(params[:cep])
      
      respond_to do |format|
        format.json  { render :json => address }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      if logged_in?
        @cliente = Cliente.find(params[:id])
      else
        redirect_to "/login"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:nome, :ultimo_nome, :email, :cpf, :data_nascimento, :endereco, :numero, :bairro, :cidade, :estado, :complemento, :cep, :password, :password_confirmation)
    end
end
