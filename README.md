YUMI

YUMI ("Your Universal Multiboot Installer") is a nifty little tool for creating bootable multi-ISO-image USB drives, which supports dozens of Linux distros and system tools, and can automatically downloads the ISO images for you. Able to add to the same USB drive many bootable ISO images of Linux distros and system tools, and ISO images of Windows 8 / Windows 10 / Windows 11. You are limited only by the total capacity (storage size) of your USB drive.

The result USB drive is able to boot with both UEFI firmware and legacy BIOS firmware.

After YUMI has added one or more OSes and tools, the USB stick is still visible as normal drive under both Windows and Linux, so that other necessary files (like checklist files, other documentation files, etc.) can be further stored on it.

This is why I like this software so much, and I wanted to save here at GitHub a public copy of it for safekeeping.

There is a Windows version and a Linux version. (The Linux version is not part of this repo, and was written in gambas, a visual-basic-for-linux language.)

The Windows version consists of .nsh files which belong to the "Nullsoft Scriptable Installer System".


Notes

Yumi is free software (GPL 3.0).

There seems to be no official Git repo, only the source code in a zip file. This is why I created this unofficial repo.
