require 'cora'
require 'siri_objects'
require 'pp'

#######
# This is a "hello world" style plugin. It simply intercepts the phrase "test siri proxy" and responds
# with a message about the proxy being up and running (along with a couple other core features). This 
# is good base code for other plugins.
# 
# Remember to add the plugin to the "config.yml" !
######

class SiriProxy::Plugin::FrenchTest < SiriProxy::Plugin
  def initialize(config)
    #if you have custom configuration options, process them here!
  end

  listen_for /bonjour/i do 
    say "Salut :D", spoken: "Bien le bonjour a vous !"
    
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  listen_for /([0-9,]*[0-9]) plus ([0-9,]*[0-9])/i do |number1,number2|
    res = (number1.to_f+number2.to_f).to_f
    say "#{number1} + #{number2} = #{res}", spoken: "Ca fait #{res}"
    
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  listen_for /([0-9,]*[0-9]) - ([0-9,]*[0-9])/i do |number1,number2|
    res = (number1.to_f-number2.to_f).to_f
    say "#{number1} - #{number2} = #{res}", spoken: "Ca fait #{res}"
    
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  listen_for /([0-9,]*[0-9]) x ([0-9,]*[0-9])/i do |number1,number2| #the x is an ASCII char... FUUU
    res = (number1.to_f*number2.to_f).to_f
    say "#{number1} x #{number2} = #{res}", spoken: "Ca fait #{res}"
    
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  listen_for /([0-9,]*[0-9])\/([0-9,]*[0-9])/i do |number1,number2|
    res = (number1.to_f/number2.to_f).to_f
    say "#{number1} / #{number2} = #{res}", spoken: "Ca fait #{res}"
    
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  listen_for /(minou)+|(chat)/i do
    r = Random.rand(3)
      case r  
          when 0  
          say "Le chat est mort !", spoken: "le chat de schrodingHer est mort"
          #le H pour la prononciation 
          when 1  
          say "Le chat est vivant !", spoken: "le chat de schrodinger est vivant"
          else  
          say "Le chat est mort vivant !", spoken: "le chat de schrodinger est mort et vivant a la fois"
      end 
    
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  listen_for /qui (.*) plus petit/i do
    say "Euuu... je sais pas trop.", spoken: "Mais c'est Nicolas Sarkozy !"
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  listen_for /(.*)blague/i do
      
      blagues = ["Comment appelle-t-on une blonde avec 2 neurones ? \nUne femme enceinte !",
      "Quelle est la ressemblance entre les blondes et les tortues ? \nToutes les deux se font baiser quand elles sont sur leur dos",
      "Pourquoi les Belges apportent-ils un fusil aux toilettes ? \nPour chasser les mauvaises odeurs.",
      "Pourquoi les Belges sont-ils en pyjama sur leurs motos ? \nPour mieux se coucher dans les virages."]
      
    r = Random.rand(blagues.length)
    say blagues[r]
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  listen_for /(.*)citation/i do
    
    citations = ["La vie est comme un arc-en-ciel, il faut de la pluie et du soleil pour en voir les couleurs.",
    " La vie offre toujours deux pentes. On grimpe ou on se laisse glisser. ",
    "Une vie ne vaut rien, mais rien ne vaut une vie.",
    " La vie est une maladie mortelle sexuellement transmissible.",
    "Dieu aima les oiseaux et inventa les arbres. L'homme aima les oiseaux et inventa les cages.",
    "Chacun tire son plaisir de l'instrument dont il joue le mieux."]
      
    r = Random.rand(citations.length)
    say citations[r]
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
    
  listen_for /chuck|chuck norris/i do
    
      chucks = ["Certaines personnes portent un pyjama Superman. Superman porte un pyjama Chuck Norris.",
      "Chuck Norris ne se mouille pas, c'est l'eau qui se Chuck Norris.",
      "Chuck Norris et Superman ont fait un bras de fer, le perdant devait mettre son slip par dessus son pantalon.",
      "Chuck Norris peut gagner une partie de puissance 4 en trois coups.",
      "Un jour, Chuck Norris a perdu son alliance. Depuis c'est le bordel dans les terres du milieu...",
      "Chuck Norris fait pleurer les oignons.",
      "Quand Google ne trouve pas quelque chose, il demande a Chuck Norris.",
      "Chuck Norris sait parler le braille.",
      "Chuck Norris est la raison pour laquelle Charlie se cache.",
      "Chuck Norris peut encercler ses ennemis. Tout seul.",
      "Chuck Norris mange les emballages des carambars. On ne blague pas avec Chuck Norris..",
      "Chuck Norris peut taguer le mur du son.",
      "Chuck Norris peut te faire passer un sale quart d'heure en 8 minutes.",
      "Chuck Norris aime la vie. Une chance pour elle.",
      "Chuck Norris a fini Super Mario Bros sans sauter."]
      
    r = Random.rand(chucks.length)
    say chucks[r]
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end


    

end
