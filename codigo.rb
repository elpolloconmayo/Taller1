require 'date'
require 'PG'


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
            puts cnxn.exec("SELECT * FROM users WHERE name = '#{nombre}' AND password = '#{contraseña}'")

            if false #aqui va conexion con BDD
                puts "Bienvenido #{nombre}"
                self.MenuPuente(nombre, contraseña)
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

            printf 'Ingrese los siguientes datos del encuestado:'
            puts 'rut con digito verificador (de no tener rut dejar en blanco):'
            run = gets.chomp

            if run == ''
                run = NULL
                dv = NULL
            else    
                dv = run[8]
                run = run[0,8].to_i
            end       

            puts 'Nombre:'
            nombre_pat = gets.chomp

            puts "Apellido materno:"
            apellido_mp = gets.chomp

            puts "Apellido paterno:"
            apellido_pp = gets.chomp

            cnxn.exec("INSERT INTO surveyeds (run, dv, name, mother_sname, father_sname) VALUES ( #{run} , '#{dv}' , '#{nombre_pat}' , '#{apellido_mp}' , '#{apellido_pp}')")

        when 2

            printf 'Dispone de la id del encuestado a modificar? Y/N'
            des = gets.chomp
            if des = 'Y' || des = 'y':

                puts 'Ingrese el id:'
                cnid = gets.chomp

            else    
                puts 'Nombre'
                cndn = gets.chomp
                puts 'Apellido materno'
                cnam = gets.chomp
                puts 'Apellido paterno'
                cnap = gets.chomp

                cond = cnxn.exec("SELECT (id) FROM profetionals WHERE name = #{cndn} AND mother_sname = #{cnam} AND father_sname = #{cnap}")
                key , value = cond.first
                value = value.to_i
                cnid = value

            end

            printf 'Ingrese los datos a modificar (de no querer modificarlos dejar en blanco):'

            puts 'Rut:'
            nrut = gets.chomp

            if nrut != ''
                nwdv = nrut[8]
                nrut = nrut[0,8].to_i
                cnxn.exec("UPDATE surveyeds SET run = #{nrut}, dv = #{nwdv} WHERE id = #{value};")
            end   

            puts 'Nombre:'
            nnam = gets.chomp

            if nnam != ''
                cnxn.exec("UPDATE surveyeds SET name = #{nrut} WHERE id = #{value};")
            end   

            puts 'Apellido materno:'
            nmsn = gets.chomp

            if nmsn != ''
                cnxn.exec("UPDATE surveyeds SET mother_sname = #{nrut} WHERE id = #{value};")
            end    

            puts 'Apellido paterno:'
            nfsn = gets.chomp

            if nfsn != ''
                cnxn.exec("UPDATE surveyeds SET father_sname = #{nfsn} WHERE id = #{cnid};")
            end    

        when 3
            puts 'Conoce el id del encuestado a eliminar? Y/N'
            des = gets.chomp
            if des == 'Y' || des == 'y'
                puts 'Porfavor ingrese el id del encuestado:'
                deid = gets.chomp
                detm = Time.now

                cnxn.exec("UPDATE surveyeds deleted_at = #{detm} WHERE id = #{deid}")

            else
                puts 'Si no recuerda el id ingrese los siguientes datos:'

                puts 'Nombre'
                cndn = gets.chomp
                puts 'Apellido materno'
                cnam = gets.chomp
                puts 'Apellido paterno'
                cnap = gets.chomp
                detm = Time.now

                cnxn.exec("UPDATE surveyeds deleted_at = #{detm} WHERE name = #{cndn} AND mother_sname = #{cnam} AND father_sname = #{cnap}")
            end

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
