require 'telegram/bot'
require 'telegram/bot/botan'
require "fileutils"
require "require_all"
require_all "plugins/*.rb"

token = 'apikey'
Telegram::Bot::Client.run(token, logger: Logger.new($stdout)) do |bot|
    bot.enable_botan!('apikey')
  bot.listen do |message|
    if message.text.include? " "
    input = message.text[0,message.text.index(' ')]
    else
        input = message.text
    end

    begin
    case input
    when '/fala'
        bot.track('/fala', message.from.id, type_of_chat: message.chat.class.name)
        bot.api.send_message(chat_id: message.chat.id, text: fala(message)) 
    when '/climatempo'
            bot.track('/climatempo', message.from.id, type_of_chat: message.chat.class.name)
        bot.api.send_message(chat_id: message.chat.id, text: climatempo(message)) 
    when '/speak'     
            bot.track('/speak', message.from.id, type_of_chat: message.chat.class.name)
        bot.api.send_audio(chat_id: message.chat.id, audio: speak(message))
        File.delete("fala.mp3")
    when '/gnu'
        bot.api.send_message(chat_id: message.chat.id, text: "GNU o caralho! FreeBSD é o capeta!!")
        puts "#{Time.now} /gnu #{message.from.first_name} #{message.from.last_name} => #{message.chat.id}"
    when '/xvideos'
            bot.track('/xvideos', message.from.id, type_of_chat: message.chat.class.name)
        bot.api.send_video(chat_id: message.chat.id, video: xvideos(message), photo: File.new("xvideos.jpg"))
        File.delete("xvideos.flv")
        File.delete("xvideos.mp4")
    when '/pornstar'
        bot.api.send_message(chat_id: message.chat.id, text: pornstar(message))
    when '/pcateg'
        bot.api.send_message(chat_id: message.chat.id, text: pcateg(message))
    when '/cardapio'
        bot.api.send_message(chat_id: message.chat.id, text: cardapio(message))
    when '/imgputa'
        images = imgputa(message)
        images.map {|image|
        bot.api.send_photo(chat_id: message.chat.id, photo: image)
        }
        Dir.glob('*.jpg') do |file|
            File.delete(file)
        end
    when '/puta'
        @hash = puta(message)
        bot.api.send_photo(chat_id: message.chat.id, photo: @hash[:image])
        bot.api.send_message(chat_id: message.chat.id, text: @hash[:nome])  
        bot.api.send_message(chat_id: message.chat.id, text: @hash[:desc])  
        bot.api.send_message(chat_id: message.chat.id, text: @hash[:hora])  
        bot.api.send_message(chat_id: message.chat.id, text: @hash[:pernoite])  
        bot.api.send_message(chat_id: message.chat.id, text: @hash[:oral])  
        bot.api.send_message(chat_id: message.chat.id, text: @hash[:anal])  
        bot.api.send_message(chat_id: message.chat.id, text: @hash[:tel])  
        bot.api.send_message(chat_id: message.chat.id, text: @hash[:name]) 
    when '/help'
        bot.api.send_message(chat_id: message.chat.id, text: help(message))  
    when '/frase'
        bot.api.send_message(chat_id: message.chat.id, text: frase(message))
    when '/yoda'
        bot.api.send_message(chat_id: message.chat.id, text: yoda(message))
    when '/mussum'
        bot.api.send_message(chat_id: message.chat.id, text: mussum(message))    
    when '/chucknorris'
        bot.api.send_message(chat_id: message.chat.id, text: chucknorris(message))  
    when '/xinga'
        bot.api.send_message(chat_id: message.chat.id, text: xinga(message))  
    when '/pimp'
        bot.api.send_message(chat_id: message.chat.id, text: pimp(message))  
    end
    rescue Exception => e  
        puts e.message  
        bot.api.send_message(chat_id: message.chat.id, text: erro(message)) 
    end
  end
end
