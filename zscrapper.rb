#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'byebug'

class String
  def separar
    self.gsub(/::/, '/').
    gsub("\t", '').
    gsub(/([a-z])([A-Z]|[\d])/,'\1   \2').
    gsub(/([\d])([A-Z])/,'\1   \2').
    gsub(/[$;]/,'').
    gsub(/([a-z])[ ]([A-Z])/,'\1   \2').split('   ')
  end
end


# Fetch and parse HTML document
#http_url = 'https://saintseiyatencent.wixsite.com/sstbr/character/aquarius_camus'
http_url = 'https://saintseiyatencent.wixsite.com/sstbr/character/andromeda_shun'
# http_url = 'https://saintseiyatencent.wixsite.com/sstbr/character/libra_dohko'

doc = Nokogiri::HTML(open(http_url))

#stats
health = doc.css('#comp-ju2xbdx7 span span span span').text
patk = doc.css('#comp-ju2xo7dd span span span span').text
matk = doc.css('#comp-ju2xqfzq span span span span').text
pdef = doc.css('#comp-ju2xqg10 span span span span').text
mdef = doc.css('#comp-ju2xrds2 span span span span').text
speed = doc.css('#comp-ju2xrdt7 span span span span').text

a = doc.css('.style-ju2wy5c3inlineContent div').first.text
class String
  def separar
    self.gsub(/::/, '/')
    gsub("\t", '').
    gsub("\n", '   ').
    gsub(/([a-z])([A-Z]|[\d])/,'\1   \2').
    gsub(/([\d])([A-Z])/,'\1   \2').
    gsub(/[$;]/,'').
    gsub(/([a-z])[ ]([A-Z])/,'\1   \2').
    split('   ').reject{|x| x.empty? }
  end
end

b=[]
nome = 'Camus'
a.separar.each do |x|
  if x.match(/^#{nome}/)
    b[-1] = ("#{b[-1]} #{x}")
  else
    b << x
  end
end

effects = ['Ataque Básico', 'Stack Gelo', 'Alvo Único', 'Congelar',
           'Ataque Grupo', 'Passiva' , 'Grupo Alvo', 'Ataque Múltiplo',
           'Aumento Defesa', 'Ataque Extra']

skill = Array.new
b.map do |z|
  if skill.empty?
    skill << z
    next
  end
  if z.length > 13
    skill << z
  elsif skill[-1].length > 13
    skill << z
  elsif effects.any? { |e| e.match(/^#{z}/) }
    skill << z
  elsif z.match(/\d/)
    skill << z
  else
    skill[-1] = ("#{skill[-1]} #{z}")
  end
end

n = 0
c = 0

habilidades = { "0": {effects: [], level_ups: []},
                "1": {effects: [], level_ups: []},
                "2": {effects: [], level_ups: []},
                "3": {effects: [], level_ups: []} }


#######FIRST SKILL
#name
habilidades[n.to_s.to_sym][:name] = skill[c]
c += 1

#effects
while skill[c].length < 30 && !skill[c].match(/\d/)
  habilidades[n.to_s.to_sym][:effects].append(skill[c])
  c += 1
end

#description
habilidades[n.to_s.to_sym][:description] = skill[c]
c += 1

#levelups
while skill[c].length > 30
  habilidades[n.to_s.to_sym][:level_ups].append(skill[c])
  c += 1
end

#cost
if !habilidades[n.to_s.to_sym][:effects].any? {|y| y == 'Passiva'}
  habilidades[n.to_s.to_sym][:cost] = skill[c]
  c += 1
end


n += 1
###### SECOND SKILL

#effects
while skill[c].length < 30 && !skill[c].match(/\d/)
  habilidades[n.to_s.to_sym][:effects].append(skill[c])
  c += 1
end

#cost
if !habilidades[n.to_s.to_sym][:effects].any? {|y| y == 'Passiva'}
  habilidades[n.to_s.to_sym][:cost] = skill[c]
  c += 1
end


#description
habilidades[n.to_s.to_sym][:description] = skill[c]
c += 1

#levelups
while skill[c].length > 30
  habilidades[n.to_s.to_sym][:level_ups].append(skill[c])
  c += 1
end

#name
habilidades[n.to_s.to_sym][:name] = skill[c]
c += 1

n += 1
########### THIRD SKILL
#name
habilidades[n.to_s.to_sym][:name] = skill[c]
c += 1

#effects
while skill[c].length < 30 && !skill[c].match(/\d/)
  habilidades[n.to_s.to_sym][:effects].append(skill[c])
  c += 1
end

#cost
if !habilidades[n.to_s.to_sym][:effects].any? {|y| y == 'Passiva'}
  habilidades[n.to_s.to_sym][:cost] = skill[c]
  c += 1
end

#description
habilidades[n.to_s.to_sym][:description] = skill[c]
c += 1

#levelups
while skill[c].length > 30
  habilidades[n.to_s.to_sym][:level_ups].append(skill[c])
  c += 1
end



n += 1
######### FOURTH SKILL

#name
habilidades[n.to_s.to_sym][:name] = skill[c]
c += 1

#effects
while skill[c].length < 30 && !skill[c].match(/\d/)
  habilidades[n.to_s.to_sym][:effects].append(skill[c])
  c += 1
end

#description
habilidades[n.to_s.to_sym][:description] = skill[c]
c += 1

#levelups
while c > skill.length && skill[c].length > 30
  habilidades[n.to_s.to_sym][:level_ups].append(skill[c])
  c += 1
end

#cost
if !habilidades[n.to_s.to_sym][:effects].any? {|y| y == 'Passiva'}
  habilidades[n.to_s.to_sym][:cost] = skill[c]
  c += 1
end


habilidades[:"0"].each do |x|
    x.each{|z| puts z}
end
puts '-----------------'
habilidades[:"1"].each do |x|
    x.each{|z| puts z}
end
puts '-----------------'
habilidades[:"2"].each do |x|
    x.each{|z| puts z}
end
puts '-----------------'
habilidades[:"3"].each do |x|
    x.each{|z| puts z}
end

byebug

puts 'ola renan'