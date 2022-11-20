require 'date'
require 'PG'
require 'encrypted_strings'
begin
    require_relative "ekey"
    puts 'Usted ah accedido al sistema con permisos de administrador, bienvenido!'
rescue Exception
    puts 'Usted ah ingresado al sistema con permisos publicos, bienvenido!'   
end

$cnxn = PG.connect(host: 'magallanes.inf.unap.cl', dbname: 'gpallero', user: 'gpallero',password: '4Fd3n2hSde')

def imprimirsql(textosql)
    textosql = textosql.values[0]
    textosql = textosql.to_s
    textosql = textosql.sub('[','')
    textosql = textosql.sub(']','')
    textosql = textosql.gsub('"','')
    textosql = textosql.gsub('\\\\','/')
    return textosql.split('/n')

end

class MenuSubmenuConsola

    #posible aplicacion a futuro
    #Characters usuario
    #Characters contraseña

    def main()

        print "MENU \n1. Ingresar \n2. Registrarse \n3. Olvido su usuario o contraseña? \n4. Salir: ";
        opcion = (gets.chomp).to_i
        case opcion
        when 1
            print "\naccedio al submenu Ingresar "
            puts "\nIngrese su nombre de usuario: "
            username = gets.chomp
            puts "Ingrese su contraseña: "
            contraseña = gets.chomp
            pss = contraseña

            ipss = $cnxn.exec("SELECT (pass) FROM professionals WHERE username = '#{username}'")
            ipss = ipss.values[0]
            ipss = ipss[0]

            if defined?($ek) != nil

                begin

                    gpss = pss.encrypt(:symmetric, :algorithm => 'des-ecb', :password => $ek)

                    if ipss == gpss
                        begin
                            test = $cnxn.exec("SELECT * FROM professionals WHERE username = '#{username}' AND pass = '#{gpss}'")
            
                            $q = $cnxn.exec("SELECT (id) FROM professionals WHERE username = '#{username}' AND pass = '#{gpss}'")
                            $q = $q.values[0]
                            $q = $q[0].to_i

                            puts 'Bienvenido administrador: ' + "#{username}"
            
                            self.MenuPuente()
                        rescue Exception
                            puts "Usuario o contraseña incorrectos, favor de reintentar"
                            self.main()
                        end
                    end

                rescue Exception
                    puts 'Este usuario esta registrado con permisos de administrador, favor de reingresar con privilegios de administrador o ingresar con un usuario publico.'
                    self.main()
                end

            else
                
                begin
                    gpss = pss.encrypt(:symmetric, :algorithm => 'des-ecb', :password => 'public-key')

                    if gpss == ipss

                        begin
                            test = $cnxn.exec("SELECT * FROM professionals WHERE username = '#{username}' AND pass = '#{gpss}'")
            
                            $q = $cnxn.exec("SELECT (id) FROM professionals WHERE username = '#{username}' AND pass = '#{gpss}'")
                            $q = $q.values[0]
                            $q = $q[0].to_i

                            puts 'Bienvenido usuario publico: ' + "#{username}"
            
                            self.MenuPuente()
                        rescue IndexError
                            puts "Usuario o contraseña incorrectos, favor de reintentar"
                            self.main()
                        end
                    end    
                rescue Exception
                    puts 'Este usuario esta registrado como administrador, favor de ingresar con privilegios de administrador.'
                    self.main()    
                end
            end

            begin
                test = $cnxn.exec("SELECT * FROM professionals WHERE username = '#{username}' AND pass = '#{gpss}'")

                $q = $cnxn.exec("SELECT (id) FROM professionals WHERE username = '#{username}' AND pass = '#{gpss}'")
                $q = $q.values[0]
                $q = $q[0].to_i

                self.MenuPuente()
            rescue IndexError
                puts "Usuario o contraseña incorrectos, favor de reintentar"
                self.main()
            end
            
        when 2
            
            print "\naccedio al submenu Registrarse\n"

            if defined?($ek) == nil

                puts 'Este usuario sera creado con el sistema publico, esto significa que la llave de cifrado de contraseña es publica esta seguro de continuar? Y/N '
                dci = gets.chomp
                
                if dci == 'Y' || dci == 'y'
                    puts 'Registrando en modo publico...'
                else
                    puts 'Entendido volviendo al menu anterior...'
                    self.main()
                end 
            end       

            puts 'rut con digito verificador (de no tener rut dejar en blanco):'
            run = gets.chomp
            if run == ''
                run = nil
                dv = nil
            else    
                dv = run[8]
                run = run[0,8].to_i
            end
            puts'ingrese un nombre de usuario'
            nombre_usu = gets.chomp
            puts "\nIngrese su nombre"
            name = gets.chomp
            puts "Ingrese su apellido paterno"
            apellido_p = gets.chomp
            puts "Ingrese su apellido materno"
            apellido_m = gets.chomp
            puts "Ingrese su genero (M/F/N)"
            genero = gets.chomp
            puts "Ingrese su correo"
            email = gets.chomp
            puts "Ingrese su contraseña"
            contraseña = gets.chomp
            puts "Ingrese su fecha de nacimiento (YYYY-MM-DD)"
            fecha_nac = gets.chomp
            puts "Ingrese su numero de telefono"
            telefono = gets.chomp

            pass = contraseña

            if defined?($ek) != nil
                ekey = $ek
            else
                ekey = 'public-key'
            end

            epss = pass.encrypt(:symmetric, :algorithm => 'des-ecb', :password => ekey)

            if run != nil
                begin
                    $cnxn.exec("INSERT INTO PROFESSIONALS (run, dv, name_, username, pass, email, mother_name, father_name, gender, birthday, cellphone) VALUES (#{run} , '#{dv}', '#{name}', '#{nombre_usu}', '#{epss}', '#{email}', '#{apellido_m}', '#{apellido_p}', '#{genero}', '#{fecha_nac}', '#{telefono}')")
                    puts 'Usuario registrado con exito!'
                    self.main()
                rescue Exception
                    puts "Error en ingreso de datos, favor de intentar de nuevo"
                    self.main()
                end    
            else
                begin
                    $cnxn.exec("INSERT INTO PROFESSIONALS (name_, username, pass, email, mother_name, father_name, gender, birthday, cellphone) VALUES ('#{name}', '#{nombre_usu}', '#{epss}', '#{email}', '#{apellido_m}', '#{apellido_p}', '#{genero}', '#{fecha_nac}', '#{telefono}')")
                    puts 'Usuario registrado con exito!'
                    self.main()
                rescue Exception
                    puts "Error en ingreso de datos, favor de intentar de nuevo"
                    self.main()
                end    
            end
        when 3

            if $ek != '' || $ek != nil

                print "Para recuperar su contraseña ingrese su numero de telefono: "
                cell = gets.chomp

                recp = $cnxn.exec(" SELECT (pass) FROM professionals WHERE cellphone = '#{cell}' ")

                recp = recp.values[0].to_s.decrypt(:symmetric, :algorithm => 'des-ecb', :password => $ek) 

                puts 'Usted es un usuario con la llave de encriptacion, su contraseña es: ' + recp
            else
                puts 'Usted no tiene permisos para recuperar contraseña, favor de ingresar como administrador.' 
                self.main()
            end
             
        when 4
            puts 'Saliendo del sistema'
            exit 
        else
            print "\nerror de opcion de menu, reiniciando..."
            self.main()
        end
    end

    def MenuPuente()
        print "MENU \n1. Gestión de pacientes 1 \n2. Gestión de Encuestas 2 \n3. Salir 3 \nfavor ingresar opcion 1_2_3: ";
        opcion = (gets.chomp).to_i
        case opcion
        when 1
            puts "accedio al submenu Gestión de pacientes"
            self.MenuPaciente()
        when 2
            puts "accedio al submenu Gestión de Encuestas"
            self.MenuEncuesta()
        else
            print "\nerror de opcion de menu, reiniciando..."
            self.MenuPuente()
        end
    end

    def MenuPaciente()
        print "MENU \n1. Ingresar paciente 1 \n2. Modificar paciente 2 \n3. Realizar encuesta 3 \n4. Eliminar paciente 4 \n5. volver al menu anterior 4 \nfavor ingresar opcion 1_2_3_4: ";
        opcion = (gets.chomp).to_i
        case opcion
        when 1

            printf 'Ingrese los siguientes datos del encuestado:'
            pputs 'rut con digito verificador (de no tener rut dejar en blanco):'
            run = gets.chomp
            if run == ''
                run = nil
                dv = nil
            else    
                dv = run[8]
                run = run[0,8].to_i
            end
            puts "\nIngrese su nombre"
            name = gets.chomp
            puts "Ingrese su apellido paterno"
            apellido_p = gets.chomp
            puts "Ingrese su apellido materno"
            apellido_m = gets.chomp
            puts "Ingrese su genero (M/F/N)"
            genero = gets.chomp
            puts "Ingrese su correo"
            email = gets.chomp
            puts "Ingrese su fecha de nacimiento (YYYY-MM-DD)"
            fecha_nac = gets.chomp

            begin
                $cnxn.exec("INSERT INTO surveyeds (run, dv, name_, father_name, mother_name, gender, birthday, mail) values ( #{run} , '#{dv}', '#{name}', '#{apellido_p}', '#{apellido_m}', '#{genero}', '#{email}', '#{fecha_nac}')")
            rescue
                puts "Error en ingreso de datos, favor de intentar de nuevo"
                self.MenuPaciente()
            end

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
                $cnxn.exec("UPDATE surveyeds SET run = #{nrut}, dv = '#{nwdv}' WHERE id = #{cnid};")
            end   

            puts 'Nombre:'
            nnam = gets.chomp

            if nnam != ''
                $cnxn.exec("UPDATE surveyeds SET name_ = '#{nnam}' WHERE id = #{cnid};")
            end   

            puts 'Apellido materno:'
            nmsn = gets.chomp

            if nmsn != ''
                $cnxn.exec("UPDATE surveyeds SET mother_sname = '#{nmsn}' WHERE id = #{cnid};")
            end    

            puts 'Apellido paterno:'
            nfsn = gets.chomp

            if nfsn != ''
                $cnxn.exec("UPDATE surveyeds SET father_sname = '#{nfsn}' WHERE id = #{cnid};")
            end
            
            puts 'email:'
            neml = gets.chomp

            if neml != ''
                $cnxn.exec(" UPDATE surveyeds SET mail = '#{neml}' WHERE id = #{cnid}")
            end

            puts 'Genero:'
            ngdr = gets.chomp

            if ngdr != ''
                $cnxn.exec(" UPDATE surveyeds SET gender = '#{ngdr}' WHERE id = #{cnid} ")
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

            r = $cnxn.exec("SELECT (question) FROM questions Where id = #{cnide}")

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
                detm = Time.now.to_s

                $cnxn.exec("UPDATE surveyeds SET deleted_at = '#{detm}' WHERE id = #{deid}")

            else
                puts 'Si no recuerda el id ingrese los siguientes datos:'

                puts 'Nombre'
                cndn = gets.chomp
                puts 'Apellido materno'
                cnam = gets.chomp
                puts 'Apellido paterno'
                cnap = gets.chomp
                detm = Time.now.to_s

                $cnxn.exec("UPDATE surveyeds deleted_at = '#{detm}' WHERE name = #{cndn} AND mother_sname = #{cnam} AND father_sname = #{cnap}")
            end

        when 5
            print "volviendo al menu anterior..."
            self.MenuPuente()
        else
            print "\nerror de opcion de menu, reiniciando..."
            self.MenuPaciente(usuario, contraseña)
        end
    end

    def MenuEncuesta()
        print "MENU \n1. Ingresar encuesta 1 \n2. Modificar encuesta 2 \n3. Eliminar encuesta 3 \n4. Volver al menu anterior 4 \nfavor ingresar opcion 1_2_3_4: ";
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

            puts 'Dispone de la id de encuesta?'
            des = gets.chomp

            if des == 'Y' || des == 'y'
                puts 'Ingrese la id de la encuesta a modificar:'
                cnem = gets.chomp
            else
                puts 'Ingrese el nombre de la encuesta:'
                #recordar hacer esto xd
            end

            puts 'Que informacion desea modificar?'
            puts '1.-Preguntas 2.-Nombre de la encuesta 3.-Observacion 4.-Ninguna'

            ds = gets.chomp.to_i

            case ds
            when 1

                cond = $cnxn.exec("SELECT (n_question) FROM questions WHERE id = #{cnem}")
                nqut = cond.values[0]
                nqut = nqut[0].to_i

                count = 0

                r = $cnxn.exec("SELECT (question) FROM questions Where id = #{cnem}")

                qsts = imprimirsql(r)
            
                fnqs = ''

                while count != nqut
                    puts "Pregunta actual: #{qsts[count]} "
                    puts 'Nueva pregunta (de no querer modificar dejar en blanco):'
                    nqst = gets.chomp

                    if nqst == ''
                        fnqs = fnqs + '\n' + qsts[count]
                    else

                        fnqs = fnqs + '\n' + nqst
                    end

                    count = count + 1
                end

                
                fnqs = fnqs.sub('\n','')
                

                qsvf = fnqs.gsub('\n','')


                if qsvf != ''
                    $cnxn.exec("UPDATE questions SET question = '#{fnqs}' WHERE id = #{cnem}")
                end    

            when 2
                
                actn = $cnxn.exec("SELECT (name_test) FROM questions WHERE id = #{cnem}")
                actn = actn.values[0]

                puts 'Nombre actual: ' + actn.first
                puts 'Nuevo nombre(de no querer modificar dejar en blanco): '
                nsvn = gets.chomp

                if nsvn != ''
                    $cnxn.exec("UPDATE questions SET name_test = '#{nsvn}' WHERE id = #{cnem}")
                end
            
            when 3

                acto = $cnxn.exec("SELECT (description) FROM questions WHERE id = #{cnem}")
                acto = acto.values[0]

                puts 'Descripcion actual: ' + acto.first.to_s
                puts 'Nueva descripcion (de no querer modificar dejar en blanco): '

                ndsc = gets.chomp

                if ndsc != ''
                    $cnxn.exec("UPDATE questions SET description = '#{ndsc}' WHERE id = #{cnem}")
                end    

            when 4
                self.MenuPuente()
            end

        when 3
            puts 'Dispone de la id de encuesta?'
            des = gets.chomp

            if des == 'Y' || des == 'y'
                puts 'Ingrese la id de la encuesta a eliminar:'
                cnds = gets.chomp
            else
                puts 'Ingrese el nombre de la encuesta:'
                #recordar hacer esto xd
            end

            dels = Time.now.to_s
            $cnxn.exec("UPDATE questions SET deleted_at = '#{dels}' WHERE id = #{cnds}")

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
