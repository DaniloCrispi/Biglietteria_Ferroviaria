
-- 1. Verifica disponibilità posti
SELECT Numero_Posto
FROM Biglietto
WHERE Stato = 'Disponibile'
  AND ID_Prenotazione IS NULL;

-- 2. Inserimento nuova prenotazione
INSERT INTO Prenotazione (Data_Prenotazione, ID_Cliente, ID_Viaggio)
VALUES (CURRENT_DATE, 1, 1);

UPDATE Biglietto
SET Stato = 'Prenotato', ID_Prenotazione = 1
WHERE ID_Biglietto = 1;

-- 3. Visualizzazione prenotazioni attive di un cliente
SELECT p.ID_Prenotazione, v.Data_Partenza, v.Data_Arrivo, t.Origine, t.Destinazione
FROM Prenotazione p
JOIN Viaggio v ON p.ID_Viaggio = v.ID_Viaggio
JOIN Tratta t ON v.ID_Tratta = t.ID_Tratta
WHERE p.ID_Cliente = 1;

-- 4. Cancellazione prenotazione
UPDATE Biglietto
SET Stato = 'Disponibile', ID_Prenotazione = NULL
WHERE ID_Prenotazione = 1;

DELETE FROM Prenotazione
WHERE ID_Prenotazione = 1;

-- 5. Report vendite mensili per tratta
SELECT t.Origine, t.Destinazione, COUNT(*) AS Numero_Biglietti, SUM(b.Prezzo) AS Totale_Incasso
FROM Biglietto b
JOIN Prenotazione p ON b.ID_Prenotazione = p.ID_Prenotazione
JOIN Viaggio v ON p.ID_Viaggio = v.ID_Viaggio
JOIN Tratta t ON v.ID_Tratta = t.ID_Tratta
WHERE EXTRACT(MONTH FROM b.Data_Emissione) = EXTRACT(MONTH FROM CURRENT_DATE)
GROUP BY t.Origine, t.Destinazione
ORDER BY Totale_Incasso DESC;
