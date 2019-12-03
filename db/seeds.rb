# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
efeitos = ['Ataque Básico', 'Ataque em Área', 'Alvo Único', 'Revidar']
constelacoes = ['Escorpião', 'Baleia', 'Câncer', 'Libra', 'Sagitário']
ranks = ['SS', 'S', 'A', 'B', 'C']


efeitos.map do |name|
  Effect.create(name: name)
end

contelacoes.map do |name|
  Constelattion.create(name: name)
end

ranks.map do |name| 
  Rank.create(name: name)
end

