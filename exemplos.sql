-- Médicos
INSERT INTO Medico (CRM, NomeM, TelefoneM, Percentual) 
VALUES  (1, 'Dr. House', '123456789', 70.00),
        (2, 'Dr. Kildare', '987654321', 80.00),
	(3, 'Dr. Rafinha', '987654777', 80.00);

-- Especialidades
INSERT INTO Especialidade (NomeE, Indice) 
VALUES  ('Dermatologia', 1), 
        ('Cardiologia', 2), 
        ('Pediatria', 3);

-- Pacientes
INSERT INTO Paciente (CPF, NomeP, TelefonePac, Endereco, Idade, Sexo) 
VALUES  ('12345678901', 'Diego Pituca', '987654321', 'Rua X, 123', 30, 'M'),
        ('98765432109', 'Maria Silva', '999888777', 'Rua Y, 456', 25, 'F');

-- Consultas
INSERT INTO Consulta (CRM, IdEsp, IdPac, Data, HoraInicCon, HoraFimCon, Pagou, ValorPago, FormaPagamento)
VALUES  (1, 1, 1, '2024-05-10', '10:00:00', '11:00:00', TRUE, 100.00, 'Cartão'),
        (1, 2, 2, '2024-01-15', '08:30:00', '09:30:00', TRUE, 80.00, 'Dinheiro'),
        (1, 3, 1, '2024-01-15', '09:00:00', '09:30:00', true, 150.0, 'Cartão'),
        (1, 2, 1, '2024-05-10', '10:00:00', '10:30:00', false, 0.0, 'Não Pago'),
        (2, 3, 2, '2024-02-20', '11:00:00', '11:30:00', true, 120.0, 'Dinheiro'),
	(3, 3, 2, '2024-05-10', '10:00:00', '10:30:00', false, 0.0, 'Não Pago');

-- Agenda
INSERT INTO Agenda (DiaSemana, HoraInicio, HoraFim, CRM)
VALUES  ('Segunda', '08:00:00', '18:00:00', 1),
	('Terça', '09:00:00', '17:00:00', 2),
        ('Segunda', '09:30:00', '17:30:00', 3),
	('Terça', '09:30:00', '17:30:00', 3),
	('Quarta', '09:30:00', '17:30:00', 3),
	('Quinta', '09:30:00', '17:30:00', 3),
	('Sexta', '09:30:00', '17:30:00', 3);

-- ExerceEsp
INSERT INTO ExerceEsp (CRM, IdEsp) 
VALUES  (1, 1),
        (1, 2),
	(1, 3),
        (2, 1),
	(3, 3);

-- Doenças
INSERT INTO Doenca (NomeD) 
VALUES  ('Dermatite'), 
        ('Arritmia'), 
        ('Hipertensão'), 
        ('Diabetes'), 
        ('Asma'), 
        ('Gripe');

-- Diagnósticos
INSERT INTO Diagnostico (TratamentoRecomendado, RemediosReceitados, Observacoes, IdCon) 
VALUES  ('Hidratação', 'Loção', 'Evitar exposição ao sol', 1),
        ('Repouso', 'Betabloqueadores', 'Evitar estresse', 2),
        ('Repouso', 'Paracetamol', 'Sem maiores observações.', 3),
        ('Creme hidratante', 'Antibiótico', 'Acompanhar evolução.', 4);

-- Inserção de dados na tabela DIAGNOSTICA
INSERT INTO Diagnostica (IdDiagnostico, IdDoenca) 
VALUES  (1, 1),
        (2, 2),
	(3, 6);
