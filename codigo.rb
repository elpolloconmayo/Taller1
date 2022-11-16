

class MenuSubmenuConsola

    #posible aplicacion a futuro
    Characters Usuario
    Characters contraseña

    def main()
        print "MENU \n1. Ingresar 1 \n2. Registrarse 2 \n3. Salir 3 \nfavor ingresar opcion 1_2_3: ";
        opcion = (gets.chomp).to_i
        case opcion
        when 1
            print "\naccedio al submenu Ingresar "
            puts "\nIngrese su nombre de usuario: "
            nombre = gets.chomp
            puts "Ingrese su contraseña: "
            contraseña = gets.chomp
            if false #aqui va conexion con BDD
                puts "Bienvenido #{nombre}"
                MenuPuente(nombre, contraseña)
            else
                puts "Usuario o contraseña incorrectos, favor de reintentar"
                self.main
            end
        when 2
            #cambiar a futuro por una funcion que reconozca los atributos de la bdd y los pida por consola
            print "\naccedio al submenu Registrarse "
            puts "\nIngrese su nombre"
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
                MenuPuente(nombre, contraseña)
            else
                puts "Error al registrar usuario, favor de intentar de nuevo"
                self.main
            end
        when 3
            print "Saliendo..."
        else
            print "\nerror de opcion de menu, reiniciando..."
            self.main
        end
    end

    def MenuPuente(usuario, contraseña)
        print "MENU \n1. Gestión de pacientes 1 \n2. Gestión de Encuestas 2 \n3. Salir 3 \nfavor ingresar opcion 1_2_3: ";
        opcion = (gets.chomp).to_i
        case opcion
        when 1
            puts "accedio al submenu Gestión de pacientes"
            MenuPaciente(usuario, contraseña)
        when 2
            puts "accedio al submenu Gestión de Encuestas"
            MenuEncuesta(usuario, contraseña)
        else
            print "\nerror de opcion de menu, reiniciando..."
            self.MenuPuente(usuario, contraseña)
        end
    end

end



obj = MenuSubmenuConsola.new
obj.main()
