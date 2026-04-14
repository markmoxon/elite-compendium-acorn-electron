#!/usr/bin/env bash

image=3-compiled-game-discs/elite-compendium-acorn-electron.dsd

# Create DSD disc image

beebtools create $image -t 80 --title "Compendium E" --boot EXEC

# Boot files (drive 0)

beebtools add $image 2-assembled-output/README.txt --name README --load FFFFFFFF --exec FFFFFFFF
beebtools add $image 1-source-files/boot-files/$.!BOOT.bin --name !BOOT --load FFFFFFFF --exec FFFFFFFF

# Shared disc files (drive 0)

beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOA.bin --name D.MOA --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOB.bin --name D.MOB --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOC.bin --name D.MOC --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOD.bin --name D.MOD --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOE.bin --name D.MOE --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOF.bin --name D.MOF --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOG.bin --name D.MOG --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOH.bin --name D.MOH --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOI.bin --name D.MOI --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOJ.bin --name D.MOJ --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOK.bin --name D.MOK --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOL.bin --name D.MOL --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOM.bin --name D.MOM --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MON.bin --name D.MON --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOO.bin --name D.MOO --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOP.bin --name D.MOP --load 00004E00 --exec 00004E00

# Compendium version (drive 0)

beebtools add $image elite-source-code-acorn-electron/3-assembled-output/D.MOZ.bin --name D.MOZ --load 00004E00 --exec 00004E00

# Musical version (drive 0)

beebtools add $image elite-source-code-acorn-electron-music/3-assembled-output/D.MOZ.bin --name D.MOY --load 00004E00 --exec 00004E00
beebtools add $image elite-source-code-acorn-electron-music/elk-elite-music/output/elite/MUSIC1 --name M.MUSIC1 --load 00000E00 --exec 00000E00
beebtools add $image elite-source-code-acorn-electron-music/elk-elite-music/output/elite/MUSIC2 --name M.MUSIC2 --load 00000E00 --exec 00000E00

# Commander files (drive 0)

beebtools add $image elite-source-code-acorn-electron/1-source-files/other-files/E.MAX.bin --name E.MAX --load 00000000 --exec 00000000
beebtools add $image elite-source-code-acorn-electron/1-source-files/other-files/E.MISS1.bin --name E.MISS1 --load 00000000 --exec 00000000
beebtools add $image elite-source-code-acorn-electron/1-source-files/other-files/E.MISS2.bin --name E.MISS2 --load 00000000 --exec 00000000

# Menu (drive 2)

beebtools add $image 1-source-files/menu-files/$.MENU.bas --name MENU --basic --side 1
beebtools add $image 2-assembled-output/SCREEN.bin --name SCREEN --load 00005700 --exec 00005700 --side 1

# Standard version (drive 2)

beebtools add $image elite-source-code-acorn-electron/1-source-files/basic-programs/load-rom.bas --name ELITEC --basic --side 1
beebtools add $image elite-source-code-acorn-electron/1-source-files/basic-programs/$.ELITE-disc.bin --name ELITEC2 --load FFFF0E00 --exec FFFF8023 --side 1
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/ELITEDA.bin --name ELITECD --load FFFF4400 --exec FFFF5200 --side 1
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/ELTROM1.bin --name ELITER1 --load FFFF8000 --exec FFFF8000 --side 1
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/ELTROM2.bin --name ELITER2 --load FFFFA000 --exec FFFFA000 --side 1
beebtools add $image elite-source-code-acorn-electron/3-assembled-output/ELITECO.bin --name ELITECC --load 00000000 --exec FFFFFFFF --side 1

# Musical version (drive 2)

beebtools add $image elite-source-code-acorn-electron-music/1-source-files/basic-programs/load-rom.bas --name ELITEM --basic --side 1
beebtools add $image elite-source-code-acorn-electron-music/1-source-files/basic-programs/$.ELITE-disc.bin --name ELITEM2 --load FFFF0E00 --exec FFFF8023 --side 1
beebtools add $image elite-source-code-acorn-electron-music/3-assembled-output/ELITEDA.bin --name ELITEMD --load FFFF4400 --exec FFFF5200 --side 1
beebtools add $image elite-source-code-acorn-electron-music/3-assembled-output/ELTROM1.bin --name ELITER3 --load FFFF8000 --exec FFFF8000 --side 1
beebtools add $image elite-source-code-acorn-electron-music/3-assembled-output/ELTROM2.bin --name ELITER4 --load FFFFA000 --exec FFFFA000 --side 1
beebtools add $image elite-source-code-acorn-electron-music/3-assembled-output/ELITECO.bin --name ELITEMC --load 00000000 --exec FFFFFFFF --side 1

# Flicker-free (drive 2)

beebtools add $image elite-source-code-acorn-electron-flicker-free/1-source-files/basic-programs/$.ELITE-disc.bin --name ELITE --load FFFF0E00 --exec FFFF8023 --side 1
beebtools add $image elite-source-code-acorn-electron-flicker-free/3-assembled-output/ELITECO.bin --name ELITECO --load 00000000 --exec FFFFFFFF --side 1
beebtools add $image elite-source-code-acorn-electron-flicker-free/3-assembled-output/ELITEDA.bin --name ELITEDA --load FFFF4400 --exec FFFF5200 --side 1
