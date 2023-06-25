class Pedido < ApplicationRecord
  belongs_to :cliente
  belongs_to :placa_mae
  belongs_to :processador
  belongs_to :placa_video, optional: true

  has_many :pedido_memoria_rams
  has_many :memorias_rams, through: :pedido_memoria_rams

  validates_presence_of :cliente, :placa_mae, :processador
  validates_presence_of :placa_video, if: :placa_de_video_obrigatoria?
  validate :restricoes_de_montagem

  def restricoes_de_montagem
    valida_compatibilidade_processador_e_placa_mae
    valida_memorias_escolhidas_com_a_placa_mae
  end

  def valida_compatibilidade_processador_e_placa_mae
    return if placa_mae.nil? || processador.nil?

    unless placa_mae.processadores_suportados.find_by(marca: processador.marca)
      errors.add(:base, "O processador #{processador.modelo} não é compatível com a placa mãe #{placa_mae.nome}")
    end
  end

  def valida_memorias_escolhidas_com_a_placa_mae
    return if placa_mae.nil? || pedido_memoria_rams.empty?

    if placa_mae.qtd_slots_memoria < pedido_memoria_rams.size
      errors.add(:base, "A quantidade de memórias é maior que a quantidade de slots que a placa mãe #{placa_mae.nome} suporta")
    end

    if placa_mae.total_memoria_suportado < pedido_memoria_rams.sum{|memoria| memoria.memoria_ram.tamanho}
      errors.add(:base, "A soma das memórias escolhidas é maior que a quantidade que a placa mãe #{placa_mae.nome} suporta")
    end
  end

  def placa_de_video_obrigatoria?
    return if placa_mae.nil?

    if !placa_mae.video_integrado? && placa_video.nil?
      errors.add(:base, "É necessário adicionar uma placa de vídeo, pois a placa mãe #{placa_mae.nome} não possui vídeo integrado")
    end
  end
end
