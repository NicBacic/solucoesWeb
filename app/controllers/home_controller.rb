require 'httpclient'
require 'json'

class HomeController < ApplicationController
  before_action do 
    auth("d096d3a782f6679cd3c1677e9cc7a93c2e453af99706b97474bb85b27d84896c")
  end

  $session = HTTPClient.new
  $session.debug_dev = STDOUT
  $session.set_cookie_store('app/controllers/cookies/cookie.dat')
  $url = 'http://api.olhovivo.sptrans.com.br/v2.1/'

  def auth(token)


    #Para autenticar-se no serviço de API do Olho Vivo
    #é necessário efetuar uma chamada prévia utilizando
    #o método http POST informando seu token de acesso.
    #Essa chamada irá retornar true quando a autenticação
    #for realizada com sucesso e false em caso de erros.


    method = "Login/Autenticar?token=" + token.to_s
    body = { 'keyword' => 'ruby', 'lang' => 'pt-br' }
    response = $session.post($url + method, body)
    $session.save_cookie_store

    puts "Session posted, waiting for response..."

    if response.status == 200
      puts "Response Accecpted"
      #get_all_bus_position
      return true
    end
    
    puts "Response Rejected"
    return false

  end

  def get(path)

    #HTTP GET comum para os demais métodos
    puts "Searching for Content"
    @response = $session.get_content($url + path)
    render :json => {
                            :file_content => @response
                    }
  end

  def search_by_bus(term)

    #Realiza uma busca das linhas do sistema com base no
    #parâmetro informado. Se a linha não é encontrada então
    #é realizada uma busca fonetizada na denominação das linhas.

    return get("Linha/Buscar?termosBusca=" + term.to_s)

  end

  def get_bus_detail(uid)

    #Retorna as informações cadastrais de uma determinada linha.
    #Caso o parâmetro seja omitido são retornados os dados de todas
    #as linhas do sistema.

    return get("Linha/CarregarDetalhes?codigoLinha=" + uid.to_s)

  end

  def search_by_stops(term)

    #Realiza uma busca fonética das paradas de ônibus do sistema
    #com base no parâmetro informado. A consulta é realizada no nome
    #da parada e também no seu endereço de localização.

    return get("Parada/Buscar?termosBusca=%s" + term.to_s)

  end

  def search_stops_by_bus(uid)

    #Realiza uma busca por todos os pontos de parada atendidos por
    #uma determinada linha.

    return get("Parada/BuscarParadasPorLinha?codigoLinha=" + uid.to_s)

  end

  def get_bus_position(uid)

    #Retorna uma lista com todos os veículos de uma determinada linha
    #com suas devidas posições.

    return get("Posicao?codigoLinha=" + uid.to_s)

  end

  def get_next_bus(stop_id, bus_id)

    #Retorna uma lista com a previsão de chegada dos veículos da linha
    #informada que atende ao ponto de parada informado.
   
    return get("Previsao?codigoParada=" + stop_id.to_s + "&codigoLinha=" + bus_id.to_s)

  end

  def get_next_bus_in_stop(stop_id)

    #Retorna uma lista com a previsão de chegada dos veículos de cada uma
    #das linhas que atendem ao ponto de parada informado.

   return get("Previsao/Parada?codigoParada=" + stop_id.to_s)

  end

  def get_all_bus_position
    
    #Retorna uma lista com TODOS os ônibus (da sptrans) em movimento no momento em que o método foi chamado.
    
    get("Posicao")

  end

end
