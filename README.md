
# Soluções Web
Código fonte para o trabalho de soluções web 

# Integrantes
Nicolas Bacic Lima : 9277617

Lucas de Sá :

Gustavo : 

# Informações Importantes
Esse projeto foi desenvolvido utilizando a linguagem Ruby atráves de Rails. O código principal, entretanto, deve ser conferido no arquivo map.js que pode ser localizado no caminho app/assets/javascripts

O rails recomenda escrever código javascript utilizando o CoffeeScript (http://coffeescript.org/) mas, para esse trabalho, desenvolvemos diretamente em javascript.

Esse trabalho visa disponibilizar uma plataforma para que o usuário possa pesquisar endereços, procurar por pontos de ônibus e por ônibus em movimento e por fim ver tudo isso em um mapa. Para isso, utilizamos a API da Google Maps (https://developers.google.com/maps/?hl=pt-br) e a API da SPTrans (http://www.sptrans.com.br/desenvolvedores/). Hospedamos esse projeto em um servidor Amazon e utilizamos MySQL para armazenar os dados. 

Para testes, a princípio, estávamos utilizando a plataforma Travis para validação. Contudo, encontramos certa dificuldade em integrar o Travis com o MySQL, portanto desistimos dele.

Existe um problema nesse trabalho devido a API da SPTrans ser HTTP enquanto que o serviço de geolocalização da Google só funciona em servidores seguros. Devido a isso, pode ser que no navegador que utilize o serviço de geolocalização não esteja disponível, visto que nosso servidor é HTTP. LocalHost é considerado endereço seguro, portanto, localmente, tudo funciona de acordo. Para rodar uma aplicação rails localmente basta executar o comando

rails s

E depois abrir no browser o endereço http://localhost:3000/ 

Todas as requisições para a API da SPTrans podem ser conferidas no arquivo home_controller.rb encontrado no caminho app/controllers . Para recuperar os dados da SPTrans utilizamos de uma gem conhecida como HTTPClient (http://www.rubydoc.info/gems/httpclient/frames). Várias funcionalidade foram desenvolvidas, apesar do projeto só estar utilizando de uma em si (get_all_bus_position que recupera a posição de todos os ônibus em movimento). A aplicação pode ser facilmente expandida para, por exemplo, dado uma linha de ônibus, recuperar somente os ônibus em movimento daquela linha.

Nesse trabalho, quando recuperamos alguma informação (como por exemplo os pontos de ônibus), optamos por recuperar todos de uma vez ao invés de gerar o conteúdo dinamicamente. Achamos que dessa forma, apesar do overhead inicial para recuperar todas essas informações, interagir com o mapa parece mais "flúido" depois. Entretanto, se deseja recuperar o conteúdo dinamicamente, dado sua posição no mapa em termos de latitude e longitude, basta recuperar os dados (seja por MySQL ou outra ferramenta) com base na sua posição (X,Y) e um raio R que desejar (recomendo utilizar o R baseado no zoom do seu google maps). Recomenda-se que funções de consulta sejam desenvolvidas no modelo da aplicação (app/models), uma vez que Rails utiliza-se do padrão MVC (Model-View-Controller).

Por último, a parte de pesquisa de endereço utiliza novamente da API do Google Maps. A princípio, se um endereço não existir, não irá aparecer nenhuma opção. Mas pode-se disparar uma mensagem de erro se achar necessário. Muita bibliografia foi consultada durante o desenvolvimento desse trabalho, as mais importantes podem ser conferidas logo abaixo.

# Links importantes
How to Integrate Google Maps into Ruby on Rails App: https://anadea.info/blog/how-to-integrate-google-maps-into-ruby-on-rails-app

Using Google Maps With Rails : https://www.sitepoint.com/use-google-maps-rails/

Como adicionar um mapa Google com marcador ao seu site: https://developers.google.com/maps/documentation/javascript/adding-a-google-map

Google Maps JavaScript API V3 Reference: https://developers.google.com/maps/documentation/javascript/reference#MapOptions

PAGE SPECIFIC JAVASCRIPT IN RAILS: http://brandonhilkert.com/blog/page-specific-javascript-in-rails/

Rails Tutorial : https://www.railstutorial.org/book/

Rails Guide : http://guides.rubyonrails.org/

