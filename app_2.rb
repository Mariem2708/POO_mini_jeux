require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "----------------------------"
puts "  Welcome to 'SQUID GAME'"
puts "----- Try to survive -------"
sleep 0.5
puts "What's your username?"
print ">"
username = gets.chomp

user = HumanPlayer.new(username)

ennemies = []

playerbot1 = Player.new("Josiane")
playerbot2 = Player.new("José")

ennemies.push(playerbot1,playerbot2)

sleep 1
puts " Voici nos combattants :"
sleep 1
puts " A ma gauche "
sleep 1
puts "#{user.name}"
sleep 1.5
puts " A ma droite "
sleep 1
puts "#{playerbot1.name}"
puts "#{playerbot2.name}\n\n"
sleep 2


while user.life_points > 0 && playerbot1.life_points > 0 || playerbot2.life_points > 0
puts "----------------------------------------"
puts "Voici ton etat actuel : "
user.show_state
puts "----------------------------------------"

puts "\n"
puts "Quel action veux-tu faire?\n"
puts "a - chercher une meilleure arme"
puts "s - chercher à se soigner\n\n"

puts "Attack an ennemy : "
puts "0 - #{playerbot1.show_state}"
puts "1 - #{playerbot2.show_state}"

puts "----------------------------------------"

print ">"
choice = gets.chomp


if choice == "a" 
  user.search_weapon
end
if choice == "s"
  user.search_health_pack
end
if choice == "0"
  user.attacks(playerbot1)
end 
if choice == "1"
  user.attacks(playerbot2)
end

puts "Press any key to continue :3"
puts gets.chomp


ennemies.each do |bot|
  
  if bot.life_points > 0
    puts "----------Fais gaffe les ennemis ripostent!!!!!!--------------\n\n"
    bot.attacks(user)  
  end
end 
end 



=begin
player.attacks(playerbot1)
if playerbot1.life_points <= 0 && playerbot2.life_points <= 0
  break
end
player.attacks(playerbot2)
  if playerbot1.life_points <= 0 && playerbot2.life_points <= 0
  break
end
if  playerbot1.life_points > 0
  playerbot1.attacks(player)
elsif player.life_points <= 0
  break
else 
  break
end

if  playerbot2.life_points > 0
  playerbot2.attacks(player)
elsif player.life_points <= 0
  break
else 
  break
end

end

if (playerbot1.life_points <= 0 && playerbot2.life_points <= 0)
  puts "BRAVO ! TU AS GAGNE !" 
else 
  puts "Loser"
end
=end










