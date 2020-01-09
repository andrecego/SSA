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
cosmo_types = ['Solar', 'Lunar', 'Estelar', 'Lendário', 'Trocar']

# efeitos.sort.map do |name|
#   Effect.where(name: name).first_or_create
# end

# constelacoes.sort.map do |name|
#   Constellation.where(name: name).first_or_create
# end

ranks.map do |name| 
  Rank.where(name: name).first_or_create
end

# cosmo_basics.sort.map do |name| 
#   CosmoBasic.where(name: name).first_or_create
# end

# cosmo_types.map do |name| 
#   CosmoType.where(name: name).first_or_create
# end

File.open('db/characters/char_rank_s.json', 'r') do |file|
  file.each_line do |line|
    char = JSON.parse line

    name = char['name']
    puts name

    constellation = char['constellation']
    if Constellation.find_by(name: constellation).blank?
      constellation = Constellation.create!(name: constellation)
    else
      constellation = Constellation.find_by(name: constellation)
    end

    rank = Rank.find_by(name: 'S')

    picture = char['picture']

    character = Character.new(name: name, constellation: constellation, rank: rank)
    character.picture.attach(io: open(picture), filename: "#{name}.png", content_type: "image/png")
    character.save!


    #status
    health = char['stats']['health']
    patk = char['stats']['patk']
    pdef = char['stats']['pdef']
    matk = char['stats']['matk']
    mdef = char['stats']['mdef']
    speed = char['stats']['speed']
    Stat.create!(health: health, patk: patk, pdef: pdef, matk: matk, mdef: mdef, speed: speed, character: character)


    #skills
    char['skills'].each.with_index do |skill, index|
      skill_name = skill['name']
      cost = skill['cost']
      description = skill['description']
      levels = skill['levels']
      new_skill = Skill.new(name: skill_name, cost: cost, description: description, levels: levels, character: character)

      new_skill.picture.attach(io: open(skill['picture']), filename: "skill_#{index+1}#{skill['picture'][-4..-1]}", content_type: "image/#{skill['picture'][-3..-1]}")
      new_skill.save!
    end

    #cosmos
    # char[:cosmos].each do |cosmo_set|
    #   cosmo_set.each do |cosmo|
    #     cosmo[:name]
      
    #     cosmo[:uri]
    #   end
    # end

  end
end
# name = 'Shaka'
# if Character.where(name: name).blank?
#   constellation = Constellation.find_by(name: 'Arayashiki')
#   rank = Rank.find_by(name: 'S')
#   character = Character.new(name: name, constellation: constellation, rank: rank)
#   character.picture.attach(io: File.open("db/characters/shaka-arayashiki/character.png"), filename: "character.png", content_type: "image/png")
#   character.save!

  #status
  # health = 11514
  # patk = 0
  # pdef = 359
  # matk = 2854
  # mdef = 507
  # speed = 304
  # Stat.create!(health: health, patk: patk, pdef: pdef, matk: matk, mdef: mdef, speed: speed, character: character)

  #skills
  #sk1
  # skill_name = 'Buddha Hit/Palm'
  # cost = '0'
  # description = 'Causa 80% de dano mágico à um inimigo. Durante o efeito da habilidade "Immobile Stance", esse ataque é substituído por "Buddha Palm", causando 110% de dano mágico em todos os inimigos.'
  # levels = ["Causa 80%/110% de dano mágico", "Causa 85%/120% de dano mágico", "Causa 90%/130% de dano mágico", "Causa 95%/140% de dano mágico", "Causa 100%/150% de dano mágico"]

  # skill = Skill.new(name: skill_name, cost: cost, description: description, levels: levels, character: character)
  # skill.picture.attach(io: File.open("db/characters/shaka-arayashiki/skill_1.gif"), filename: "skill_1.gif", content_type: "image/gif")
  # skill.save!
# end
