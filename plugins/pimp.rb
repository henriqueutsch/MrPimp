require "open-uri"

def pimp(message)
	puts "#{Time.now} /pimp #{message.from.first_name} #{message.from.last_name} => #{message.chat.id}"
	frase = message.text.gsub("/pimp ","").gsub(" ","+")

    return open("http://www.ed.conpet.gov.br/mod_perl/bot_gateway.cgi?server=0.0.0.0%3A8085&charset_post=utf-8&charset=utf-8&pure=1&js=0&tst=1&msg=#{frase}").read
end