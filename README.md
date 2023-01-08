# Uruchomienie




## Instalujemy Docker'a:

_Instrukcja zaczerpnięta ze strony https://docs.docker.com/engine/install/ubuntu/_

Usuwamy stare wersje:

```
sudo apt-get remove docker docker-engine docker.io containerd runc
```

Aktualizujemy repozytoria pakietów pakietów:

```
sudo apt-get update
```

Instalujemy potrzebne zależności:

```
sudo apt-get install ca-certificates curl gnupg lsb-release
```

Dodajemy klucz GPG dla Docker'a:

```
sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

Konfigurujemy repozytrium:

```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Instalujemy oprogramowanie **Docker**:

```
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

Nadajemy uprawnienia dla administratora:

```
sudo usermod -aG docker v1p
```

_(wyloguj się i zaloguj ponownie aby zastosować zmiany)_



## Generujemy klucze SSL:

### Sposób A:

Uruchom skrypt `/scripts/create-self-signed.sh` i postępuj zgodnie z poleceniami z konsoli.

### Sposób B:

Wpierw uruchom `/scripts/create-root-ca.sh`, a następnie `scripts/create-certificate.sh`

### Uwaga:

Niezależnie od wybranego sposobu po wygenerowaniu klucza i certyfikatu skopiuj ich zawartość do odpowiednich plików:

```
/caddy/tls/crt.pem
/caddy/tls/key.pem
```



## Start aplikacji

Będąc w głównym folderze projektu, tam gdzie znajduje się plik `docker-compose.yaml` wykonaj polecenie `docker-compose up -d` lub `docker compose up -d`. Aby zatrzymać cały stos aplikacji wykonaj polecenie `docker-compose down` lub `docker compose down`.



## Autor

Adrian Gargula