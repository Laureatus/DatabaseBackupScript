
![Database BackuP](https://github.com/Laureatus/DatabaseBackupScript/assets/47870802/7f84a869-8a7f-49f9-acbd-9840c1afac97)


# Database Backup Script

## Projektbeschrieb

Wir werden ein Script erstellen, welches in der Lage ist, den Inhalt einer Datenbank zu fetchen und anschliessend die erhaltenen Daten auf eine andere backup Datenbank hochzuladen. Die Datenbanken sollten über ein config file an das Script übergeben werden und alle outputs und errors werden in einem Log file festgehalten.

### Muss:
- Kopiert source Datenbank zur target Datenbank
- Schreibt einen Log Datei
- Source und target Datenbank werden in einem config file angegeben
- Log file Pfad wird in config file angegeben
- Unterstützt MySQL Datenbanken

### Kann:
- Unterstützt mehrere Datenbanken (Datenbanktyp wird in config file angegeben)
- Mehrere source/target Datenbanken auf einmal angeben können
- Config file ist optional und kann mit Parametern ersetzt werden
- Auswahl von Spalten/Zeilen möglich

## Config File Beschreibung

```
HOST='localhost' # The host of your DB
PORT='3306' # The Port of your DB
SRC_DB='world' # Name of the DB that should be backed up
TRG_DB='world_backup' # Name of the DB where the DB dump is imported into
USER_NAME='root' # Username of the DB user
PASSWORD='test' # Password of the DB user
BACKUP_DIR='../database/backups' # Path to the Directory where Dump files are going to be stored
LOG_PATH='TestLog' # Path where the log file is stored
KEEP_DUMP_FILES='Last' # Choose if you want to keep the dump files. [All, None, Last]
DATE=$(date +"%Y-%m-%d_%H-%M-%S") # Date format used for naming the Dump files
```

## Activity Diagram
![Untitled Diagram drawio](https://github.com/Laureatus/DatabaseBackupScript/assets/47870802/a8aed9d9-6a0b-4c90-9371-42e2bda35798)

## Installation

Um das Script laufen lassen zu können, muss mysql installiert sein: https://dev.mysql.com/downloads/mysql/
Ausserdem muss eine backup datenbank definiert sein, um das Script laufen zu lassen. Das Script erstellt KEINE datenbanken selbstständig sondern füllt nur Daten ab.

Um das script laufen zu lassen, müssen folgende Werte abgefüllt werden:


```
# The host of your DB
HOST='localhost'

# The Port of your DB
PORT='3306'

# Name of the DB that should be backed up
SRC_DB='world'

# Name of the DB where the DB dump is imported into
TRG_DB='world_backup'

# Username of the DB user
USER_NAME='root'

# Password of the DB user 
PASSWORD='test'

# Path to the Directory where Dump files are going to be stored
BACKUP_DIR='../database/backups'

# Path where the log file is stored
LOG_PATH='TestLog'

# Choose if you want to keep the dump files. [All, None, Last]
KEEP_DUMP_FILES='Last'

# Date format used for naming the Dump files
DATE=$(date +"%Y-%m-%d_%H-%M-%S") 
```
Es sollte ausserdem sichergestellt werden, dass der DB user welcher sich mit dem Script auf der DB einloggt, die nötigen Berechtigungen hat, um Dumps zu erstellen und diese zu importieren.
