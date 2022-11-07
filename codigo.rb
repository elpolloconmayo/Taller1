class MenuSubmenuConsola

    def main()
                print "menu \n1. Ingresar y Registrarse 1 \n2. Preguntas 2 \nfavor ingresar opcion 1_2: ";
                opcion = (gets.chomp).to_i
                case opcion 
                    when 1
                        print "\n accedio al menu Ingresar y Registrarse\n";
                        print "sub menu\n1.1 Ingresar 1\n1.2 Registrarse 2\nfavor ingresar opcion 1_2: ";
                        opcion = (gets.chomp).to_i
                        case opcion
                            when 1
                                #se dirige a la funcion 1.1 / ingresar
                                print "\naccedio al submenu Ingresar "
                                puts "\nIngrese su nombre de usuario: "
                                nombre = gets.chomp
                                puts "Ingrese su contraseña: "
                                contraseña = gets.chomp
                                if false #aqui va conexion con BDD
                                    puts "Bienvenido #{nombre}"
                                    Main(Usuario)
                                else
                                    puts "Usuario o contraseña incorrectos"
                                end
                            when 2
                                #se dirige a la funcion 1.2 / registrarse
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
                                end
                            else
                                print "\nerror de opcion en el menu"
                        end
                    when 2
                        print "\n accedio al menu de Preguntas\n";
                        print "sub menu\n2.1 Preguntas 1\n2.2 opcion 2\nfavor ingresar opcion 1: ";
                        opcion = (gets.chomp).to_i
                        case opcion
                        when 1
                            #se dirige a la funcion 2.1 / aqui van las preguntas
                            print "\naccedio al submenu de preguntas"
                            if false #aqui va conexion con BDD
                                puts "Preguntas" 
                                Main(Usuario)
                            else
                                puts "Error en las Preguntas"
                        else
                            print "\nerror de opcion en el menu"
                        end
                    else
                        print "\nerror de opcion de menu"
                end
        end
end
obj = MenuSubmenuConsola.new
obj.main()