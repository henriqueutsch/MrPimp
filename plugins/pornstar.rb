require "open-uri"
require "nokogiri"

def pornstar(message)
puts "#{Time.now} /pornstar #{message.from.first_name} #{message.from.last_name} => #{message.chat.id}"
	@list = ''	
	page = rand(9)
		if page == 0
			page = ""
		else 
			page = "/#{page}"
		end
		page = Nokogiri::HTML(open("http://www.xvideos.com/pornstars#{page}"))
		categories = page.xpath("//div[@id='profilesList']/div/p/a")
		categories.map {|category|
			@list = "#{@list} #{category.text} \n"
		}
		


	return @list

end

# puts pornstar("teste")