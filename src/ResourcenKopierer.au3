#include <File.au3>

Global $ResQuelle=FileSelectFolder("Bestehenden Resourcen-Ordner auswählen, aus dem die Dateien kopiert werden sollen","",2)
If @error Then Exit
Global $ResZiel=FileSelectFolder("Neuen Resourcen-Ordner auswählen, in den die Dateien kopiert werden sollen","",7)
If @error Then Exit
Global $MakeLinks=False
If StringLeft($ResQuelle,1)=StringLeft($ResZiel,1) And DriveGetFileSystem(StringLeft($ResQuelle,3))="NTFS" Then
	If MsgBox(4+32,"ResourcenKopierer",'Quell- und Ziel-Resourcenordner liegen auf dem gleichen NTFS-Laufwerk. Daher ist es möglich, die Dateien nicht zu kopieren, sondern "Hardlinks" zu erstellen. '&@CRLF& _
		'Dies spart Festplattenplatz, da über beide Pfade auf die selbe Datei zugegriffen wird.'&@CRLF&@CRLF&'Sollen die Dateien im Resourcenordner verlinkt statt kopiert werden?')=6 Then
		$MakeLinks=True;
	EndIf
EndIf
Global $Listendatei=FileOpenDialog("Datei mit einer Liste aller zu kopierenden Dateien","","Textdateien (*.txt)",3)
If @error Then Exit

Global $Startzeit=TimerInit()
Global $arr
Global $logfile=FileOpen(@ScriptDir&"\ResourcenKopierer.log",2)
_FileReadToArray($Listendatei,$arr)
Global $Fehlerzahl=0
ProgressOn("Dateien kopieren...","","",-1,-1,18)
If $MakeLinks Then
	FileWriteLine($logfile,"Kopiere von "&$ResQuelle&" nach "&$ResZiel&" (NTFS-Verlinkung)"&@CRLF)
Else
	FileWriteLine($logfile,"Kopiere von "&$ResQuelle&" nach "&$ResZiel&@CRLF)
EndIf
For $i=1 To $arr[0]
	$RegExp=StringRegExp("\"&$arr[$i],'(.*\\)[^\\]*',1)
	If $MakeLinks And CanBeLinked($arr[$i]) Then
		DirCreate($ResZiel&$RegExp[0])
		Local $Result=FileCreateNTFSLink($ResQuelle&"\"&$arr[$i],$ResZiel&"\"&$arr[$i])
	Else
		Local $Result=FileCopy($ResQuelle&"\"&$arr[$i],$ResZiel&$RegExp[0],8)
	EndIf
	If $Result=0 Then
		$Fehlerzahl+=1
		FileWriteLine($logfile,"Fehler Nr. "&$Fehlerzahl&" bei Datei Nr. "&$i&": "&$arr[$i])
		If Not FileExists($ResQuelle&"\"&$arr[$i]) Then
			FileWriteLine($logfile,"  -> Quelldatei existiert nicht")
		ElseIf FileExists($ResZiel&$RegExp[0]) Then
			FileWriteLine($logfile,"  -> Zieldatei existiert schon")
		EndIf
	EndIf
	ProgressSet($i/$arr[0]*100,$arr[$i],"Datei "&$i&" von "&$arr[0]&"; "&$Fehlerzahl&" Fehler")
Next
ProgressOff()
Global $Dauer=TimerDiff($Startzeit)/1000
Global $DauerF=StringFormat("%02d:%02d",Int($Dauer/60),Mod($Dauer,60))
FileWriteLine($logfile,@CRLF&"=================================="&@CRLF&($arr[0]-$Fehlerzahl)&" von "&$arr[0]&" Dateien in "&$DauerF&" Minuten erfolgreich kopiert, "&$Fehlerzahl&" Fehler.")
FileClose($logfile)
If MsgBox(4+64,"ResourcenKopierer",($arr[0]-$Fehlerzahl)&" von "&$arr[0]&" Dateien in "&$DauerF&" Minuten erfolgreich kopiert, "&$Fehlerzahl&" Fehler."&@CRLF&@CRLF&"Logfile öffnen?")=6 Then
	;Logfile öffnen
	ShellExecute(@ScriptDir&"\ResourcenKopierer.log")
EndIf

Func CanBeLinked($filename)
	Return Not StringRegExp($filename,"(?>EEPTree.xml|Models.db|Models.ini)\z")
EndFunc
