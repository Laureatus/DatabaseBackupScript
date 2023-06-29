
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
srcConStr='Server=ServerAddress;Database=DataBase;Uid=Username;Pwd=Password;'
trgConStr='Server=ServerAddress;Database=DataBase;Uid=Username;Pwd=Password;'
logPath='/path/to/dict'
```

## Activity Diagram
![Untitled Diagram drawio](https://github.com/Laureatus/DatabaseBackupScript/assets/47870802/a8aed9d9-6a0b-4c90-9371-42e2bda35798)

