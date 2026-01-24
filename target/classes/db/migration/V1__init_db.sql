-- Attend un court instant pour s'assurer que le serveur est prêt à accepter des commandes.
WAITFOR DELAY '00:00:05';

-- Vérifie si la base de données 'userdb' existe déjà
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'userdb')
BEGIN
    -- Si elle n'existe pas, la créer
    CREATE DATABASE userdb;
    PRINT 'Database [userdb] created successfully.';
END
ELSE
BEGIN
    PRINT 'Database [userdb] already exists.';
END
GO