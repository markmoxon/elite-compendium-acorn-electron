#!/usr/bin/env bash

image=3-compiled-game-discs/elite-compendium-acorn-electron.adl

# Create ADFS disc image

beebtools create $image -t 80 --title "Compendium E" --boot EXEC

# Boot files

beebtools add $image 1-source-files/boot-files/$.!BOOT-adfs.bin --name $.!BOOT --load FFFFFFFF --exec FFFFFFFF
beebtools add $image 2-assembled-output/README.txt --name $.README --load FFFFFFFF --exec FFFFFFFF

# Shared disc files

beebtools mkdir $image $.D
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOA.bin --name $.D.MOA --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOB.bin --name $.D.MOB --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOC.bin --name $.D.MOC --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOD.bin --name $.D.MOD --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOE.bin --name $.D.MOE --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOF.bin --name $.D.MOF --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOG.bin --name $.D.MOG --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOH.bin --name $.D.MOH --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOI.bin --name $.D.MOI --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOJ.bin --name $.D.MOJ --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOK.bin --name $.D.MOK --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOL.bin --name $.D.MOL --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOM.bin --name $.D.MOM --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MON.bin --name $.D.MON --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOO.bin --name $.D.MOO --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOP.bin --name $.D.MOP --load 00004E00 --exec 00004E00

# Compendium version

beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOZ.bin --name $.D.MOZ --load 00004E00 --exec 00004E00

# Musical version

beebtools mkdir $image $.M
beebtools add $image elite-source-code-acorn-electron-music/3-assembled-output/D.MOZ.bin --name $.D.MOY --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron-music/elk-elite-music/output/elite/MUSIC1 --name $.M.MUSIC1 --load 00000E00 --exec 00000E00
beebtools add $image elite-source-code-acorn-electron-music/elk-elite-music/output/elite/MUSIC2 --name $.M.MUSIC2 --load 00000E00 --exec 00000E00

# Commander files

beebtools mkdir $image $.E
beebtools add $image elite-source-code-acorn-electron/1-source-files/other-files/E.MAX.bin --name $.E.MAX --load 00000000 --exec 00000000
beebtools add $image elite-source-code-acorn-electron/1-source-files/other-files/E.MISS1.bin --name $.E.MISS1 --load 00000000 --exec 00000000
beebtools add $image elite-source-code-acorn-electron/1-source-files/other-files/E.MISS2.bin --name $.E.MISS2 --load 00000000 --exec 00000000

# Menu

beebtools add $image 1-source-files/menu-files/$.MENU.bas --name $.MENU --basic
beebtools add $image 2-assembled-output/SCREEN.bin --name $.SCREEN --load 00005700 --exec 00005700

# Standard version

beebtools add $image elite-source-code-acorn-electron/1-source-files/basic-programs/load-rom.bas --name $.ELITEC --basic
beebtools add $image elite-source-code-acorn-electron/1-source-files/basic-programs/$.ELITE-disc.bin --name $.ELITEC2 --load FFFF0E00 --exec FFFF8023
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/ELITEDA.bin --name $.ELITECD --load FFFF4400 --exec FFFF5200
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/ELTROM1.bin --name $.ELITER1 --load FFFF8000 --exec FFFF8000
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/ELTROM2.bin --name $.ELITER2 --load FFFFA000 --exec FFFFA000
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/ELITECO.bin --name $.ELITECC --load 00000000 --exec FFFFFFFF

# Musical version

beebtools add $image elite-source-code-acorn-electron-music/1-source-files/basic-programs/load-rom.bas --name $.ELITEM --basic
beebtools add $image elite-source-code-acorn-electron-music/1-source-files/basic-programs/$.ELITE-disc.bin --name $.ELITEM2 --load FFFF0E00 --exec FFFF8023
beebtools add $image elite-source-code-acorn-electron-music/3-assembled-output/ELITEDA.bin --name $.ELITEMD --load FFFF4400 --exec FFFF5200
beebtools add $image elite-source-code-acorn-electron-music/3-assembled-output/ELTROM1.bin --name $.ELITER3 --load FFFF8000 --exec FFFF8000
beebtools add $image elite-source-code-acorn-electron-music/3-assembled-output/ELTROM2.bin --name $.ELITER4 --load FFFFA000 --exec FFFFA000
beebtools add $image elite-source-code-acorn-electron-music/3-assembled-output/ELITECO.bin --name $.ELITEMC --load 00000000 --exec FFFFFFFF

# Flicker-free

beebtools add $image elite-source-code-acorn-electron-flicker-free/1-source-files/basic-programs/$.ELITE-disc.bin --name $.ELITE --load FFFF0E00 --exec FFFF8023
beebtools add $image elite-source-code-acorn-electron-flicker-free/3-assembled-output/ELITECO.bin --name $.ELITECO --load 00000000 --exec FFFFFFFF
beebtools add $image elite-source-code-acorn-electron-flicker-free/3-assembled-output/ELITEDA.bin --name $.ELITEDA --load FFFF4400 --exec FFFF5200
