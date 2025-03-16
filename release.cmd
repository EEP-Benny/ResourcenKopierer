SETLOCAL ENABLEEXTENSIONS

SET releasedir=release\ResourcenKopierer
SET releasefile=%releasedir%.zip

RMDIR /s /q "%releasedir%"
DEL "%releasefile%"
MKDIR "%releasedir%"
XCOPY /i "data" "%releasedir%"
XCOPY /i "build" "%releasedir%"

explorer "%releasedir%\.."

ECHO The folder %releasedir% needs to be zipped manually
PAUSE