-- a) Listar as consultas (IdMedico, IdPaciente, IdEspecial, Data, HoraInicCon) marcadas pelo paciente “Diego Pituca” com o “Dr. House”.
SELECT C.CRM AS IdMedico, C.IdPac, C.IdEsp, C.Data, C.HoraInicCon
FROM Consulta C
JOIN Paciente P ON C.IdPac = P.IdPac
JOIN Medico M ON C.CRM = M.CRM
WHERE P.NomeP = 'Diego Pituca' AND M.NomeM = 'Dr. House';

-- b) Listar os médicos (CRM, NomeM) que atendem somente na especialidade “Dermatologia”.
SELECT M.CRM, M.NomeM
FROM Medico M
JOIN ExerceEsp EE ON M.CRM = EE.CRM
JOIN Especialidade E ON EE.IdEsp = E.IdEsp
WHERE E.NomeE = 'Dermatologia'
GROUP BY M.CRM, M.NomeM
HAVING COUNT(*) = 1;

-- c) Listar os médicos (CRM, NomeM) que atendem todas as especialidades.
SELECT M.CRM, M.NomeM
FROM Medico M
JOIN ExerceEsp EE ON M.CRM = EE.CRM
JOIN Especialidade E ON EE.IdEsp = E.IdEsp
GROUP BY M.CRM, M.NomeM
HAVING COUNT(DISTINCT E.IdEsp) = (SELECT COUNT(*) FROM Especialidade);

-- d) Listar os pacientes (CPF, NomeP) consultados pelo “Dr. House” como “Cardiologista”.
SELECT P.CPF, P.NomeP
FROM Consulta C
JOIN Paciente P ON C.IdPac = P.IdPac
JOIN Medico M ON C.CRM = M.CRM
JOIN Especialidade E ON C.IdEsp = E.IdEsp
WHERE M.NomeM = 'Dr. House' AND E.NomeE = 'Cardiologia';

-- e) Listar o nome dos médicos que atendem consultas todos os dias da semana.
SELECT M.CRM, M.NomeM
FROM Medico M
JOIN Agenda A ON M.CRM = A.CRM
GROUP BY M.CRM, M.NomeM
HAVING COUNT(DISTINCT A.DiaSemana) = (SELECT COUNT(DISTINCT DiaSemana) FROM Agenda);

-- f) Listar as consultas (IdMedico, IdPaciente, IdEspecial, Data, HoraInicCon) feitas no mês de janeiro de 2024.
SELECT C.CRM AS IdMedico, C.IdPac, C.IdEsp, C.Data, C.HoraInicCon
FROM Consulta C
WHERE EXTRACT(MONTH FROM C.Data) = 1 AND EXTRACT(YEAR FROM C.Data) = 2024;

-- g) Qual é a quantidade total de consultas feitas pelo “Dr. House” por especialidade?
SELECT E.NomeE, COUNT(*) AS TotalConsultas
FROM Consulta C
JOIN Medico M ON C.CRM = M.CRM
JOIN Especialidade E ON C.IdEsp = E.IdEsp
WHERE M.NomeM = 'Dr. House'
GROUP BY E.NomeE;

-- h) Quais são os médicos (CRM, NomeM) com o menor número de consultas atendidas?
SELECT M.CRM, M.NomeM
FROM Medico M
JOIN Consulta C ON M.CRM = C.CRM
GROUP BY M.CRM, M.NomeM
HAVING COUNT(*) = (
    SELECT COUNT(*)
    FROM Consulta
    GROUP BY CRM
    ORDER BY COUNT(*) ASC
    LIMIT 1
);

-- i) Remover todos as consultas não pagas.
DELETE FROM Consulta WHERE Pagou = FALSE;

-- j) Transferir a consulta do paciente “Diego Pituca” no dia “10/05/2024” às 10 a:m,na Especialidade “dermatologia”, com o “Dr. House”, para o dia “24/05/2024”, na mesma hora, como o “Dr. Kildare”, na mesma especialidade.
UPDATE Consulta
SET CRM = (SELECT CRM FROM Medico WHERE NomeM = 'Dr. Kildare'),
    Data = '2024-05-24'
WHERE IdPac = (SELECT IdPac FROM Paciente WHERE NomeP = 'Diego Pituca')
AND Data = '2024-05-10'
AND HoraInicCon = '10:00:00'
AND IdEsp = (SELECT IdEsp FROM Especialidade WHERE NomeE = 'Dermatologia');
