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
          say "Le chat est mort !", spoken: "le chat de schrodinger est mort"
          when 1  
          say "Le chat est vivant !", spoken: "le chat de schrodinger est vivant"
          else  
          say "Le chat est mort vivant !", spoken: "le chat de schrodinger est mort et vivant a la fois"
      end 
    
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
    

end
