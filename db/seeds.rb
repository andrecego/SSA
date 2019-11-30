# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# kikibase = BaseAttribute.create(health: '12041', patk: '0', matk: '2280', pdef: '454', mdef: '454', speed: '388')
# kiki = Character.create(name: 'Kiki', rank: 'B', base_attribute_id: kikibase.id)
efeitos = ['Ataque Básico', 'Ataque em Área', 'Alvo Único', 'Revidar']

efeitos.map do |name|
  Effect.create(name: name)
end