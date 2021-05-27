BEGIN TRANSACTION
 
SET XACT_ABORT ON
 
BEGIN TRY
--------------------------------------------------- Seus comandos aqui - INICIO
-- Comandos de INSERT, UPDATE, DELETE...
 	
--------------------------------------------------- Seus comandos aqui - FIM 
COMMIT -- Caso tudo OK, realiza o COMMIT (conclui a transação)
SELECT 'Sucesso!'
 
END TRY

BEGIN CATCH
 IF XACT_STATE() <> 0
 BEGIN TRY
 ROLLBACK -- Caso apresente erro, desfaz o que foi iniciado (ROLLBACK). Não finaliza a transação
 SELECT 'Erro'
 
 END TRY
 BEGIN CATCH
 END CATCH
 
END CATCH
