class Pedido < ApplicationRecord
  belongs_to :cliente
  belongs_to :placa_mae
  belongs_to :processador
  belongs_to :placa_video
end
