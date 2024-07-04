CREATE TABLE dbo.[IMPIEGO] (
    IDImpiego INT PRIMARY KEY IDENTITY(1,1),
    TipoImpiego NVARCHAR(50),
    Assunzione DATETIME2
);

CREATE TABLE dbo.[IMPIEGATO] (
    IDImpiegato INT PRIMARY KEY IDENTITY(1,1),
    Cognome NVARCHAR(50),
    Nome NVARCHAR(50),
    CodiceFiscale NVARCHAR(16),
    Eta INT,
    RedditoMensile DECIMAL(18, 2),
    DetrazioneFiscale BIT,
    IDImpiego INT,
    FOREIGN KEY (IDImpiego) REFERENCES dbo.IMPIEGO(IDImpiego)
);

-- Inserimento di impieghi
INSERT INTO dbo.IMPIEGO (TipoImpiego, Assunzione)
VALUES
('Manager', '2010-01-01'),
('Developer', '2012-03-15'),
('Analyst', '2014-07-30'),
('HR', '2011-06-20'),
('Marketing', '2013-09-05'),
('Sales', '2015-02-18'),
('Support', '2016-04-22'),
('Consultant', '2017-08-13');

-- Inserimento di impiegati
INSERT INTO dbo.IMPIEGATO (Cognome, Nome, CodiceFiscale, Eta, RedditoMensile, DetrazioneFiscale, IDImpiego)
VALUES 
('Rossi', 'Mario', 'RSSMRA80A01H501X', 40, 3000.00, 1, 1),
('Bianchi', 'Luigi', 'BNCLGU75T01A662B', 45, 3200.00, 0, 1),
('Verdi', 'Carla', 'VRDCRL85P41B774K', 38, 2800.00, 1, 2),
('Neri', 'Anna', 'NRINNA60D50H501Z', 50, 3500.00, 1, 2),
('Gialli', 'Paolo', 'GLLPLO70C01Z404Z', 34, 3100.00, 0, 3),
('Blu', 'Sara', 'BLUSRA90A41H501X', 28, 2900.00, 1, 3),
('Marrone', 'Giorgio', 'MRRGGR85A41H501Y', 36, 2700.00, 0, 4),
('Grigio', 'Elena', 'GRGLNE80M01H501Y', 42, 3300.00, 1, 4),
('Viola', 'Luca', 'VLLLCA75E50H501W', 47, 3600.00, 0, 5),
('Rosso', 'Laura', 'RSSLRU82H01H501X', 39, 3100.00, 1, 5),
('Azzurro', 'Marco', 'ZZRMRC85L01H501X', 33, 3200.00, 0, 6),
('Beige', 'Francesca', 'BGFFNC88M41H501Z', 30, 2800.00, 1, 6),
('Bianco', 'Stefano', 'BNCSTF75R50H501Z', 44, 3400.00, 0, 7),
('Celeste', 'Giovanni', 'CLSGVN82L41H501Y', 37, 3500.00, 1, 7),
('Rosa', 'Chiara', 'RSCCHR90M01H501Z', 27, 2700.00, 0, 8),
('Arancio', 'Fabio', 'ARCFBA88E41H501W', 41, 3000.00, 1, 8),
('Nero', 'Giulia', 'NRGGLA85H01H501X', 35, 3100.00, 0, 1),
('Oro', 'Davide', 'ORDDVA80C41H501Z', 46, 3600.00, 1, 2),
('Argento', 'Alessia', 'RGTLSS85M41H501Y', 32, 3200.00, 0, 3),
('Verde', 'Giorgia', 'VRDGRG75L41H501X', 48, 3400.00, 1, 4);


INSERT INTO dbo.IMPIEGATO (Cognome, Nome, CodiceFiscale, Eta, RedditoMensile, DetrazioneFiscale, IDImpiego)
VALUES 
('Rossini', 'Maria', 'RSSMRA80A01H501Y', 40, 780.00, 1, 1),
('Bianchina', 'Luigia', 'BNCLGU75T01A662R', 45, 560.00, 0, 1);



SELECT * 
FROM IMPIEGATO
WHERE ETA>29;

SELECT * 
FROM IMPIEGATO
WHERE RedditoMensile>=800;

SELECT * 
FROM IMPIEGATO
WHERE DetrazioneFiscale = 1;

SELECT * 
FROM IMPIEGATO
WHERE DetrazioneFiscale = 0;

SELECT * 
FROM IMPIEGATO
WHERE Cognome LIKE 'G%'
ORDER BY Cognome;

SELECT 
COUNT(*) as 'Numero impiegati registrati'
FROM IMPIEGATO;

SELECT
SUM(redditoMensile) as 'Totale mensile impiegati)'
FROM IMPIEGATO;

SELECT
AVG(redditoMensile) as 'Totale media mensile impiegati)'
FROM IMPIEGATO;

SELECT MAX(RedditoMensile) AS RedditoMassimo
FROM dbo.IMPIEGATO;

SELECT MIN(RedditoMensile) AS RedditoMinimo
FROM dbo.IMPIEGATO;

SELECT i.*
FROM dbo.IMPIEGATO i
JOIN dbo.IMPIEGO imp ON i.IDImpiego = imp.IDImpiego
WHERE imp.Assunzione BETWEEN '2013-09-05' AND '2016-04-22';

SELECT AVG(Eta) AS EtaMedia
FROM IMPIEGATO;

SELECT imp.TipoImpiego, COUNT(i.IDImpiegato) AS NumeroImpiegati
FROM IMPIEGATO i
JOIN IMPIEGO imp ON i.IDImpiego = imp.IDImpiego
GROUP BY imp.TipoImpiego;

