alter table facultate add primary key (id);

alter table universitate.specializare add foreign key (id_facultate) references universitate.facultate(id);

alter table materie add foreign key (id_specializare) references specializare(id_specializare);

alter table student add foreign key (id_specializare) references specializare(id_specializare);

alter table student add foreign key (cnp) references persoana(cnp);

alter table nota add foreign key (id_student) references student(nr_matricol);

alter table nota add foreign key (id_curs) references materie(id_materie);

