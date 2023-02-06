YUMI

YUMI ("Your Universal Multiboot Installer") is a nifty little tool for creating bootable multi-ISO-image USB drives, which supports dozens of Linux distros and system tools, and can automatically download the ISO images for you. Able to add to the same USB drive many bootable ISO images of Linux distros and system tools, and ISO images of Windows 8 / Windows 10 / Windows 11. You are limited only by the total capacity (storage size) of your USB drive.

The result USB drive is able to boot with both UEFI firmware and legacy BIOS firmware.

After YUMI has added one or more OSes and tools, the USB stick is still visible as normal drive under both Windows and Linux, so that other necessary files (like checklist files, other documentation files, etc.) can be further stored on it.

This tool was very useful to me when I needed to install and config new laptops (Linux and Windows), and to troubleshoot non-bootable computers, and this is why I like this software so much, and I wanted to save here at GitHub a public copy of it for safekeeping.

There is a Windows version and a Linux version. (The Linux version is not part of this repo, and was written in gambas, a visual-basic-for-linux language.)

The Windows version consists of .nsh files which belong to the "Nullsoft Scriptable Installer System".

There seems to be no official Git repo, only the source code in a zip file. This is why I created this unofficial repo.



NOTES

YUMI is free software (GPL 3.0 - https://www.gnu.org/licenses/gpl-3.0.en.html). You can contact me if you want to know why I chose this license, or if you want to debate the merits of  GNU Project's more restrictive licenses (strong copyleft, like GPL 3, AGPL 3, etc.) versus the more permissive open source licenses (MIT, Apache 2.0, etc.) or the weak copyleft ones (LGPL 3, CPL 1.0, Eclipse 2.0, Mozilla 1.1, etc.).
