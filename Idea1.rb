user_input = ""

while user_input != 3
    
    puts "1.- Opcion 1" #Las preguntas que se harian
    puts "2.- opcion 2"
    puts "3.- Salir"

    print 'Ingrese la opcion deseada:'


    user_input = gets.to_i

    if user_input == 1
    puts 'Aqui va los que se hace en la opcion 1 ' #lo quen se haria dependiendo de la respuesta (sistema de putnos, respuestas preregistradas, etc...)
    elsif user_input == 2
    puts 'Aqui lo de la opcion 2'
    elsif user_input == 3
        'Terminando programa'
    end

end