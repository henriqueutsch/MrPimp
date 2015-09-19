def yoda(message)
frases = [
"Que a Força esteja com você.",
"Aventura. Excitação. Um Jedi anseia não por essas coisas.",
"Sempre passar o que você aprendeu.",
"Um Jedi usa a Força para o conhecimento e defesa, nunca para o ataque.",
"Em um lugar escuro nos encontramos, e um pouco mais de conhecimento ilumina nosso caminho.",
"Poderoso você se tornou, o lado escuro sinto em você.",
"Quando 900 anos de idade chegar, tão boa aparência você não terá",
"Muitas das verdades que temos dependem de nosso ponto de vista.",
"Paciência você deve ter meu jovem Padawan.",
"Sinta a Força",
"O lado negro mancha tudo. Impossível de ver o futuro é.",
"O medo é o caminho para o lado negro. O medo leva a raiva, a raiva leva ao ódio, o ódio leva ao sofrimento.",
"A morte é uma parte natural da vida.  Feliz fique por aqueles que na Força se transformam. Apego leva ao ciúmes, a sombra da ganância isso é.",
"Treine a si mesmo a deixar partir tudo que teme perder.",
"Verdadeiramente maravilhosa, a mente de uma criança é.",
"Luke: Mas eu não acredito! Yoda: É por isso que você fracassa.",
"Tamanho importa não. Olhe para mim. Você julga a mim pelo tamanho?",
"Seres luminosos somos nós. Não esta matéria bruta.",
"Guerras não faz grande ninguém.",
"Faça. Ou não faça. Não existe a tentativa."]

    puts "#{Time.now} /yoda #{message.from.first_name} #{message.from.last_name} => #{message.chat.id}"

	return frases[rand(14)]

end

# yoda()