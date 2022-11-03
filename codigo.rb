def Question1(Usuario)
    puts "Sentimiento de culpabilidad"
    puts "-No 
    \n-Me culpo a mi mismo, creo decepcionar a la gente.
    \n-Constantemente recuerdo errores pasados.
    \n-El constante sentimiento depresivo es un castigo.
    \n-Oigo voces acusatorias o de denuncia." 
    respuesta = gets.chomp
    Usuario.puntos = Usuario.puntos + respuesta.to_i
    end
end

def Question2(Usuario)
    puts "Insomnio" 
    puts "-No, duermo bien.
    \n-A veces me cuesta dormir, toma mas de media hora lograrlo.
    \n-Me cuesta dormir cada noche.
    \n-Constantemente estoy despierto durante la noche y me molesta
    \n-Estoy despierto durante la noche y puedo levantarme sin problema.
    \n-Me despierto antes de lo propuesto, pero vuelvo a dormir.
    \n-No puedo volver a dormir si me levanto de la cama." 
    respuesta = gets.chomp
    Usuario.puntos = Usuario.puntos + respuesta.to_i
    end
end

def Question3(Usuario)
    puts 'Trabajos e intereses'
    puts "-No tengo problemas en trabajar
    \n-Constantemente no me veo capaz de realizar una tarea, me siento cansado.
    \n-No me interesan las tareas ni trabajos que realizo.
    \n-No dedico mucho tiempo a trabajo, no soy capaz.
    \n-Dejé de trabajar, no puedo hacerlo."
    respuesta = gets.chomp
    Usuario.puntos = Usuario.puntos + respuesta.to_i
end

def Question4(Usuario)
    puts 'Pérdida de interés en el sexo'
    puts "-No he notado ningún cambio reciente en mi interés por el sexo.
    \n-Estoy menos interesado en el sexo de lo que solía estarlo.
    \n-Estoy mucho menos interesado en el sexo.
    \n-He perdido completamente el interés en el sexo."
    respuesta = gets.chomp
    Usuario.puntos = Usuario.puntos + respuesta.to_i

def Question5(Usuario)
    puts 'Agitación'
    puts "-Estoy relajado.
    \n-Ocasionalmente juego con mis manos, pelos, muevo los pies.
    \n-Estoy inquieto la mayoría del tiempo, cambio de posición en la silla, muevo mis manos.
    \n-No puedo estar quieto.
    \n-Me muerdo las uñas, los labios, me tiro los pelos."
    respuesta = gets.chomp
    Usuario.puntos = Usuario.puntos + respuesta.to_i
end

def Question6(Usuario)
    puts 'Ansiedad Psíquica'
    puts "-No tengo ansiedad.
    \n-Me encuentro ligeramente irritado.
    \n-Me preocupan varias cosas pequeñas.
    \n-Me preocupa cómo expresarme, me inquieta cometer un error comunicándome.
    \n-Constantemente hablo de mis terrores."
    respuesta = gets.chomp
    Usuario.puntos = Usuario.puntos + respuesta.to_i
end

def Question7(Usuario)
    puts 'Desvalorización'
    puts "-No siento que yo no sea valioso.
    \n-No me considero a mi mismo tan valioso y útil como solía considerarme.
    \n-Me siento menos valioso cuando me comparo con otros.
    \n-Siento que no valgo nada."
    respuesta = gets.chomp
    Usuario.puntos = Usuario.puntos + respuesta.to_i
end

def Question8(Usuario)
    puts 'Cambios en el apetito'
    puts "-No he experimentado ningún cambio en mi apetito.
    \n-Mi apetito es un poco menor que lo habitual.
    \n-Mi apetito es un poco mayor que lo habitual.
    \n-Mi apetito es mucho menor que antes.
    \n-Mi apetito es mucho mayor que lo habitual
    \n-No tengo apetito en absoluto.
    \n-Quiero comer todo el día."
    respuesta = gets.chomp
    Usuario.puntos = Usuario.puntos + respuesta.to_i
end

def Question9(Usuario)
    puts 'Dificultad de concentración'
    puts "-Puedo concentrarme tan bien como siempre.
    \n-No puedo concentrarme tan bien como habitualmente
    \n-Me es difícil mantener la mente en algo por mucho tiempo.
    \n-Encuentro que no puedo concentrarme en nada."
    respuesta = gets.chomp
    Usuario.puntos = Usuario.puntos + respuesta.to_i
end

def Question10(Usuario)
    puts 'Pérdida de placer'
    puts "-Obtengo tanto placer como siempre por las cosas de las que disfruto.
    \n-No disfruto tanto de las cosas como solía hacerlo.
    \n-Obtengo muy poco placer de las cosas que solía disfrutar.
    \n-No puedo obtener ningún placer de las cosas de las que solía disfrutar."
    respuesta = gets.chomp
    Usuario.puntos = Usuario.puntos + respuesta.to_i
end

def menu(respuesta)
    puts "1.- Registrarse/Ingresar" #Las preguntas que se harian
    puts "2.- Realizar encuesta"
    puts "3.- Salir"
    print 'Ingrese la opcion deseada: '
    user_input = gets.to_i
    if user_input == 1
        puts 'Aqui lo de la opcion 2'
        #crear usuario
    elsif user_input == 2
        #Question1()
        #Question2()
        #puts Usuario.puntos
    elsif user_input == 3
        'Terminando programa'
        break
    end
end

puts "fin"