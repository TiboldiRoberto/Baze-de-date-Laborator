describe facultate;
select * from facultate;

describe materie;
select * from materie;

describe nota;
select * from nota;

describe persoana;
select * from persoana;

describe specializare;
select * from specializare;

describe student;
select * from student;

UPDATE student SET semestru='2',bursa='1' WHERE nr_matricol=7;
UPDATE facultate SET decan='Antoniu', an_fondare='2002' WHERE id=4;

INSERT INTO facultate (id,denumire,adresa,decan) VALUES (5,"UniTBv","Eroilor","Stan");

INSERT INTO nota (id_nota,id_student,id_curs,nota) VALUES (20,1,2,10);

UPDATE nota SET data_examen=DATE('2021/09/03') WHERE id_nota=1;
UPDATE nota SET data_examen=DATE('2020/02/12') WHERE id_nota=2;
UPDATE nota SET data_examen=DATE('2018/11/23') WHERE id_nota=3;
UPDATE nota SET data_examen=DATE('2019/12/13') WHERE id_nota=4;
UPDATE nota SET data_examen=DATE('2020/05/13') WHERE id_nota=5;
UPDATE nota SET data_examen=DATE('2020/07/23') WHERE id_nota=6;
UPDATE nota SET data_examen=DATE('2012/11/11') WHERE id_nota=7;
UPDATE nota SET data_examen=DATE('2015/03/03') WHERE id_nota=8;
UPDATE nota SET data_examen=DATE('2018/01/16') WHERE id_nota=9;
UPDATE nota SET data_examen=DATE('2020/09/18') WHERE id_nota=10;


ALTER table nota
modify column id_nota int auto_increment;