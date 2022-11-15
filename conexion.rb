require "dbi"

#acá sólo se realizará la conexión a la base de datos, para las  funciones vinculadas consultar "FuncionesBDD.rb"

begin
   # Comando para conectar a posgres
   dbh = DBI.connect("DBI:ODBC:magallanes.inf.unap.cl:gpallero", "gpallero", "4Fdn2hSde")
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
