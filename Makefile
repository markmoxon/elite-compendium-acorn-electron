BEEBASM?=beebasm
BEEBTOOLS?=beebtools
DSD?=3-compiled-game-discs/elite-compendium-acorn-electron.dsd
ADL?=3-compiled-game-discs/elite-compendium-acorn-electron.adl

.PHONY:all
all: build-ssd build-dsd build-adl

.PHONY:build-ssd
build:
	$(BEEBASM) -i 1-source-files/main-sources/elite-acornsoft.asm
	$(BEEBASM) -i 1-source-files/main-sources/elite-readme.asm
	$(BEEBASM) -i 1-source-files/main-sources/elite-disc-1.asm -do 3-compiled-game-discs/elite-compendium-acorn-electron-drive-0.ssd -opt 3 -title "CompendiumE0"
	$(BEEBASM) -i 1-source-files/main-sources/elite-disc-2.asm -do 3-compiled-game-discs/elite-compendium-acorn-electron-drive-2.ssd -title "CompendiumE2"

.PHONY:build-dsd
build-dsd:
	# Create DSD disc image
	$(BEEBTOOLS) create $(DSD) -t 80 --title "Compendium E" --boot EXEC

	# Build drive 0

	# Boot files
	$(BEEBTOOLS) add $(DSD) 1-source-files/boot-files/$$.!BOOT.bin --name !BOOT --load FFFFFFFF --exec FFFFFFFF
	$(BEEBTOOLS) add $(DSD) 2-assembled-output/README.txt --name README --load FFFFFFFF --exec FFFFFFFF

	# Shared disc files
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOA.bin --name D.MOA --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOB.bin --name D.MOB --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOC.bin --name D.MOC --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOD.bin --name D.MOD --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOE.bin --name D.MOE --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOF.bin --name D.MOF --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOG.bin --name D.MOG --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOH.bin --name D.MOH --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOI.bin --name D.MOI --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOJ.bin --name D.MOJ --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOK.bin --name D.MOK --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOL.bin --name D.MOL --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOM.bin --name D.MOM --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MON.bin --name D.MON --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOO.bin --name D.MOO --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOP.bin --name D.MOP --load 00004E00 --exec 00004E00

	# Compendium version
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/D.MOZ.bin --name D.MOZ --load 00004E00 --exec 00004E00

	# Musical version
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron-music/3-assembled-output/D.MOZ.bin --name D.MOY --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron-music/elk-elite-music/output/elite/MUSIC1 --name M.MUSIC1 --load 00000E00 --exec 00000E00
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron-music/elk-elite-music/output/elite/MUSIC2 --name M.MUSIC2 --load 00000E00 --exec 00000E00

	# Commander files
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/1-source-files/other-files/E.MAX.bin --name E.MAX --load 00000000 --exec 00000000
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/1-source-files/other-files/E.MISS1.bin --name E.MISS1 --load 00000000 --exec 00000000
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/1-source-files/other-files/E.MISS2.bin --name E.MISS2 --load 00000000 --exec 00000000

	# Build drive 2

	# Menu
	$(BEEBTOOLS) add $(DSD) 1-source-files/menu-files/$$.MENU.bas --name MENU --basic --side 1
	$(BEEBTOOLS) add $(DSD) 2-assembled-output/SCREEN.bin --name SCREEN --load 00005700 --exec 00005700 --side 1

	# Standard version
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/1-source-files/basic-programs/load-rom.bas --name ELITEC --basic --side 1
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/1-source-files/basic-programs/$$.ELITE-disc.bin --name ELITEC2 --load FFFF0E00 --exec FFFF8023 --side 1
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/ELITEDA.bin --name ELITECD --load FFFF4400 --exec FFFF5200 --side 1
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/ELTROM1.bin --name ELITER1 --load FFFF8000 --exec FFFF8000 --side 1
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/ELTROM2.bin --name ELITER2 --load FFFFA000 --exec FFFFA000 --side 1
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron/3-assembled-output/ELITECO.bin --name ELITECC --load 00000000 --exec FFFFFFFF --side 1

	# Musical version
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron-music/1-source-files/basic-programs/load-rom.bas --name ELITEM --basic --side 1
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron-music/1-source-files/basic-programs/$$.ELITE-disc.bin --name ELITEM2 --load FFFF0E00 --exec FFFF8023 --side 1
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron-music/3-assembled-output/ELITEDA.bin --name ELITEMD --load FFFF4400 --exec FFFF5200 --side 1
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron-music/3-assembled-output/ELTROM1.bin --name ELITER3 --load FFFF8000 --exec FFFF8000 --side 1
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron-music/3-assembled-output/ELTROM2.bin --name ELITER4 --load FFFFA000 --exec FFFFA000 --side 1
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron-music/3-assembled-output/ELITECO.bin --name ELITEMC --load 00000000 --exec FFFFFFFF --side 1

	# Flicker-free
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron-flicker-free/1-source-files/basic-programs/$$.ELITE-disc.bin --name ELITE --load FFFF0E00 --exec FFFF8023 --side 1
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron-flicker-free/3-assembled-output/ELITECO.bin --name ELITECO --load 00000000 --exec FFFFFFFF --side 1
	$(BEEBTOOLS) add $(DSD) elite-source-code-acorn-electron-flicker-free/3-assembled-output/ELITEDA.bin --name ELITEDA --load FFFF4400 --exec FFFF5200 --side 1

.PHONY:build-adl
build-adl:
	# Create ADFS disc image
	$(BEEBTOOLS) create $(ADL) -t 80 --title "Compendium E" --boot EXEC

	# Boot files
	$(BEEBTOOLS) add $(ADL) 1-source-files/boot-files/$$.!BOOT-adfs.bin --name $$.!BOOT --load FFFFFFFF --exec FFFFFFFF
	$(BEEBTOOLS) add $(ADL) 2-assembled-output/README.txt --name $$.README --load FFFFFFFF --exec FFFFFFFF

	# Shared disc files
	$(BEEBTOOLS) mkdir $(ADL) $$.D
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOA.bin --name $$.D.MOA --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOB.bin --name $$.D.MOB --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOC.bin --name $$.D.MOC --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOD.bin --name $$.D.MOD --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOE.bin --name $$.D.MOE --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOF.bin --name $$.D.MOF --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOG.bin --name $$.D.MOG --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOH.bin --name $$.D.MOH --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOI.bin --name $$.D.MOI --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOJ.bin --name $$.D.MOJ --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOK.bin --name $$.D.MOK --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOL.bin --name $$.D.MOL --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOM.bin --name $$.D.MOM --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MON.bin --name $$.D.MON --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOO.bin --name $$.D.MOO --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOP.bin --name $$.D.MOP --load 00004E00 --exec 00004E00

	# Compendium version
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/D.MOZ.bin --name $$.D.MOZ --load 00004E00 --exec 00004E00

	# Musical version
	$(BEEBTOOLS) mkdir $(ADL) $$.M
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron-music/3-assembled-output/D.MOZ.bin --name $$.D.MOY --load 00004E00 --exec 00004E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron-music/elk-elite-music/output/elite/MUSIC1 --name $$.M.MUSIC1 --load 00000E00 --exec 00000E00
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron-music/elk-elite-music/output/elite/MUSIC2 --name $$.M.MUSIC2 --load 00000E00 --exec 00000E00

	# Commander files
	$(BEEBTOOLS) mkdir $(ADL) $$.E
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/1-source-files/other-files/E.MAX.bin --name $$.E.MAX --load 00000000 --exec 00000000
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/1-source-files/other-files/E.MISS1.bin --name $$.E.MISS1 --load 00000000 --exec 00000000
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/1-source-files/other-files/E.MISS2.bin --name $$.E.MISS2 --load 00000000 --exec 00000000

	# Menu
	$(BEEBTOOLS) add $(ADL) 1-source-files/menu-files/$$.MENU.bas --name $$.MENU --basic
	$(BEEBTOOLS) add $(ADL) 2-assembled-output/SCREEN.bin --name $$.SCREEN --load 00005700 --exec 00005700

	# Standard version
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/1-source-files/basic-programs/load-rom.bas --name $$.ELITEC --basic
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/1-source-files/basic-programs/$$.ELITE-disc.bin --name $$.ELITEC2 --load FFFF0E00 --exec FFFF8023
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/ELITEDA.bin --name $$.ELITECD --load FFFF4400 --exec FFFF5200
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/ELTROM1.bin --name $$.ELITER1 --load FFFF8000 --exec FFFF8000
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/ELTROM2.bin --name $$.ELITER2 --load FFFFA000 --exec FFFFA000
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron/3-assembled-output/ELITECO.bin --name $$.ELITECC --load 00000000 --exec FFFFFFFF

	# Musical version
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron-music/1-source-files/basic-programs/load-rom.bas --name $$.ELITEM --basic
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron-music/1-source-files/basic-programs/$$.ELITE-disc.bin --name $$.ELITEM2 --load FFFF0E00 --exec FFFF8023
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron-music/3-assembled-output/ELITEDA.bin --name $$.ELITEMD --load FFFF4400 --exec FFFF5200
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron-music/3-assembled-output/ELTROM1.bin --name $$.ELITER3 --load FFFF8000 --exec FFFF8000
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron-music/3-assembled-output/ELTROM2.bin --name $$.ELITER4 --load FFFFA000 --exec FFFFA000
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron-music/3-assembled-output/ELITECO.bin --name $$.ELITEMC --load 00000000 --exec FFFFFFFF

	# Flicker-free
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron-flicker-free/1-source-files/basic-programs/$$.ELITE-disc.bin --name $$.ELITE --load FFFF0E00 --exec FFFF8023
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron-flicker-free/3-assembled-output/ELITECO.bin --name $$.ELITECO --load 00000000 --exec FFFFFFFF
	$(BEEBTOOLS) add $(ADL) elite-source-code-acorn-electron-flicker-free/3-assembled-output/ELITEDA.bin --name $$.ELITEDA --load FFFF4400 --exec FFFF5200
