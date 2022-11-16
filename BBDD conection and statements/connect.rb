require 'PG'

cnxn = PG.connect(host: 'magallanes.inf.unap.cl', dbname: 'gpallero', user: 'gpallero',password: '4Fd3n2hSde')

q = cnxn.exec("SELECT * FROM profetionals")

puts q.first