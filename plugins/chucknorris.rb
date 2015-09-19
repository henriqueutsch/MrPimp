require "open-uri"
require "nokogiri"

def chucknorris(message)
   puts "#{Time.now} /chucknorris #{message.from.first_name} #{message.from.last_name} => #{message.chat.id}"

   filmes = Nokogiri::HTML(open("http://mundomisturado.com/2010/08/05/as-975-verdades-sobre-chuck-norris/"))
   return filmes.xpath("//div[@class='entry-content']/p")[rand(976)].text


end

# puts chucknorris("teste")

