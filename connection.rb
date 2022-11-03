gem install dbi
gem install dbd-odbc
gem install ruby-odbc

#Se conecta al DSN
require 'DBI'
cnxn = DBI.connect('DBI:ODBC:CData MySQL Source','','')
 
#Aqui se ejecutan los comandos de ruby
resultSet = cnxn.execute("SELECT ShipName, Freight FROM Orders")
 
#Se muestran los datos solicitados
resultSet.column_names.each do |name|
print name, "\t"
end
puts
 
#Se imprime
while row = resultSet.fetch do
(0..resultSet.column_names.size - 1).each do |n|
print row[n], "\t"
end
puts
end
resultSet.finish
 
#Comando para cerrar conexion
cnxn.disconnect if cnxn