require 'BBDD conection and statements\connect.rb'

cnxn = PG.connect(host: 'magallanes.inf.unap.cl', dbname: 'gpallero', user: 'gpallero',password: '4Fd3n2hSde')

class MenuSubmenuConsola

    #posible aplicacion a futuro
    #Characters usuario
    #Characters contraseña

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
            puts'ingrese un nombre de usuario'
            nombre_usu = gets.chomp
            puts "\nIngrese su nombre"
            nombre = gets.chomp
            puts "Ingrese su apellido materno"
            apellido_m = gets.chomp
            puts "Ingrese su apellido paterno"
            apellido_p = gets.chomp
            puts "Ingrese su correo"
            email = gets.chomp
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

    def MenuPaciente(usuario, contraseña)
        print "MENU \n1. Ingresar paciente 1 \n2. Modificar paciente 2 \n3. Eliminar paciente 3 \n4. Salir 4 \nfavor ingresar opcion 1_2_3_4: ";
        opcion = (gets.chomp).to_i
        case opcion
        when 1
            puts 'ingrese rut con digito verificador:'
            run = gets.chomp
            dv = run[8]
            run = run[0,8].to_i
            puts 'Ingrese el nombre del encuestado:'
            nombre_pat = gets.chomp
            puts "Ingrese su apellido materno"
            apellido_mp = gets.chomp
            puts "Ingrese su apellido paterno"
            apellido_pp = gets.chomp
            cnxn.exec("INSERT INTO surveyeds (run, dv, name, mother_sname, father_sname) VALUES ( #{run} , '#{dv}' , '#{nombre_pat}' , '#{apellido_mp}' , '#{apellido_pp}')")

        when 2
            #aqui va la funcion de modificar paciente
        when 3
            #aqui va la funcion de eliminar paciente
        when 4
            print "Saliendo..."
        else
            print "\nerror de opcion de menu, reiniciando..."
            self.MenuPaciente(usuario, contraseña)
        end
    end

    def MenuEncuesta(usuario, contraseña)
        print "MENU \n1. Ingresar encuesta 1 \n2. Modificar encuesta 2 \n3. Eliminar encuesta 3 \n4. Salir 4 \nfavor ingresar opcion 1_2_3_4: ";
        opcion = (gets.chomp).to_i
        case opcion
        when 1
            #aqui va la funcion de ingresar encuesta
        when 2
            #aqui va la funcion de modificar encuesta
        when 3
            #aqui va la funcion de eliminar encuesta
        when 4
            print "Saliendo..."
        else
            print "\nerror de opcion de menu, reiniciando..."
            self.MenuEncuesta(usuario, contraseña)
        end
    end

end


obj = MenuSubmenuConsola.new
obj.main()
