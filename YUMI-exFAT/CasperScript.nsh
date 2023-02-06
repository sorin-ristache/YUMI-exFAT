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

; ------------ Casper Script --------------

Function CasperScript
${If} $Casper != "0"
${AndIf} $DistroName != "Windows to Go (Virtual Hard Disk)"
${AndIf} $DistroName != "Phoenix LiteOS"
 Call GetCaspTools
 
     ${If} $DistroName == "Ubuntu"
	  ${OrIf} $DistroName == "Linux Lite"
		 ${StrContains} $0 "buntu-19" "$JustISO"   
		 ${StrContains} $1 "buntu-18" "$JustISO"
		 ${StrContains} $2 "buntu-17" "$JustISO" 
		 ${StrContains} $3 "buntu-16" "$JustISO" 		
		 
		 ${If} $0 != "buntu-19" 
		 ${AndIf} $1 != "buntu-18"  
		 ${AndIf} $2 != "buntu-17"  
		 ${AndIf} $3 != "buntu-16" 	 
		  StrCpy $CasperName "writable"
         ${Else}
		  StrCpy $CasperName "casper-rw" 
		 ${EndIf}
		 
     ${ElseIf} $DistroName == "Linux Mint"
		 ${StrContains} $0 "mint-19" "$JustISO"   
		 ${StrContains} $1 "mint-18" "$JustISO"
		 ${StrContains} $2 "mint-17" "$JustISO" 
		 ${StrContains} $3 "mint-16" "$JustISO" 		
		 
		 ${If} $0 != "mint-19" 
		 ${AndIf} $1 != "mint-18"  
		 ${AndIf} $2 != "mint-17"  
		 ${AndIf} $3 != "mint-16" 	 
		  StrCpy $CasperName "writable" 
         ${Else}
		  StrCpy $CasperName "casper-rw" 
		 ${EndIf}
		 
     ${ElseIf} $DistroName == "Kaspersky Rescue Disk (Antivirus Scanner)"
          StrCpy $CasperName "casper-rw"	

     ${ElseIf} $DistroName == "MX Linux"
          StrCpy $CasperName "MX-Persist"			  
		 
     ${ElseIf} $DistroName == "Debian Live"
     ${OrIf} $DistroName == "Raspberry Pi Desktop"
	 ${OrIf} $DistroName == "Clonezilla (Backup + Clone Tool)"
     ${OrIf} $DistroName == "Kali Linux (Penetration Testing)"
          StrCpy $CasperName "persistence"		 
		  
     ${ElseIf} $DistroName == "ArchLinux"
     ${OrIf} $DistroName == "Fedora"
          StrCpy $CasperName "vtoycow"		 		  
	 ${Else}
	      ;StrCpy $CasperName "casper-rw" ; default to newer persistence label
	      StrCpy $CasperName "writable" ; default to newer persistence label
${EndIf}   
    ;MessageBox MB_OK "$CasperName"  
 Sleep 2000
 DetailPrint "Sleeping for 2 second..."
 ExpandEnvStrings $COMSPEC "%COMSPEC%"
 ExecShell "" '"$COMSPEC"' '/C if 1==1 "$PLUGINSDIR\dd.exe" if=/dev/zero of="$BootDir\YUMI\$DistroPath\$JustISOName.rw" bs=1M count=$Casper --progress 2>$PLUGINSDIR\ddlog.txt' SW_HIDE
 Banner::show /set 76 "Creating a $CasperName persistence file."
 Banner::getWindow
 Pop $1  
 DetailPrint "Creating a $JustISOName.rw file. Progress will not move until finished..."
 Call ddProgress
 Banner::destroy
 
 DetailPrint "Sleeping for a few seconds..."
 Sleep 3000 ; Give the dd.exe time to exit.
 DetailPrint "Now Formatting $JustISOName.rw" 
 DetailPrint "Formatting the $JustISOName.rw file: The progress bar will not move until finished. Please be patient..." 
 nsExec::ExecToLog '"$PLUGINSDIR\mke2fs.exe" -t ext4 -L $CasperName "$BootDir\YUMI\$DistroPath\$JustISOName.rw"'
 ; Exec '"$PLUGINSDIR\mke2fs.exe" -t ext3 -L $CasperName "$BootDir\YUMI\$DistroPath\$JustISOName.rw"' ;need to revisit to answer yes.

 
StrCpy $OLDCOMMENT '{"-":"-","-":"-"},'
StrCpy $COMMENT '{"":"","":""},'
StrCpy $NEWCOMMENT '{"-":"-","-":"-"},$\r$\n{"image": "/YUMI/$DistroPath/$JustISO","backend": "/YUMI/$DistroPath/$JustISOName.rw"},$\r$\n'
StrCpy $NEWSLUG '{$\r$\n"persistence": [$\r$\n{"":"","":""},$\r$\n{"image": "/YUMI/$DistroPath/$JustISO","backend": "/YUMI/$DistroPath/$JustISOName.rw"},$\r$\n{$\r$\n}$\r$\n]$\r$\n}$\r$\n' 

;${If} $VolName == "Ventoy"
; CreateDirectory "$BootDir\ventoy"
;${EndIf}

; If ventoy directory doesn't exist create it.
 ${IfNot} ${FileExists} "$BootDir\ventoy\*.*" 
  CreateDirectory "$BootDir\ventoy"
 ${EndIf}

${If} ${FileExists} "$BootDir\ventoy\*.*"
StrCpy $JsonPath "ventoy" ;note that the ventoy directory takes precedence
${Else}
StrCpy $JsonPath "YUMI"
${EndIf}

${IfNot} ${FileExists} "$BootDir\$JsonPath\ventoy.json"
;CreateDirectory "$BootDir\ventoy"
FileOpen $0 "$BootDir\$JsonPath\ventoy.json" w
FileWrite $0 "SLUG"
FileClose $0
!insertmacro ReplaceInFile "SLUG" "$NEWSLUG" "all" "all" "$BootDir\$JsonPath\ventoy.json" 
${LineFind} "$BootDir\$JsonPath\ventoy.json" "$BootDir\ventoy\ventoy.json" "1:-1" "DeleteEmptyLine" ; Remove any left over empty lines  

${ElseIf} ${FileExists} "$BootDir\$JsonPath\ventoy.json"
!insertmacro ReplaceInFile "$COMMENT" "$NEWCOMMENT" "all" "all" "$BootDir\$JsonPath\ventoy.json" 
!insertmacro ReplaceInFile "$OLDCOMMENT" "$COMMENT" "all" "all" "$BootDir\$JsonPath\ventoy.json" 
${LineFind} "$BootDir\ventoy\ventoy.json" "$BootDir\$JsonPath\ventoy.json" "1:-1" "DeleteEmptyLine" ; Remove any left over empty lines  

StrCpy $NEWCOMMENT ""
StrCpy $NEWSLUG ""
${EndIf}

${EndIf}
FunctionEnd

Function CasperSize
 IntOp $SizeOfCasper $SizeOfCasper + $Casper
FunctionEnd

Function GetCaspTools
SetShellVarContext all
InitPluginsDir
File /oname=$PLUGINSDIR\dd.exe "tools\dd.exe"
File /oname=$PLUGINSDIR\mke2fs.exe "tools\mke2fs.exe"
File /oname=$PLUGINSDIR\cygwin1.dll "tools\cygwin1.dll"
File /oname=$PLUGINSDIR\cyggcc_s-1.dll "tools\cyggcc_s-1.dll"
FunctionEnd