def speak (message)
    puts "#{Time.now} /speak #{message.from.first_name} #{message.from.last_name} => #{message.chat.id}"

	texto = message.text.gsub("/speak ","")
	system("espeak -v pt '#{texto}' --stdout > fala.mp3")
	return File.new('fala.mp3')
end