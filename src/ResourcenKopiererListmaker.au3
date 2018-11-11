#include <File.au3>

Global $ResOrdner=FileSelectFolder("Resourcen-Ordner auswählen, dessen Modelle gelistet werden sollen","",2,"E:\Eisenbahn.exe\EEP6\Resourcen")
If @error Then Exit
Global $Zieldatei=FileSaveDialog("Datei, in der alle Modelle gespeichert werden sollen","","Textdateien (*.txt)",16)
If @error Then Exit
If StringRight($Zieldatei,4) <> ".txt" Then $Zieldatei&=".txt"

Global $file=FileOpen($Zieldatei,10)
Global $filecount=0

WriteCompleteDir("")

FileClose($file)
MsgBox(64,"ResourcenKopiererListmaker","Alle "&$filecount&" Dateien aus dem Ordner"&@CRLF&$ResOrdner&@CRLF&"wurden in die Datei"&@CRLF&$Zieldatei&@CRLF&"geschrieben.")

Func WriteCompleteDir($dir)
	Local $folderlist=_FileListToArray($ResOrdner&"\"&$dir,"*",2)
	Local $filelist=_FileListToArray($ResOrdner&"\"&$dir,"*",1)
	If $folderlist<>0 Then
		For $i=1 To $folderlist[0]
			WriteCompleteDir($dir&$folderlist[$i]&"\")
		Next
	EndIf
	If $filelist<>0 Then
		For $i=1 To $filelist[0]
			FileWriteLine($file,$dir&$filelist[$i])
			$filecount+=1
		Next
	EndIf
	
EndFunc