\ ******************************************************************************
\
\ ACORN ELECTRON ELITE COMPENDIUM DISC IMAGE SCRIPT
\
\ Acorn Electron Elite was written by Ian Bell and David Braben and is copyright
\ Acornsoft 1984
\
\ The code in this file has been reconstructed from a disassembly of the version
\ released on Ian Bell's personal website at http://www.elitehomepage.org/
\
\ The commentary is copyright Mark Moxon, and any misunderstandings or mistakes
\ in the documentation are entirely my fault
\
\ The terminology and notations used in this commentary are explained at
\ https://elite.bbcelite.com/terminology
\
\ The deep dive articles referred to in this commentary can be found at
\ https://elite.bbcelite.com/deep_dives
\
\ ------------------------------------------------------------------------------
\
\ This source file produces side 2 of the following DSD disc image:
\
\   * elite-compendium.dsd
\
\ This can be loaded into an emulator or a real Acorn Electron.
\
\ ******************************************************************************

\ Menu

 PUTBASIC "1-source-files/menu-files/$.MENU.bas", "MENU"
 PUTFILE "2-assembled-output/SCREEN.bin", "SCREEN", &005700, &005700

\ Musical version

 PUTBASIC "elite-source-code-acorn-electron-music/1-source-files/basic-programs/load-rom.bas", "ELITESR"
 PUTFILE "elite-source-code-acorn-electron-music/1-source-files/basic-programs/$.ELITE-disc.bin", "ELITE", &FF0E00, &FF8023
 PUTFILE "elite-source-code-acorn-electron-music/3-assembled-output/ELITEDA.bin", "ELITEDA", &FF4400, &FF5200
 PUTFILE "elite-source-code-acorn-electron-music/3-assembled-output/ELTROM1.bin", "ELITER1", &FF8000, &FF8000
 PUTFILE "elite-source-code-acorn-electron-music/3-assembled-output/ELTROM2.bin", "ELITER2", &FFA000, &FFA000
 PUTFILE "elite-source-code-acorn-electron-music/3-assembled-output/ELITECO.bin", "ELITECO", &000000, &FFFFFF
 PUTFILE "elite-source-code-acorn-electron-music/3-assembled-output/D.MOZ.bin", "D.MOZ", &004E00, &004E00

 PUTFILE "elite-source-code-acorn-electron-music/1-source-files/music/MUSIC1", "M.MUSIC1", &000E00, &000E00
 PUTFILE "elite-source-code-acorn-electron-music/1-source-files/music/MUSIC2", "M.MUSIC2", &000E00, &000E00
