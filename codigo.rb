

class MenuSubmenuConsola

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
                        Main(Usuario)
                    else
                        puts "Usuario o contraseña incorrectos, favor de reintentar"
                        self.main
                    end
                when 2
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
                        Main(Usuario)
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
end

obj = MenuSubmenuConsola.new
obj.main()
