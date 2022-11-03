def Question1(Usuario)
    puts "¿Se siente culpable?"
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
    puts "¿Tiene insomnio?" 
    puts "-No, duermo bien.
    \n-A veces me cuesta dormir, toma mas de media hora lograrlo.
    \n-Me cuesta dormir cada noche.
    \n-Constantemente estoy despierto durante la noche y me molesta
    \n-Estoy despierto durante la noche y puedo levantarme sin problema.
    \n-Me despierto antes de lo propuesto, pero vuelvo a dormir.
    \n-No puedo volver a dormir si me levanto de la cama." 
    respuesta = gets.chomp
    if respuesta == "si"
        Usuario.puntos = Usuario.puntos + 1
    end
end

def Question3(Usuario)
    puts 'lorem ipsum'
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
    end
end

puts "fin"