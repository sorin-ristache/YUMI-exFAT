/*
 * This file is part of YUMI
 *
 * YUMI is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * any later version.
 *
 * YUMI is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with YUMI.  If not, see <http://www.gnu.org/licenses/>.
 */

; ------------ Uninstall Distros Macro -------------- 

!macro Uninstall_Distros  
  StrCpy $PersistName "$DistroName" -4
  
  Push $PersistName
  Call ConvertBStoFS
  Pop $R0
  StrCpy $PersistName2 $R0
  
  ;;StrCpy $DELPERSIST '{$\r$\n"image": "/YUMI/$PersistName2.iso",$\r$\n"backend": "/YUMI/$PersistName2.rw"$\r$\n},'
  ;;StrCpy $DELPERSIST2 '{$\r$\n"image": "/YUMI/$PersistName2.iso",$\r$\n"backend": "/YUMI/$PersistName2.rw"$\r$\n}'
  StrCpy $DELPERSIST '{"image": "/YUMI/$PersistName2.iso","backend": "/YUMI/$PersistName2.rw"},'
  ;;StrCpy $DELPERSIST2 '{"image": "/YUMI/$PersistName2.iso","backend": "/YUMI/$PersistName2.rw"}'
  
   ;;MessageBox MB_OK "$DELPERSIST"
 ${If} $DistroName != ""  
   ${AndIf} ${FileExists} "$BootDir\YUMI\$DistroName" ; $DistroName includes $DistroPath\$JustISOName ; $BootDir\YUMI\$DistroName\*.*
    ;RMDir /R "$BootDir\YUMI\$DistroName"
    Delete "$BootDir\YUMI\$DistroName" 
    ${LineFind} "$BootDir\YUMI\Installed.txt" "$BootDir\YUMI\Installed.txt" "1:-1" "DeleteInstalled" ; Remove the Installed entry
    ${LineFind} "$BootDir\YUMI\Installed.txt" "$BootDir\YUMI\Installed.txt" "1:-1" "DeleteEmptyLine" ; Remove any left over empty lines
    DetailPrint "The Distro $DistroName was removed!"
   ${If} ${FileExists} "$BootDir\YUMI\$PersistName.rw" ; Persistence file also exists.
	 MessageBox MB_YESNO|MB_ICONQUESTION "Would you like to also remove the persistence entry$\r$\nand related file $PersistName.rw?" IDYES deleteit
	 Goto skipdeletion
	 deleteit:
     Delete "$BootDir\YUMI\$PersistName.rw" 

      ${If} ${FileExists} "$BootDir\ventoy\*.*"
       StrCpy $JsonPath "ventoy"
      ${Else}
       StrCpy $JsonPath "YUMI"
      ${EndIf}

     !insertmacro ReplaceInFile "$DELPERSIST" "" "all" "all" "$BootDir\$JsonPath\ventoy.json" 
	 !insertmacro ReplaceInFile "$DELPERSIST2" "" "all" "all" "$BootDir\$JsonPath\ventoy.json" 
     ${LineFind} "$BootDir\$JsonPath\ventoy.json" "$BootDir\$JsonPath\ventoy.json" "1:-1" "DeleteEmptyLine" ; Remove any left over empty lines  
	 DetailPrint "The persistence file $PersistName.rw was also removed!"
	 skipdeletion:
   ${EndIf}
 ${EndIf} 
!macroend

Function ConvertBStoFS
 Exch $R0 ;input string
 Push $R1
 Push $R2
 StrCpy $R1 0
loop:
  IntOp $R1 $R1 - 1
  StrCpy $R2 $R0 1 $R1
  StrCmp $R2 "" done
 StrCmp $R2 "\" 0 loop
  StrCpy $R2 $R0 $R1 ;part before
   Push $R1
  IntOp $R1 $R1 + 1
  StrCpy $R1 $R0 "" $R1 ;part after
 StrCpy $R0 "$R2/$R1"
   Pop $R1
  IntOp $R1 $R1 - 1
Goto loop
done:
   Pop $R2
   Pop $R1
   Exch $R0 ;output string
FunctionEnd