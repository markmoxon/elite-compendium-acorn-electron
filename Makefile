BEEBASM?=beebasm
DISC?=oaknut-disc
DSD?=3-compiled-game-discs/elite-compendium-acorn-electron.dsd
ADL?=3-compiled-game-discs/elite-compendium-acorn-electron.adl

.PHONY:all
all: build-ssd build-dsd build-adl

.PHONY:build-ssd
build-ssd:
	$(BEEBASM) -i 1-source-files/main-sources/elite-acornsoft.asm
	$(BEEBASM) -i 1-source-files/main-sources/elite-readme.asm
	$(BEEBASM) -i 1-source-files/main-sources/elite-disc-1.asm -do 3-compiled-game-discs/elite-compendium-acorn-electron-drive-0.ssd -opt 3 -title "CompendiumE0"
	$(BEEBASM) -i 1-source-files/main-sources/elite-disc-2.asm -do 3-compiled-game-discs/elite-compendium-acorn-electron-drive-2.ssd -title "CompendiumE2"

.PHONY:build-dsd
build-dsd:
	$(DISC) create $(DSD) --title "Compendium E"
	$(DISC) opt $(DSD) EXEC
	$(DISC) cp -r "3-compiled-game-discs/elite-compendium-acorn-electron-drive-0.ssd:*" $(DSD)
	$(DISC) cp -r "3-compiled-game-discs/elite-compendium-acorn-electron-drive-2.ssd:*" $(DSD)::2.

.PHONY:build-adl
build-adl:
	$(DISC) create $(ADL) --title "Compendium E"
	$(DISC) opt $(ADL) EXEC
	$(DISC) cp -r "3-compiled-game-discs/elite-compendium-acorn-electron-drive-0.ssd:*" $(ADL)
	$(DISC) cp -r "3-compiled-game-discs/elite-compendium-acorn-electron-drive-2.ssd:*" $(ADL)
	$(DISC) rm $(ADL):$$.!BOOT 
	$(DISC) put $(ADL):$$.!BOOT 1-source-files/boot-files/$$.!BOOT-adfs.bin --load 0xFFFFFFFF --exec 0xFFFFFFFF
