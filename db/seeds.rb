# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'

CartProduct.destroy_all
Cart.destroy_all
Product.destroy_all
User.destroy_all

puts 'Creating user'

user = User.create!(email: 'ygravata@gmail.com', password: 'testtest', admin: true)

puts "User #{user.email} created."

puts "Creating products"

3.times do

  product = Product.new(
    user_id: user.id,
    name: "Trend",
    brand: 'Safety 1st',
    category: 'carrinho',
    image_url: "https://www.safety1st.com.br/imagens/medium/medium_D968B_carrinho_trend_safety-1st_red_perspectiva_esquerda_padrao_IMG_8947.jpg?1519151885",
    for: "Para crianças de 0 meses a 15 kg",
    desc1: "Carrinho com fechamento guarda-chuva compatível com bebê conforto, assento reversível e removível, com encosto reclinável em 3 posições.",
    desc2:
    "  <p>Carrinho com fechamento guarda-chuva compatível com bebê conforto, assento reversível e removível, com encosto reclinável em 3 posições.</p>
      <p>O Carrinho Trend Safety 1st possui 3 posições do encosto sendo a primeira sentado, a segunda levemente reclinado e a terceira deitado. O assento pode ser revertido, de frente para os pais ou virado para o mundo, e pode ser removido para armazenar ou encaixar o bebê conforto (vendido separadamente com base veicular).</p>
      <p>Fechamento exclusivo na categoria Travel System tipo guarda-chuva, compacto e leve. Possui 4 rodas duplas com trava de direcionamento nas rodas dianteiras e freios interligados nas rodas traseiras, manopla dupla acolchoada, amplo cesto de compras para até 4,5kg com zíper lateral que facilita o acesso.</p>
      <p>Capota retrátil e extensível com para-sol e visor para os pais, cinto de 5 pontos com protetor de ombro acolchoado, 3 alturas para cinto e apoio para os pés emborrachado. Tecido fácil de limpar. Para proceder com o fechamento correto do carrinho, o assento deve estar revertido contrário a visão de quem guia.</p>
    ",
    price: rand(500...1000)
  )

  product.save!

  puts "Product #{product.name} created!"
end
