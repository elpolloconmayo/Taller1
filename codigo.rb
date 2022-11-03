def Question1(Usuario)
    puts "¿ha tenido perdida de apetito?: " 
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

respuesta = "si"

while respuesta == "si" do
    print "¿ha tenido perdida de apetito?: " 
    respuesta = gets.chomp
end

puts "fin"