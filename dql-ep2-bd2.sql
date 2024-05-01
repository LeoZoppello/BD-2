-- a)
SELECT m.Crm AS IdMedico, c.IdPac AS IdPaciente, c.IdEsp AS IdEspecial, c.DataCon, c.HoraInicCon
FROM CONSULTA c
JOIN MEDICO m ON c.Crm = m.Crm
JOIN PACIENTE p ON c.IdPac = p.IdPac
WHERE p.Nome_P = 'Diego Pituca' AND m.NomeM = 'Dr. House';

-- b)
SELECT m.Crm, m.NomeM
FROM MEDICO m
LEFT JOIN EXERC_ESP e ON m.Crm = e.Crm
LEFT JOIN ESPECIALIDADE esp ON e.IdEsp = esp.IdEsp
WHERE esp.NomeE = 'Dermatologia'
GROUP BY m.Crm, m.NomeM
HAVING COUNT(*) = 1;

-- c)

SELECT m.Crm, m.NomeM
FROM MEDICO m
LEFT JOIN EXERC_ESP e ON m.Crm = e.Crm
GROUP BY m.Crm, m.NomeM
HAVING COUNT(*) = (SELECT COUNT(*) FROM ESPECIALIDADE);


-- d)

SELECT p.CPF, p.Nome_P
FROM CONSULTA c
JOIN MEDICO m ON c.Crm = m.Crm
JOIN PACIENTE p ON c.IdPac = p.IdPac
JOIN ESPECIALIDADE esp ON c.IdEsp = esp.IdEsp
WHERE m.NomeM = 'Dr. House' AND esp.NomeE = 'Cardiologia';


-- e)
SELECT m.NomeM
FROM MEDICO m
LEFT JOIN AGENDA a ON m.Crm = a.Crm
GROUP BY m.NomeM
HAVING COUNT(*) = (SELECT COUNT(DISTINCT DiaSemana) FROM AGENDA);


-- f)
SELECT m.Crm AS IdMedico, c.IdPac AS IdPaciente, c.IdEsp AS IdEspecial, c.DataCon, c.HoraInicCon
FROM CONSULTA c
JOIN MEDICO m ON c.Crm = m.Crm
WHERE EXTRACT(MONTH FROM c.DataCon) = 1 AND EXTRACT(YEAR FROM c.DataCon) = 2024;

-- g)
SELECT m.NomeM, esp.NomeE, COUNT(*) AS TotalConsultas
FROM CONSULTA c
JOIN MEDICO m ON c.Crm = m.Crm
JOIN ESPECIALIDADE esp ON c.IdEsp = esp.IdEsp
WHERE m.NomeM = 'Dr. House'
GROUP BY m.NomeM, esp.NomeE;

-- h)
SELECT m.Crm, m.NomeM, COUNT(c.IdCon) AS NumConsultas
FROM MEDICO m
LEFT JOIN CONSULTA c ON m.Crm = c.Crm
GROUP BY m.Crm, m.NomeM
HAVING COUNT(c.IdCon) = (SELECT MIN(ConsultasCount) FROM (
    SELECT COUNT(IdCon) AS ConsultasCount
    FROM CONSULTA
    GROUP BY Crm
) AS CountSubquery);

-- i)
DELETE FROM CONSULTA
WHERE Pagou = false;


-- j)

UPDATE CONSULTA
SET Crm = (SELECT Crm FROM MEDICO WHERE NomeM = 'Dr. Kildare'),
    DataCon = '2024-05-24',
    HoraInicCon = '10:00:00'
WHERE IdPac = (SELECT IdPac FROM PACIENTE WHERE Nome_P = 'Diego Pituca')
  AND DataCon = '2024-05-10'
  AND HoraInicCon = '10:00:00';
