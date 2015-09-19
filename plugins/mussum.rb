def mussum(message)
frases =[
"Minha vidis é um LITRO abertis.",
"Mais vale um bebadis conhecidiss, que um alcoolatra anonimiss.",
"Cacildis!",
"Criôlo é a tua véia!",
"Não sou faixa preta cumpadi, sou preto inteiris, inteiris.",
"Paisis, filhis, espiritis santis.",
"Eu vou me pirulitar!",
"Suco de cevadiss deixa as pessoas mais interessantiss.",
"Casa, comida, três milhão por mês, fora o bafo!",
"Suco de cevadis",
"Trais mais uma ampola",
"Todo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo!",
"Ta deprimidis, eu conheço uma cachacis que pode alegrar sua vidis.",
"Se suco de cevadiss atrapalha seu casamentiss, abandone sua mulher, cacildiss!!",
"Forevis!"]

    puts "#{Time.now} /mussum #{message.from.first_name} #{message.from.last_name} => #{message.chat.id}"

	return frases[rand(14)]
end