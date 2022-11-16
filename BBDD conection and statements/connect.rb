require 'PG'

cnxn = PG.connect(host: 'magallanes.inf.unap.cl', dbname: 'gpallero', user: 'gpallero',password: '4Fd3n2hSde')

q = cnxn.exec("DROP TABLE IF EXISTS answers")

puts q.first