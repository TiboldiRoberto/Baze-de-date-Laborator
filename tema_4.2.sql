-- 1. Afișează media notelor tuturor studentilor
SELECT 
    AVG(nota) AS media_notelor
FROM
    nota;

-- 2. Afișați pentru fiecare notă din tabelul nota timpul trecut de la acordarea notei până în prezent.
SELECT 
    data_examen,
    CURRENT_DATE(),
    DATEDIFF(CURRENT_DATE(), data_examen) AS vechime
FROM
    nota
LIMIT 10;

-- 3. Afișați din tabelul persoană numele complet al studentului într-o singură coloană, și seria cu numărul de buletin în altă coloană.
SELECT 
    CONCAT(serie, ' ', nr) AS serie_buletin,
    CONCAT(prenume, ' ', nume) AS nume_complet
FROM
    persoana;
    
-- 4. Afișați din tabelul student numărul de studenți înmatriculați și numărul total de persoane înmatriculate. Acest exercițiu reflectă posibilitatea unei persoane de a fi student la mai multe facultăți simultan.
SELECT 
    COUNT(nr_matricol) AS nr_studenti_inmatriculati,
    COUNT(DISTINCT cnp) AS nr_total_persoane
FROM
    student;

-- 5. Afișează numele decanilor de facultate cu caractere mari : Ex: POPESCU.      
select upper(decan) as decan_upper from facultate;

-- 6. Afișează CNP-ul, numele persoanei, luna nașterii (numeric, ex: 08), luna nașterii( text, ex: August) pentru toate persoanele. (Extrage luna nasterii din CNP.
select cnp,nume, substr(cnp,4,2) as luna_numeric,
monthname(concat(
'1970',
'-',
substr(cnp,4,2),
'-',
substr(cnp,6,2)
))
as luna_text from persoana;

-- 7. Afișează în format ASCII numele profesorilor care au in componenta numelui litera ‘a’. (opțional)
select decan,length(decan) as lungime_nume,
CONCAT_WS(
'-',
ASCII(SUBSTRING(decan, 1, 1)),
ASCII(SUBSTRING(decan, 2, 1)),
ASCII(SUBSTRING(decan, 3, 1)),
ASCII(SUBSTRING(decan, 4, 1))
)
AS nume_ascii
from facultate Where decan LIKE '%a%' AND length(decan)<5;

-- 8. Adaugă litera ‘x’ în fața numelui decanilor care conduc facultăți ce au denumirea formată din mai puțin de 5 caractere.
select denumire,concat('x',decan) as decan_with_x from facultate Where length(denumire)<5;

