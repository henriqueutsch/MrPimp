def fala(message)
	puts "#{Time.now} /fala #{message.from.first_name} #{message.from.last_name} => #{message.chat.id}"

 	return message.text.gsub("/fala","")
end