/*
  This file is part of YUMI

  YUMI is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 2 of the License, or
  any later version.

  YUMI is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with YUMI.  If not, see <http://www.gnu.org/licenses/>.

  YUMI Copyright https://www.pendrivelinux.com (See YUMI-Copying.txt and YUMI-Readme.txt for more information, Credits, and Licensing)
*/

!define NAME "YUMI exFAT"
!define FILENAME "YUMI-exFAT"
!define VERSION "1.0.1.1"
!define MUI_ICON "images\usbicon.ico"

; MoreInfo Plugin - Adds Version Tab fields to Properties. Plugin created by onad http://nsis.sourceforge.net/MoreInfo_plug-in
VIProductVersion "${VERSION}"
VIAddVersionKey CompanyName "pendrivelinux.com"
VIAddVersionKey LegalCopyright "Copyright 2023 Lance Pendrivelinux.com"
VIAddVersionKey FileVersion "${VERSION}"
VIAddVersionKey FileDescription "YUMI - Your USB MultiBoot Installer"
VIAddVersionKey License "GPL Version 2"

Name "${NAME} ${VERSION}"
OutFile "Output\${FILENAME}-${VERSION}.exe"
RequestExecutionLevel admin ;highest
SetCompressor /SOLID lzma
CRCCheck On
XPStyle on
ShowInstDetails show
BrandingText "${NAME} ${VERSION}"
CompletedText "All Finished, Process is Complete!"
InstallButtonText "Create"
Unicode True

!include WinVer.nsh
!include WordFunc.nsh
!include nsDialogs.nsh
!include MUI2.nsh
!include FileFunc.nsh
!include LogicLib.nsh
;!include TextFunc.nsh
!addplugindir "plugins"

; Variables
Var JsonPath
Var Capacity
Var VolName
Var Checker
Var FileFormat
Var Format
Var FormatMe
Var BlockSize
Var Dialog
Var LabelDrivePage
Var Distro
Var DistroName
Var ISOFileName
Var DestDriveTxt
Var JustDrive
Var DestDrive
Var BootDir
Var LinuxDistroSelection
Var LabelISOSelection
Var ISOFileTxt
Var TheISO
Var IsoFile
Var ISOSelection
Var ISOTest
Var JustISO
Var JustISOName
Var JustISOPath
Var DestDisk
Var DownloadISO
Var DownloadMe
Var Link
Var Link1
Var Link2
Var Links
Var Links1
Var Links2
Var Auth
Var DownLink
Var LocalSelection
Var Letters
Var DistroPath
Var SomeFileExt
Var AllDriveOption
Var DisplayAll
Var DistroLink
Var Homepage
Var OfficialSite
Var OfficialName
Var NameThatISO
Var Uninstaller
Var Removal
Var InUnName
Var InUnStall
Var InUnStalling
Var InUnStalled
Var OnFrom
Var RepeatInstall
Var ShowAll
Var ForceShowAll
Var ShowingAll
Var SizeOfCasper
Var Casper
Var CasperSlider
Var CasperSelection
Var SlideSpot
Var RemainingSpace
; Var MaxPersist
Var Persistence
Var CasperName
Var COMSPEC
Var PERCENT
Var FSType
Var DiskNum
Var BOOT_DISK
Var INST_DISK
Var NEWSLUG
Var NEWCOMMENT
Var OLDCOMMENT
Var COMMENT
Var DELPERSIST
Var PersistName
Var PersistName2
Var VHDSize 
Var VHDLBL 
Var WINE
Var VHDDisk

!include ReplaceInFile.nsh
!include DiskVoodoo.nsh

; Interface settings
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "images\usb-logo-nsis.bmp"
!define MUI_HEADERIMAGE_BITMAP_NOSTRETCH
!define MUI_HEADERIMAGE_RIGHT

; License Agreement Page
!define MUI_TEXT_LICENSE_SUBTITLE $(License_Subtitle)
!define MUI_LICENSEPAGE_TEXT_TOP $(License_Text_Top)
!define MUI_LICENSEPAGE_TEXT_BOTTOM $(License_Text_Bottom)
!define MUI_PAGE_CUSTOMFUNCTION_PRE License_PreFunction
!insertmacro MUI_PAGE_LICENSE "YUMI-Copying.txt"

; Distro Selection Page
Page custom SelectionsPage

; Install Files Page
!define MUI_INSTFILESPAGE_COLORS "00FF00 000000" ;Green and Black
!define MUI_INSTFILESPAGE_FINISHHEADER_TEXT $(Finish_Install)
!define MUI_TEXT_INSTALLING_TITLE $(Install_Title)
!define MUI_TEXT_INSTALLING_SUBTITLE $(Install_SubTitle)
!define MUI_TEXT_FINISH_SUBTITLE $(Install_Finish_Sucess)
!define MUI_PAGE_CUSTOMFUNCTION_PRE InstFiles_PreFunction
!insertmacro MUI_PAGE_INSTFILES

; Finish page
!define MUI_FINISHPAGE_TITLE $(Finish_Title)
!define MUI_FINISHPAGE_TEXT $(Finish_Text)
!define MUI_FINISHPAGE_LINK $(Finish_Link)
!define MUI_FINISHPAGE_LINK_LOCATION "https://www.pendrivelinux.com/boot-multiple-iso-from-usb-multiboot-usb/"
!define MUI_WELCOMEFINISHPAGE_BITMAP "images\finish.bmp"
!define MUI_PAGE_CUSTOMFUNCTION_PRE Finish_PreFunction
!insertmacro MUI_PAGE_FINISH

; English Language files
!insertmacro MUI_LANGUAGE "English" ; first language is the default language
LangString License_Subtitle ${LANG_ENGLISH} "Please review the license terms before proceeding"
LangString License_Text_Top ${LANG_ENGLISH} "The software within this program falls under the following Licenses."
LangString License_Text_Bottom ${LANG_ENGLISH} "You must accept the terms of this License agreement to run this ${NAME}. If you agree, Click I Agree to Continue."
LangString SelectDist_Title ${LANG_ENGLISH} "Drive Selection and Distro Options Page"
LangString SelectDist_Subtitle ${LANG_ENGLISH} "Choose your Flash Drive, and a Distro, ISO/ZIP file.$\r$\nAdditional Distributions can be added each time this tool is run."
LangString DrivePage_Text ${LANG_ENGLISH} "Step 1: Select your USB device."
LangString Distro_Text ${LANG_ENGLISH} "Step 2: Select a Distribution from the list to put on your USB."
LangString IsoPage_Text ${LANG_ENGLISH} "Step 3: Select the $FileFormat (Name must be the same as above)."
LangString IsoPage_Title ${LANG_ENGLISH} "Select Your $FileFormat"
LangString Casper_Text ${LANG_ENGLISH} "Step 4: Set a Persistent file size for storing changes (Optional)."
LangString IsoFile ${LANG_ENGLISH} "$FileFormat file|$ISOFileName" ;$ISOFileName variable previously *.iso
LangString Extract ${LANG_ENGLISH} "Extracting the $FileFormat: The progress bar will not move until finished. Please be patient..."
LangString CreateSysConfig ${LANG_ENGLISH} "Creating configuration files for $DestDisk"
LangString ExecuteSyslinux ${LANG_ENGLISH} "Executing syslinux on $BootDir"
LangString SkipSyslinux ${LANG_ENGLISH} "Good Syslinux Exists..."
LangString WarningSyslinux ${LANG_ENGLISH} "An error ($R8) occurred while executing syslinux.$\r$\nYour USB drive won't be bootable..."
LangString WarningSyslinuxOLD ${LANG_ENGLISH} "This YUMI revision uses a newer Syslinux version that is not compatible with earlier revisions.$\r$\nPlease ensure your USB drive doesn't contain earlier revision installs."
LangString Install_Title ${LANG_ENGLISH} "$InUnStalling $InUnName"
LangString Install_SubTitle ${LANG_ENGLISH} "Please wait while we $InUnStall $InUnName $OnFrom $JustDrive"
LangString Install_Finish_Sucess ${LANG_ENGLISH} "${NAME} $InUnStalled $InUnName $OnFrom $JustDrive"
LangString Finish_Install ${LANG_ENGLISH} "Process Complete."
LangString Finish_Title ${LANG_ENGLISH} "Thanks for using ${NAME}"
LangString Finish_Text ${LANG_ENGLISH} "Your Selections have been $InUnStalled on your USB drive.$\r$\n$\r$\nFeel Free to run this tool again to $InUnStall more Distros.$\r$\n$\r$\nYUMI will keep track of selections you have already $InUnStalled."
LangString Finish_Link ${LANG_ENGLISH} "Visit the YUMI Home Page"

!include FileManipulation.nsh ; Text File Manipulation
!include FileNames.nsh ; Macro for FileNames
!include DistroList.nsh ; List of Distributions
!include StrContains.nsh ; Let's check if a * wildcard exists
!include "CasperScript.nsh" ; For creation of Persistent files

Function License_PreFunction
  StrCpy $R8 1 ;This is the 1st page
FunctionEnd

Function SelectionsPage
  StrCpy $R8 2
 !insertmacro MUI_HEADER_TEXT $(SelectDist_Title) $(SelectDist_Subtitle)
  nsDialogs::Create 1018
  Pop $Dialog

 ${If} $RepeatInstall == "YES"
 ${NSD_SetText} $DestDriveTxt "$DestDrive"

; To Install or Uninstall? That is the question!
  ${NSD_CreateCheckBox} 60% 0 44% 15 "View or Remove Installed Distros?"
  Pop $Uninstaller
  ${NSD_OnClick} $Uninstaller Uninstall

 ; Distro Selection Starts
  ${NSD_CreateLabel} 0 50 50% 15 $(Distro_Text)
  Pop $LinuxDistroSelection

  ${NSD_CreateDroplist} 0 70 55% 95 "" ; was  ${NSD_CreateListBox} ; Enable For DropBox
  Pop $Distro
  ${NSD_OnChange} $Distro OnSelectDistro
  ${NSD_CB_SelectString} $Distro $DistroName ; Was ${NSD_LB_SelectString} $Distro $DistroName  ; Enable For DropBox

; Force Show All ISO Option
  ${NSD_CreateCheckBox} 80% 100 20% 15 "Show All ISOs?"
  Pop $ForceShowAll
  ${NSD_OnClick} $ForceShowAll ShowAllISOs

; ISO Download Option
  ${NSD_CreateCheckBox} 60% 60 40% 15 "Download the ISO (Optional)."
  Pop $DownloadISO
  ${NSD_OnClick} $DownloadISO DownloadIt

; Clickable Link to Distribution Homepage
  ${NSD_CreateLink} 60% 80 40% 15 "Visit the $OfficialName HomePage"
  Pop $DistroLink
  ${NSD_OnClick} $DistroLink onClickLinuxSite

; ISO Selection Starts
  ${NSD_CreateLabel} 0 100 100% 15 $(IsoPage_Text)
  Pop $LabelISOSelection
  ${NSD_CreateText} 0 120 78% 20 "Browse to and select the $FileFormat"
  Pop $ISOFileTxt
  ${NSD_CreateBrowseButton} 85% 120 60 20 "Browse"
  Pop $ISOSelection
  ${NSD_OnClick} $ISOSelection ISOBrowse

; Casper-RW Selection Starts
  ${NSD_CreateLabel} 0 150 75% 15 $(Casper_Text)
  Pop $CasperSelection

  ${NSD_CreateLabel} 52% 178 25% 25 ""
  Pop $SlideSpot

  nsDialogs::CreateControl "msctls_trackbar32" "0x50010000|0x00000018" "" 0 174 50% 25 ""
  Pop $CasperSlider

  SendMessage $CasperSlider ${TBM_SETRANGEMIN} 1 0 ; Min Range Value 0
  SendMessage $CasperSlider ${TBM_SETRANGEMAX} 1 $RemainingSpace ; Max Range Value $RemainingSpace
  ${NSD_OnNotify} $CasperSlider onNotify_CasperSlider

; Drive Pre-Selection
  ${NSD_CreateLabel} 0 0 58% 15 ""
  Pop $LabelDrivePage
  ${NSD_SetText} $LabelDrivePage "Step 1: YUMI Summoned $DestDrive as your USB Device"

; Droplist for Drive Selection
  ${NSD_CreateDropList} 0 20 55% 15 ""
  Pop $DestDriveTxt

  ${GetDrives} "FDD+HDD" DrivesList

  ${NSD_CB_SelectString} $DestDriveTxt "$DestDrive"
   StrCpy $9 $DestDrive 3
   StrCpy $JustDrive $9
   Call PhysDrive
   Call GetDiskVolumeName
   Call DiskSpace
   Call GetFSType
   StrCpy $JustDrive $DestDrive 3
   StrCpy $BootDir $DestDrive 2 ;was -1
   StrCpy $DestDisk $DestDrive 2 ;was -1


   SendMessage $Distro ${CB_RESETCONTENT} 0 0 ; Clear all distro entries because a new drive may have been chosen ; Enable for DropBox
   StrCpy $Checker "YES"
   Call InstallorRemove
   Call SetSpace
   Call CheckSpace
   Call FormatIt
   Call EnableNext
  ${NSD_OnChange} $DestDriveTxt OnSelectDrive
 ; MessageBox MB_ICONSTOP|MB_OK "$9 is on (Disk $DiskNum) or (Disk $INST_DISK) and $VolName with $Capacity and a $FSType filesystem"

; Add Home Link
  ${NSD_CreateLink} 0 215 16% 15 "Home Page"
  Pop $Link
  ${NSD_OnClick} $LINK onClickMyLink

; Add Help Link
  ${NSD_CreateLink} 16% 215 9% 15 "FAQ"
  Pop $Link1
  ${NSD_OnClick} $LINK1 onClickMyLinkFAQ

; Add Giveback Link
  ${NSD_CreateLink} 25% 215 30% 15 "Recommended Flash Drives"
  Pop $Link2
  ${NSD_OnClick} $LINK2 onClickMyLinkUSB

; Disable Next Button until a selection is made for all
  GetDlgItem $6 $HWNDPARENT 1
  EnableWindow $6 0
; Remove Back Button
  GetDlgItem $6 $HWNDPARENT 3
  ShowWindow $6 0
; Hide or disable steps until we state to display them
  EnableWindow $LabelISOSelection 0
  EnableWindow $ISOFileTxt 0
  ShowWindow $ISOSelection 0
  EnableWindow $DownloadISO 0
  ShowWindow $DistroLink 0
  StrCpy $JustISOName "NULL" ; Set to NULL until something is selected
  nsDialogs::Show

 ${Else}

; To Install or Uninstall? That is the question!
  ${NSD_CreateCheckBox} 60% 0 44% 15 "View or Remove Installed Distros?"
  Pop $Uninstaller
  ${NSD_OnClick} $Uninstaller Uninstall

; Drive Selection Starts
  ${NSD_CreateLabel} 0 0 58% 15 ""
  Pop $LabelDrivePage
  ${NSD_SetText} $LabelDrivePage "Step 1: Select the Drive Letter of your USB Device."

; Droplist for Drive Selection
  ${NSD_CreateDropList} 0 20 40% 15 "" ; was 0 20 15% 15
  Pop $DestDriveTxt
  Call ListAllDrives
  ${NSD_OnChange} $DestDriveTxt OnSelectDrive

; All Drives Option
  ${NSD_CreateCheckBox} 41% 23 17% 15 "Show All" ; was 17% 23 41% 15
  Pop $AllDriveOption
  ${NSD_OnClick} $AllDriveOption ListAllDrives

; Format Drive Option
  ${NSD_CreateCheckBox} 60% 23 100% 15 "Prepare Drive for YUMI"
  Pop $Format
  ${NSD_OnClick} $Format FormatIt

; Distro Selection Starts
  ${NSD_CreateLabel} 0 50 50% 15 $(Distro_Text)
  Pop $LinuxDistroSelection

  ${NSD_CreateDropList} 0 70 55% 95 "" ; was ${NSD_CreateListBox} ; Enable for Dropbox
  Pop $Distro
  ${NSD_OnChange} $Distro OnSelectDistro
  ${NSD_CB_SelectString} $Distro $DistroName ; Was ${NSD_LB_SelectString} $Distro $DistroName  ; Enable For DropBox

; Force Show All ISO Option
  ${NSD_CreateCheckBox} 80% 100 20% 15 "Show All ISOs?"
  Pop $ForceShowAll
  ${NSD_OnClick} $ForceShowAll ShowAllISOs

; ISO Download Option
  ${NSD_CreateCheckBox} 60% 60 40% 15 "Download the ISO (Optional)."
  Pop $DownloadISO
  ${NSD_OnClick} $DownloadISO DownloadIt

; Clickable Link to Distribution Homepage
  ${NSD_CreateLink} 60% 80 40% 15 "Visit the $OfficialName HomePage"
  Pop $DistroLink
  ${NSD_OnClick} $DistroLink onClickLinuxSite

; ISO Selection Starts
  ${NSD_CreateLabel} 0 100 100% 15 $(IsoPage_Text)
  Pop $LabelISOSelection
  ${NSD_CreateText} 0 120 78% 20 "Browse to and select the $FileFormat"
  Pop $ISOFileTxt
  ${NSD_CreateBrowseButton} 85% 120 60 20 "Browse"
  Pop $ISOSelection
  ${NSD_OnClick} $ISOSelection ISOBrowse

; Casper-RW Selection Starts
  ${NSD_CreateLabel} 0 150 75% 15 $(Casper_Text)
  Pop $CasperSelection

  ${NSD_CreateLabel} 52% 178 25% 25 ""
  Pop $SlideSpot

  nsDialogs::CreateControl "msctls_trackbar32" "0x50010000|0x00000018" "" 0 174 50% 25 ""
  Pop $CasperSlider

  SendMessage $CasperSlider ${TBM_SETRANGEMIN} 1 0 ; Min Range Value 0
  SendMessage $CasperSlider ${TBM_SETRANGEMAX} 1 $RemainingSpace ; Max Range Value $RemainingSpace
  ${NSD_OnNotify} $CasperSlider onNotify_CasperSlider

;; Add Help Link
;  ${NSD_CreateLink} 0 215 65% 15 "Click HERE to visit the YUMI page for additional info!"
;  Pop $Link
;  ${NSD_OnClick} $LINK onClickMyLink

; Add Home Link
  ${NSD_CreateLink} 0 215 16% 15 "Home Page"
  Pop $Link
  ${NSD_OnClick} $LINK onClickMyLink

; Add Help Link
  ${NSD_CreateLink} 16% 215 9% 15 "FAQ"
  Pop $Link1
  ${NSD_OnClick} $LINK1 onClickMyLinkFAQ

; Add Giveback Link
  ${NSD_CreateLink} 25% 215 30% 15 "Recommended Flash Drives"
  Pop $Link2
  ${NSD_OnClick} $LINK2 onClickMyLinkUSB

;; Add a custom donate button
;   ${NSD_CreateBitmap} 80% 125 20% 50 "PayPal Donation"
;   Var /Global Donate
;   Var /Global DonateHandle
;   Pop $Donate
;   ${NSD_SetImage} $Donate $PLUGINSDIR\paypal.bmp $DonateHandle
;  GetFunctionAddress $DonateHandle OnClickDonate
;  nsDialogs::OnClick $Donate $DonateHandle

; Disable Next Button until a selection is made for all
  GetDlgItem $6 $HWNDPARENT 1
  EnableWindow $6 0
; Remove Back Button
  GetDlgItem $6 $HWNDPARENT 3
  ShowWindow $6 0
; Hide or disable steps until we state to display them
  EnableWindow $LabelISOSelection 0
  EnableWindow $ISOFileTxt 0
  ShowWindow $ISOSelection 0
  EnableWindow $LinuxDistroSelection 0
  EnableWindow $Distro 0
  EnableWindow $DownloadISO 0
  ShowWindow $DistroLink 0
  ShowWindow $CasperSelection 0
  ShowWindow $CasperSlider 0
  ShowWindow $SlideSpot 0
  ShowWindow $Format 0
  ShowWindow $ForceShowAll 0
  ShowWindow $Uninstaller 0
  nsDialogs::Show
 ${EndIf}
FunctionEnd

Function InstFiles_PreFunction
  StrCpy $R8 3
FunctionEnd

Function Finish_PreFunction
  StrCpy $R8 4
  Call NoQuit
FunctionEnd

Function ListAllDrives ; Set to Display All Drives
  SendMessage $DestDriveTxt ${CB_RESETCONTENT} 0 0
  ${NSD_GetState} $AllDriveOption $DisplayAll
  ${If} $DisplayAll == ${BST_CHECKED}
   ${NSD_Check} $AllDriveOption
   ${NSD_SetText} $AllDriveOption "All Shown"
    StrCpy $ShowAll "YES"
    ${GetDrives} "FDD+HDD" DrivesList ; All Drives Listed
  ${ElseIf} $DisplayAll == ${BST_UNCHECKED}
   ${NSD_Uncheck} $AllDriveOption
   ${NSD_SetText} $AllDriveOption "Show All"
    StrCpy $ShowAll "NO"
   ${GetDrives} "FDD" DrivesList ; FDD+HDD reduced to FDD for removable media only
  ${EndIf}
FunctionEnd

/* Function onClickMyLink
  Pop $Links ; pop something to prevent corruption
  ExecShell "open" "https://www.pendrivelinux.com/yumi-multiboot-usb-creator/"
FunctionEnd

Function onClickLinuxSite
  Pop $OfficialSite
  ExecShell "open" "$Homepage"
FunctionEnd */

Function onClickMyLink
  Pop $Links ; pop something to prevent corruption
  ExecShell "open" "https://www.pendrivelinux.com/yumi-multiboot-usb-creator/"
FunctionEnd

Function onClickMyLinkFAQ
  Pop $Links1 ; pop something to prevent corruption
  ExecShell "open" "https://www.pendrivelinux.com/yumi-multiboot-usb-creator/#FAQ"
FunctionEnd

Function onClickMyLinkUSB
  Pop $Links2 ; pop something to prevent corruption
  ExecShell "open" "https://www.pendrivelinux.com/recommended-usb-flash-drives/"
FunctionEnd

Function onClickLinuxSite
  Pop $OfficialSite
  ExecShell "open" "$Homepage"
FunctionEnd

Function DownloadIt ; Set Download Option
  ${NSD_GetState} $DownloadISO $DownloadMe
  ${If} $DownloadMe == ${BST_CHECKED}
  ${NSD_Check} $DownloadISO
  ${NSD_SetText} $DownloadISO "Opened Download Link"
  Call DownloadLinks
  ${ElseIf} $DownloadMe == ${BST_UNCHECKED}
  ${NSD_Uncheck} $DownloadISO
  ${NSD_SetText} $DownloadISO "Download Link"
  ${EndIf}
FunctionEnd

Function EnableNext ; Enable Install Button
 ; ${If} $Blocksize >= 4
  ${If} $Removal != "YES"
  ShowWindow $Format 1
  ${Else}
  ShowWindow $Format 0
  ${EndIf}
  ${If} $Removal != "YES"
   ${AndIf} $ISOFileName != ""
    ${AndIf} $ISOFile != ""
     ${AndIf} $DestDrive != ""
      ${AndIf} $ISOTest != ""
  StrCpy $InUnStall "Add"
   StrCpy $InUnStalling "Adding"
    StrCpy $InUnStalled "Added"
  StrCpy $OnFrom "to"
  StrCpy $InUnName "$JustISOName"
  GetDlgItem $6 $HWNDPARENT 1 ; Get "Install" control handle
   SendMessage $6 ${WM_SETTEXT} 0 "STR:Create"
    EnableWindow $6 1 ; Enable "Install" control button

  ${ElseIf} $Removal == "YES"
   ${AndIf} $ISOFileName != ""
     ${AndIf} $DestDrive != ""
      ${AndIf} $ISOTest != ""
  StrCpy $InUnStall "Remove"
   StrCpy $InUnStalling "Removing"
    StrCpy $InUnStalled "Removed"
  StrCpy $OnFrom "from"
  StrCpy $InUnName "$DistroName"
  GetDlgItem $6 $HWNDPARENT 1 ; Get "Install" control handle
   SendMessage $6 ${WM_SETTEXT} 0 "STR:Remove"
    EnableWindow $6 1 ; Enable "Install" control button
  ${EndIf}

; Test if ISO has been Selected. If not, disable Install Button
  ${If} $ISOTest == ""
  GetDlgItem $6 $HWNDPARENT 1
  EnableWindow $6 0 ; Disable "Install" if ISO not set
  ${EndIf}

; Show Steps in progression
  ${If} $DestDrive != ""
  EnableWindow $LinuxDistroSelection 1
  EnableWindow $Distro 1
  ${EndIf}

  ${If} $ISOFileName != ""
  ${AndIf} $Removal != "YES"
  EnableWindow $LabelISOSelection 1
  EnableWindow $ISOFileTxt 1
  ShowWindow $ISOSelection 1

  ${AndIf} $Removal == "YES"
  EnableWindow $LabelISOSelection 0
  EnableWindow $ISOFileTxt 0
  ShowWindow $ISOSelection 0
  ${EndIf}

; Disable Window if ISO was downloaded
  ${If} $TheISO == "$EXEDIR\$ISOFileName"
  ${AndIf} $ISOTest != ""
  EnableWindow $ISOSelection 0
  SetCtlColors $ISOFileTxt 009900 FFFFFF
  ${EndIf}

; If using Casper Persistence...
  ${If} $Persistence != "NULL" ; If can use Persistence...
  ${AndIf} $TheISO != ""
  ${AndIf} $BootDir != ""
  ShowWindow $CasperSelection 1
  ShowWindow $CasperSlider 1
  ShowWindow $SlideSpot 1
  ;${NSD_SetText} $Format "Format $JustDrive Drive (Erases Content)"

; Else If not using Casper Persistence...
  ${ElseIf} $Persistence == "NULL"
  ${OrIf} $Removal == "YES"
  ShowWindow $CasperSelection 0
  ShowWindow $CasperSlider 0
  ShowWindow $SlideSpot 0
  ;${NSD_SetText} $Format "Format $JustDrive Drive (Erases Content)"
  ${EndIf}
FunctionEnd

Function DownloadLinks
MessageBox MB_YESNO|MB_ICONQUESTION "Launch the Download Link?$\r$\nLet the download finish before moving to step 2." IDYES DownloadIt IDNO Skip
  Skip: ; Reset Download Checkbox Options
  ${NSD_Uncheck} $DownloadISO
  ${NSD_SetText} $DownloadISO "Download Link"
  EnableWindow $DownloadISO 1
  Goto end
  DownloadIt:
  ${NSD_SetText} $LabelISOSelection "Step 3: Once your download has finished, Browse and select the ISO."
  EnableWindow $DownloadISO 0
  ExecShell "open" "$DownLink"
  end:
FunctionEnd

Function LocalISODetected ; The script autodetected the ISO, so let's do the following
 ${If} $DownloadMe != ${BST_CHECKED}
 ${AndIf} $LocalSelection != "YES"
 StrCpy $ISOFile "$EXEDIR\$ISOFileName"
 ${EndIf}
FunctionEnd

; get only the filename
Function GrabNameOnly
  Exch $4 ; count to get part
  Exch
  Exch $0 ; input string
  Push $1
  Push $2
  Push $3
  StrCpy $1 0
  StrCpy $3 1
  loop:
    IntOp $1 $1 - 1
    StrCpy $2 $0 1 $1
    StrCmp $2 "" exit2
    StrCmp $2 "\" next ; grab text to the right of "\"
    Goto loop
  next:
    StrCmp $3 $4 exit
    IntOp $3 $3 + 1
  Goto loop
  exit2:
    IntOp $1 $1 - 1
  exit:
    IntOp $1 $1 + 1
    StrCpy $0 $0 "" $1
    Pop $3
    Pop $2
    Pop $1
    Exch $0 ; output string
FunctionEnd

; !include StrContains.nsh ; Let's check if a * wildcard exists

; On Selection of Linux Distro
Function OnSelectDistro
  Pop $Distro
  
  ${If} $Removal == "YES"
   ShowWindow $ForceShowAll 0
  ${Else}
   ShowWindow $ForceShowAll 1
  ${EndIf}

  ${NSD_GetText} $Distro $DistroName
  StrCpy $DistroName "$DistroName"
  StrCpy $Checker "No"
  ${If} $Removal == "YES"
  StrCpy $ISOFileName "$DistroName"
  StrCpy $ISOTest "$DistroName"
  ${Else}
  Call SetISOFileName
  StrCpy $ISOFileName "$ISOFileName"
  StrCpy $SomeFileExt "$ISOFileName" "" -3 ; Grabs the last 3 characters of the file name... zip or iso?
  StrCpy $FileFormat "$SomeFileExt" ; Set file type to look for zip, tar, iso etc...
  ${NSD_SetText} $LabelISOSelection "Step 3: Browse and Select your $ISOFileName"
  ${NSD_SetText} $ISOFileTxt "Browse to your $ISOFileName  -->"
  SetCtlColors $ISOFileTxt FF0000 FFFFFF
  StrCpy $ISOTest "" ; Set to null until a new ISO selection is made
  ${EndIf}
  
  ${If} $DistroName == "Phoenix LiteOS"
    ${NSD_SetText} $CasperSelection "Step 4: Set how large a VHDx file to create. ($RemainingSpace MB) left." 
  ${Else}
    ${NSD_SetText} $CasperSelection "$(Casper_Text)" 
  ${EndIf}

; Redraw Home page Links as necessary
  ${NSD_SetText} $DistroLink "Visit the $OfficialName Home Page"
  ShowWindow $DistroLink 0
  ${If} $OfficialName == ""
   ${OrIf} $Removal == "YES"
  ShowWindow $DistroLink 0
  ${Else}
  ShowWindow $DistroLink 1
  ${EndIf}

; Autodetect ISO's in same folder and select if they exist
 ${If} ${FileExists} "$EXEDIR\$ISOFileName"
 ${AndIf} $Removal != "YES"
 ${StrContains} $WILD "*" "$ISOFileName" ; Check for Wildcard and force Browse if * exists.
 ${AndIf} $WILD != "*"
  StrCpy $TheISO "$EXEDIR\$ISOFileName"
  StrCpy $ISOFile "$TheISO"
  ${GetFileName} "$TheISO" $JustISO
  ${GetBaseName} "$JustISO" $JustISOName
 ${StrRep} '$JustISOName' '$JustISOName' ' ' '-'
  ${GetParent} "$TheISO" $JustISOPath
  EnableWindow $DownloadISO 0
  ${NSD_SetText} $DownloadISO "We Found and Selected the $SomeFileExt."
  EnableWindow $ISOSelection 0
  SetCtlColors $ISOFileTxt 009900 FFFFFF
  ${NSD_SetText} $ISOFileTxt $ISOFile
  ${NSD_SetText} $LabelISOSelection "Step 3 DONE: $ISOFileName Found and Selected!"
  StrCpy $ISOTest "$TheISO" ; Populate ISOTest so we can enable Next
  Call EnableNext

 ${ElseIf} ${FileExists} "$EXEDIR\$ISOFileName"
 ${AndIf} $Removal != "YES"
 ${AndIf} $WILD == "*"
  EnableWindow $DownloadISO 1
  EnableWindow $ISOSelection 1
  ${NSD_Uncheck} $DownloadISO
  ${NSD_SetText} $DownloadISO "Download Link"
  SetCtlColors $ISOFileTxt FF9B00 FFFFFF
  ${NSD_SetText} $ISOFileTxt "Browse to and select the $ISOFileName"
  ${NSD_SetText} $LabelISOSelection "Step 3 PENDING: Browse to your $ISOFileName"
  Call EnableNext

 ${Else}
  Call EnableNext
  EnableWindow $DownloadISO 1
  EnableWindow $ISOSelection 1
  ${NSD_Uncheck} $DownloadISO
  ${NSD_SetText} $DownloadISO "Download Link"
 ${EndIf}

 ${If} $DownLink == "NONE"
  ${OrIf} $Removal == "YES"
  ShowWindow $DownloadISO 0
 ${Else}
  ShowWindow $DownloadISO 1
 ${EndIf}

FunctionEnd

; On Selection of ISO File
Function ISOBrowse
 ${If} $ShowingAll == "YES"
  StrCpy $ISOFileName "*.iso"
 ${ElseIf} $ShowingAll != "YES"
  Call SetISOFileName
 ${EndIf}

 nsDialogs::SelectFileDialog open "" $(IsoFile)
 Pop $TheISO
 ${NSD_SetText} $ISOFileTxt $TheISO
 SetCtlColors $ISOFileTxt 009900 FFFFFF
 EnableWindow $DownloadISO 0
 ${NSD_SetText} $DownloadISO "Local $SomeFileExt Selected."
 StrCpy $ISOTest "$TheISO" ; Populate ISOTest so we can enable Next
 StrCpy $ISOFile "$TheISO"
 ${GetFileName} "$TheISO" $JustISO
  ${StrRep} '$JustISO' '$JustISO' ' ' '-'
 ${GetBaseName} "$JustISO" $JustISOName
 ${StrRep} '$JustISOName' '$JustISOName' ' ' '-'
 ${GetParent} "$TheISO" $JustISOPath
 StrCpy $LocalSelection "YES"
  Call SetISOSize
  Call SetSpace
  Call CheckSpace
  Call HaveSpacePre
 ${If} $JustISOName == ""
 StrCpy $JustISOName "NULL" ; Set to NULL until something is selected
 ${EndIf}

 ${If} ${FileExists} "$BootDir\YUMI\$DistroPath\$JustISO"
 ${AndIf} $JustISOName != ""
 ${AndIf} $FormatMe != "YES"
  MessageBox MB_OK "$BootDir\YUMI\$DistroPath\$JustISO is already installed. You should remove it first!$\r$\n$\r$\nIf you proceed without removal, YUMI will remove and replace the directory and files for you."
 ${EndIf}
 Call EnableNext
 ; Uncomment for Testing --> MessageBox MB_ICONQUESTION|MB_OK 'Removal: "$Removal"  ISOFileName: "$ISOFileName" ISOFile "$ISOFile" BootDir: "$BootDir" DestDisk: "$DestDisk" DestDrive: "$DestDrive" ISOTest: "$ISOTest"'
 FunctionEnd

Function ClearAll
StrCpy $ISOTest ""
StrCpy $DistroName "" ; Clear Distro Name
StrCpy $ISOFileName "" ; Clear ISO Selection
StrCpy $SomeFileExt ""
StrCpy $FileFormat ""
StrCpy $JustISO ""
StrCpy $JustISOName ""
FunctionEnd

Function InstallorRemove ; Populate DistroName based on Install/Removal option
  ${If} $Removal == "YES"
  Call RemovalList
  ${Else}
   ${NSD_SetText} $LinuxDistroSelection "Step 2: Select a Distribution to put on $DestDisk"
  Call SetISOFileName
  ${EndIf}
FunctionEnd

; On Selection of Uninstaller Option
Function Uninstall
  ${NSD_GetState} $Uninstaller $Removal
  ${If} $Removal == ${BST_CHECKED}
  ShowWindow $Format 0
    ShowWindow $LabelISOSelection 0
    Call ClearAll
    EnableWindow $ISOFileTxt 0
    ShowWindow $ISOFileTxt 0
    ShowWindow $ISOSelection 0
    ShowWindow $ForceShowAll 0
    ShowWindow $CasperSelection 0
    ShowWindow $CasperSlider 0
    ShowWindow $SlideSpot 0
    StrCpy $Persistence "NULL"

  ${NSD_Check} $Uninstaller
  StrCpy $Removal "YES"
  ShowWindow $DistroLink 0
  ShowWindow $DownloadISO 0
   GetDlgItem $6 $HWNDPARENT 1 ; Get "Install" control handle
    SendMessage $6 ${WM_SETTEXT} 0 "STR:Remove"
    EnableWindow $6 0 ; Disable "Install" control button
   ${NSD_SetText} $Uninstaller "You're in Uninstaller Mode!"
   ${NSD_SetText} $LinuxDistroSelection "Step 2: Select a Distribution to remove from $DestDisk"
    SendMessage $Distro ${CB_RESETCONTENT} 0 0 ; Clear all distro entries because a new option may have been chosen ; Enable for DropBox
     StrCpy $Checker "YES"
     Call RemovalList

  ${ElseIf} $Removal == ${BST_UNCHECKED}
   ShowWindow $Format 1
    ShowWindow $LabelISOSelection 1
    ShowWindow $ISOFileTxt 1
    ShowWindow $ISOSelection 0
    Call ClearAll
    ${NSD_SetText} $LabelISOSelection "Step 3: Select your $ISOFileName"
    ${NSD_SetText} $ISOFileTxt "Disabled until step 2 is complete"
     GetDlgItem $6 $HWNDPARENT 1 ; Get "Install" control handle
      SendMessage $6 ${WM_SETTEXT} 0 "STR:Create"
      EnableWindow $6 0 ; Disable "Install" control button
    ${NSD_Uncheck} $Uninstaller
     StrCpy $Removal "No"
    ${NSD_SetText} $Uninstaller "View or Remove Installed Distros?"
    ${NSD_SetText} $LinuxDistroSelection "Step 2: Select a Distribution to put on $DestDisk"
     SendMessage $Distro ${CB_RESETCONTENT} 0 0  ; Clear all distro entries because a new option may have been chosen ; Enable for DropBox
     StrCpy $Checker "YES"
     Call SetISOFileName
  ${EndIf}
FunctionEnd

; On Selection of USB Drive
Function OnSelectDrive
  Pop $DestDriveTxt
  ${NSD_GetText} $DestDriveTxt $Letters
  StrCpy $DestDrive "$Letters"
  StrCpy $JustDrive $DestDrive 3
  StrCpy $BootDir $DestDrive 2 ;was -1
  StrCpy $DestDisk $DestDrive 2 ;was -1

  Call PhysDrive
  StrCpy $INST_DISK "$DiskNum" ; save Install Disk Number in case we need it again later
  Call GetFSType

; Check if drive is already setup for YUMI-EXFAT or Ventoy
 ${StrContains} $VolName "Ventoy" "$Letters" ; set the volume label to check for before running the following $VolName conditional test.
 ${IfNot} ${FileExists} "$BootDir\YUMI\*.*"
  ; ${AndIfNot} ${FileExists} "$BootDir\ventoy\*.*"
  ${AndIfNot} $VolName == "Ventoy"
  ; ${If} $RepeatInstall != "YES"
   ${NSD_SetText} $Format "Prepare this Drive?"
   MessageBox MB_YESNO|MB_ICONQUESTION "$Letters has not been prepared for this version of YUMI.$\r$\n$\r$\nDo you want YUMI to prepare and format it?" IDYES checkit
   StrCpy $FormatMe ""
   ${NSD_SetState} $FormatMe ${BST_UNCHECKED}
   ${NSD_Uncheck} $Format
   ;MessageBox MB_ICONSTOP|MB_OK "UNCHECKED"
   Goto skipper
   checkit:
   StrCpy $FormatMe ""
   ${NSD_SetState} $FormatMe ${BST_CHECKED}
   ${NSD_Check} $Format
   ;MessageBox MB_ICONSTOP|MB_OK "CHECKED"
   skipper:
   ;${NSD_SetText} $Format "Prepare this Drive?"
 ; ${Endif}
 ${Else} ;${ElseIf} ${FileExists} "$BootDir\YUMI\*.*"
  ${NSD_SetText} $Format "Reinstall or Update?"
 ${Endif}

  SendMessage $Distro ${CB_RESETCONTENT} 0 0 ; Clear all distro entries because a new drive may have been chosen ; Enable for DropBox
  StrCpy $Checker "YES"
  Call InstallorRemove
  Call SetSpace
  Call CheckSpace
  Call FormatIt
  Call EnableNext

  ${NSD_SetText} $LabelDrivePage "Step 1: You Selected $DestDisk (Disk $DiskNum) as your USB Device"
FunctionEnd

Function ExecFAT
${If} ${FileExists} "$EXEDIR\Ventoy2Disk.exe"
MessageBox MB_ICONEXCLAMATION "You will now be taken to Ventoy2Disk to create a Ventoy based bootable USB.$\r$\n$\r$\n1.) NOTE: You will need to reselect your USB device.$\r$\n$\r$\n2.) Then, click Install to put Ventoy on your USB device.$\r$\n$\r$\n3.) Once finished, close Ventoy2Disk and return to YUMI to continue."
    ; "Now launching Ventoy2Disk..."
	nsExec::Exec 'cmd /k cd /D "$EXEDIR"&Ventoy2Disk.exe $JustDrive'
${Else}
    SetOutPath $PLUGINSDIR
    Nsis7z::ExtractWithDetails "$PLUGINSDIR\YUMI2USB.7z" "Extracting package YUMI2USB %s..."
    ; "Now launching YUMI2USB..."
    nsExec::Exec 'cmd /k cd /D "$PLUGINSDIR"&YUMI2USB.exe $JustDrive'
${EndIf}
FunctionEnd

Function GetDiskVolumeName
 ;pop $1 ; get parameter
 System::Alloc 1024 ; Allocate string body
 Pop $0 ; Get the allocated string's address

 !define GetVolumeInformation "Kernel32::GetVolumeInformation(t,t,i,*i,*i,*i,t,i) i"
 System::Call '${GetVolumeInformation}("$9",.r0,1024,,,,,1024)' ;

;Push $0 ; Push result
 ${If} $0 != ""
  StrCpy $VolName "$0"
 ${Else}
  StrCpy $VolName ""
 ${EndIf}
FunctionEnd

Function DiskSpace
${DriveSpace} "$9" "/D=T /S=G" $1 ; used to find total space of each drive
${If} $1 > "0"
 StrCpy $Capacity "$1GB"
${Else}
 StrCpy $Capacity ""
${EndIf}
FunctionEnd

Function DrivesList
 StrCpy $JustDrive $9
 Call PhysDrive
 Call GetDiskVolumeName
 Call DiskSpace
 Call GetFSType
;Prevent System Drive from being selected
 StrCpy $7 $WINDIR 3
 ; MessageBox MB_ICONSTOP|MB_OK "$WINDIR"
 ${If} $9 != "$7"
 ${AndIf} $DiskNum != "0" ; Prevent (Disk 0) - it's most likely the booted system from being displayed.
  SendMessage $DestDriveTxt ${CB_ADDSTRING} 0 "STR:$9 (Disk $DiskNum) $VolName $Capacity $FSType" ;$8
 ${EndIf}
 Push 1 ; must push something - see GetDrives documentation
FunctionEnd

Function FormatYES ; If Format is checked, do something
 ${If} $FormatMe == "YES"
  SetShellVarContext all
  InitPluginsDir
  ;Call ExecFAT
 ${Endif}
FunctionEnd

Function FormatIt ; Set Format Option
  ${NSD_GetState} $Format $FormatMe
  ${If} $FormatMe == ${BST_CHECKED}
  ${NSD_Check} $Format
    StrCpy $FormatMe "YES"
    SendMessage $Distro ${CB_RESETCONTENT} 0 0 ; Clear all distro entries because a new format option may have been chosen ; Enable for DropBox
    ShowWindow $Uninstaller 0 ; Disable Uninstaller option because we will be formatting the drive.
    StrCpy $Checker "YES"
    Call ExecFAT
     ${NSD_Uncheck} $Format

  ${ElseIf} $FormatMe == ${BST_UNCHECKED}
  ${NSD_Uncheck} $Format
  StrCpy $FormatMe "NO"
    SendMessage $Distro ${CB_RESETCONTENT} 0 0 ; Clear all distro entries because a new format option may have been chosen ; Enable for DropBox
    ${If} ${FileExists} "$BootDir\YUMI\*"
     ShowWindow $Uninstaller 1 ; Re-enable Uninstaller option.
     EnableWindow $Format 1
     ShowWindow $Format 1
    ${EndIf}
    StrCpy $Checker "YES"
    Call SetSpace
  ${EndIf}
    Call InstallorRemove
FunctionEnd

Function ShowAllISOs ; Set Show All ISOs Option
  ${NSD_GetState} $ForceShowAll $ShowingAll
  ${If} $ShowingAll == ${BST_CHECKED}
  ${NSD_Check} $ForceShowAll
  StrCpy $ShowingAll "YES"
  ${NSD_SetText} $ForceShowAll "Show All ISOs!"
    SendMessage $ISOSelection ${CB_RESETCONTENT} 0 0

  ${ElseIf} $ShowingAll == ${BST_UNCHECKED}
  ${NSD_Uncheck} $ForceShowAll
  ${NSD_SetText} $ForceShowAll "Show All ISOs?"
    SendMessage $ISOSelection ${CB_RESETCONTENT} 0 0
  ${EndIf}
FunctionEnd

Function CheckSpace ; Check total available space so we can set block size
  Call TotalSpace
  ${If} $1 <= 511
  StrCpy $BlockSize 1
  ${ElseIf} $1 >= 512
  ${AndIf} $1 <= 8191
  StrCpy $BlockSize 4
  ${ElseIf} $1 >= 8192
  ${AndIf} $1 <= 16383
  StrCpy $BlockSize 8
  ${ElseIf} $1 >= 16384
  ${AndIf} $1 <= 32767
  StrCpy $BlockSize 16
  ${ElseIf} $1 > 32768
  StrCpy $BlockSize 32
  ${EndIf}
 ; MessageBox MB_ICONSTOP|MB_OK "$0 Drive is $1 MB in size, blocksize = $BlockSize KB."
FunctionEnd

Function TotalSpace
${DriveSpace} "$JustDrive" "/D=T /S=M" $1 ; used to find total space of select disk
 StrCpy $Capacity "$1"
FunctionEnd

Function FreeDiskSpace
${If} $FormatMe == "YES"
${DriveSpace} "$JustDrive" "/D=T /S=M" $1
${Else}
${DriveSpace} "$JustDrive" "/D=F /S=M" $1
${EndIf}
FunctionEnd

Function SetSpace ; Set space available for persistence
  Call FreeDiskSpace
  StrCpy $RemainingSpace "$1"
  IntOp $RemainingSpace $RemainingSpace - 100 ; Subtract 100MB as a buffer
  SendMessage $CasperSlider ${TBM_SETRANGEMAX} 1 $RemainingSpace ; Re-Setting Max Value
FunctionEnd

Function HaveSpacePre ; Check space required
  Call CasperSize
  Call FreeDiskSpace
  System::Int64Op $1 > $SizeOfCasper ; Compare the space available > space required
  Pop $3 ; Get the result ...
  IntCmp $3 1 okay ; ... and compare it
  MessageBox MB_ICONSTOP|MB_OK "Oops: There is not enough disk space! on $JustDrive Drive.$\r$\n$\r$\n($1) MB Free$\r$\n$\r$\n($SizeOfCasper) MB Needed$\r$\n$\r$\nNOTE: If this tool is showing () MB Free, You may need to Format your drive? YUMI can Format it for you by choosing the option to 'Prepare this Drive'."
  okay: ; Proceed to execute...
FunctionEnd

Function HaveSpace ; Check space required
  Call CasperSize
  Call FreeDiskSpace
  System::Int64Op $1 > $SizeOfCasper ; Compare the space available > space required
  Pop $3 ; Get the result ...
  IntCmp $3 1 okay ; ... and compare it
  MessageBox MB_ICONSTOP|MB_OK "Not enough free space remains. Quitting YUMI!"
  quit ; Close the program if the disk space was too small...
  okay: ; Proceed to execute...
  ;MessageBox MB_OK "ISO + Persistence will use $SizeOfCasper MB of the $1 MB Free disk space on $JustDrive Drive."
  ;quit ; enable for testing message above
FunctionEnd

; Custom Distros Installer - Uninstaller Include
!include "InstallDistro.nsh" ; ##################################### ADD NEW DISTRO ########################################
!include "RemoveDistro.nsh" ; ##################################### ADD NEW DISTRO ########################################

; ---- Let's Do This Stuff ----
Section  ; This is the only section that exists
; Get just the name of the ISO file
Push "$ISOFile"
Push 1
Call GrabNameOnly
Pop $NameThatISO

; Prevent from installing on booted drive.
 ${If} $DiskNum == "0"
  MessageBox MB_ICONEXCLAMATION|MB_OK "YUMI will not attempt to install on (Disk $DiskNum). Did you select a drive?"
  Quit
 ${EndIf}

; Make sure drive doesn't contain Windows... (secondary check - the droplist shouldn't be displaying Windows System drives).
 ${If} ${FileExists} "$BootDir\windows\system32" ; additional safeguard to help protect from mishap.
  MessageBox MB_ICONSTOP|MB_OK "ABORTING! ($DestDisk) contains a WINDOWS/SYSTEM32 Directory."
  Quit
 ${EndIf}

 Call GetFSType

;checkpoint:

;proceed:
 ${IfThen} $Removal == "YES" ${|} Goto removeonly ${|}
  Call HaveSpace ; Got enough Space? Lets Check!
  Call FormatYES ; Format the Drive?

  ;Goto theend ; Temporary test stop here.
  Call LocalISODetected

; If path doesn't exist, create the directory.
 ${IfNot} ${FileExists} "$BootDir\YUMI\$DistroPath\*.*"
   CreateDirectory "$BootDir\YUMI\$DistroPath"
 ${EndIf}
 
; If ventoy directory doesn't exist, create it.
 ${IfNot} ${FileExists} "$BootDir\ventoy\*.*" 
   CreateDirectory "$BootDir\ventoy"
 ${EndIf}
 
; If ventoy/ventoy.json file doesn't exist, copy it over.
 ${IfNot} ${FileExists} "$BootDir\ventoy\ventoy.json"
   CopyFiles "$PLUGINSDIR\ventoy.json" "$BootDir\ventoy\ventoy.json"
 ${EndIf}
 
; If ventoy/theme/YUMI/theme.txt doesn't exist, copy it over.
 ${IfNot} ${FileExists} "$BootDir\ventoy\theme\YUMI\theme.txt" 
   CreateDirectory "$BootDir\ventoy\theme"
   SetOutPath "$BootDir\ventoy\theme\"
   Nsis7z::ExtractWithDetails "$PLUGINSDIR\theme.7z" "Extracting YUMI theme files %s..."
   SetOutPath "$PLUGINSDIR"
 ${EndIf}

removeonly:
 ${If} $Removal != "YES"
  !insertmacro Install_Distros ; Install those distros
 ${ElseIf} $Removal == "YES"
  ;Call ConfigRemove
  !insertmacro Uninstall_Distros ; Remove those distros
 ${EndIf}
;theend:
SectionEnd

Function NoQuit
MessageBox MB_YESNO "Would you like to add more ISOs/Distros Now on $DestDisk?" IDYES noskip
    StrCmp $R8 3 0 End ;Compare $R8 variable with current page #
    StrCpy $R9 1 ; Goes to finish page
    Call RelGotoPage
    Abort
noskip:
StrCpy $ShowAll "$ShowAll" ; Retain Display All Drives
StrCpy $DestDrive "$DestDrive" ; Retain previously selected Drive Letter
StrCpy $DiskNum "$DiskNum" ; Retain previously selected Disk

    StrCpy $VolName $VolName
    StrCpy $FSType $FSType

StrCpy $BOOT_DISK "$BOOT_DISK" ; Retain previously selected Disk
;StrCpy $DiskNum "$BOOT_DISK" ; Retain previously selected Disk
StrCpy $RepeatInstall "YES" ; Set Repeat Install Option to YES
StrCpy $ISOTest "" ; Reset
StrCpy $JustISO "" ; Reset
StrCpy $JustISOName "" ; Reset
StrCpy $ISOFile "" ; Reset
StrCpy $Removal "" ; Reset
StrCpy $Persistence "NULL" ; Reset
StrCpy $NameThatISO "" ; Reset NameThatISO ISO Name
StrCpy $DistroPath "" ; Clear Path to create
StrCpy $DistroName "" ; Clear Distro Name
StrCpy $ISOFileName "" ; Clear ISO Selection
StrCpy $FileFormat "" ; Clear File Format
StrCpy $DownloadMe 0 ; Ensure Uncheck of Download Option
StrCpy $LocalSelection "" ; Reset Local Selection
StrCpy $ShowingAll ""
StrCpy $FormatMe "" ; Reset Format Option
    StrCmp $R8 4 0 End ;Compare $R8 variable with current page #
    StrCpy $R9 -3 ; Goes back to selections page
    Call RelGotoPage ; change pages
    Abort
End:
FunctionEnd

Function RelGotoPage
  IntCmp $R9 0 0 Move Move
  StrCmp $R9 "X" 0 Move
  StrCpy $R9 "120"
Move:
  SendMessage $HWNDPARENT "0x408" "$R9" ""
FunctionEnd

; --- Stuff to do at startup of script ---
Function .onInit
;${Ifnot} ${AtLeastWin8} ; checkpoint to test if is => Windows 8 to support all features.
; Abort
;${EndIf}

StrCpy $R9 0 ; we start on page 0
;StrCpy $InstallButton ""
 StrCpy $FileFormat "ISO"
 userInfo::getAccountType
 Pop $Auth
 strCmp $Auth "Admin" done
 Messagebox MB_OK|MB_ICONINFORMATION "Currently you're trying to run this program as: $Auth$\r$\n$\r$\nYou must run this program with administrative rights...$\r$\n$\r$\nRight click the file and select Run As Administrator or Run As (and select an administrative account)!"
 Abort
 done:
 SetShellVarContext all
 InitPluginsDir
  File /oname=$PLUGINSDIR\YUMI-EXFAT "tools\YUMI-EXFAT"
  File /oname=$PLUGINSDIR\YUMI-Copying.txt "YUMI-Copying.txt"
  File /oname=$PLUGINSDIR\license.txt "license.txt"
  File /oname=$PLUGINSDIR\YUMI2USB.7z "YUMI2USB\YUMI2USB.7z"
  File /oname=$PLUGINSDIR\w2gdiskpart.txt "w2gdiskpart.txt" 
  File /oname=$PLUGINSDIR\diskpartdetach.txt "diskpartdetach.txt" 
  File /oname=$PLUGINSDIR\dskvol.txt "dskvol.txt" 
  File /oname=$PLUGINSDIR\dismstuff.cmd "dismstuff.cmd"   
  File /oname=$PLUGINSDIR\7zG.exe "tools\7zG.exe" 
  File /oname=$PLUGINSDIR\7z.dll "tools\7z.dll" 
  File /oname=$PLUGINSDIR\AutoUnattend.xml "AutoUnattend.xml"
  File /oname=$PLUGINSDIR\ventoy.json "ventoy.json"
  File /oname=$PLUGINSDIR\theme.7z "theme.7z"
  SetOutPath "$PLUGINSDIR"  
  File /r "wimlib" 
  SetOutPath "" 

ClearErrors
# check for WINE in registry
EnumRegKey $0 HKLM "Software\Wine" 0
 IfErrors 0 wine
  StrCpy $WINE "NULL" ; WINE Does Not Exist
  Goto notwine
wine:
  StrCpy $WINE "WINE"
  Messagebox MB_OK|MB_ICONINFORMATION "This program appears to be running from $WINE.$\r$\n$\r$\nThis is fine as long as your USB drive has already been prepared for YUMI exFAT.$\r$\n$\r$\nThe prep and format features and Windows distro options do not currently work from WINE." 
notwine:     
FunctionEnd

Function onNotify_CasperSlider
 Pop $Casper
 SendMessage $CasperSlider ${TBM_GETPOS} 0 0 $Casper ; Get position
 ${NSD_SetText} $SlideSpot "$Casper MB"
FunctionEnd

Function SetISOSize ; Get size of ISO
 System::Call 'kernel32::CreateFile(t "$TheISO", i 0x80000000, i 1, i 0, i 3, i 0, i 0) i .r0'
 System::Call "kernel32::GetFileSizeEx(i r0, *l .r1) i .r2"
 System::Alloc $1
 System::Int64Op $1 / 1048576 ; convert to MB
 Pop $1
 StrCpy $SizeOfCasper "$1"
 ; MessageBox MB_OK|MB_ICONINFORMATION "ISO Size: $SizeOfCasper"
 System::Call 'kernel32::CloseHandle(i r0)'
FunctionEnd

Function GetFSType
System::Call 'Kernel32::GetVolumeInformation(t "$JustDrive",t,i ${NSIS_MAX_STRLEN},*i,*i,*i,t .r1" ,i ${NSIS_MAX_STRLEN}) i.r0'
 StrCpy $FSType "$1"
FunctionEnd

