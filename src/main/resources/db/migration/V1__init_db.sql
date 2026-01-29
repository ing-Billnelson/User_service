-- PostgreSQL ne possède pas de WAITFOR natif en SQL, 
-- on utilise pg_sleep (attention: cela bloque la session)
SELECT pg_sleep(5);

-- Pour la création conditionnelle, on utilise souvent un utilitaire système 
-- ou une commande directe car "CREATE DATABASE" ne peut être mis dans un bloc IF
-- Voici la commande pour ignorer l'erreur si elle existe déjà :
DROP DATABASE IF EXISTS userdb; -- Optionnel : pour repartir à neuf
CREATE DATABASE userdb;
