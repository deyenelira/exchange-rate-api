# README
* Versão do ruby: 2.7.4
* Dependências: Ruby, PostgreSQL
* Instruções para rodar o projeto: 
  - bundle install - instala todas as gems do projeto
  - rake db:create -  cria o banco de dados
  - rails s - executa a aplicaço no localhost:3000
* Comandos para executar os testes:
  - rspec ./spec/controllers/exchange_rate_spec.rb
  - rspec ./spec/controllers/historics_spec.rb
  - rspec ./spec/models/historic_spec.rb
