\ ******************************************************************************
\
\ ACORN ELECTRON ACORNSOFT LOGO
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
\ This source file code to draw the Acornsoft logo on the Acorn Electron.
\
\ ------------------------------------------------------------------------------
\
\ This source file produces the following binary file:
\
\   * LOGO.bin
\
\ ******************************************************************************

 GUARD &7C00            \ Guard against assembling over screen memory

\ ******************************************************************************
\
\ Configuration variables
\
\ ******************************************************************************

 CODE% = &5700          \ The address where the code will be run

 LOAD% = &5700          \ The address where the code will be loaded

 OSNEWL = &FFE7         \ The address for the OSNEWL routine

 OSWRCH = &FFEE         \ The address for the OSWRCH routine

 OSBYTE = &FFF4         \ The address for the OSBYTE routine

 OSWORD = &FFF1         \ The address for the OSWORD routine

 OSCLI = &FFF7          \ The address for the OSCLI vector

\ ******************************************************************************
\
\       Name: ZP
\       Type: Workspace
\    Address: &0004 to &0005 and &0070 to &0082
\   Category: Workspaces
\    Summary: Important variables used by the loader
\
\ ******************************************************************************

 ORG &0004              \ Set the assembly address to &0004

.TRTB%

 SKIP 2                 \ Contains the address of the keyboard translation
                        \ table, which is used to translate internal key
                        \ numbers to ASCII

 ORG &0070              \ Set the assembly address to &0070

.S

 SKIP 1                 \ Temporary storage, used in a number of places

.ZP

 SKIP 2                 \ Stores addresses used for moving content around

.P

 SKIP 1                 \ Temporary storage, used in a number of places

.Q

 SKIP 1                 \ Temporary storage, used in a number of places

.R

 SKIP 1                 \ Temporary storage, used in a number of places

.T

 SKIP 1                 \ Temporary storage, used in a number of places

 ORG &0081              \ Set the assembly address to &0081

.SC

 SKIP 1                 \ Screen address (low byte)
                        \
                        \ Elite draws on-screen by poking bytes directly into
                        \ screen memory, and SC(1 0) is typically set to the
                        \ address of the character block containing the pixel
                        \ we want to draw

.SCH

 SKIP 1                 \ Screen address (high byte)

\ ******************************************************************************
\
\ ACORNSOFT LOADING SCREEN
\
\ ******************************************************************************

 ORG CODE%              \ Set the assembly address to CODE%

\ ******************************************************************************
\
\       Name: Elite loader (Part 1 of 2)
\       Type: Subroutine
\   Category: Loader
\    Summary: Various copy protection checks, and make sure there is no Tube
\
\ ******************************************************************************

.ENTRY


 JSR LOADSCR            \ Call PROT1 to display the mode 7 loading screen and
                        \ perform lots of copy protection

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ECHAR
\       Type: Variable
\   Category: Loader
\    Summary: Character definitions for the Electron to mimic the graphics
\             characters of the BBC Micro's mode 7 teletext screen
\
\ ******************************************************************************

.ECHAR

 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &E0, &E0, &00, &00, &00, &00, &00, &00
 EQUB &0E, &0E, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &0E, &0E
 EQUB &E0, &E0, &00, &E0, &E0, &00, &00, &00
 EQUB &EE, &EE, &00, &E0, &E0, &00, &00, &00
 EQUB &EE, &EE, &00, &0E, &0E, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &E0, &E0
 EQUB &E0, &E0, &00, &00, &00, &00, &E0, &E0
 EQUB &00, &00, &00, &E0, &E0, &00, &E0, &E0
 EQUB &E0, &E0, &00, &E0, &E0, &00, &E0, &E0
 EQUB &EE, &EE, &00, &E0, &E0, &00, &E0, &E0
 EQUB &EE, &EE, &00, &EE, &EE, &00, &E0, &E0
 EQUB &EE, &EE, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &0E, &0E, &00, &0E, &0E
 EQUB &0E, &0E, &00, &0E, &0E, &00, &0E, &0E
 EQUB &EE, &EE, &00, &0E, &0E, &00, &0E, &0E
 EQUB &EE, &EE, &00, &EE, &EE, &00, &0E, &0E
 EQUB &00, &00, &00, &00, &00, &00, &EE, &EE
 EQUB &EE, &EE, &00, &00, &00, &00, &EE, &EE
 EQUB &00, &00, &00, &E0, &E0, &00, &EE, &EE
 EQUB &E0, &E0, &00, &E0, &E0, &00, &EE, &EE
 EQUB &00, &00, &00, &0E, &0E, &00, &EE, &EE
 EQUB &0E, &0E, &00, &0E, &0E, &00, &EE, &EE
 EQUB &00, &00, &00, &EE, &EE, &00, &EE, &EE
 EQUB &E0, &E0, &00, &EE, &EE, &00, &EE, &EE
 EQUB &0E, &0E, &00, &EE, &EE, &00, &EE, &EE
 EQUB &EE, &EE, &00, &EE, &EE, &00, &EE, &EE

\ ******************************************************************************
\
\       Name: LOGO
\       Type: Variable
\   Category: Loader
\    Summary: Tables containing the Acornsoft logo for the BBC Micro and Acorn
\             Electron
\
\ ******************************************************************************

.LOGO

 EQUB &A0, &A1          \ For the BBC Micro, the tables below consist of offsets
 EQUB &A2, &E0          \ into this top table, so the first three characters of
 EQUB &A5, &A7          \ the Acornsoft logo are &A0 (the &00-th entry in this
 EQUB &AB, &B0          \ table), then &FC (the &18-th entry in this table),
 EQUB &B1, &B4          \ then &B4 (the &09-th entry in this table) and so on
 EQUB &B5, &B7          \
 EQUB &BF, &A3          \ The Electron ignores this top table and just uses the
 EQUB &E8, &EA          \ values below, adding &E0 to get the number of the
 EQUB &EB, &EF          \ relevant user-defined character (so the first three
 EQUB &F0, &F3          \ characters are &E0, then &F8, then &E9 and so on)
 EQUB &F4, &F5          \
 EQUB &F8, &FA          \ The Acornsoft logo is made up of 5 rows with 38
 EQUB &FC, &FD          \ graphics characters on each row, which corresponds
 EQUB &FE, &FF          \ with the tables below

 EQUB &00, &00, &00, &18, &09, &03, &18, &18
 EQUB &07, &00, &16, &18, &14, &00, &18, &18
 EQUB &18, &07, &0E, &14, &00, &0E, &09, &16
 EQUB &18, &18, &07, &00, &1A, &1B, &09, &00
 EQUB &18, &18, &18, &18, &18, &18

 EQUB &00, &00, &17, &1B, &0A, &1B, &05, &06
 EQUB &1B, &0F, &0C, &0D, &11, &0A, &1B, &0D
 EQUB &10, &0A, &0F, &1B, &09, &0F, &0A, &1B
 EQUB &08, &06, &04, &0F, &1B, &1B, &1B, &00
 EQUB &1B, &0D, &0D, &0D, &1B, &0D

 EQUB &00, &0E, &0C, &10, &0A, &1B, &00, &00
 EQUB &00, &0F, &0A, &00, &0F, &0A, &1B, &18
 EQUB &1A, &04, &0F, &0C, &1B, &17, &0A, &06
 EQUB &1B, &19, &07, &1B, &1B, &1B, &1B, &0A
 EQUB &1B, &1B, &1B, &00, &1B, &00

 EQUB &03, &1B, &19, &1A, &0A, &1B, &07, &03
 EQUB &18, &0F, &15, &00, &17, &0A, &1B, &06
 EQUB &19, &00, &0F, &0A, &10, &1B, &0A, &12
 EQUB &00, &10, &1B, &13, &13, &13, &13, &08
 EQUB &1B, &00, &00, &00, &1B, &00

 EQUB &1A, &0B, &00, &0F, &0A, &06, &1B, &1B
 EQUB &05, &02, &11, &1B, &0C, &01, &1B, &00
 EQUB &10, &15, &0F, &0A, &00, &11, &0A, &11
 EQUB &1B, &1B, &04, &11, &1B, &1B, &1B, &04
 EQUB &1B, &00, &00, &00, &1B, &00

 SKIP 28                \ These bytes appear to be unused
 EQUB &02, &0D
 SKIP 8

\ ******************************************************************************
\
\       Name: LOADSCR
\       Type: Subroutine
\   Category: Loader
\    Summary: Show the mode 7 Acornsoft loading screen
\
\ ******************************************************************************

.LOADSCR

 LDA #LO(ECHAR)         \ Set ZP(1 0) = ECHAR
 STA ZP
 LDA #HI(ECHAR)
 STA ZP+1

                        \ We now define a character set consisting of "fake"
                        \ mode 7 graphics characters so the Electron can print
                        \ its own version of the Acornsoft loading screen
                        \ despite not having the BBC Micro's teletext mode 7
                        \
                        \ The command to define a character is as follows:
                        \
                        \   VDU 23, n, b0, b1, b2, b3, b4, b5, b6, b7
                        \
                        \ where n is the character number and b0 through b7 are
                        \ the bytes for each pixel row in the character (there
                        \ are 8 rows of 8 pixels in a character)
                        \
                        \ So in the following, we perform the above command
                        \ for each character using the values from the ECHAR
                        \ table

 LDY #0                 \ Set Y to act as an index into the table at ECHAR

.eloop

 LDX #7                 \ Set a counter in X for the 8 bytes we need to print
                        \ from the table for each character definition (one byte
                        \ per pixel row)

 LDA #23                \ Print character 23 (i.e. VDU 23)
 JSR OSWRCH

 TYA                    \ We will increase Y by 8 for each character, so this
 LSR A                  \ sets A = Y / 8 to give the character number, starting
 LSR A                  \ from 0 and counting up by 1 for each new character
 LSR A

 ORA #&E0               \ This adds &E0 to A, so our new character set starts
                        \ with character number &E0, then character number &E1,
                        \ and so on

 JSR OSWRCH             \ Print the character number (so we have now done the
                        \ VDU 23, n part of the command)

.vloop

 LDA (ZP),Y             \ Print the Y-th byte from the ECHAR table (we set ZP to
 JSR OSWRCH             \ point to ECHAR above)

 INY                    \ Increment the index to point to the next byte in the
                        \ table

 DEX                    \ Decrement the byte counter

 BPL vloop              \ Loop back until we have printed 8 characters

 CPY #224               \ Loop back to do the next VDU 23 command until we have
 BNE eloop              \ printed out the whole table

                        \ We now print the Acornsoft loading screen background
                        \ using the "fake" characters we just defined

 LDA #LO(LOGO)          \ Set ZP(1 0) = LOGO
 STA ZP
 LDA #HI(LOGO)
 STA ZP+1

 LDA #22                \ Switch to mode 6 using a VDU 22, 6 command
 JSR OSWRCH
 LDA #6
 JSR OSWRCH

.jsr1

 JSR prstr              \ Call prstr to print the following characters,
                        \ restarting from the NOP instruction

 EQUB 23, 0, 10, 32     \ Set 6845 register R10 = %00100000 = 32
 EQUB 0, 0, 0           \
 EQUB 0, 0, 0           \ This is the "cursor start" register, and bits 5 and 6
                        \ define the "cursor display mode", as follows:
                        \
                        \   * %00 = steady, non-blinking cursor
                        \
                        \   * %01 = do not display a cursor
                        \
                        \   * %10 = fast blinking cursor (blink at 1/16 of the
                        \           field rate)
                        \
                        \   * %11 = slow blinking cursor (blink at 1/32 of the
                        \           field rate)
                        \
                        \ We can therefore turn off the cursor completely by
                        \ setting cursor display mode %01, with bit 6 of R10
                        \ clear and bit 5 of R10 set

 NOP                    \ Marks the end of the VDU block

 JSR LOGOS              \ Call LOGOS

 JSR prstr              \ Call prstr to print the following characters,
                        \ restarting from the NOP instruction

 EQUB 28                \ Define a text window as follows:
 EQUB 13, 12, 25, 10    \
                        \   * Left = 13
                        \   * Right = 25
                        \   * Top = 10
                        \   * Bottom = 12
                        \
                        \ i.e. 2 rows high, 12 columns wide at (13, 10)

 EQUB 12                \ Clear the text area

 EQUB 26                \ Restore default windows

 EQUB 31, 15, 11        \ Move text cursor to 15, 11

 EQUS "E L I T E"       \ The name of the game

 NOP                    \ Marks the end of the VDU block

 RTS                    \ Return from the PROT1 subroutine

 EQUS "         "       \ These bytes appear to be unused
 EQUS "          "
 NOP
 RTS

\ ******************************************************************************
\
\       Name: LOGOS
\       Type: Subroutine
\   Category: Loader
\    Summary: Print a large Acornsoft logo as part of the loading screen
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   T                   The logo colour as a teletext control code for graphics
\                       colour
\
\   ZP(1 0)             The address of the Acornsoft logo character table at
\                       LOGO
\
\ ******************************************************************************

.LOGOS

 LDY #28                \ Set Y = 28 as an index to the first row of logo
                        \ characters in the table at LOGO, after the 28 bytes of
                        \ lookup data in the first part of the table

.aloop

 LDX #38                \ Each row of the Acornsoft logo consists of 38 teletext
                        \ graphics characters, so set a counter in X to count
                        \ through the characters

 LDA #' '               \ Print a space
 JSR OSWRCH

.cloop

 LDA (ZP),Y             \ Fetch the Y-th character from ZP into A, so A contains
                        \ the next byte from LOGO, which is the user-defined
                        \ character we want to print

 ORA #&E0               \ Add &E0 to the character number

 JSR OSWRCH             \ Print the character in A

 INY                    \ Increment Y to point to the next byte in the table

 CPY #255               \ If Y = 255 then we are done printing all 5 rows of the
 BEQ adone              \ logo, so jump to adone to finish off

 DEX                    \ Otherwise decrement the character counter in X

 BNE cloop              \ Loop back to print the next character until we have
                        \ done all 38 in this row

 LDA #' '               \ Print a space
 JSR OSWRCH

 CLC                    \ Jump back to aloop to print the next row in the logo
 BCC aloop

.adone

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: prstr
\       Type: Subroutine
\   Category: Loader
\    Summary: Print the NOP-terminated string immediately following the JSR
\             instruction that called the routine
\
\ ******************************************************************************

.prstr

 PLA                    \ We call prstr with a JSR, so pull the return address
 STA Q                  \ off the stack into Q(1 0), which actually points to
 PLA                    \ the last byte of the JSR prstr instruction
 STA Q+1

.p1

 INC Q                  \ Increment Q(1 0) to point to the next byte (so the
 BNE P%+4               \ first time we call prstr, Q points to the first byte
 INC Q+1                \ of the string we want to print)

 LDY #0                 \ Fetch the byte at Q(1 0) into A
 LDA (Q),Y

 CMP #&EA               \ If we just fetched a NOP instruction (opcode &EA),
 BEQ p2                 \ then we have reached the end of the string, so jump to
                        \ p2 to return from the subroutine

 JSR OSWRCH             \ Print the byte we just fetched

 CLC                    \ Loop back to p1 to fetch the next byte to print
 BCC p1

.p2

 JMP (Q)                \ Jump to the address in Q(1 0) - i.e. to the NOP that
                        \ we just fetched, so execution continues from the end
                        \ of the string we just printed

\ ******************************************************************************
\
\ Save ELITE2.bin
\
\ ******************************************************************************

 PRINT "S.LOGO ", ~CODE%, " ", ~P%, " ", ~LOAD%, " ", ~LOAD%
 SAVE "2-assembled-output/LOGO.bin", CODE%, P%, LOAD%

