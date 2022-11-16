require 'PG'

cnxn = PG.connect(host: 'magallanes.inf.unap.cl', dbname: 'gpallero', user: 'gpallero',password: '4Fd3n2hSde')

q = cnxn.prepare('qr1', "INSERT INTO profetionals (run, dv, name, username, pass, email, mother_sname, father_sname) VALUES ( ? , ? , ? , ? , ? , ? , ? , ? )")

q.execute('qr1', [10456788, '9', 'David', 'DavidR12', 'david 1 2 3 4', 'davidr@gmail.com','Rojas','Morello'])
