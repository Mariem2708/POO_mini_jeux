require 'bundler'
Bundler.require


require_relative 'lib/player'
require_relative 'lib/game'

player1 = Player.new("Josiane")
player2 = Player.new("José")


round = 1
############# - Presentation des joueurs - ###################
while player1.life_points > 0 || player2.life_points > 0
  puts "-------------- Round #{round} ------------------"
  round += 1
  puts "Voici l'état de chaque joueur :"
  player1.show_state
  puts "#{player2.show_state}\n"



############ - FIGHT! - #################
  puts "Passons à la phase d'attaque:"
  player1.attacks(player2)
  if player2.life_points <= 0
  break
  end 
  puts "#{player2.attacks(player1)}\n"

  if player1.life_points <= 0
  break
  end 
end 
