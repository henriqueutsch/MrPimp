require "open-uri"
require "nokogiri"

def pcateg(message)
	puts "#{Time.now} /pcateg #{message.from.first_name} #{message.from.last_name} => #{message.chat.id}"

	@list = ''	
	page = Nokogiri::HTML(open("http://www.pornhub.com/categories"))
	# puts filmes
	categories = page.xpath("//ul[@class='categories-list videos row-4-thumbs']/li/div/h5/a/strong")
	categories.map {|category|
		@list = "#{@list} #{category.text} \n"
	}
	# @list
	return @list

end


# puts pcateg("ola")
