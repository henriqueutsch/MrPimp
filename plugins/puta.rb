require "open-uri"
require "nokogiri"

def puta(message)
	puts "#{Time.now} /puta #{message.from.first_name} #{message.from.last_name} => #{message.chat.id}"
    main = Nokogiri::HTML(open("http://bhmodels.com.br/acompanhantes.php"))
    name = main.xpath("//div[@id='box_acompanhantes']/dl/dt/a/@href")[rand(149)]
    puta = Nokogiri::HTML(open("http://bhmodels.com.br/#{name}"))
    # puta = Nokogiri::HTML(open("http://bhmodels.com.br/carolmendes"))
    images = puta.xpath("//ul[@class='thumbs']/li/a/@href").count
    nome = puta.xpath("//div[@id='box_info_acompanhante']/dl/dd/h1").text
    dados = puta.xpath("//div[@class='info_acompanhante']/p").text
    desc = puta.xpath("//div[@id='box_info_acompanhante']/dl/dd/p").text
    tel = puta.xpath("//div[@class='info_acompanhante']/h3").text
    hora = puta.xpath("//dd[@class='conteudoacompanhates']")[3].text
    pernoite = puta.xpath("//dd[@class='conteudoacompanhates']")[5].text
    oral = puta.xpath("//dd[@class='conteudoacompanhates']")[8].text
    anal = puta.xpath("//dd[@class='conteudoacompanhates']")[9].text
    image = puta.xpath("//ul[@class='thumbs']/li/a/@href")[0]
    open("http://bhmodels.com.br/#{image}") {|f|
       File.open("model.jpg","wb") do |file|
         file.puts f.read
       end
    }
    return {
    	:image => File.new('model.jpg'),
    	:nome => nome,
    	:desc => desc,
        :hora => "1h - #{hora}",
        :pernoite => "Pernoite: #{pernoite}",
        :oral => "Oral: #{oral}",
        :anal => "Anal: #{anal} ",
    	:tel => tel,
    	:name => "/imgputa [#{images}] #{name}"
    }

end

# puta("teste")