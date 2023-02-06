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

; ------------ Distro List -------------- 

Function SetISOFileName ; $DistroName $ISOFileName $DownLink $Persistence $DistroPath $Homepage $OfficialName
     !insertmacro SetISOFileNames "--- Ubuntu ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""
	 
 !insertmacro SetISOFileNames "Ubuntu" "ubuntu*desktop*.iso" "https://www.ubuntu.com/download/desktop" "casper" "Linux-ISOs" "https://www.ubuntu.com/desktop" "Ubuntu"
 !insertmacro SetISOFileNames "Kubuntu" "kubuntu*desktop*.iso" "https://kubuntu.org/getkubuntu/" "casper" "Linux-ISOs" "https://www.kubuntu.org" "Kubuntu"
 !insertmacro SetISOFileNames "Lubuntu" "lubuntu*desktop*.iso" "http://cdimage.ubuntu.com/lubuntu/releases/" "casper" "Linux-ISOs" "https://lubuntu.net" "Lubuntu" 
 !insertmacro SetISOFileNames "Xubuntu" "xubuntu*desktop*.iso" "https://cdimage.ubuntu.com/xubuntu/releases/" "casper" "Linux-ISOs" "https://xubuntu.org" "Xubuntu"
 !insertmacro SetISOFileNames "Ubuntu Budgie" "ubuntu-budgie*desktop*.iso" "https://ubuntubudgie.org/downloads" "casper" "Linux-ISOs" "https://ubuntubudgie.org/" "Ubuntu Budgie" 
 !insertmacro SetISOFileNames "Ubuntu Mate" "ubuntu-mate*desktop*.iso" "https://ubuntu-mate.org/download/" "casper" "Linux-ISOs" "https://ubuntu-mate.org/" "Ubuntu Mate" 
 ;!insertmacro SetISOFileNames "Ubuntu Gnome" "ubuntu-gnome*desktop*.iso" "https://wiki.ubuntu.com/UbuntuGNOME/GetUbuntuGNOME/LTS#Standard_PC" "casper" "Linux-ISOs" "https://www.ubuntugnome.org" "Ubuntu Gnome"
 !insertmacro SetISOFileNames "Ubuntu Server" "ubuntu*server*.iso" "https://www.ubuntu.com/download/server" "NULL" "Linux-ISOs" "https://www.ubuntu.com/server" "Ubuntu Server"
 !insertmacro SetISOFileNames "Ubuntu Studio" "ubuntustudio*.iso" "https://ubuntustudio.org/download/" "casper" "Linux-ISOs" "https://ubuntustudio.org" "Ubuntu Studio" 
 ;!insertmacro SetISOFileNames "Emmabuntus" "emmabuntus*.iso" "https://sourceforge.net/projects/emmabuntus/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/emmabuntus/" "Emmabuntus" 

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Linux Mint ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""  
   
 !insertmacro SetISOFileNames "Linux Mint" "linuxmint*.iso" "https://www.linuxmint.com/download.php" "casper" "Linux-ISOs" "https://www.linuxmint.com" "Linux Mint"
 !insertmacro SetISOFileNames "Linux Mint Debian" "lmde*.iso" "https://www.linuxmint.com/download_lmde.php" "NULL" "Linux-ISOs" "https://www.linuxmint.com" "Linux Mint"

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- CentOS ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""

 !insertmacro SetISOFileNames "CentOS" "CentOS*.iso" "https://mirrors.oit.uci.edu/centos/7.8.2003/isos/x86_64/CentOS-7-x86_64-LiveGNOME-2003.iso" "NULL" "Linux-ISOs" "https://www.centos.org" "CentOS"

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- ClearLinux ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""

 !insertmacro SetISOFileNames "ClearLinux" "Clear*.iso" "https://clearlinux.org/downloads" "NULL" "Linux-ISOs" "https://clearlinux.org/" "Clear Linux"

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Debian Live ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""
	 
 !insertmacro SetISOFileNames "Debian Live" "debian-live*.iso" "hhttps://cdimage.debian.org/cdimage/release/current-live/amd64/iso-hybrid/" "NULL" "Linux-ISOs" "https://www.debian.org" "Debian Live"

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Fedora ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""
 
 !insertmacro SetISOFileNames "Fedora" "Fedora*Live*.iso" "https://getfedora.org/en/workstation/download/" "vtoycow" "Linux-ISOs" "https://fedoraproject.org" "Fedora"	 

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- OpenSUSE ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""  

 !insertmacro SetISOFileNames "OpenSUSE" "openSUSE*.iso" "http://linuxfreedom.com/opensuse/distribution/13.2/iso/openSUSE-13.2-GNOME-Live-x86_64.iso" "NULL" "Linux-ISOs" "https://software.opensuse.org" "OpenSUSE"	 

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Puppy Linux Based ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""  
	 
 !insertmacro SetISOFileNames "Puppy Linux" "*pup*.iso" "http://distro.ibiblio.org/puppylinux/puppy-fossa/fossapup64-9.5.iso" "NULL" "Linux-ISOs" "puppylinux.com" "Puppy Linux" 	 
 !insertmacro SetISOFileNames "Fatdog64" "Fatdog64*.iso" "https://distro.ibiblio.org/fatdog/iso/Fatdog64-702.iso" "NULL" "Linux-ISOs" "http://www.puppylinuxforum.org/thread-180.html" "Fatdog64"
 !insertmacro SetISOFileNames "Puppy Arcade" "slacko_arcade*.iso" "https://archive.org/download/Puppy_Linux_Puppy_Arcade/slacko_arcade.iso" "NULL" "Linux-ISOs" "" ""	
 !insertmacro SetISOFileNames "Slacko Puppy" "slacko*uefi.iso" "https://distro.ibiblio.org/puppylinux/puppy-slacko-6.3.2/64/slacko64-6.3.2-uefi.iso" "NULL" "Linux-ISOs" "http://slacko.eezy.xyz/index.php" "Slacko Puppy" 

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Other Distros ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""	 
	 
 !insertmacro SetISOFileNames "Academix" "academix*.iso" "https://sourceforge.net/projects/academix/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/academix/" "Academix"  
 !insertmacro SetISOFileNames "ArchLinux" "archlinux*.iso" "https://archlinux.org/download/" "vtoycow" "Linux-ISOs" "https://archlinux.org/" "Arch Linux"
 
 !insertmacro SetISOFileNames "AmogOS" "amog*.iso" "https://amogos.studio/" "NULL" "Linux-ISOs" "https://github.com/jostroOS/AmogOS" "AmogOS"
 !insertmacro SetISOFileNames "AntiX" "antiX*.iso" "https://sourceforge.net/projects/antix-linux/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/antix-linux/" "AntiX"   
 !insertmacro SetISOFileNames "Archbang" "archbang*.iso" "https://sourceforge.net/projects/archbang/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/archbang/" "Archbang"  
 !insertmacro SetISOFileNames "Archlinux" "archlinux*.iso" "http://mirrors.us.kernel.org/archlinux/iso/latest/" "NULL" "Linux-ISOs" "https://www.archlinux.org" "Archlinux"  
 !insertmacro SetISOFileNames "Bluestar Linux" "bluestar*.iso" "https://sourceforge.net/projects/bluestarlinux/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/bluestarlinux/" "Bluestar" 
 !insertmacro SetISOFileNames "Bodhi" "bodhi*.iso" "https://sourceforge.net/projects/bodhilinux/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/bodhilinux/" "Bodhi"  
 !insertmacro SetISOFileNames "CAELinux (Computer Aided Engineering)" "caelinux*.iso" "https://sourceforge.net/projects/caelinux/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/caelinux/" "CAELinux"  
 !insertmacro SetISOFileNames "Calculate Linux Desktop" "cld*.iso" "http://www.gtlib.gatech.edu/pub/calculate/release/20.6/" "NULL" "Linux-ISOs" "https://www.calculate-linux.org/" "Calculate Linux"
 !insertmacro SetISOFileNames "Cub Linux" "CubLinux*.iso" "https://sourceforge.net/projects/cublinux/files/latest/download" "casper" "Linux-ISOs" "https://sourceforge.net/projects/cublinux/" "CubLinux" 
 !insertmacro SetISOFileNames "Deepin" "deepin*.iso" "https://sourceforge.net/projects/deepin/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/deepin/" "Deepin"
 !insertmacro SetISOFileNames "Elementary OS" "elementa*.iso" "https://elementary.io" "casper" "Linux-ISOs" "https://elementary.io" "Elementary OS"
 !insertmacro SetISOFileNames "Endeavour OS" "endeavour*.iso" "https://endeavouros.com/latest-release/" "NULL" "Linux-ISOs" "https://endeavouros.com/" "Endeavour OS"
 !insertmacro SetISOFileNames "Feren OS" "Feren*.iso" "https://sourceforge.net/projects/ferenoslinux/files/latest/download" "casper" "Linux-ISOs" "https://sourceforge.net/projects/ferenoslinux/" "Feren OS"
 !insertmacro SetISOFileNames "JustBrowsing" "justbrowsing64*.iso" "https://sourceforge.net/projects/justbrowsing/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/justbrowsing/" "JustBrowsing"
 !insertmacro SetISOFileNames "KDE Neon" "neon*.iso" "https://neon.kde.org/download" "casper" "Linux-ISOs" "https://neon.kde.org/" "KDE Neon"
 !insertmacro SetISOFileNames "KNOPPIX" "KNOPPIX*.iso" "http://ftp.knoppix.nl/os/Linux/distr/knoppix/KNOPPIX_V9.1CD-2021-01-25-EN.iso" "NULL" "Linux-ISOs" "https://knopper.net" "KNOPPIX"
 !insertmacro SetISOFileNames "KXStudio" "KXStudio*.iso" "https://sourceforge.net/projects/kxstudio/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/kxstudio/" "KXStudio"
 !insertmacro SetISOFileNames "LinuxFX" "linuxfx*.iso" "https://sourceforge.net/projects/linuxfxdevil/files/latest/download" "casper" "Linux-ISOs" "https://sourceforge.net/projects/linuxfxdevil/" "LinuxFX"
 !insertmacro SetISOFileNames "Linux Kid X" "linuxKidX*.iso" "https://sourceforge.net/projects/linuxkidx/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/linuxkidx/" "Linux Kid X" 
 !insertmacro SetISOFileNames "Linux Lite" "linux-lite*.iso" "https://osdn.net/projects/linuxlite/storage/" "casper" "Linux-ISOs" "https://www.linuxliteos.com/" "Linux Lite"
 !insertmacro SetISOFileNames "LXLE Desktop" "lxle*.iso" "https://sourceforge.net/projects/lxle/files/latest/download" "casper" "Linux-ISOs" "https://sourceforge.net/projects/lxle/" "LXLE Desktop" 
 !insertmacro SetISOFileNames "Manjaro" "Manjaro*.iso" "https://manjaro.org/downloads/official/xfce/" "NULL" "Linux-ISOs" "http://manjaro.org" "Manjaro"
 !insertmacro SetISOFileNames "mintyMac" "minty*.iso" "http://sourceforge.net/projects/mintymacpremium/files/latest/download" "casper" "Linux-ISOs" "http://sourceforge.net/projects/mintymacpremium/" "MintyMac"
 !insertmacro SetISOFileNames "MX Linux" "MX*.iso" "https://sourceforge.net/projects/mx-linux/files/latest/download" "casper" "Linux-ISOs" "https://sourceforge.net/projects/mx-linux/" "MX Linux"
 !insertmacro SetISOFileNames "Netrunner" "netrunner*.iso" "https://www.netrunner.com/download/" "NULL" "Linux-ISOs" "https://www.netrunner-os.com" "Netrunner"
 !insertmacro SetISOFileNames "OpenMandriva" "openMandriva*.iso" "https://sourceforge.net/projects/openmandriva/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/openmandriva/" "OpenMandriva"	
 !insertmacro SetISOFileNames "OSGeo Live" "osgeo-live*.iso" "https://sourceforge.net/projects/osgeo-live/files/latest/download" "NULL" "Linux-ISOs" "http://sourceforge.net/projects/osgeo-live/" "OSGeo Live"
 !insertmacro SetISOFileNames "ParrotOS" "parrot*.iso" "https://www.parrotsec.org/download/" "NULL" "Linux-ISOs" "https://www.parrotsec.org" "ParrotOS" 
 !insertmacro SetISOFileNames "PCLinuxOS" "pclinuxos*.iso" "https://www.pclinuxos.com/?page_id=10" "NULL" "Linux-ISOs" "https://www.pclinuxos.com" "PCLinuxOS"
 !insertmacro SetISOFileNames "Peach OSI" "PeachOSI*.iso" "https://www.peachosi.com/content/download-patriot" "casper" "Linux-ISOs" "https://www.peachosi.com" "Peach OSI"
 !insertmacro SetISOFileNames "Pear Linux" "pearlinux*.iso" "https://sourceforge.net/projects/pearoslinux/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/pearoslinux/" "Pear Linux"
 !insertmacro SetISOFileNames "Peppermint" "Peppermint*.iso" "https://peppermintos.com/guide/downloading/" "NULL" "Linux-ISOs" "https://peppermintos.com" "Peppermint"
 !insertmacro SetISOFileNames "Pinguy OS" "Pinguy*.iso" "https://sourceforge.net/projects/pinguy-os/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/pinguy-os/" "Pinguy" 
 !insertmacro SetISOFileNames "Porteus" "porteus*.iso" "http://porteus.org/porteus-mirrors.html" "NULL" "Linux-ISOs" "http://porteus.org/" "Porteus"
 !insertmacro SetISOFileNames "POP!_OS" "Pop*.iso" "https://pop.system76.com/" "NULL" "Linux-ISOs" "https://pop.system76.com/" "POP!_OS"
 !insertmacro SetISOFileNames "Q4OS" "q4os*.iso" "https://sourceforge.net/projects/q4os/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/q4os/" "Q4OS" 
 !insertmacro SetISOFileNames "Raspberry Pi Desktop" "*ras*.iso" "https://www.raspberrypi.org/downloads/raspberry-pi-desktop/" "NULL" "Linux-ISOs" "https://www.raspberrypi.org/downloads/raspberry-pi-desktop/" "Raspberry Pi"
 !insertmacro SetISOFileNames "Skywave" "skywave*.iso" "https://sourceforge.net/projects/skywavelinux/files/latest/download" "casper" "Linux-ISOs" "https://sourceforge.net/projects/skywavelinux/" "Skywave Linux"  
 !insertmacro SetISOFileNames "SLAX (Tiny Slackware Based Distro)" "slax*.iso" "https://www.slax.org/#purchase" "NULL" "Linux-ISOs" "https://slax.org" "SLAX"
 !insertmacro SetISOFileNames "Slitaz (Another Tiny Distro)" "slitaz*.iso" "https://www.slitaz.org/en/get/" "NULL" "Linux-ISOs" "https://www.slitaz.org" "SliTaZ"
 !insertmacro SetISOFileNames "LuninuX OS" "LuninuxOS*Desktop*.iso" "https://sourceforge.net/projects/luninuxos/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/luninuxos/" "LuninuX OS" 
 !insertmacro SetISOFileNames "Solus" "Solus*.iso" "https://getsol.us/download/" "NULL" "Linux-ISOs" "https://getsol.us/home/" "Solus"
 !insertmacro SetISOFileNames "SolydX" "solydx*.iso" "https://solydxk.com/downloads.php" "NULL" "Linux-ISOs" "https://solydxk.com" "SolydX Linux" 
 !insertmacro SetISOFileNames "Sparky Linux" "sparkylinux*.iso" "https://sourceforge.net/projects/sparkylinux/files/latest/download" "NULL" "Linux-ISOs" "http://sourceforge.net/projects/sparkylinux/" "Sparky Linux" 
 !insertmacro SetISOFileNames "Sugar on a Stick" "Fedora-Live-SoaS*.iso" "https://wiki.sugarlabs.org/go/Sugar_on_a_Stick" "NULL" "Linux-ISOs" "https://wiki.sugarlabs.org/go/Sugar_on_a_Stick" "Sugar On A Stick"
 !insertmacro SetISOFileNames "Terralinux" "Terra*.iso" "https://sourceforge.net/projects/terralinuxos/files/latest/download" "NULL" "Linux-ISOs" "http://sourceforge.net/projects/terralinuxos/" "Terralinux"
 !insertmacro SetISOFileNames "Uberstudent" "uberstudent*.iso" "https://sourceforge.net/projects/uberstudent/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/uberstudent/" "Uberstudent"
 !insertmacro SetISOFileNames "Ultimate Edition" "ultimate-edition*.iso" "https://sourceforge.net/projects/ultimateedition/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/ultimateedition/" "Ultimate Edition"
 !insertmacro SetISOFileNames "Xiaopan (Penetration Testing)" "Xiaopan*.iso" "https://sourceforge.net/projects/xiaopanos/files/latest/download" "NULL" "Linux-ISOs" "https://sourceforge.net/projects/xiaopanos/" "Xiaopan" 
 !insertmacro SetISOFileNames "Zorin OS Core" "zorin*.iso" "https://zorinos.com/download/" "NULL" "Linux-ISOs" "https://zorin-os.com/" "Zorin OS"
  
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Anonymous Browsers ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
 
 !insertmacro SetISOFileNames "Kodachi (Anonymous Browsing)" "kodachi*.iso" "https://sourceforge.net/projects/linuxkodachi/files/latest/download" "NULL" "Anonymous-Browsers" "https://www.digi77.com/linux-kodachi/" "Kodachi"
 !insertmacro SetISOFileNames "Tails (Anonymous Browsing)" "tails*.iso" "http://dl.amnesia.boum.org/tails/stable/" "NULL" "Anonymous-Browsers" "https://tails.boum.org/" "Tails"

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Antivirus Tools ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
	 
 !insertmacro SetISOFileNames "Antivirus Live CD (Virus Scanner)" "AntivirusLiveCD*.iso" "http://sourceforge.net/projects/antiviruslivecd/files/latest/download" "NULL" "AntiVirus-Utilities" "http://antiviruslivecd.4mlinux.com" "Antivirus Live CD"  
 !insertmacro SetISOFileNames "AOSS (Malware Scanner)" "AOSS.iso" "http://download.pctools.com/mirror/AOSS.iso" "NULL" "AntiVirus-Utilities" "http://www.pctools.com/aoss/" "AOSS"  
 !insertmacro SetISOFileNames "AVIRA AntiVir Rescue CD (Virus Scanner)" "*escue-system.iso" "https://www.avira.com/en/downloads#tab_a3_0" "NULL" "AntiVirus-Utilities" "http://www.avira.com" "Avira"
 !insertmacro SetISOFileNames "Dr.Web LiveDisk" "drweb-livedisk*.iso" "http://download.geo.drweb.com/pub/drweb/livedisk/drweb-livedisk-900-cd.iso" "NULL" "AntiVirus-Utilities" "http://www.freedrweb.com/livecd/" "Dr.Web"  
 !insertmacro SetISOFileNames "Desinfec't 2013" "desinfect*.iso" "NONE" "NULL" "AntiVirus-Utilities" "" ""
 !insertmacro SetISOFileNames "ESET SysRescue Live" "eset*.iso" "https://www.eset.com/int/support/sysrescue/#download" "NULL" "AntiVirus-Utilities" "http://kb.eset.com/esetkb/index?page=content&id=SOLN3509" "ESET SysRecue Live" 
 !insertmacro SetISOFileNames "F-Secure Rescue CD" "rescue-cd*.iso" "https://download.f-secure.com/estore/rescue-cd-3.16-73600.iso" "NULL" "AntiVirus-Utilities" "http://www.f-secure.com/en_EMEA-Labs/security-threats/tools/rescue-cd/" "F-Secure Rescue CD"
 !insertmacro SetISOFileNames "GDATA Rescue CD" "G*.iso" "https://secure.gd/dl-int-bootcd" "NULL" "AntiVirus-Utilities" "https://www.gdatasoftware.com" "GDATA"
 !insertmacro SetISOFileNames "Kaspersky Rescue Disk (Antivirus Scanner)" "krd.iso" "https://rescuedisk.s.kaspersky-labs.com/updatable/2018/krd.iso" "casper" "AntiVirus-Utilities" "http://support.kaspersky.com/viruses/rescuedisk" "Kaspersky"

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- System Tools ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
	
 !insertmacro SetISOFileNames "Acronis True Image" "Acronis*.iso" "NONE" "NULL" "System-Tools" "https://www.acronis.com" "Acronis True-Image" 
 !insertmacro SetISOFileNames "BackBox (Penetration Testing)" "backbox*.iso" "https://www.backbox.org/download/" "NULL" "System-Tools" "https://linux.backbox.org/" "BackBox"
 !insertmacro SetISOFileNames "Boot Repair Disk" "boot-repair*.iso" "https://sourceforge.net/projects/boot-repair-cd/files/boot-repair-disk-64bit.iso/download" "NULL" "System-Tools" "https://sourceforge.net/projects/boot-repair-cd/" "Boot Repair Disk"
 !insertmacro SetISOFileNames "Caine (Penetration Testing)" "caine*.iso" "https://deb.parrot.sh/direct/parrot/iso/caine/caine12.4.iso" "NULL" "System-Tools" "https://www.caine-live.net/" "Caine" 
 !insertmacro SetISOFileNames "Clonezilla (Backup + Clone Tool)" "clonezilla*.iso" "https://sourceforge.net/projects/clonezilla/files/latest/download" "casper" "System-Tools" "https://clonezilla.org" "Clonezilla"
 !insertmacro SetISOFileNames "DBAN (Hard Drive Nuker)" "dban*.iso" "https://sourceforge.net/projects/dban/files/latest/download" "NULL" "System-Tools" "https://sourceforge.net/projects/dban/" "DBAN"
 !insertmacro SetISOFileNames "Demon Linux (Penetration Testing)" "demon*.iso" "https://demonlinux.com/" "NULL" "System-Tools" "https://demonlinux.com/" "Demon Linux"
 !insertmacro SetISOFileNames "DRBL (Diskless Remote Boot in Linux)" "drbl-live*.iso" "https://sourceforge.net/projects/drbl/files/latest/download" "NULL" "System-Tools" "https://sourceforge.net/projects/drbl/" "DRBL"	  
 !insertmacro SetISOFileNames "EASEUS Disk Copy (Disk Cloning Tool)" "Disk*.iso" "https://download.easeus.com/free/EaseUS_DiskCopy_Home.exe" "NULL" "System-Tools" "https://www.easeus.com" "EASEUS Disk Copy"
 !insertmacro SetISOFileNames "Finnix x86/64- BIOS ONLY" "finnix*.iso" "https://www.finnix.org/Download" "NULL" "System-Tools" "https://www.finnix.org/" "Finnix"
 !insertmacro SetISOFileNames "GParted (Partition Tool)" "gparted-live*.iso" "https://sourceforge.net/projects/gparted/files/latest/download" "NULL" "System-Tools" "https://sourceforge.net/projects/gparted/" "gParted"
 !insertmacro SetISOFileNames "G4L (Ghost For Linux)" "g4l*.iso" "https://sourceforge.net/projects/g4l/files/latest/download" "NULL" "System-Tools" "https://sourceforge.net/projects/g4l/" "G4L"
 !insertmacro SetISOFileNames "GRML (system rescue)" "grml*.iso" "https://grml.org/download/" "NULL" "System-Tools" "https://grml.org" "GRML" 
 !insertmacro SetISOFileNames "Kali Linux (Penetration Testing)" "kali*live*.iso" "https://www.kali.org/get-kali/#kali-live" "casper" "System-Tools" "https://www.kali.org" "Kali"
 !insertmacro SetISOFileNames "Matriux (Penetration Testing)" "Matriux*.iso" "https://sourceforge.net/projects/matriux/files/latest/download" "NULL" "System-Tools" "https://sourceforge.net/projects/matriux/" "Matriux"
 !insertmacro SetISOFileNames "Memtest86 (Memory Testing Tool)" "memtest86-usb.zip" "https://www.memtest86.com/download.htm" "NULL" "System-Tools" "https://www.memtest86.com/" "Memtest86" 
 !insertmacro SetISOFileNames "Memtest86+ (Memory Testing Tool)" "mt86*.zip" "https://www.memtest.org/" "NULL" "System-Tools" "https://www.memtest.org" "Memtest86+" 
 !insertmacro SetISOFileNames "Ophcrack (Password Finder)" "ophcrack*.iso" "https://sourceforge.net/projects/ophcrack/files/ophcrack-livecd/3.6.0/" "NULL" "System-Tools" "https://sourceforge.net/projects/ophcrack/" "Ophcrack"
 !insertmacro SetISOFileNames "Redo Backup And Recovery (Recovery Tool)" "redo*.iso" "https://sourceforge.net/projects/redobackup/files/latest/download" "NULL" "System-Tools" "https://sourceforge.net/projects/redobackup/" "RedoBackup"
 !insertmacro SetISOFileNames "Rescatux (Boot Repair)" "rescatux*.iso" "https://sourceforge.net/projects/rescatux/files/latest/download" "NULL" "System-Tools" "https://www.supergrubdisk.org/rescatux/" "Rescatux" 
 !insertmacro SetISOFileNames "Rescuezilla (Backup + Clone Tool)" "rescuezilla*.iso" "https://rescuezilla.com/download.html" "NULL" "System-Tools" "https://rescuezilla.com" "Rescuezilla" 
 !insertmacro SetISOFileNames "Rip Linux (Recovery Distro) - BIOS ONLY" "RIPLinuX*.iso" "https://sourceforge.net/projects/riplinuxmeta4s/files/latest/download" "NULL" "System-Tools" "https://sourceforge.net/projects/riplinuxmeta4s/" "RIP Linux"
 !insertmacro SetISOFileNames "System Rescue CD" "systemres*.iso" "https://sourceforge.net/projects/systemrescuecd/files/latest/download" "NULL" "System-Tools" "https://www.sysresccd.org" "System Rescue"
 !insertmacro SetISOFileNames "Trinity Rescue Kit - BIOS ONLY" "trinity-rescue-kit*.iso" "https://trinityhome.org/trinity_rescue_kit_download/" "NULL" "System-Tools" "https://trinityhome.org" "TRK"
 !insertmacro SetISOFileNames "Ultimate Boot CD (Diagnostics Tools) - BIOS ONLY" "ubcd5*.iso" "http://www.ultimatebootcd.com/download/redirect.php" "NULL" "System-Tools" "http://www.ultimatebootcd.com" "Ultimate Boot CD"
 !insertmacro SetISOFileNames "Wifislax (Wireless Penetration Testing)" "wifislax*.iso" "https://www.wifislax.com/category/download/" "NULL" "System-Tools" "https://www.wifislax.com/" "Wifislax"

     !insertmacro SetISOFileNames "" "" "" "" "" "" "" 
     !insertmacro SetISOFileNames "--- Linux Fully Installed on VDisk ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" "" 

 !insertmacro SetISOFileNames "Ubuntu 22.04 Bootable VDI" "Ub*22.04*.vdi.7z" "https://sourceforge.net/projects/usb-bootable-vdisk-images/files/UBNTU22.04.vdi.7z/download" "NULL" "Linux-VDI-Images" "https://sourceforge.net/projects/usb-bootable-vdisk-images/" "USB Bootable VDisk Images" 
 !insertmacro SetISOFileNames "CentOS 7 Bootable VDI" "C*7*.vdi.7z" "https://sourceforge.net/projects/usb-bootable-vdisk-images/files/COS7.vdi.7z/download" "NULL" "Linux-VDI-Images" "https://sourceforge.net/projects/usb-bootable-vdisk-images/" "USB Bootable VDisk Images" 
 

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Windows Installers ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""

 !insertmacro SetISOFileNames "Windows 11 Installer ISO" "*.iso" "https://www.microsoft.com/en-us/software-download/windows11" "NULL" "Windows-Installers" "https://www.microsoft.com" "Windows" 
 !insertmacro SetISOFileNames "Windows 10 Installer ISO" "*.iso" "https://www.microsoft.com/en-us/software-download/windows10" "NULL" "Windows-Installers" "https://www.microsoft.com" "Windows" 

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Windows PE ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" "" 
 
 !insertmacro SetISOFileNames "Hiren's BootCD PE" "HBCD*.iso" "https://www.hirensbootcd.org/download/" "NULL" "Windows-PE" "https://www.hirensbootcd.org/" "Hiren's BootCD PE"
 !insertmacro SetISOFileNames "Sergei Strelec WinPE" "WinPE*.iso" "" "NULL" "Windows-PE" "https://sergeistrelec.ru/" "Sergei Strelec WinPE"
 !insertmacro SetISOFileNames "Other Windows PE ISO" "*.iso" "" "NULL" "Windows-PE" "" "" 
 
${If} $WINE != "WINE"
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Run Windows 11 from VHD on USB ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""

 !insertmacro SetISOFileNames "Phoenix LiteOS" "Phoenix*.iso" "https://phoenixliteos.com/DOWNLOADS/" "casper" "Windows-On-VHD" "https://phoenixliteos.com/" "Phoenix LiteOS" 
${EndIf}

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Unlisted Bootable ISOs ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" "" 	

 !insertmacro SetISOFileNames "Try an Unlisted ISO" "*.iso" "NONE" "NULL" "Unlisted ISOs" "" "" 
 
FunctionEnd