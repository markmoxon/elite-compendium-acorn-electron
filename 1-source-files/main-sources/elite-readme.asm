\ ******************************************************************************
\
\ ACORN ELECTRON ELITE COMPENDIUM README
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
\ This source file produces the following binary file:
\
\   * README.txt
\
\ ******************************************************************************

.readme

 EQUB 10, 13
 EQUS "---------------------------------------"
 EQUB 10, 13
 EQUS "Acornsoft Elite (Compendium version)"
 EQUB 10, 13
 EQUB 10, 13
 EQUS "For the Electron with 16K sideways RAM"
 EQUB 10, 13
 EQUB 10, 13
 EQUS "Flicker-free routines, bug fixes and"
 EQUB 10, 13
 EQUS "other enhancements by Mark Moxon"
 EQUB 10, 13
 EQUB 10, 13
 EQUS "Sound routines by Negative Charge"
 EQUB 10, 13
 EQUB 10, 13
 EQUS "Original music by Aidan Bell and Julie"
 EQUB 10, 13
 EQUS "Dunn (c) D. Braben and I. Bell 1985,"
 EQUB 10, 13
 EQUS "ported from MIDI by Negative Charge"
 EQUB 10, 13
 EQUB 10, 13
 EQUS "Sideways RAM loader, routines and"
 EQUB 10, 13
 EQUS "inspiration by Wouter Hobers"
 EQUB 10, 13
 EQUB 10, 13

 EQUS "See www.bbcelite.com for details"
 EQUB 10, 13
 EQUB 10, 13
 EQUS "Build: ", TIME$("%F %T")
 EQUB 10, 13
 EQUS "---------------------------------------"
 EQUB 10, 13

 SAVE "2-assembled-output/README.txt", readme, P%

