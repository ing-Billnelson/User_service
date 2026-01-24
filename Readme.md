# Trouver l'IP du conteneur
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' sqlserver

# Se connecter (remplacez 172.17.0.2 par l'IP réelle)
sqlcmd -S 172.17.0.2 -U SA -P "Rootp@ss123!" -d userdb
