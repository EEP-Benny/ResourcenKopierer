Enthalten sind zwei exe-Dateien sowie meherere txt-Dateien.
Damit lassen sich aus einem vorhandenen, mehr oder weniger kompletten Resourcen-Ordner 
gezielt die Modelle rausfischen, die zur Grundversion gehören.
Die txt-Dateien sind fertige Listen aller Grundmodelle in der genannten EEP-Version.

Der Otto-Normal-EEPler wird nur die ResourcenKopierer.exe und die zu seiner Version passende txt-Datei brauchen.


ResourcenKopierer.exe
=====================

Nach dem Starten des Programms werden nacheinander drei Ordner bzw. Dateien abgefragt:
 1. Der Quell-Resourcen-Ordner, in dem alle Modelle drin sind. Alle Modelle werden aus
    diesem Ordner herauskopiert.
 2. Der Ziel-Resourcen-Ordner, in den die Modelle kopiert werden sollen. In der Regel 
    wird das ein neuer Ordner sein, der sich im Dialog anlegen lässt.
 3. Eine txt-Datei, in der alle zu kopierenden Dateien stehen. Diese lässt sich entweder 
    mit dem ResourcenKopiererListmaker erzeugen (siehe unten), oder du nimmst eine 
    fertige Liste aus dieser zip-Datei.
Falls es möglich ist (beide Resourcen-Ordner liegen auf dem gleichen NTFS-Laufwerk), 
wird nach Schritt 2 gefragt, ob die Dateien kopiert (der Standardfall) oder verlinkt werden sollen.
Letzteres spart ein bisschen Festplattenplatz, da über beide Pfade auf die selbe Datei zugegriffen wird.

Anschließend werden alle Dateien aus der Liste kopiert. Ein Fortschrittsbalken zeigt 
dabei, welche Datei gerade kopiert wird, und wie viele Fehler es bisher gab.
Dieser Vorgang kann ein bisschen dauern.
Sobald alle Dateien kopiert sind, wird eine Erfolgsmeldung gezeigt.
Eine genaue Auflistung aller Fehler wird in die Datei "ResourcenKopierer.log" geschrieben.



ResourcenKopiererListmaker.exe
==============================

Mit diesem Programm lassen sich die vom ResourcenKopierer benötigten Listen selbst 
erzeugen. Nach dem Starten des Programms werden zwei Ordner und Dateien abgefragt:
 1. Der Resourcen-Ordner, aus dem alle Dateien ausgelesen werden sollen
 2. Wo die txt-Datei gespeichert werden soll, in die alle Dateien reingeschrieben werden.
Anschließend werden alle Dateiennamen in dem gewählten Ordner und den Unterordnern in die
gewählte Datei geschrieben.
Nachdem alle Dateien zusammengesucht und in die txt geschrieben sind, wird in einer Erfolgsmeldung die Anzahl der gefundenen Dateien angezeigt.
