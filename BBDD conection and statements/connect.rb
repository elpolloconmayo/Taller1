require 'PG'

cnxn = PG.connect(host: 'hostname', dbname: 'nombre bbdd', user: 'usuario',password: 'contraseña')

q = cnxn.exec("SELECT * FROM tabla")

puts q.first