BEEBASM?=beebasm

.PHONY:all
all:
	$(BEEBASM) -i 1-source-files/main-sources/elite-acornsoft.asm
	$(BEEBASM) -i 1-source-files/main-sources/elite-readme.asm
	$(BEEBASM) -i 1-source-files/main-sources/elite-disc-1.asm -do 3-compiled-game-discs/elite-compendium-acorn-electron-drive-0.ssd -opt 3 -title "CompendiumE0"
	$(BEEBASM) -i 1-source-files/main-sources/elite-disc-2.asm -do 3-compiled-game-discs/elite-compendium-acorn-electron-drive-2.ssd -title "CompendiumE2"
	./build-dsd.sh
	./build-adl.sh

.PHONY:b2
b2:
	curl -G "http://localhost:48075/reset/b2"
	curl -H "Content-Type:application/binary" --upload-file "3-compiled-game-discs/elite-compendium-acorn-electron.dsd" "http://localhost:48075/run/b2?name=elite-compendium-acorn-electron.dsd"
