class PedidosController < ApplicationController
  def create
    cliente = Cliente.find_by(nome: pedido_params[:cliente_nome], email: pedido_params[:cliente_email])
    placa_mae = PlacaMae.find_by(nome: pedido_params[:placa_mae_nome])
    processador = Processador.find_by(marca: pedido_params[:processador_marca], modelo: pedido_params[:processador_modelo])
    placa_video = PlacaVideo.find_by(descricao: pedido_params[:placa_video_descricao])
    memorias_ram = MemoriaRam.where(modelo: params[:pedido][:memorias_ram].split(','))

    pedido = Pedido.new(cliente: cliente, placa_mae: placa_mae, processador: processador, placa_video: placa_video)

    memorias_ram.each do |memoria|
      pedido.pedido_memoria_rams.build(memoria_ram_id: memoria.id)
    end

    if pedido.valid? && pedido.save
      render json: pedido, status: :created
    else
      render json: { errors: pedido.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    pedido = Pedido.find(params[:id])
    render json: pedido, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Pedido não encontrado' }, status: :not_found
  end


  private

  def pedido_params
    params.require(:pedido).permit(
      :cliente_nome,
      :cliente_email,
      :placa_mae_nome,
      :processador_marca,
      :processador_modelo,
      :placa_video_descricao,
      memorias_ram: []
    )
  end
end
