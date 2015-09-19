require "open-uri"
require "nokogiri"
require "fileutils"
require "time"

def delete(name)
	if File.exists?(name) 
		File.delete(name)
	end
end

def xvideos(message)
   puts "#{Time.now} /xvideos #{message.from.first_name} #{message.from.last_name} => #{message.chat.id}"   
   text = message.text
	delete("xvideos.mp4")
	delete("xvideos.flv")
	delete("xvideos.flv.part")
	delete("xvideos.flv.part.aria2")
   text = text.gsub("/xvideos ","")
   search = text.gsub(" ","+")
   filmes = Nokogiri::HTML(open("http://www.xvideos.com/?k=#{search}&p=100&durf=1-3min"))
   pages = filmes.xpath("//div[@class='pagination small']/ul/li/a")[8].text
   randpage = rand(pages.to_i)
   filmes = Nokogiri::HTML(open("http://www.xvideos.com/?k=#{search}&p=#{randpage}&durf=1-3min"))
   pages = filmes.xpath("//div[@class='thumb']/a/@href")
   movies = filmes.xpath("//div[@class='thumb']/a/@href").count
   randmovie = rand(movies)
   movie = filmes.xpath("//div[@class='thumb']/a/@href")[randmovie]
   start = Time.now.to_i
   system "youtube-dl -R 1 --external-downloader-args --file-allocation=none --external-downloader-args -q --external-downloader aria2c -o 'xvideos.%(ext)s' http://www.xvideos.com#{movie} -q --no-warnings --no-progress --no-call-home"
   system "youtube-dl -R 1 --external-downloader-args --file-allocation=none --external-downloader-args -q --external-downloader aria2c --write-thumbnail -o 'xvideos.%(ext)s' http://www.xvideos.com#{movie} -q --no-warnings --no-progress --no-call-home"
   if File.exists?('xvideos.flv') 
	   # system 'ffmpeg -i xvideos.flv -c copy -copyts xvideos.mp4 -loglevel quiet'
      system 'ffmpeg -i xvideos.flv -c:v libx264 -crf 23 -c:a libfaac -q:a 100 xvideos.mp4 -loglevel quiet'
	end
   finish = Time.now.to_i
   puts "P#{randpage} V#{randmovie} #{movie} Time: #{finish-start}s"
   return File.new("xvideos.mp4")
end
# xvideos("anal")