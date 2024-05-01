CREATE TABLE Medico (
    CRM INT PRIMARY KEY,
    NomeM VARCHAR(100) NOT NULL,
    TelefoneM VARCHAR(20) NOT NULL,
    Percentual DECIMAL(5,2) NOT NULL CHECK (Percentual >= 0 AND Percentual <= 100)
);

CREATE TABLE Especialidade (
    IdEsp SERIAL PRIMARY KEY,
    NomeE VARCHAR(100) NOT NULL,
    Indice INT NOT NULL
);

CREATE TABLE Paciente (
    IdPac SERIAL PRIMARY KEY,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    NomeP VARCHAR(100) NOT NULL,
    TelefonePac VARCHAR(20) NOT NULL,
    Endereco VARCHAR(200) NOT NULL,
    Idade INT NOT NULL,
    Sexo CHAR(1) CHECK (Sexo IN ('M', 'F'))
);

CREATE TABLE Consulta (
    IdCon SERIAL PRIMARY KEY,
    CRM INT,
    IdEsp INT,
    IdPac INT,
    Data DATE NOT NULL,
    HoraInicCon TIME NOT NULL,
    HoraFimCon TIME NOT NULL,
    Pagou BOOLEAN NOT NULL,
    ValorPago DECIMAL(10,2),
    FormaPagamento VARCHAR(50),
    FOREIGN KEY (CRM) REFERENCES Medico(CRM),
    FOREIGN KEY (IdEsp) REFERENCES Especialidade(IdEsp),
    FOREIGN KEY (IdPac) REFERENCES Paciente(IdPac)
);

CREATE TABLE Diagnostico (
    IdDiagnostico SERIAL PRIMARY KEY,
    TratamentoRecomendado TEXT,
    RemediosReceitados TEXT,
    Observacoes TEXT,
    IdCon INT,
    FOREIGN KEY (IdCon) REFERENCES Consulta(IdCon)
);

CREATE TABLE Agenda (
    IdAgenda SERIAL PRIMARY KEY,
    DiaSemana VARCHAR(20) NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFim TIME NOT NULL,
    CRM INT,
    FOREIGN KEY (CRM) REFERENCES Medico(CRM)
);

CREATE TABLE ExerceEsp (
    CRM INT,
    IdEsp INT,
    FOREIGN KEY (CRM) REFERENCES Medico(CRM),
    FOREIGN KEY (IdEsp) REFERENCES Especialidade(IdEsp),
    PRIMARY KEY (CRM, IdEsp)
);

CREATE TABLE Doenca (
    IdDoenca SERIAL PRIMARY KEY,
    NomeD VARCHAR(100) NOT NULL
);

CREATE TABLE Diagnostica (
    IdDiagnostico SERIAL,
    IdDoenca INT,
    FOREIGN KEY (IdDiagnostico) REFERENCES Diagnostico(IdDiagnostico),
    FOREIGN KEY (IdDoenca) REFERENCES Doenca(IdDoenca),
    PRIMARY KEY (IdDiagnostico, IdDoenca)
);
