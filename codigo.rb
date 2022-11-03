def Ingresar()
    puts "Ingrese su nombre de usuario: "
    nombre = gets.chomp
    puts "Ingrese su contraseña: "
    contraseña = gets.chomp
    if false #aqui va conexion con BDD
        puts "Bienvenido #{nombre}"
        Main(Usuario)
    else
        puts "Usuario o contraseña incorrectos"
    end
end

def Registrarse()
    puts "Ingrese su nombre"
    nombre = gets.chomp
    puts "Ingrese su primer apellido"
    apellido = gets.chomp
    puts "Ingrese su segundo apellido"
    apellido2 = gets.chomp
    puts "Ingrese su correo"
    edad = gets.chomp.to_i
    puts "Ingrese su contraseña"
    contraseña = gets.chomp
    if false #aqui va conexion con BDD
        puts "Usuario registrado" 
        Main(Usuario)
    else
        puts "Error al registrar usuario, favor de intentar de nuevo"
    end
end

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