require "open-uri"
require "nokogiri"

def cardapio(message)
    puts "#{Time.now} /cardapio #{message.from.first_name} #{message.from.last_name} => #{message.chat.id}"
	main = Nokogiri::HTML(open("http://bhmodels.com.br/acompanhantes.php"))
    nome = main.xpath("//div[@id='box_acompanhantes']/dl/dt/a/@href")
    @lista=''
    nome.map {|name|
    	@lista = "#{@lista}/imgputa #{name}\n" 
    }

    return @lista
end