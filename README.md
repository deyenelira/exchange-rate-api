# README
* Versão do ruby: 2.7.4
* Dependências: Ruby, PostgreSQL
* Instruções para rodar o projeto: 
  - Antes de tudo é preciso ter a chave de autenticação para usar a API, que pode ser encontrada em https://rapidapi.com/fixer/api/fixer-currency, a         chave deve ser inserida nas linhas 25 e 37 dos respectivos arquivos latest_rate.rb e historical_rates.rb
  - bundle install - instala todas as gems do projeto
  - rake db:create -  cria o banco de dados
  - rails s - executa a aplicação no localhost:3000
* Comandos para executar os testes:
  - rspec ./spec/controllers/exchange_rate_spec.rb
  - rspec ./spec/controllers/historics_spec.rb
  - rspec ./spec/models/historic_spec.rb
