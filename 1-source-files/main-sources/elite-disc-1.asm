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
\ This source file produces side 1 of the following DSD disc image:
\
\   * elite-compendium.dsd
\
\ This can be loaded into an emulator or a real Acorn Electron.
\
\ ******************************************************************************

\ Boot files

 PUTFILE "2-assembled-output/README.txt", "README", &FFFFFF, &FFFFFF
 PUTFILE "1-source-files/boot-files/$.!BOOT.bin", "!BOOT", &FFFFFF, &FFFFFF

\ Shared disc files

 PUTBASIC "elite-source-code-acorn-electron/1-source-files/basic-programs/load-rom.bas", "ELITESR"
 PUTFILE "elite-source-code-acorn-electron/1-source-files/basic-programs/$.ELITE-disc.bin", "ELITE", &FF0E00, &FF8023
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/ELITEDA.bin", "ELITEDA", &FF4400, &FF5200
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/ELTROM1.bin", "ELITER1", &FF8000, &FF8000
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/ELTROM2.bin", "ELITER2", &FFA000, &FFA000
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/ELITECO.bin", "ELITECO", &000000, &FFFFFF

 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOA.bin", "D.MOA", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOB.bin", "D.MOB", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOC.bin", "D.MOC", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOD.bin", "D.MOD", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOE.bin", "D.MOE", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOF.bin", "D.MOF", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOG.bin", "D.MOG", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOH.bin", "D.MOH", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOI.bin", "D.MOI", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOJ.bin", "D.MOJ", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOK.bin", "D.MOK", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOL.bin", "D.MOL", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOM.bin", "D.MOM", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MON.bin", "D.MON", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOO.bin", "D.MOO", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOP.bin", "D.MOP", &004E00, &004E00
 PUTFILE "elite-source-code-acorn-electron/3-assembled-output/D.MOZ.bin", "D.MOZ", &004E00, &004E00

 PUTFILE "elite-source-code-acorn-electron/1-source-files/music/MUSIC1", "M.MUSIC1", &000E00, &000E00
 PUTFILE "elite-source-code-acorn-electron/1-source-files/music/MUSIC2", "M.MUSIC2", &000E00, &000E00

\ Commander files

 PUTFILE "elite-source-code-acorn-electron/1-source-files/other-files/E.MAX.bin", "E.MAX", &000000, &000000
 PUTFILE "elite-source-code-acorn-electron/1-source-files/other-files/E.MISS1.bin", "E.MISS1", &000000, &000000
 PUTFILE "elite-source-code-acorn-electron/1-source-files/other-files/E.MISS2.bin", "E.MISS2", &000000, &000000
