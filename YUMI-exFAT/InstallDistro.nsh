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
 * along with YUMI. If not, see <http://www.gnu.org/licenses/>.
 */
 
; ------------ Install Distros Macro -------------- 

!macro Install_Distros 

; If distro is already installed, delete it, so we don't make a mess.
 ${If} ${FileExists} "$BootDir\YUMI\$DistroPath\$JustISO"
  Delete "$BootDir\YUMI\$DistroPath\$JustISO" 
  ${LineFind} "$BootDir\YUMI\Installed.txt" "$BootDir\YUMI\Installed.txt" "1:-1" "DeleteInstalled" ; Remove the Installed entry
  ${LineFind} "$BootDir\YUMI\Installed.txt" "$BootDir\YUMI\Installed.txt" "1:-1" "DeleteEmptyLine" ; Remove any left over empty lines
 ${EndIf}

; Create the Path (container for Distro and persistence if available).
 ${IfNot} ${FileExists} "$BootDir\YUMI\$DistroPath\*.*"
  CreateDirectory "$BootDir\YUMI\$DistroPath" ; Create the Directory so we can copy the file to it.
 ${EndIf}
 
; Do Stuff with Distro 
 ${If} $DistroName != "" 
; Distro Specific
; Run Windows on VHDx (Virtual Hard Disk) from USB
 ${AndIf} $DistroName == "Phoenix LiteOS" 
 
   ${IfNot} ${FileExists} "$BootDir\Ventoy\ventoy_vhdboot.img"
     ${IfNot} ${FileExists} "$BootDir\Ventoy\*.*"
      CreateDirectory "$BootDir\Ventoy" ; Create the Directory so we can copy the file to it.
     ${EndIf}
     inetc::get /caption "ventoy_vhdboot.zip" /banner "Downloading VHD Boot Plugin" /nocancel "https://github.com/ventoy/vhdiso/releases/download/v3.0/ventoy_vhdboot.zip"  "$BootDir\ventoy\ventoy_vhdboot.zip" /end
     Pop $0 # return value = exit code, "OK" means OK
     DetailPrint "VHD Download Status: $0"
	 DetailPrint "Extracting ventoy_vhdboot.img" 
	 ExecWait '"$PLUGINSDIR\7zG.exe" x "$BootDir\ventoy\ventoy_vhdboot.zip" -o"$BootDir\ventoy" -y'
	 CopyFiles "$BootDir\ventoy\ventoy_vhdboot\Win10Based\ventoy_vhdboot.img" "$BootDir\ventoy\ventoy_vhdboot.img"
	 RMDir /R "$BootDir\ventoy\ventoy_vhdboot"
	 Delete "$BootDir\ventoy\ventoy_vhdboot.zip"
   ${EndIf}
   	 CreateDirectory "$EXEDIR\TEMPYUMI" ; Create the TEMPYUMI directory
	 
	 ${If} $Casper != "0"
	  StrCpy $VHDSize "$Casper" 
	 ${Else}
	  StrCpy $VHDSize "30000" 
	 ${EndIf}
	 
	 StrCpy $VHDLBL "Win11"
	 
	 !insertmacro ReplaceInFile "DSK" "$EXEDIR\TEMPYUMI" "all" "all" "$PLUGINSDIR\w2gdiskpart.txt" ;$BootDir\YUMI\$DistroPath
	 !insertmacro ReplaceInFile "SLUG" "$JustISOName" "all" "all" "$PLUGINSDIR\w2gdiskpart.txt" ;Phoenix-LiteOS-PRO
	 !insertmacro ReplaceInFile "DSK" "$EXEDIR\TEMPYUMI" "all" "all" "$PLUGINSDIR\diskpartdetach.txt" ;$BootDir\YUMI\$DistroPath
	 !insertmacro ReplaceInFile "SLUG" "$JustISOName" "all" "all" "$PLUGINSDIR\diskpartdetach.txt" ;Phoenix-LiteOS-PRO
	 !insertmacro ReplaceInFile "VHDFMT" "ntfs" "all" "all" "$PLUGINSDIR\w2gdiskpart.txt"  ; edit this to format type
	 !insertmacro ReplaceInFile "VHDSIZE" "$VHDSize" "all" "all" "$PLUGINSDIR\w2gdiskpart.txt"  ; edit this to beyond the calculated filesize in bytes
	 !insertmacro ReplaceInFile "VHDLBL" "$VHDLBL" "all" "all" "$PLUGINSDIR\w2gdiskpart.txt"  
	 
	 DetailPrint "Creating a Virtual Hard Disk for Phoenix LiteOS." 
	 nsExec::ExecToLog '"DiskPart" /S $PLUGINSDIR\w2gdiskpart.txt' 

	 DetailPrint "Installing $JustISOName to Virtual Hard Disk. Please be patient, this may take time..." 
	 DetailPrint "Extracting $ISOFile to $EXEDIR\TEMPYUMI" 
	 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -o"$EXEDIR\TEMPYUMI" -y'
	 
	 ;repass:
	 ;ExecWait '"$PLUGINSDIR\7zG.exe" e "$ISOFile" -ir!*iso -o"$EXEDIR\TEMPYUMI"'
	 ;${If} ${FileExists} "$EXEDIR\TEMPYUMI\*.iso"
	 ;ExecWait '"$PLUGINSDIR\7zG.exe" x "$EXEDIR\TEMPYUMI\*.iso" -o"$EXEDIR\TEMPYUMI" -y'
	 ;${Else} 
	 ;Goto repass
	 ;${EndIf}
	 
	 DetailPrint "Now copying AutoUnattend.xml"
     CopyFiles "$PLUGINSDIR\AutoUnattend.xml" "$EXEDIR\TEMPYUMI\unattend.xml"
	 
	 CopyFiles "$PLUGINSDIR\dskvol.txt" "$DestDisk\dskvol.txt" 
     Call GetVolNameDSK 
     StrCpy $VHDDisk "$VHDDisk" 1
	 Delete "$DestDisk\dskvol.txt"

	    ${If} ${FileExists} "$EXEDIR\TEMPYUMI\sources\install.wim" 
	        ${If} ${FileExists} "$WINDIR\System32\Dism.exe" 
	         DetailPrint "DISM will be used on install.wim"
			 !insertmacro ReplaceInFile "EXEDIR" "$EXEDIR" "all" "all" "$PLUGINSDIR\dismstuff.cmd" 
			 !insertmacro ReplaceInFile "USBDEV" "$VHDDisk" "all" "all" "$PLUGINSDIR\dismstuff.cmd" 
			 ExecWait '"cmd" /c $PLUGINSDIR\dismstuff.cmd'
	         ; ExecWait '"cmd" /c Dism /Apply-Image /ImageFile:"$EXEDIR\TEMPYUMI\sources\install.wim" /index:1 /ApplyDir:$VHDDisk:\'
	        ${Else}
			 DetailPrint "$WINDIR\System32\Dism.exe does not exist. We will use Wimlib."
		     ExecWait '"cmd" /c $PLUGINSDIR\wimlib\wimlib-imagex apply "$EXEDIR\TEMPYUMI\sources\install.wim" 1 $VHDDisk:\' 
	        ${EndIf}
	    ${EndIf}
	  
	    ${If} ${FileExists} "$EXEDIR\TEMPYUMI\sources\install.esd" 
	        ${If} ${FileExists} "$WINDIR\System32\Dism.exe" 
	   	     DetailPrint "DISM will be used on install.esd"
			 !insertmacro ReplaceInFile "install.wim" "install.esd" "all" "all" "$PLUGINSDIR\dismstuff.cmd"  
			 !insertmacro ReplaceInFile "USBDEV" "$VHDDisk" "all" "all" "$PLUGINSDIR\dismstuff.cmd" 
			 !insertmacro ReplaceInFile "EXEDIR" "$EXEDIR" "all" "all" "$PLUGINSDIR\dismstuff.cmd"  
			 ExecWait '"cmd" /c $PLUGINSDIR\dismstuff.cmd'
	         ; ExecWait '"cmd" /c Dism /Apply-Image /ImageFile:"$EXEDIR\TEMPYUMI\sources\install.esd" /index:1 /ApplyDir:$VHDDisk:\'
	        ${Else}
			 DetailPrint "$WINDIR\System32\Dism.exe does not exist. We will use Wimlib."
		     ExecWait '"cmd" /c $PLUGINSDIR\wimlib\wimlib-imagex apply "$EXEDIR\TEMPYUMI\sources\install.esd" 1 $VHDDisk:\' 
	        ${EndIf}
	    ${EndIf}
	  
	  CopyFiles "$PLUGINSDIR\AutoUnattend.xml" "B:\unattend.xml"
	  nsExec::ExecToLog '"DiskPart" /S $PLUGINSDIR\diskpartdetach.txt'  
	  
	  CopyFiles "$EXEDIR\TEMPYUMI\$JustISOName.vhdx" "$BootDir\YUMI\$DistroPath\$JustISOName.vhdx"
	  
	 ;; Delete "$EXEDIR\TEMPYUMI\*.*"
	 RMDir /R "$EXEDIR\TEMPYUMI"
	  
	 ;revert back in case of reuse during add additional distro
	 !insertmacro ReplaceInFile "$BootDir\YUMI\$DistroPath\$JustISOName" "DSK" "all" "all" "$PLUGINSDIR\w2gdiskpart.txt" 
	 !insertmacro ReplaceInFile "$JustISOName" "SLUG" "all" "all" "$PLUGINSDIR\w2gdiskpart.txt" 
	 !insertmacro ReplaceInFile "$BootDir\YUMI\$DistroPath\$JustISOName" "DSK" "all" "all" "$PLUGINSDIR\diskpartdetach.txt" 
	 !insertmacro ReplaceInFile "$JustISOName" "SLUG" "all" "all" "$PLUGINSDIR\diskpartdetach.txt"  
	 !insertmacro ReplaceInFile "ntfs" "VHDFMT" "all" "all" "$PLUGINSDIR\w2gdiskpart.txt"  ; edit this to format type
	 !insertmacro ReplaceInFile "$VHDSize" "VHDSIZE" "all" "all" "$PLUGINSDIR\w2gdiskpart.txt"  ; edit this to beyond the calculated filesize in bytes
	 !insertmacro ReplaceInFile "$VHDLBL" "VHDLBL" "all" "all" "$PLUGINSDIR\w2gdiskpart.txt"   	
	 
; For VDI
 ${ElseIf} $DistroName == "Ubuntu 22.04 Bootable VDI" 
  ${OrIf} $DistroName == "CentOS 7 Bootable VDI" 
     DetailPrint "Decompressing $JustISO to $BootDir\YUMI\$DistroPath\"
  	 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -o"$BootDir\YUMI\$DistroPath\" -y'
	 
; For Memtest + zip extraction
 ${ElseIf} $DistroName == "Memtest86 (Memory Testing Tool)" 
  ${OrIf} $DistroName == "Memtest86+ (Memory Testing Tool)" 
     DetailPrint "Copying $JustISO to $BootDir\YUMI\$DistroPath\"
     CopyFiles "$ISOFile" "$BootDir\YUMI\$DistroPath\$JustISO" ; Copy to Directory
	 DetailPrint "Extracting $JustISO from .zip" 
	 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -o"$BootDir\YUMI\$DistroPath\" -y'
 
; For all other Distros, just copy the ISO to the container
 ${Else}
  DetailPrint "Copying $JustISO to $BootDir\YUMI\$DistroPath\"
  CopyFiles "$ISOFile" "$BootDir\YUMI\$DistroPath\$JustISO" ; Copy the ISO to Directory
 ${EndIf}

; Write the Path to Installed.txt
 ${If} $DistroName == "Phoenix LiteOS" 
  ${InstalledList} "$DistroPath\$JustISOName.vhdx" $R0 
 ${Else}
  ${InstalledList} "$DistroPath\$JustISO" $R0 ; Write the ISO path name to the Installed List "Installed.txt" file (so we can keep track of installs for removal)
 ${EndIf}
 ${LineFind} "$BootDir\YUMI\Installed.txt" "$BootDir\YUMI\Installed.txt" "1:-1" "DeleteEmptyLine" ; Remove any left over empty lines 

 ; Enable and Create Casper if necessary
 ${If} $Persistence != "NULL"
 ${AndIf} $Casper != "0" ; Casper Slider (Size) was not Null
   Call CasperScript  
 ${EndIf}

!macroend