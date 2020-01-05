require 'nokogiri'
require 'open-uri'
require 'byebug'
require 'json'

s_ranks = [
           'https://saintseiyatencent.wixsite.com/sstbr/character/aquarius_camus',
           'https://saintseiyatencent.wixsite.com/sstbr/character/arayashiki_shaka',
           'https://saintseiyatencent.wixsite.com/sstbr/character/aries_mu',
           'https://saintseiyatencent.wixsite.com/sstbr/character/aries_shion',
           'https://saintseiyatencent.wixsite.com/sstbr/character/capricorn_shura',
           'https://saintseiyatencent.wixsite.com/sstbr/character/chrysaor_krishna',
           'https://saintseiyatencent.wixsite.com/sstbr/character/deathmask_cancer',
           'https://saintseiyatencent.wixsite.com/sstbr/character/evil_saga',
           'https://saintseiyatencent.wixsite.com/sstbr/character/gemini_saga',
           'https://saintseiyatencent.wixsite.com/sstbr/character/godcloth_ikki',
           'https://saintseiyatencent.wixsite.com/sstbr/character/godcloth_seiya',
           'https://saintseiyatencent.wixsite.com/sstbr/character/leo_aiolia',
           'https://saintseiyatencent.wixsite.com/sstbr/character/libra_dohko',
           'https://saintseiyatencent.wixsite.com/sstbr/character/nebula_shun',
           'https://saintseiyatencent.wixsite.com/sstbr/character/pandora',
           'https://saintseiyatencent.wixsite.com/sstbr/character/peacock_shoyao',
           'https://saintseiyatencent.wixsite.com/sstbr/character/pisces_aphrodite',
           'https://saintseiyatencent.wixsite.com/sstbr/character/pog_hyoga',
           'https://saintseiyatencent.wixsite.com/sstbr/character/pope',
           'https://saintseiyatencent.wixsite.com/sstbr/character/sagitario_seiya',
           'https://saintseiyatencent.wixsite.com/sstbr/character/sagittarius_aiolos',
           'https://saintseiyatencent.wixsite.com/sstbr/character/saori',
           'https://saintseiyatencent.wixsite.com/sstbr/character/scorpio_milo',
           'https://saintseiyatencent.wixsite.com/sstbr/character/seadragon_kanon',
           'https://saintseiyatencent.wixsite.com/sstbr/character/siren_sorrento',
           'https://saintseiyatencent.wixsite.com/sstbr/character/taurus_aldebaran',
           'https://saintseiyatencent.wixsite.com/sstbr/character/virgo_shaka',
           'https://saintseiyatencent.wixsite.com/sstbr/character/wyvern_radamanthys']

s_ranks.each do |char_url|
  doc = Nokogiri::HTML(open(char_url))

  skill_descriptions = Array.new
  costs = Array.new
  skill_names = Array.new
  skill_images = Array.new
  skills_ups = Array.new
  skills = Array.new
  cosmos = Array.new

  name = doc.css('.style-jkdkppc01 h4.font_4')[0].text
  constellation = doc.css('.style-jkdkppc01 h4.font_4')[1].text
  picture = doc.css("img[alt='blank_hd.png']").first.values.last.match(/^.*\.png\//).to_s.chop

  #status
  health = doc.css('.style-ju2wy5c3inlineContent .txtNew .font_7')[1].text
  patk = doc.css('.style-ju2wy5c3inlineContent .txtNew .font_7')[3].text
  pdef = doc.css('.style-ju2wy5c3inlineContent .txtNew .font_7')[4].text
  matk = doc.css('.style-ju2wy5c3inlineContent .txtNew .font_7')[6].text
  mdef = doc.css('.style-ju2wy5c3inlineContent .txtNew .font_7')[10].text
  speed = doc.css('.style-ju2wy5c3inlineContent .txtNew .font_7')[8].text


  #skills
  (0..3).each do |skill_number|
    next if doc.css("div[data-content-padding-horizontal='2']")[skill_number].attributes['title'].value.empty?

    skill_names << doc.css("div[data-content-padding-horizontal='2']")[skill_number].attributes['title'].value
    image_partition = doc.css("div[data-content-padding-horizontal='2'] > div > wix-image > img")[skill_number].attributes["src"].value.partition(/\.(gif|png)/)
    skill_images << image_partition[0] + image_partition[1]
    unless doc.css('.style-jkdkppc01 ol')[skill_number].nil?
      skills_ups << doc.css('.style-jkdkppc01 ol')[skill_number].css('li').text.split(/[\n\t]/).reject(&:empty?).map{ |x| x.gsub(';', '') }
    end
  end


  doc.css("div.style-jkdkppc01[data-min-height='22'] > p.font_8 > span > span:not(:empty)").each.with_index do |x,i|
    case i
    when 0, 3, 5, 7 then skill_descriptions << x.text
    when 1, 2, 4, 6 then costs << x.text
    end
  end

  #troca branco por P
  costs.map!{|x| x == "\u200B" ? x = 'P' : x = x }


  skill_names.count.times do |n|
    skills << {name: skill_names[n], cost: costs[n], description: skill_descriptions[n], levels: skills_ups[n], picture: skill_images[n]}
  end

  #cosmos
  doc.css("div[data-content-padding-vertical='4'] div wix-image.style-jn82063uimg").each do |cosmo_single|
    parsed = JSON.parse(cosmo_single.attributes["data-image-info"].value)
    cosmo_name = parsed["imageData"]["title"]
    uri = "https://static.wixstatic.com/media/#{parsed['imageData']['uri']}"
    cosmos << { name: cosmo_name, uri: uri }
  end


  #divide em arrays com 4
  cosmos = cosmos.each_slice(4).to_a

  character = { name: name, 
                    constellation: constellation, 
                    picture: picture, 
                    stats: {
                      health: health,
                      patk: patk,
                      pdef: pdef,
                      matk: matk,
                      mdef: mdef,
                      speed: speed,
                    },
                    skills: skills,
                    cosmos: cosmos
                  }


  File.open("db/characters/char.json","a") do |f|
    f.write(character.to_json)
    f.write "\n"
  end
end






# puts 'Nome'
# puts char_json[:name]

# puts 'Contelacao'
# puts char_json[:constellation]

# puts 'Foto'
# puts char_json[:picture]


# puts 'Status'
# puts 'Vida'
# puts char_json[:stats][:health]
# puts 'Atk Fisico'
# puts char_json[:stats][:patk]
# puts 'Def Fisica'
# puts char_json[:stats][:pdef]
# puts 'Atk magico'
# puts char_json[:stats][:matk]
# puts 'Def magica'
# puts char_json[:stats][:mdef]
# puts 'Velocidade'
# puts char_json[:stats][:speed]

# puts 'Skills'
# char_json[:skills].each do |skill|
#   puts 'Nome: '
#   puts skill[:name]

#   puts 'Custo: '
#   puts skill[:cost]

#   puts 'Imagem: '
#   puts skill[:picture]

#   puts 'Descriçao: '
#   puts skill[:description]

#   puts 'Levels: '
#   puts skill[:levels]
# end

# puts 'Cosmos'
# char_json[:cosmos].each do |cosmo_set|
#   cosmo_set.each do |cosmo|
#     puts 'Nome: '
#     puts cosmo[:name]
  
#     puts 'URI: '
#     puts cosmo[:uri]

#     puts '-'
#   end
#   puts '--------'
# end
