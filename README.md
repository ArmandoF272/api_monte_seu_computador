# API MONTE SEU COMPUTADOR
  Está API é uma resolução para o desafio da empresa COREPLAN.

# Problemática
  A loja Devise Informática deseja disponibilizar em seu site a opção Monte seu Computador
  onde seus clientes podem montar um computador pessoal (desktop) sob demanda escolhendo
  as peças disponíveis que irão compor o computador e a loja irá se responsabilizar pela
  montagem, certificação (realização de testes) e envio ao cliente.
  O cliente entra no site e pode selecionar as seguintes peças para montar o seu computador:
    
    ● Processador
    ● Placa Mãe
    ● Memória RAM
    ● Placa de vídeo
  
  As demais peças que compõem o computador serão selecionadas pela própria loja e o cliente
  não precisa especificá-las.


# Produtos disponíveis
  Processadores:
  
    | Produto | Marca |
    | Core i5 | Intel |
    | Core i7 | Intel |
    | Ryzen 5 | AMD   |
    | Ryzen 7 | AMD   |

  Placas Mãe:
  
    | Produto             | Marca       | Qtde. slots de memória RAM | Total de memória RAM suportado | Vídeo Integrado |
    | Asus ROG            | Intel       | 2                          | até 16GB                       | Não             |
    | Gigabyte Aorus      | AMD         | 2                          | até 16GB                       | Não             |
    | ASRock Steel Legend | Intel e AMD | 4                          | até 64GB                       | Sim             |

  Memórias RAM:

    | Modelo                | Tamanho |
    | Kingston Hiper X 4GB  | 4       |
    | Kingston Hiper X 8GB  | 8       |
    | Kingston Hiper X 16GB | 16      |
    | Kingston Hiper X 32GB | 32      |
    | Kingston Hiper X 64GB | 64      |

  Placas de Vídeo
  
    | Produto                              |
    | Evga Geforce RTX 2060 6GB            |
    | Asus ROG Strix Geforce RTX 3060 6GB  |
    | Gigabyte Radeon RX 6600 XT EAGLE 8GB |

  # Restrições de Montagem
    A montagem do computador pelo cliente deve conter certas restrições para que seja possível
    montar e testar o computador na loja antes do seu envio. Tais restrições estão descritas a
    seguir:
      
      Processador
        ● É possível selecionar apenas um processador por máquina .
        Placa Mãe
        ● É possível selecionar apenas uma placa mãe por máquina.
        ● A placa mãe deve suportar a marca (AMD ou Intel) do processador escolhido.
        Ex: Não deve ser possível selecionar a Placa Mãe Gigabyte (que suporta apenas AMD)
        se o processador escolhido foi o processador Intel Core i5 (Intel).
        
      Memória RAM
        ● A máquina deve ter pelo menos uma memória RAM.
        ● A quantidade total de memórias que podem ser escolhidas dependem da quantidade de
          slots de memória da placa mãe escolhida.
          Ex: Não deve ser possível selecionar 4 memórias RAM se a placa mãe escolhida foi a
          Placa Mãe Gigabyte (que possui apenas 2 slots de memória).
        ● A quantidade total de armazenamento (em GB) não deve superar o total de memória
          RAM suportado pela placa mãe.
          Ex: Não deve ser possível selecionar 2 memórias RAM de 16 GB (totalizando 32 GB) se
          a placa mãe selecionada foi a Placa Mãe Gigabyte (que suporta até 16 GB) .
      
      Placa de Vídeo
        ● É possível selecionar apenas uma placa de vídeo para compor a máquina.
        ● Se a placa mãe escolhida não possui vídeo integrado, o cliente deve selecionar
          obrigatoriamente uma placa de vídeo. Caso contrário, selecioná-la é opcional.
          Ex: Se a placa mãe selecionada foi a Placa Mãe ASRock Fatal (que possui vídeo
          integrado), não é obrigatório selecionar uma placa de vídeo.


  # Requisitos Solicitados
      ●  O cliente monta sua máquina selecionando as peças disponíveis na loja e faz o seu
        pedido.

      ● O servidor, por sua vez, valida esse pedido conforme as Restrições de Montagem
      
      ● Sendo um pedido inválido, o servidor rejeita o pedido retornando os erros cometidos
        pelo cliente.
      
      ● Sendo um pedido válido, o servidor cria o pedido, armazenando-o na base de dados da
        loja, e retorna suas informações ao cliente.

  # Preparações
    Execute o comando a baixo na ordem para gerar o banco, as tabelas e populalas.
    rails db:create -> rails db:migrate -> rails db:seed.

  # Tabela Cliente
    Tabela para realizar o vinculo e a identificação a quem pedido de montagem pertence.
    Está tabela contem as seguintes atributos nome e email.

  # Tabela PlacaMaes
    Tabela para realizar o vinculo e a identificação da Placa Mãe escolhida ao pedido de montagem.
    Está tabela contem os seguintes atributos: nome, qtd_slots_memorias, total_memoria_suportado e video_integrado.

  # Tabela ProcessadoresSuportados
    Tabela para realizar o vinculo com a tabela de placa mãe para poder fazer a verificação se a placa suporta o processador.
    Está tabela contem os seguintes atributos: marca e placa_mae_id.
    
  # Tabela Processadrs 
    Tabela para realizar o vinculo e a identificação do processador ao pedido de montagem.
    Está tabela contem os seguintes atributos: modelo e marca.

  # Tabela PlacaVideo 
    Tabela para realizar o vinculo e a identificação da Placa de Vídeo escolhida ao pedido de montagem.
    Está tabela possui apenas o atributo: descrição.
  # Tabela MemoriaRams
     Tabela para realizar o vinculo e a identificação da(s) memória(s) escolhida(s) nas memorias escolhidas e armazenadas ba tabela de PedidoMemoriaRams que foram associadas ao pedido de montage.
  
  # Tabela PedidoMemoriaRams
    Tabela para realizar o vinculo e a identificação da(s) memória(s) escolhida(s) ao pedido de montagem.

  # Tabela Pedidos
    A principal tábela, na qual possui todas as ligações do perifericos escolhidos pelo usuario.

    Para a criação de um novo pedido é necessário receber o seguinte padraão de parametros:
      
      {
        "pedido": {
          "cliente_nome": "João Pedro Martins",
          "cliente_email": "joao@coreplan.com",
          "placa_mae_nome": "Asus ROG",
          "processador_marca": "Intel",
          "processador_modelo": "Core i5",
          "placa_video_descricao": "Evga Geforce RTX 2060 6GB",
          "memorias_ram": ["Kingston Hiper X 4GB", "Kingston Hiper X 8GB"]
        }
      }

      Após receber os parametros é realizado a consulta para buscar os periféricos e realizar as validações.

    
     

