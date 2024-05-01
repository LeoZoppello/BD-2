CREATE TABLE DOENCA(
	IdDoenca					Serial Primary Key,
	NomeD						Varchar(100)
);


CREATE TABLE MEDICO(
	Crm							Serial Primary Key,
	NomeM						Varchar(200),
	TelefoneM					Varchar(13),
	Percentual					Double Precision
);


CREATE TABLE ESPECIALIDADE(
	IdEsp						Serial Primary Key,
	NomeE						Varchar(40),
	Indice						Integer
);


CREATE TABLE PACIENTE(
	IdPac						Serial Primary Key,
	CPF							Varchar(11),
	Nome_P						Varchar(50),
	TelefonePac					Varchar(13),
	Endereco					Varchar(70),
	Idade						Integer,
	Sexo						Varchar(2)
);


-- Só são referenciadas por alguma outra tabela abaixo da linha. E não referenciam ninguém. ↑
---------------------------------------------------
-- São referenciadas por outras tabelas e referenciam também ↓

CREATE TABLE CONSULTA (
	IdCon						Serial Primary Key,
	Crm							Serial,
	IdEsp						Serial,
	IdPac						Serial,
	DataCon						Date,
	HoraInicCon					Time,
	HoraFimCon					Time,			
	Pagou						Boolean,
	ValorPago					Double Precision,
	FormaPagamento				Varchar(20)
);
ALTER TABLE CONSULTA ADD CONSTRAINT fk_consulta_medico FOREIGN KEY (Crm) REFERENCES MEDICO (Crm);
ALTER TABLE CONSULTA ADD CONSTRAINT fk_consulta_especialidade FOREIGN KEY (IdEsp) REFERENCES ESPECIALIDADE (IdEsp);
ALTER TABLE CONSULTA ADD CONSTRAINT fk_consulta_paciente FOREIGN KEY (IdPac) REFERENCES PACIENTE (IdPac);


CREATE TABLE DIAGNOSTICO(
	IdDiagnostico				Serial Primary Key,
	TratamentoRecomendado		Varchar(500),
	RemediosReceitados			Varchar(200),
	Observacoes					Varchar(500),
	IdCon						Serial
);
ALTER TABLE DIAGNOSTICO ADD CONSTRAINT fk_diagnostico_consulta FOREIGN KEY (IdCon) REFERENCES CONSULTA (IdCon);

CREATE TABLE DIAGNOSTICA(
	IdDiagnostico				Serial Primary Key,
	IdDoenca					Serial
);
ALTER TABLE DIAGNOSTICA ADD CONSTRAINT fk_diagnostica_diagnostico FOREIGN KEY (IdDiagnostico) REFERENCES DIAGNOSTICO (IdDiagnostico);
ALTER TABLE DIAGNOSTICA ADD CONSTRAINT fk_diagnostica_doenca FOREIGN KEY (IdDoenca) REFERENCES DOENCA (IdDoenca);

CREATE TABLE EXERC_ESP(
	Crm							Serial,
	IdEsp						Serial
);
ALTER TABLE EXERC_ESP ADD CONSTRAINT fk_exerc_esp_medico FOREIGN KEY (Crm) REFERENCES MEDICO (Crm);
ALTER TABLE EXERC_ESP ADD CONSTRAINT fk_exerc_esp_especialidade FOREIGN KEY (IdEsp) REFERENCES ESPECIALIDADE (IdEsp);

CREATE TABLE AGENDA(
	IdAgenda					Serial Primary Key,
	DiaSemana					Varchar(8),
	HoraInicio					Time,
	HoraFim						Time,
	Crm							Serial
);
ALTER TABLE AGENDA ADD CONSTRAINT fk_agenda_medico FOREIGN KEY (Crm) REFERENCES MEDICO (Crm);