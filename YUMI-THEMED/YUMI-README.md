This YUMI exFAT themed build was based upon and derived from Ventoy 1.0.88
Original Source: https://github.com/ventoy/Ventoy/archive/refs/tags/v1.0.88.zip

To reproduce it, simply copy the following modified folder and file structure over to a source Ventoy-1.0.88 folder, merging the files when prompted. Then proceed to compile and build as usual.

> GRUB2
> INSTALL
> LANGUAGES
=======================================================================================================================================

The YUMI2USB folder contains a USB Installer build based upon and derived from Ventoy2Disk. It can be compiled within Visual Studio via YUMI2USB.sln.

========================================================================================================================================

YUMI-exFAT folder contains the YUMI frontend. It can be compiled using NSIS v3.08 via the YUMI.nsi file. Note that you'll need to create and include a YUMI2USB.7z file in the YUMI-exFAT -> YUMI2USB folder. A README.txt file with instuctions is included there.
