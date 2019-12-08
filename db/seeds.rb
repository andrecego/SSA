# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

efeitos = ["Adormecer", "Alvo Único", "Ataque Básico", "Ataque Conjunto", "Ataque Extra", "Ataque em Área", "Aumento Crítico", "Bloqueio de Cosmo", 
           "Bonus de Ataque", "Bonus de Cosmo", "Bonus de Defesa", "Confusão", "Congelar", "Contra-Ataque", "Controle de Grupo", "Cura em Área", 
           "Dano Real", "Escudo", "Imunidade", "Invocação", "Marca", "Marca de Gelo", "Múltiplos Ataques", "Passiva", "Penetração Mágica", "Precisão", 
           "Previne Morte", "Purificar", "Redirecionar", "Redução de Cosmo", "Redução de Dano", "Redução de Defesa", "Renascer", "Resistência", "Revidar", 
           "Roubo de Vida", "Silenciar", "Sono Profundo", "Turno Extra"]

# efeitos = ['Marca de Luz', 'Marca de Nebulosa', 'Marca de Rosa', 'Marca de Agulha']
constelacoes = ['Escorpião', 'Baleia', 'Câncer', 'Libra', 'Sagitário', 'Aquário', 'Virgem', 'Arayashiki', 'Áries', 'Capricórnio', 
                'Chrysaor', 'Gêmeos', 'Armadura Divina', 'Leão', 'Andrômeda', 'Pavão', 'Peixes', 'Cisne', 'Relógio', 'Cetro',
                'Dragão Marinho', 'Sirene', 'Touro']
ranks = ['SS', 'S', 'A', 'B', 'C']
cosmo_basics = ['perc_phi_attack', 'phi_attack', 'perc_cosmo_attack', 'cosmo_attack', 'phi_defense', 'cosmo_defense',
                'perc_phi_defense', 'perc_cosmo_defense','speed', 'health',  'healing', 'status_hit', 'status_res', 'crit_rate', 'crit_damage']
cosmo_types = ['Solar', 'Lunar', 'Estelar', 'Lendário']

efeitos.sort.map do |name|
  Effect.where(name: name).first_or_create
end

constelacoes.sort.map do |name|
  Constellation.where(name: name).first_or_create
end

ranks.map do |name| 
  Rank.where(name: name).first_or_create
end

cosmo_basics.sort.map do |name| 
  CosmoBasic.where(name: name).first_or_create
end

cosmo_types.map do |name| 
  CosmoType.where(name: name).first_or_create
end