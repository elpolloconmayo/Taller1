gem install dbi

#para instalar el driver

#$ tar zxf dbi-0.2.0.tar.gz

#$ ruby setup.rb config

#$ ruby setup.rb config --with = dbi,dbd_mysql

#$ ruby setup.rb setup
#$ ruby setup.rb install

#para instalar el driver

require "dbi"

begin
   # Comando para mysql
   dbh = DBI.connect("DBI:Mysql:nombre de la bbdd:localhost", "usuario", "contraseña")
   # para mostrar la version del servidor
   row = dbh.select_one("SELECT VERSION()")
   puts "Server version: " + row[0]
#excepciones   
rescue DBI::DatabaseError => e
   puts "An error occurred"
   puts "Error code:    #{e.err}"
   puts "Error message: #{e.errstr}"
ensure
   # para desconectarse de la bbdd
   dbh.disconnect if dbh
end

#para hacer consultas o modificar la bbdd con comandos sql
dbh.do("Consulta sql") 

sth = dbh.prepare( "INSERT INTO nombre de la tabla(att1, att2, att3, att4, att5)
      VALUES (?, ?, ?, ?, ?)" )
   sth.execute('John', 'Poul', 25, 'M', 2300) #por ejemplo en el caso de una persona
   sth.execute('Zara', 'Ali', 17, 'F', 1000) #se pueden seguir insertando mas tuplas

end

sth = dbh.prepare("comando select") 
   sth.execute(1000) # para las 1000 primeras lineas

   sth.fetch do |row|
   printf "att1: %s, att2: %s\n", row[0], row[1] # estas son las filas en las que se encuentran los atributos
   printf "att3: %d, att4 : %s\n", row[2], row[3]
   printf "att5 :%d \n\n", row[4]
end

sth = dbh.prepare("comando update + condicion")
   sth.execute('valor a reemplazar')
   sth.finish
   dbh.commit
end
sth = dbh.prepare("comando delete + condicion")
   sth.execute('valor de la condicion')
   sth.finish
   dbh.commit
end

dbh.rollback #el comando salvador de rollback xd

#Uso general de las excepciones
rescue DBI::DatabaseError => e
    puts "An error occurred"
    puts "Error code:    #{e.err}"
    puts "Error message: #{e.errstr}"
    dbh.rollback
 ensure
    # para desconectar
    dbh.disconnect if dbh
end

#comandos para cifrado de contraseñas
puts OpenSSL::Cipher.ciphers

cipher = OpenSSL::Cipher.new('<name>-<key length>-<mode>')

cipher = OpenSSL::Cipher::AES.new(128, :CBC)
cipher = OpenSSL::Cipher::AES.new(128, 'CBC') #diferentes formas de escribirlo pero estos 3 son lo mismo
cipher = OpenSSL::Cipher::AES.new('128-CBC')

cipher = OpenSSL::Cipher::AES128.new(:CBC)
cipher = OpenSSL::Cipher::AES192.new(:CBC) #otras clases para diferentes tamaños de la llave
cipher = OpenSSL::Cipher::AES256.new(:CBC)

cipher.encrypt
cipher.decrypt #comandos para encriptar y desencriptar

#ejemplo

cipher = OpenSSL::AES256.new(:CFB)
cipher.encrypt
key = cipher.random_key # este comando pone la llave generada automaticamnte

#uso

data = "la contraseña"

cipher = OpenSSL::Cipher::AES.new(128, :CBC)
cipher.encrypt
key = cipher.random_key
iv = cipher.random_iv

encrypted = cipher.update(data) + cipher.final
...
decipher = OpenSSL::Cipher::AES.new(128, :CBC)
decipher.decrypt
decipher.key = key
decipher.iv = iv

plain = decipher.update(encrypted) + decipher.final

puts data == plain #=> true

