
class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end 


  def show_state
    return "#{@name} a #{@life_points} points de vie"
  end 


  def gets_damage(amount_attack) #C'est une méthode qui sort les points de vie du player après une attaque
    @life_points -= amount_attack
    if @life_points <= 0
    puts "PLAYER #{@name} HAS BEEN SLAYED!"
    end 
  end 


  def attacks(victim)
    puts "Le joueur #{@name} attaque le joueur #{victim.name}"
    damage = compute_damage  #damage est la variable qui stock le resultat de la méthode compute_damage
    puts "il lui inflige #{damage} points de dommages\n\n"

    victim.gets_damage(damage) #c'est le subissant qui subit les dommages de l'attaque.
  end


  def compute_damage
    return rand(1..6) # la méthode permet d'obtenir un chiffre aléatoire entre 1 et 6 
  end

end

class HumanPlayer < Player # HumanPlayer hérite de toute les méthodes de la class Player
attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    super(name)
    @life_points = 100
  end



  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon  
    weapon_new = rand(1..6) # la valeur de la nouvelle arme est un integer aléatoire compris entre 1 et 6
    puts "Tu as trouvé une arme de niveau #{weapon_new}"
    if weapon_new > weapon_level # si la nouvelle arme a une valeur supérieur à l'arme actuelle, on la récupère. 
      weapon_level = weapon_new
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack  #cette méthode nous permet de recupérer des points de vie.
    pack_life = rand(1..6) # on obtient un chiifre aléatoire entre 1 et 6. Selon le chiffre, on récupère ou non des points de vie.
    if pack_life == 1
      @life_points
      puts "Tu n'as rien trouvé"
    elsif pack_life >= 2 && pack_life <= 5
      health = 50 
      puts "Bravo, tu as trouvé un pack de +50 points de vie!"
      if @life_points <= 50
        @life_points += health
      else
        @life_points = 100
      end
    elsif pack_life = 6
      health = 80
      puts "Bravo, tu as trouvé un pack de +80 points de vie!"
      if @life_points <= 20
        @life_points += health
      else
        @life_points = 100
      end
    end   
  end
end

#binding.pry