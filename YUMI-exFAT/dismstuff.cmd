@echo off
Dism /Get-ImageInfo /imagefile:"EXEDIR\TEMPYUMI\sources\install.wim"
echo.
set /p wimindex=Which Image would you like to Apply? Enter the Index Number, then press Enter.
echo.
echo ==================== APPLYING IMAGE ======================
echo Now applying Index: %wimindex% to drive USBDEV. 
echo The first percent of progress can take a minute to display.
echo Please be patient as this is expected to take a while...
echo ==========================================================
echo.
Dism /Apply-Image /ImageFile:"EXEDIR\TEMPYUMI\sources\install.wim" /index:%wimindex% /ApplyDir:USBDEV:\