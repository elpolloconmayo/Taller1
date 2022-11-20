require 'date'
require 'PG'


$cnxn = PG.connect(host: 'magallanes.inf.unap.cl', dbname: 'gpallero', user: 'gpallero',password: '4Fd3n2hSde')

def imprimirsql(textosql)
    textosql = textosql.values[0]
    textosql = textosql.to_s
    textosql = textosql.sub('[','')
    textosql = textosql.sub(']','')
    textosql = textosql.sub('"','')
    textosql = textosql.sub('"','')
    textosql = textosql.sub('\\\\','/')
    return textosql.split('/n')

end


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
            username = gets.chomp
            puts "Ingrese su contraseña: "
            contraseña = gets.chomp

            begin
                test = $cnxn.exec("SELECT * FROM professionals WHERE username = '#{username}' AND pass = '#{contraseña}'")
                test = test[0].length

                $q = $cnxn.exec("SELECT (id) FROM professionals WHERE username = '#{username}' AND pass = '#{contraseña}'")
                $q = $q.values[0]
                $q = $q[0].to_i

                self.MenuPuente()
            rescue IndexError
                puts "Usuario o contraseña incorrectos, favor de reintentar"
                self.main()
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
                MenuPuente()
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

    def MenuPuente()
        print "MENU \n1. Gestión de pacientes 1 \n2. Gestión de Encuestas 2 \n3. Salir 3 \nfavor ingresar opcion 1_2_3: ";
        opcion = (gets.chomp).to_i
        case opcion
        when 1
            puts "accedio al submenu Gestión de pacientes"
            MenuPaciente()
        when 2
            puts "accedio al submenu Gestión de Encuestas"
            MenuEncuesta()
        else
            print "\nerror de opcion de menu, reiniciando..."
            self.MenuPuente()
        end
    end

    def MenuPaciente()
        print "MENU \n1. Ingresar paciente 1 \n2. Modificar paciente 2 \n3. Realizar encuesta 3 \n4. Eliminar paciente 4 \n5. Salir 4 \nfavor ingresar opcion 1_2_3_4: ";
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

            $cnxn.exec("INSERT INTO surveyeds (run, dv, name, mother_sname, father_sname) textosql ( #{run} , '#{dv}' , '#{nombre_pat}' , '#{apellido_mp}' , '#{apellido_pp}')")

        when 2

            printf 'Dispone de la id del encuestado a modificar? Y/N'
            des = gets.chomp
            if des == 'Y' || des == 'y'

                puts 'Ingrese el id:'
                cnid = gets.chomp

            else    
                puts 'Nombre'
                cndn = gets.chomp
                puts 'Apellido materno'
                cnam = gets.chomp
                puts 'Apellido paterno'
                cnap = gets.chomp

                cond = $cnxn.exec("SELECT (id) FROM profetionals WHERE name = #{cndn} AND mother_sname = #{cnam} AND father_sname = #{cnap}")
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
                $cnxn.exec("UPDATE surveyeds SET run = #{nrut}, dv = #{nwdv} WHERE id = #{value};")
            end   

            puts 'Nombre:'
            nnam = gets.chomp

            if nnam != ''
                $cnxn.exec("UPDATE surveyeds SET name = #{nrut} WHERE id = #{value};")
            end   

            puts 'Apellido materno:'
            nmsn = gets.chomp

            if nmsn != ''
                $cnxn.exec("UPDATE surveyeds SET mother_sname = #{nrut} WHERE id = #{value};")
            end    

            puts 'Apellido paterno:'
            nfsn = gets.chomp

            if nfsn != ''
                $cnxn.exec("UPDATE surveyeds SET father_sname = #{nfsn} WHERE id = #{cnid};")
            end    
        
        when 3
            printf 'Dispone de la id del encuestado a realizar encuesta? Y/N'
            des = gets.chomp
            if des == 'Y' || des == 'y'
                printf 'Ingrese el id:'
                cnid = gets.chomp

            else
                printf 'Favor de ingresar el nombre: '
                cndn = gets.chomp
                printf 'Favor de ingresar el apellido paterno: '
                cnap = gets.chomp
                printf 'Favor de ingresar el apellido materno: '
                cnam = gets.chomp

                cond = $cnxn.exec("SELECT (id) FROM surveyeds WHERE name = #{cndn} AND mother_sname = #{cnam} AND father_sname = #{cnap}")
                key , value = cond.first
                value = value.to_i
                cnid = value
            end

            printf "dispone de la id de la encuesta a realizar? Y/N"
            des = gets.chomp
            if des == 'Y' || des == 'y'
                printf 'Ingrese el id:'
                cnide = gets.chomp
            else
                printf 'Favor de ingresar el nombre de la encuesta: '
                cndne = gets.chomp

                cond = $cnxn.exec("SELECT (id) FROM questions WHERE name = #{cndne}")
                key , value = cond.first
                value = value.to_i
                cnide = value
            end    

            cond = $cnxn.exec("SELECT (n_question) FROM questions WHERE id = #{cnide}")
            nqut = cond.values[0]
            nqut = nqut[0].to_i

            count = 0

            r = $cnxn.exec("SELECT (question) FROM questions Where id = 1")
            qsts = imprimirsql(r)
            ftex = ''

            while count != nqut

                puts qsts[count]
                puts 'ingrese su respuesta:'
                resp = gets.chomp

                ftex = ftex + '\n' + resp

                count = count + 1

            end

            ftex = ftex.sub('\n','')

        $cnxn.exec("INSERT INTO answers(answer, point, surveyeds_id, professionals_id, questions_id) VALUES('#{ftex}','100',#{cnid},#{$q},#{cnide})")

        when 4
            puts 'Conoce el id del encuestado a eliminar? Y/N'
            des = gets.chomp
            if des == 'Y' || des == 'y'
                puts 'Porfavor ingrese el id del encuestado:'
                deid = gets.chomp
                detm = Time.now

                $cnxn.exec("UPDATE surveyeds deleted_at = #{detm} WHERE id = #{deid}")

            else
                puts 'Si no recuerda el id ingrese los siguientes datos:'

                puts 'Nombre'
                cndn = gets.chomp
                puts 'Apellido materno'
                cnam = gets.chomp
                puts 'Apellido paterno'
                cnap = gets.chomp
                detm = Time.now

                $cnxn.exec("UPDATE surveyeds deleted_at = #{detm} WHERE name = #{cndn} AND mother_sname = #{cnam} AND father_sname = #{cnap}")
            end

        when 5
            print "Saliendo..."
        else
            print "\nerror de opcion de menu, reiniciando..."
            self.MenuPaciente(usuario, contraseña)
        end
    end

    def MenuEncuesta()
        print "MENU \n1. Ingresar encuesta 1 \n2. Modificar encuesta 2 \n3. Eliminar encuesta 3 \n4. Salir 4 \nfavor ingresar opcion 1_2_3_4: ";
        opcion = (gets.chomp).to_i
        case opcion
        when 1
            puts 'cuantas preguntas desea que tenga la encuesta?'
            nqus = gets.chomp.to_i
            puts 'Ingrese el nombre con el cual guardara la encuesta:'
            nsur = gets.chomp

            count = 0
            ftes = ''
            fpts = ''
            fqus = ''
            qstn = ''

            while count != nqus
                puts "Ingrese la pregunta numero #{count + 1}:"
                ques = gets.chomp
                puts 'Ingrese el puntaje maximo de esta pregunta:'
                fpts = gets.chomp


                ftes = ftes + '\n' + ques
                qstn = "Pregunta #{count + 1}:"
                fpts = qstn + fpts
                fqus = fqus + '\n' + fpts

                count = count + 1
            end

            ftes = ftes.sub('\n','')
            fqus = fqus.sub('\n','')
            
            $cnxn.exec("INSERT INTO questions(name_test, question, n_question, max_point) VALUES ( '#{nsur}', '#{ftes}', #{nqus}, '#{fqus}')")
                
        when 2
            #aqui va la funcion de modificar encuesta
        when 3
            #aqui va la funcion de eliminar encuesta
        when 4
            print "Saliendo..."
        else
            print "\nerror de opcion de menu, reiniciando..."
            self.MenuEncuesta()
        end
    end

end


obj = MenuSubmenuConsola.new
obj.main()
