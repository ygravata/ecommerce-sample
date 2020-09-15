# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'

Order.destroy_all
Coupon.destroy_all
CartProduct.destroy_all
Cart.destroy_all
Product.destroy_all
User.destroy_all

puts 'Creating user'

user = User.create!(name:"Yuri", last_name: "Gravatá", birthdate: '24/11/1992', email: 'ygravata@gmail.com', password: 'testtest', admin: true)

puts "User #{user.email} created."

puts 'Creating user'

user2= User.create!(name:"Pedro", last_name: "Pazello", birthdate: '24/11/1992', email: 'pedro.pazello@dorel.com.br', password: 'testtest', admin: true)

puts "User #{user2.email} created."

puts "Creating products"

  product = Product.new(
    user_id: user.id,
    name: "Trend",
    brand: 'Safety 1st',
    category: 'carrinho',
    image_url: "https://www.safety1st.com.br/imagens/medium/medium_D968B_carrinho_trend_safety-1st_red_perspectiva_esquerda_padrao_IMG_8947.jpg?1519151885",
    for: "Para crianças de 0 meses a 15 kg",
    desc1: "Carrinho com fechamento guarda-chuva compatível com bebê conforto, assento reversível e removível, com encosto reclinável em 3 posições.",
    desc2:
    "  Carrinho com fechamento guarda-chuva compatível com bebê conforto, assento reversível e removível, com encosto reclinável em 3 posições.
      O Carrinho Trend Safety 1st possui 3 posições do encosto sendo a primeira sentado, a segunda levemente reclinado e a terceira deitado. O assento pode ser revertido, de frente para os pais ou virado para o mundo, e pode ser removido para armazenar ou encaixar o bebê conforto (vendido separadamente com base veicular).
      Fechamento exclusivo na categoria Travel System tipo guarda-chuva, compacto e leve. Possui 4 rodas duplas com trava de direcionamento nas rodas dianteiras e freios interligados nas rodas traseiras, manopla dupla acolchoada, amplo cesto de compras para até 4,5kg com zíper lateral que facilita o acesso.
      Capota retrátil e extensível com para-sol e visor para os pais, cinto de 5 pontos com protetor de ombro acolchoado, 3 alturas para cinto e apoio para os pés emborrachado. Tecido fácil de limpar. Para proceder com o fechamento correto do carrinho, o assento deve estar revertido contrário a visão de quem guia.
    ",
    price: rand(500...1000)
  )

  product.save!

  puts "Product #{product.name} created!"


  product = Product.new(
    user_id: user.id,
    name: 'Trend',
    brand: 'Safety 1st',
    category: 'carrinho',
    image_url: 'https://images-na.ssl-images-amazon.com/images/I/616mTDF3oGL._AC_SY355_.jpg',
    for: 'Para crianças de 0 meses a 15 kg',
    desc1: 'Carrinho com fechamento guarda-chuva compatível com bebê conforto, assento reversível e removível, com encosto reclinável em 3 posições.',
    desc2:
      'Carrinho com fechamento guarda-chuva compatível com bebê conforto, assento reversível e removível, com encosto reclinável em 3 posições.
          O Carrinho Trend Safety 1st possui 3 posições do encosto sendo a primeira sentado, a segunda levemente reclinado e a terceira deitado. O assento pode ser revertido, de frente para os pais ou virado para o mundo, e pode ser removido para armazenar ou encaixar o bebê conforto (vendido separadamente com base veicular).
          Fechamento exclusivo na categoria Travel System tipo guarda-chuva, compacto e leve. Possui 4 rodas duplas com trava de direcionamento nas rodas dianteiras e freios interligados nas rodas traseiras, manopla dupla acolchoada, amplo cesto de compras para até 4,5kg com zíper lateral que facilita o acesso.
          Capota retrátil e extensível com para-sol e visor para os pais, cinto de 5 pontos com protetor de ombro acolchoado, 3 alturas para cinto e apoio para os pés emborrachado. Tecido fácil de limpar. Para proceder com o fechamento correto do carrinho, o assento deve estar revertido contrário a visão de quem guia.',
    price: rand(500...1000)
    )

  product.save!

  puts "Product #{product.name} created!"

  product = Product.new(
    user_id: user.id,
    name: 'Zippy',
    brand: 'Safety 1st',
    category: 'carrinho',
    image_url: 'https://rihappy.vteximg.com.br/arquivos/ids/319165-800-800/carrinho-de-passeio-zippy-full-black-safety-1st-IMP91210_Detalhe5.jpg?v=636113505562470000s',
    for: 'Para crianças de 7,2 meses a 15 kg',
    desc1: 'Carrinho portátil com tamanho fechado super compacto de apenas 54,4 x 40 x 16 cm.',
    desc2:
      'Carrinho portátil com tamanho fechado super compacto de apenas 54,4 x 40 x 16 cm.
          Leve estrutura de alumínio, pesando somente 5,4 kg, com bolsa para transporte para facilitar a vida dos pais. Mantém o conforto com as 2 posições de reclínio e capota com proteção UV50+.',
    price: rand(500...1000)
    )

  product.save!

  puts "Product #{product.name} created!"

  product = Product.new(
    user_id: user.id,
    name: 'Andador Melody Garden',
    brand: 'Safety 1st',
    category: 'Acessórios',
    image_url: 'https://www.pontofrio-imagens.com.br/bebes/PasseiodeBebes/AndadoresparaBebes/405973/4446918/centro-de-atividades-safety-1st-melody-garden-11389-405973.jpg',
    for: 'Para crianças de 7,2 meses a 12 kg',
    desc1: 'Centro de atividades completo, com funções de balanço e andador. Assento giratório 360º removível e lavável, bandeja removível com brinquedos, luzes e sons da natureza.',
    desc2:
    '  Centro de atividades completo, com funções de balanço e andador. Assento giratório 360º removível e lavável, bandeja removível com brinquedos, luzes e sons da natureza.
        Funções de balanço, andador e centro de entretenimento com 3 posições de altura e assento giratório 360º removível e lavável. Bandeja removível com brinquedos, luzes e sons da natureza.
        Possui exclusivo sistema anti-quedas que evita acidentes em escadas e pisos irregulares, aprovado pelo INMETRO conforme a norma ABNT NBR 16.311 para crianças entre cerca de 6 meses até 12kg.',
    price: rand(500...1000)
    )

  product.save!

  puts "Product #{product.name} created!"

  product = Product.new(
    user_id: user.id,
    name: 'MiloFix',
    brand: 'Maxi-Cosi',
    category: 'Cadeirinha',
    image_url: 'https://cdn.shopify.com/s/files/1/0924/5328/products/maxi-cosi-milofix-assento-de-carro-anne-claire-baby-store-nomad-preto-645083_512x615.jpg?v=1586766776',
    for: 'Para crianças de 0 meses a 18 kg',
    desc1: 'Cadeirinha do nascimento aos 18kg com fixação ISOFIX. É reversível e permanece até os 13kg de costas para o movimento, aumentando a segurança e o conforto dos bebês.',
    desc2:
      'Cadeirinha do nascimento aos 18kg com fixação ISOFIX. É reversível e permanece até os 13kg de costas para o movimento, aumentando a segurança e o conforto dos bebês.
          Sistema de reclínio ideal para os recém-nascidos, 6 posições de ajuste do apoio de cabeça em conjunto com a altura dos cintos e assento acolchoado ultra macio lavável na máquina.
          Fixação ISOFIX super segura, com indicadores que mostram se a instalação está correta e ponto de ancoragem superior modelo Top Tether para maior estabilidade.
          Instalação de frente e de costas para o movimento ajustável com um simples giro da base e ganchos laterais para apoiar os cintos enquanto acomoda a criança.
          Aprovado pelo INMETRO conforme a norma ABNT NBR 14.400 para crianças do nascimento aos 18kg (Grupos 0+ e 1) e pelos mais rígidos testes internacionais de segurança.',
    price: rand(500...1000)
    )

  product.save!

  puts "Product #{product.name} created!"


