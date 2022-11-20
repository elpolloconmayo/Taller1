DROP TABLE IF EXISTS professionals;

CREATE TABLE professionals (
  id serial NOT NULL,
  run int DEFAULT NULL,
  dv char(1) DEFAULT NULL,
  name_ varchar(100) NOT NULL,
  username varchar(100) NOT NULL,
  pass varchar(100) NOT NULL,
  email varchar(100) NOT NULL,
  mother_name varchar(100) NOT NULL,
  father_name varchar(100) NOT NULL,
  gender varchar(1) NOT NULL,
  birthday date NOT NULL,
  cellphone varchar(12) NOT NULL,
  deleted_at timestamp with time zone DEFAULT NULL,
  PRIMARY KEY (id)
  UNIQUE (id)
);
