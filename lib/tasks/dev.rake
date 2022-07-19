namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    
    if Rails.env.development?
      
      show_spinner("Excluindo banco de dados...") { %x(rails db:drop) }
      
      show_spinner("Criando banco de dados...") { %x(rails db:create)}
     
     
      show_spinner("Migrando banco de dados...") { %x(rails db:migrate)}
          %x(rails dev:add_coins) 
      
    else
      puts "Você não está em modo de desenvolvimento"
    end
  end

  desc "Cadastra moedas"
  task add_coins: :environment do
    
    coins = [{description: "Bitcoin", acronym: "BTC", url_image: "https://en.bitcoin.it/w/images/en/5/50/Bitcoin.png"},
    {description: "Etherum", acronym: "ETH", url_image: "https://w7.pngwing.com/pngs/399/855/png-transparent-ethereum-classic-cryptocurrency-bitcoin-cardano-bitcoin-angle-triangle-logo.png"}]

  coins.each do |coin| 
    Coin.find_or_create_by!(coin)
end
end

 desc "Cadastra tipos de mineraçã"
  task add_mini_types: :environment do
    mini_types = [
      {name: "Proof of work", acronym: "POW"}, 
      {name: "Proof of steak", acronym: "P0S"}]
      
      mini_types.each do |mini_type| 
      MiniType.find_or_create_by!(mini_types)
end
end
end

private
  def show_spinner(msg_start, msg_end = "Concluido")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
end