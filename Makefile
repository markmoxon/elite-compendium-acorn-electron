BEEBASM?=beebasm
DISC?=oaknut-disc
DSD?=4-compiled-game-discs/elite-compendium-acorn-electron.dsd
ADF?=4-compiled-game-discs/elite-compendium-acorn-electron.adf

.PHONY:all
all: build-ssd build-dsd build-adl

.PHONY:build-ssd
build-ssd:
	$(BEEBASM) -i 1-source-files/main-sources/elite-acornsoft.asm
	$(BEEBASM) -i 1-source-files/main-sources/elite-readme.asm
	$(BEEBASM) -i 1-source-files/main-sources/elite-disc-1.asm -do 4-compiled-game-discs/elite-compendium-acorn-electron-drive-0.ssd -opt 3 -title "CompendiumE0"
	$(BEEBASM) -i 1-source-files/main-sources/elite-disc-2.asm -do 4-compiled-game-discs/elite-compendium-acorn-electron-drive-2.ssd -title "CompendiumE2"

.PHONY:build-dsd
build-dsd:
	$(DISC) create $(DSD) --title "Compendium E"
	$(DISC) opt $(DSD) EXEC
	$(DISC) cp -r "4-compiled-game-discs/elite-compendium-acorn-electron-drive-0.ssd:*" $(DSD)
	$(DISC) cp -r "4-compiled-game-discs/elite-compendium-acorn-electron-drive-2.ssd:*" $(DSD)::2.

.PHONY:build-adl
build-adl:
	$(DISC) create $(ADF) --title "Compendium E" --geometry m
	$(DISC) opt $(ADF) EXEC
	$(DISC) cp -r "4-compiled-game-discs/elite-compendium-acorn-electron-drive-0.ssd:*" $(ADF)
	$(DISC) cp -r "4-compiled-game-discs/elite-compendium-acorn-electron-drive-2.ssd:*" $(ADF)
	$(DISC) rm $(ADF):$$.!BOOT 
	$(DISC) put $(ADF):$$.!BOOT 1-source-files/boot-files/$$.!BOOT-adfs.bin --load 0xFFFFFFFF --exec 0xFFFFFFFF
