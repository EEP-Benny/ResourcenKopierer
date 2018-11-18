<div align="center">

# ResourcenKopierer
![Screenshot](https://emaps-eep.de/images/modellfotos/resourcenkopierer.png)

Erzeugt einen neuen EEP-Resourcenordner, der nur den Grundbestand¹ enthält.

Falls bestehender und neuer Ordner auf dem selben Laufwerk liegen, werden NTFS-Hardlinks statt echten Kopien erzeugt.  
Das spart Zeit und Speicherplatz.

| [Download auf emaps-eep.de](https://emaps-eep.de/downloads/programme#resourcenkopierer) |
| - |

</div >

¹ _Der ResourcenKopierer kann nicht nur den Grundbestand kopieren. Was in den neuen Ordner kopiert werden soll, wird durch eine txt-Datei definiert, die alle Dateien auflistet. Mitgeliefert werden Listen vom Grundbestand der meisten EEP-Versionen, eigene können aber auch erstellt werden._

---

## Benutzen
Das fertige Programm inkl. den wichtigsten Modell-Listen [gibt es als zip auf emaps-eep.de](https://emaps-eep.de/downloads/programme#resourcenkopierer), oder in den [Releases hier auf GitHub](https://github.com/EEP-Benny/ResourcenKopierer/releases).  
Weitere Bedienungshinweise finden sich in der [Readme-Datei](data/ResourcenKopierer_readme.txt)  (diese ist auch in der zip enthalten).

## Mitmachen und Beitragen
Du möchtest mithelfen, den ResourcenKopierer zu verbessern? Das freut nicht nur mich, sondern auch alle anderen Benutzer, die davon profitieren!

Wenn du dich mit GitHub noch nicht auskennst, melde dich einfach bei mir, z.B. über das ["Mein EEP Forum"](https://www.eepforum.de/user/37-benny/) oder die [Anlagenmeisterei](https://www.anlagenmeisterei.de/memberlist.php?mode=viewprofile&u=54).  
Andernfalls kannst du auch einfach hier auf GitHub ein Issue oder einen PullRequest eröffnen.

### Listen
Die Listen liegen als `txt`-Dateien unter [`data/`](data/).

Zum Erstellen der Listen gibt es ein eigenes Programm, den `ResourcenKopiererListmaker` (ebenfalls in der zip-Datei enthalten). Nach der Angabe eines Ordners werden Namen und Pfade aller darin enthaltenen Dateien in eine `txt`-Datei geschrieben. Auch das ist in der oben genannten [Readme-Datei](data/ResourcenKopierer_readme.txt) beschrieben.  
Das Erstellen so einer Liste macht natürlich hauptsächlich dann Sinn, wenn du EEP gerade
frisch installiert hat, sodass im Resourcenordner wirklich nur Grundmodelle enthalten sind.

### Programm
Das Programm ist (oder genauer: beide Programme sind) in [AutoIt](https://www.autoitscript.com/site/) geschrieben. Der Quellcode befindet sich unter [`src/`](src/).
