require 'PG'

cnxn = PG.connect(host: 'magallanes.inf.unap.cl', dbname: 'gpallero', user: 'gpallero',password: '4Fd3n2hSde')

def funcion(run, dv, name, mother_sname, father_sname, cnxn)
    texto = "INSERT INTO profetionals (run, dv, name, mother_sname, father_sname) VALUES ( #{run} , '#{dv}' , '#{name}' , '#{mother_sname}' , '#{father_sname}' )"
    q = cnxn.prepare('qr1', texto)
    cnxn.exec_prepared('qr1')
end

#funcion('10456788', '9', 'David', 'Rojas', 'Morello', cnxn)