-- Inserção de dados na tabela DOENCA
INSERT INTO DOENCA (NomeD) VALUES ('Hipertensão');
INSERT INTO DOENCA (NomeD) VALUES ('Diabetes');
INSERT INTO DOENCA (NomeD) VALUES ('Asma');
INSERT INTO DOENCA (NomeD) VALUES ('Gripe');

-- Inserção de dados na tabela MEDICO
INSERT INTO MEDICO (NomeM, TelefoneM, Percentual) VALUES ('Dr. House', '123-456-7890', 70.5);
INSERT INTO MEDICO (NomeM, TelefoneM, Percentual) VALUES ('Dr. Kildare', '987-654-3210', 65.0);

-- Inserção de dados na tabela ESPECIALIDADE
INSERT INTO ESPECIALIDADE (NomeE, Indice) VALUES ('Cardiologia', 1);
INSERT INTO ESPECIALIDADE (NomeE, Indice) VALUES ('Dermatologia', 2);
INSERT INTO ESPECIALIDADE (NomeE, Indice) VALUES ('Pediatria', 3);

-- Inserção de dados na tabela PACIENTE
INSERT INTO PACIENTE (CPF, Nome_P, TelefonePac, Endereco, Idade, Sexo) VALUES ('12345678901', 'Diego Pituca', '555-1234', 'Rua A, 123', 35, 'M');
INSERT INTO PACIENTE (CPF, Nome_P, TelefonePac, Endereco, Idade, Sexo) VALUES ('98765432109', 'Maria Silva', '777-4321', 'Av. B, 456', 25, 'F');

-- Inserção de dados na tabela CONSULTA
INSERT INTO CONSULTA (Crm, IdEsp, IdPac, DataCon, HoraInicCon, HoraFimCon, Pagou, ValorPago, FormaPagamento) 
VALUES (1, 1, 1, '2024-01-15', '09:00:00', '09:30:00', true, 150.0, 'Cartão');
INSERT INTO CONSULTA (Crm, IdEsp, IdPac, DataCon, HoraInicCon, HoraFimCon, Pagou, ValorPago, FormaPagamento) 
VALUES (1, 2, 1, '2024-05-10', '10:00:00', '10:30:00', false, 0.0, 'Não Pago');
INSERT INTO CONSULTA (Crm, IdEsp, IdPac, DataCon, HoraInicCon, HoraFimCon, Pagou, ValorPago, FormaPagamento) 
VALUES (2, 2, 2, '2024-02-20', '11:00:00', '11:30:00', true, 120.0, 'Dinheiro');

-- Inserção de dados na tabela DIAGNOSTICO
INSERT INTO DIAGNOSTICO (TratamentoRecomendado, RemediosReceitados, Observacoes, IdCon) 
VALUES ('Repouso', 'Paracetamol', 'Sem maiores observações.', 1);
INSERT INTO DIAGNOSTICO (TratamentoRecomendado, RemediosReceitados, Observacoes, IdCon) 
VALUES ('Creme hidratante', 'Antibiótico', 'Acompanhar evolução.', 3);

-- Inserção de dados na tabela DIAGNOSTICA
INSERT INTO DIAGNOSTICA (IdDiagnostico, IdDoenca) VALUES (1, 1);
INSERT INTO DIAGNOSTICA (IdDiagnostico, IdDoenca) VALUES (2, 2);

-- Inserção de dados na tabela EXERC_ESP
INSERT INTO EXERC_ESP (Crm, IdEsp) VALUES (1, 1);
INSERT INTO EXERC_ESP (Crm, IdEsp) VALUES (2, 2);

-- Inserção de dados na tabela AGENDA
INSERT INTO AGENDA (DiaSemana, HoraInicio, HoraFim, Crm) 
VALUES ('Segunda', '08:00:00', '18:00:00', 1);
INSERT INTO AGENDA (DiaSemana, HoraInicio, HoraFim, Crm) 
VALUES ('Terça', '09:00:00', '17:00:00', 2);
