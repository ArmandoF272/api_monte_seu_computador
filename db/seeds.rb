# Processadores
processadores = [
  { marca: 'Intel', modelo: 'Core i5' },
  { marca: 'Intel', modelo: 'Core i7' },
  { marca: 'AMD', modelo: 'Ryzen 5' },
  { marca: 'AMD', modelo: 'Ryzen 7' }
]

processadores.each do |processador|
  Processador.find_or_create_by(processador)
end

# Placas Mãe
placas_mae = [
  { nome: 'Asus ROG', processadores_suportados: 'Intel', qtd_slots_memoria: 2, total_memoria_suportado: 16, video_integrado: false },
  { nome: 'Gigabyte Aorus', processadores_suportados: 'AMD', qtd_slots_memoria: 2, total_memoria_suportado: 16, video_integrado: false },
  { nome: 'ASRock Steel Legend', processadores_suportados: 'Intel e AMD', qtd_slots_memoria: 4, total_memoria_suportado: 64, video_integrado: true }
]

placas_mae.each do |placa_mae_params|
  processadores_suportados = placa_mae_params.delete(:processadores_suportados)
  placa_mae = PlacaMae.find_or_create_by(placa_mae_params)

  processadores_suportados.split(' e ').each do |marca|
    placa_mae.processadores_suportados.find_or_create_by(marca: marca)
  end
end

# Memórias RAM
memorias_ram = [
  { modelo: 'Kingston Hiper X 4GB', tamanho: 4 },
  { modelo: 'Kingston Hiper X 8GB', tamanho: 8 },
  { modelo: 'Kingston Hiper X 16GB', tamanho: 16 },
  { modelo: 'Kingston Hiper X 32GB', tamanho: 32 },
  { modelo: 'Kingston Hiper X 64GB', tamanho: 64 }
]

memorias_ram.each do |memoria_ram|
  MemoriaRam.find_or_create_by(memoria_ram)
end

# Placas de Vídeo
placas_video = [
  { descricao: 'Evga Geforce RTX 2060 6GB' },
  { descricao: 'Asus ROG Strix Geforce RTX 3060 6GB' },
  { descricao: 'Gigabyte Radeon RX 6600 XT EAGLE 8GB' }
]

placas_video.each do |placa_video|
  PlacaVideo.find_or_create_by(placa_video)
end

# Clientes
clientes = [
  { nome: 'João Pedro Martins', email: 'joao@coreplan.com' },
  { nome: 'Pedro Tiago Martins', email: 'tiagom@corepan.com' },
  { nome: 'Maria Clara Pessoa', email: 'clara@cloreplan.com' },
  { nome: 'Eduarda Savarino', email: 'eduarda@coreplan.com' }
]

clientes.each do |cliente|
  Cliente.find_or_create_by(cliente)
end
