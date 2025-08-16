MODE 6
*FX 4,1
*FX 200,1
VDU 23;8202;0;0;0;
*RUN SCREEN
UH$="   "
UL$="   "
HH$=" | "
HL$=" | "
UT$="                                        "
UB$="                                        "
HT$=" "+CHR$(&AD)+"------------------------------------"+CHR$(&AE)+" "
HB$=" "+CHR$(&AF)+"------------------------------------"+CHR$(&B0)+" "
START%=3
ROWS%=4
PROCtitle
PROCoptions
PROCselect
PROCgettitle
PROCrun
END

DEF PROCrun
IF O%=0 PROCcompendium
IF O%=1 PROCmusic
IF O%=2 PROCflickerfree
ENDPROC

DEF PROCtitle
PRINT''"   Elite by Ian Bell and David Braben"
PRINT"       Enhancements by Mark Moxon"
PRINT'CHR$(&AB);CHR$(&AC);" to select, ";CHR$(&AA);" for info, RETURN to play";
VDU28,0,24,39,9
ENDPROC

DEF PROCoptions
RESTORE
READ T$,V$
Y%=START%
C%=0
REPEAT
PROChl(Y%,UH$,UL$,UT$,UB$)
PROCsh(Y%,T$)
PROCsh(Y%+1,V$)
Y%=Y%+ROWS%
C%=C%+1
READ T$, V$
UNTIL T$=""
ENDPROC

DEF PROCgettitle
RESTORE
FOR L%=0 TO O%
READ T$,V$
NEXT
CLS
PROCsh(2,T$)
PROCsh(3,V$)
PROChl(2,HH$,HL$,HT$,HB$)
PRINT'
ENDPROC

DEF PROCselect
L%=(O%+1)MOD C%
REPEAT
IF O%<>L% THEN PROChl(START%+L%*ROWS%,UH$,UL$,UT$,UB$):PROChl(START%+O%*ROWS%,HH$,HL$,HT$,HB$)
L%=O%
K%=GET
IF K%=138 THEN O%=(O%+1)MOD C%
IF K%=139 THEN O%=(O%+C%-1)MOD C%
IF K%=136 OR K%=137 THEN PROCinfo
UNTIL K%=13
ENDPROC

DEF PROCcompendium
IF PAGE>&1E00 THEN PROCpagetoohigh
*FX 12,0
PAGE=&1D00:CHAIN "ELITEC"
ENDPROC

DEF PROCmusic
IF PAGE>&F00 THEN PROCmusicalpagetoohigh
*FX 12,0
PAGE=&0E00:CHAIN "ELITEM"
ENDPROC

DEF PROCflickerfree
*FX 12,0
PAGE=&1D00:CHAIN "ELITE"
ENDPROC

DEF PROCsh(Y%,T$)
LOCAL X%
X%=20-LEN(T$)/2
PRINTTAB(X%,Y%);T$;
ENDPROC

DEF PROChl(Y%,T$,U$,A$,B$)
PRINTTAB(0,Y%);T$;TAB(37,Y%);T$;
PRINTTAB(0,Y%+1);U$;TAB(37,Y%+1);U$;
PRINTTAB(0,Y%-1);A$;
PRINTTAB(0,Y%+2);B$;
ENDPROC

DEF PROCinfo
PROCgettitle
PRINTTAB(0,0);"        ";CHR$(&AA);" for menu, RETURN to play";
IF O%=0 PROCsh(5,"The classic 1984 Electron release"):PROCsh(6,"with the following enhancements"):PROCsh(8,"All the features of BBC Micro Elite")
IF O%=0 PROCsh(9,"Flicker-free ships and planets"):PROCsh(10,"Docking computer improvements"):PROCsh(11,"The epic Trumbles mission"):PROCsh(12,"Joystick and fuel scoop improvements")
IF O%=1 PROCsh(5,"The classic 1984 Electron release"):PROCsh(6,"with the following enhancements"):PROCsh(8,"All the features of BBC Micro Elite")
IF O%=1 PROCsh(9,"Music (title screen and docking)"):PROCsh(10,"Flicker-free ships and planets"):PROCsh(11,"Docking computer improvements"):PROCsh(12,"Trumbles, joystick improvements etc.")
IF O%=2 PROCsh(5,"The classic 1984 Electron release"):PROCsh(6,"with the following enhancements"):PROCsh(8,"Flicker-free ships")
IF O%=2 PROCsh(9,"Flicker-free planets"):PROCsh(10,"Higher fidelity planet circles"):PROCsh(11,"More stardust particle sizes"):PROCsh(12,"Save/load commanders to tape only")
IF O%=0 PROCsh(14,"For the Electron with 16K sideways RAM")
IF O%=1 PROCsh(14,"For the Electron & 16K SRAM & E00 disc")
IF O%=2 PROCsh(14,"For the standard Acorn Electron")
PROCsh(15,"See www.bbcelite.com for more details")
REPEAT
K%=GET
UNTIL K%=136 OR K%=137 OR K%=13
IF K%=13 PROCgettitle:PROCrun
CLS
PRINT CHR$(&AB);CHR$(&AC);" to select, ";CHR$(&AA);" for info, RETURN to play";
PROCoptions
PROChl(START%+O%*ROWS%,HH$,HL$,HT$,HB$)
L%=O%
ENDPROC

DEF PROCpagetoohigh
PRINT"Sorry, this version of the Elite"
PRINT"Compendium only works when PAGE"
PRINT"is &1D00 or lower, and PAGE is"
PRINT"currently &";STR$~PAGE;"."
PRINT'"Please free up more memory and"
PRINT"try again."
END
ENDPROC

DEF PROCmusicalpagetoohigh
PRINT"Sorry, this version of the Elite"
PRINT"Compendium only works when PAGE"
PRINT"is &0E00 or lower, and PAGE is"
PRINT"currently &";STR$~PAGE;"."
PRINT'"Please free up more memory and"
PRINT"try again."
END
ENDPROC

REM  "----------------------------------"
DATA "Compendium Elite on the Electron"
DATA "Super-fast & packed with features"
DATA "Compendium Elite... with music!"
DATA "With added docking and title tunes"
DATA "Flicker-free Electron Elite"
DATA "The best version of cassette Elite"
DATA "",""
