require "open-uri"
require "nokogiri"

def imgputa(message)
	puts "#{Time.now} /imgputa #{message.from.first_name} #{message.from.last_name} => #{message.chat.id}"
    nome = message.text.gsub("/imgputa ","")
    # nome = message.gsub("/imgputa ","")
    number = 5
    if nome[0,2].to_i > 0
        number = nome[0,2].to_i
        nome = nome[3,nome.size]

    end
    puta = Nokogiri::HTML(open("http://bhmodels.com.br/#{nome}"))
    images = puta.xpath("//ul[@class='thumbs']/li/a/@href")
    if number>images.count
        number = images.count
    end
    @imagesoutput = Array.new
    images.map.with_index {|image, index|
    if index==number
        break
    end
    # puts image
    open("http://bhmodels.com.br/#{image}") {|f|
        File.open("model2#{index}.jpg","wb") do |file|
           file.puts f.read
        end
        }
        @imagesoutput << File.new("model2#{index}.jpg")
    }
    # puts @imagesoutput
    return @imagesoutput

end
# imgputa("/imgputa 10 carol")
