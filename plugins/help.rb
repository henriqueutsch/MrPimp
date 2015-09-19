def help(message)
	puts "#{Time.now} /help #{message.from.first_name} #{message.from.last_name} => #{message.chat.id}"

	return "/help => Ajuda
			/cardapio => Exibe minhas putas
			/puta => Exibe a puta
			/imgputa [numerofotos] [nomeputa] => Exibe 5 imagens da puta por padrao
			/speak [texto] => Falo o que escrever em audio
			/fala [texto]=> Posto uma mensagem do que escrever
			/frase => Posto um ensinamento da minha vida de cafetão 
			/xvideos [busca] => Busca video de 1 a 3 min do xvideos.
			/pcateg => Mostro uma lista de categorias porno
			/pornstar => mostro uma lista de pornstar	
			/pimp [frase] => O mesmo que o comando morfetico
			/xinga => Envia um xingamento
			/mussum => Diz uma frase do mussum
			/yoda => diz uma frase do mestre yoda
			/chucknorris = diz uma frase sobre chuck norris
			/climatempo [Nome Cidade] => imprime condiçoes da cidade Tem que ter acento e iniciais maiusculas"
end