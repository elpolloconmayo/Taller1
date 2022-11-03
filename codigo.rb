res = true
while res == true
    puts "1.- Ingresar"
    puts "2.- Registrarse"
    puts "3.- Salir"
    print "Opcion: "
    Opcion = gets.chomp.to_i
    if Opcion == 1
        Ingresar()
    elsif Opcion == 2
        Registrarse()
    elsif Opcion == 3
        res = false
    else
        puts "Opcion no valida"
    end
end