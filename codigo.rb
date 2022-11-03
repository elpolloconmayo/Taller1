def Question1(Usuario)
    puts "¿Se siente culpable?: "
    puts "-No 
    \n-Me culpo a mi mismo, creo decepcionar a la gente.
    \n-Constantemente recuerdo errores pasados.
    \n-El constante sentimiento depresivo es un castigo.
    \n-Oigo voces acusatorias o de denuncia." 
    respuesta = gets.chomp
    if respuesta == "si"
        Usuario.puntos = Usuario.puntos + 1
    end
end

def Question2(Usuario)
    puts "¿ha tenido perdida de peso?: " 
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