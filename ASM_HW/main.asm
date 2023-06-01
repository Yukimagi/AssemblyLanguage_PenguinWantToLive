INCLUDE Irvine32.inc                ;引入組合語言的函式庫 

INCLUDE macros.inc                  ;引入音樂需要的函式庫
INCLUDELIB winmm.lib                ;引入音樂需要的函式庫
PlaySound PROTO, pszSound:PTR BYTE, hmod:DWORD, fdwSound:DWORD   ;引入音樂需要的函式庫

.386                                ;此為可以access 32-bit的register & addresses 
.model flat,stdcall                  
.stack 4096                         ;堆疊空間4096bytes 
ExitProcess PROTO,dwExitCode:DWORD  ;ExitProcess的輸入parameter 
.data                               ;.data下為變數宣告用 

  play_music BYTE "play.wav", 0         ;引入音樂
  start_music BYTE "start.wav", 0
  end_music BYTE "Break.wav", 0




  pic0 BYTE"                                    .-+*####*-.                                " , 0dh, 0ah,                                      
  "                                :-=+****######**+-:                            " , 0dh, 0ah,                           
  "                             :-++*****#############*=:                         " , 0dh, 0ah,0
  pic1 BYTE "                           .=+++****#######%%%%%######+.                       " , 0dh, 0ah,                      
  "                          -++++*****#####%%%%%%%%%%####*-                      " , 0dh, 0ah,                     
  "                         -+++=--=+*#####%%%%%%%%%#+=-=+#*=                     " , 0dh, 0ah,                   
  "                        -++-..:=..-*###%%%%%%%%%*::++:.:**=                    " , 0dh, 0ah,0
  pic2 BYTE"                       -++: ..*#:..-##%%#+*%%%%#:.:+#-...+*=                   " , 0dh, 0ah,                                 
  "                      =+=  .........:*%*---+#%+::.........:**                  " , 0dh, 0ah,                
  "                     :++.  ..........:=*####*=::::.........=*-                 " , 0dh, 0ah,0
  pic3 BYTE"                     ++=   ............:::::::::::.........:**.                " , 0dh, 0ah,                                     
  "                   =+***+-...........:::::::::::::::::::.-*##***               " , 0dh, 0ah,
  "                  .++******+=-::..::::::::::::::::::-==*######**:              " , 0dh, 0ah,0
  pic4 BYTE"                  :++*****#######***++++++++++**##%%%%%%%#####**=              " , 0dh, 0ah,
  "                  =+******#####%%%%%%%%%%%%@%@%@%%%%%%%%%#####***.             " , 0dh, 0ah,
  "                 -*+**-.......:-=*#%%%%%%%@@@@%%%#*=-::::....-#***             " , 0dh, 0ah,0
  pic5 BYTE"                 +*+*-...........:::=+**#####*+=-:::::::......=#*#:            " , 0dh, 0ah, 
  "              :*%%*+................::::::::::::::::::::........*%@%*          " , 0dh, 0ah,
  "              +%@%*+...............:::::::::::::::::::::........*##%%=         " , 0dh, 0ah,0
  pic6 BYTE"             -##-.*=...............::::::::::::::::::::::.......*= :*%-        " , 0dh, 0ah,        
  "                  :+:..............::::::::::::::::::::::::....--              " , 0dh, 0ah,
  "                    :...............:::::::::::::::::::::::...-@@#:            ", 0dh, 0ah,0
  pic7 BYTE"                :=*%@%#-.............::::::::::::::::::::::::::=%@@*+-         ", 0dh, 0ah,
  "           .-+*%@@%@%#*-::::.............:::::::::::::::-===---=#@@@@@#.       ", 0dh, 0ah,
  "          +@@@@@@@=:::--------::............:::::::--====------@@@@@@@@%.      ", 0dh, 0ah,
  "        -@@@@@--@@@@@@@@%%@%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%@@@+:@@@%+=-...    ", 0dh, 0ah,0
  pic8 BYTE"       :%@@@@#  %@@@@@@@%@@%@@@%@%+.-*-=@@@@@@@%#@@@@%@@@@@@@@@#.%@@@@@@*:..   ", 0dh, 0ah,            
  "      :%@@@@#.  =@@@@@@@@@@@@@@@@*.+@@@@@@@@@@@@@@%@@@@@@@@@@@@#:=@@@@@@@%:..  ", 0dh, 0ah,0                    
  pic9 BYTE"    %@@@@@@@@@@@@@@@@@#*=*@@@@@@@@@@@@@@@@*@@@@@@@@#@@@@@@@@@@@@@@@@@@@@@@@@@@", 0dh, 0ah,0

   Computer DWORD 0h
   ChooseWords BYTE "Please choose computer or 2 players.", 0ah, 0dh,0ah, 0dh,
                    "If you want to play with computer please press 1.", 0ah, 0dh,0ah, 0dh,
                    "If you want to play with your friend please press 0.", 0ah, 0dh,0
   WelcomeWords1 BYTE "歡迎來到PenguinWantToLive!!~~~", 0dh, 0ah,
                "此遊戲為兩人遊戲，請先決定好player1以及player2(or computer )><", 0dh, 0ah,
                "遊戲規則:", 0dh, 0ah,
                "總共有九個方格，玩家不能選擇跟對方相同的格子", 0dh, 0ah,
                "同時玩家只能選擇自己目前所在的位置相鄰的格子(不能走斜的~)", 0dh, 0ah,0
   WelcomeWords2 BYTE "每踩到一次格子，顏色就會改變!", 0dh, 0ah,
                "顏色順序為白->綠->黃->紅->Bang!", 0dh, 0ah,
                "也就是說一個格子只能踩3次，踩到紅色的格子就輸囉!~~~", 0dh, 0ah,
                "那我們要開始囉!!~~~(請按任意鍵)", 0dh, 0ah, 0
                
   SelectSite1 BYTE "換player1囉!請選擇下一個你想到達的位置~", 0dh, 0ah, 0

   SelectSite2 BYTE "換player2囉!請選擇下一個你想到達的位置~", 0dh, 0ah, 0

   WRONG BYTE "這格有人或是您選超出範圍嘍 (\_/)",0dh,0ah,
              "再選擇一次吧:)            (˙_˙)",0dh,0ah,
              "                          />請加油好嗎?＞",0dh,0ah,0

   ERR BYTE "您沒辦法走到這個位置哦:)(\_/)",0dh,0ah,
            "                       (˙_˙)",0dh,0ah,
            "                       />請加油好嗎?＞",0dh,0ah,0

   die DWORD 1h
   MSG1 BYTE "player1 win",0dh,0ah,
             "player2 lose",0dh,0ah,0
   MSG2 BYTE "player2 win",0dh,0ah,
             "player1 lose",0dh,0ah,0
   MSG3 BYTE "player win",0dh,0ah,
             "computer lose",0dh,0ah,0
   MSG4 BYTE "computer win",0dh,0ah,
             "player lose",0dh,0ah,0 

   EndWords BYTE"GAME OVER",0

   P1SiteWords BYTE "PLAYER 1 目前的位置:",0
   P2SiteWords BYTE "PLAYER 2 目前的位置:",0
   computerSiteWords BYTE "Computer 目前的位置:",0

   player_A BYTE "|A| ",0
   player_B BYTE "|B| ",0

   Site1 BYTE "|1| ",0              ;MAP位置1~9
   Site2 BYTE "|2| ",0
   Site3 BYTE "|3| ",0
   Site4 BYTE "|4| ",0
   Site5 BYTE "|5| ",0
   Site6 BYTE "|6| ",0
   Site7 BYTE "|7| ",0
   Site8 BYTE "|8| ",0
   Site9 BYTE "|9| ",0
   state3 BYTE "|X| ",0

   P1Site DWORD 0h                  ;P1位置
   P2Site DWORD 0h                  ;P2位置
   ComputerSite DWORD 0h

   

   previous DWORD 0h
   
   M1color SDWORD -1h               ;地圖現在顯示顏色
   M2color SDWORD -1h
   M3color SDWORD -1h
   M4color SDWORD -1h
   M5color SDWORD -1h
   M6color SDWORD -1h
   M7color SDWORD -1h
   M8color SDWORD -1h
   M9color SDWORD -1h

.code                               ;.code下為程式碼 
;------------------------------------------------------------------------------------
StateP0 PROC                        ;地圖狀態0顏色:綠
    mov eax, 2  ;green=2
    call SetTextColor
    ret
StateP0 ENDP
;------------------------------------------------------------------------------------

;------------------------------------------------------------------------------------
StateP1 PROC                        ;地圖狀態1顏色:黃
    mov eax, 6  ;yellow=6
    call SetTextColor
    ret
StateP1 ENDP
;------------------------------------------------------------------------------------

;------------------------------------------------------------------------------------
StateP2 PROC                        ;地圖狀態2顏色:紅
    mov eax, 4  ;red=4
    call SetTextColor
    ret
StateP2 ENDP
;------------------------------------------------------------------------------------

;------------------------------------------------------------------------------------
ORICOLOR PROC                       ;地圖原始顏色:白
    mov eax, 15  ;white=15
    call SetTextColor
    ret
ORICOLOR ENDP
;------------------------------------------------------------------------------------

;------------------------------------------------------------------------------------
MAPROC PROC                         ;印map
    mov eax,M1color
    .IF eax == -1h
        call ORICOLOR
        .ELSEIF eax == 0h
            call StateP0 
        .ELSEIF eax == 1h
            call StateP1 
        .ELSEIF eax == 2h
            call StateP2 
        .ELSEIF eax == 3h
            mov eax,Computer
            cmp eax,0h
            je endGame
            jmp endGame2
    .ENDIF
    mov eax,P1Site
    cmp eax,1h
    je A
    mov eax,P2Site
    cmp eax,1h
    je B
    mov eax,ComputerSite
    cmp eax,1h
    je B
    mov edx , OFFSET Site1 
    jmp NEXT
    A:
        mov edx , OFFSET player_A
        jmp NEXT
    B:
        mov edx , OFFSET player_B
        jmp NEXT
    NEXT:
    call WriteString

    mov eax,M2color
    .IF eax == -1h
        call ORICOLOR
        .ELSEIF eax == 0h
            call StateP0 
        .ELSEIF eax == 1h
            call StateP1 
        .ELSEIF eax == 2h
            call StateP2 
        .ELSEIF eax == 3h
            mov eax,Computer
            cmp eax,0h
            je endGame
            jmp endGame2
    .ENDIF
    mov eax,P1Site
    cmp eax,2h
    je A2
    mov eax,P2Site
    cmp eax,2h
    je B2
    mov eax,ComputerSite
    cmp eax,2h
    je B2
    mov edx , OFFSET Site2 
    jmp NEXT2
    A2:
        mov edx , OFFSET player_A
        jmp NEXT2
    B2:
        mov edx , OFFSET player_B
        jmp NEXT2
    NEXT2:    
    call WriteString

    mov eax,M3color
    .IF eax == -1h
        call ORICOLOR
        .ELSEIF eax == 0h
            call StateP0 
        .ELSEIF eax == 1h
            call StateP1 
        .ELSEIF eax == 2h
            call StateP2 
        .ELSEIF eax == 3h
            mov eax,Computer
            cmp eax,0h
            je endGame
            jmp endGame2
    .ENDIF
    mov eax,P1Site
    cmp eax,3h
    je A3
    mov eax,P2Site
    cmp eax,3h
    je B3
    mov eax,ComputerSite
    cmp eax,3h
    je B3
    mov edx , OFFSET Site3 
    jmp NEXT3
    A3:
        mov edx , OFFSET player_A
        jmp NEXT3
    B3:
        mov edx , OFFSET player_B
        jmp NEXT3
    NEXT3:    
    call WriteString
    call crlf

    mov eax,M4color
    .IF eax == -1h
        call ORICOLOR
        .ELSEIF eax == 0h
            call StateP0 
        .ELSEIF eax == 1h
            call StateP1 
        .ELSEIF eax == 2h
            call StateP2 
        .ELSEIF eax == 3h
            mov eax,Computer
            cmp eax,0h
            je endGame
            jmp endGame2
    .ENDIF
    mov eax,P1Site
    cmp eax,4h
    je A4
    mov eax,P2Site
    cmp eax,4h
    je B4
    mov eax,ComputerSite
    cmp eax,4h
    je B4
    mov edx , OFFSET Site4 
    jmp NEXT4
    A4:
        mov edx , OFFSET player_A
        jmp NEXT4
    B4:
        mov edx , OFFSET player_B
        jmp NEXT4
    NEXT4:    
    call WriteString

    mov eax,M5color
    .IF eax == -1h
        call ORICOLOR
        .ELSEIF eax == 0h
            call StateP0 
        .ELSEIF eax == 1h
            call StateP1 
        .ELSEIF eax == 2h
            call StateP2 
        .ELSEIF eax == 3h
            mov eax,Computer
            cmp eax,0h
            je endGame
            jmp endGame2
    .ENDIF
    mov eax,P1Site
    cmp eax,5h
    je A5
    mov eax,P2Site
    cmp eax,5h
    je B5
    mov eax,ComputerSite
    cmp eax,5h
    je B5
    mov edx , OFFSET Site5 
    jmp NEXT5
    A5:
        mov edx , OFFSET player_A
        jmp NEXT5
    B5:
        mov edx , OFFSET player_B
        jmp NEXT5
    NEXT5:    
    call WriteString

    mov eax,M6color
    .IF eax == -1h
        call ORICOLOR
        .ELSEIF eax == 0h
            call StateP0 
        .ELSEIF eax == 1h
            call StateP1 
        .ELSEIF eax == 2h
            call StateP2 
        .ELSEIF eax == 3h
            mov eax,Computer
            cmp eax,0h
            je endGame
            jmp endGame2
    .ENDIF
    mov eax,P1Site
    cmp eax,6h
    je A6
    mov eax,P2Site
    cmp eax,6h
    je B6
    mov eax,ComputerSite
    cmp eax,6h
    je B6
    mov edx , OFFSET Site6 
    jmp NEXT6
    A6:
        mov edx , OFFSET player_A
        jmp NEXT6
    B6:
        mov edx , OFFSET player_B
        jmp NEXT6
    NEXT6:   
    call WriteString
    call crlf

    mov eax,M7color
    .IF eax == -1h
        call ORICOLOR
        .ELSEIF eax == 0h
            call StateP0 
        .ELSEIF eax == 1h
            call StateP1 
        .ELSEIF eax == 2h
            call StateP2 
        .ELSEIF eax == 3h
            mov eax,Computer
            cmp eax,0h
            je endGame
            jmp endGame2
    .ENDIF
    mov eax,P1Site
    cmp eax,7h
    je A7
    mov eax,P2Site
    cmp eax,7h
    je B7
    mov eax,ComputerSite
    cmp eax,7h
    je B7
    mov edx , OFFSET Site7 
    jmp NEXT7
    A7:
        mov edx , OFFSET player_A
        jmp NEXT7
    B7:
        mov edx , OFFSET player_B
        jmp NEXT7
    NEXT7:    
    call WriteString

    mov eax,M8color
    .IF eax == -1h
        call ORICOLOR
        .ELSEIF eax == 0h
            call StateP0 
        .ELSEIF eax == 1h
            call StateP1 
        .ELSEIF eax == 2h
            call StateP2 
        .ELSEIF eax == 3h
            mov eax,Computer
            cmp eax,0h
            je endGame
            jmp endGame2
    .ENDIF
    mov eax,P1Site
    cmp eax,8h
    je A8
    mov eax,P2Site
    cmp eax,8h
    je B8
    mov eax,ComputerSite
    cmp eax,8h
    je B8
    mov edx , OFFSET Site8 
    jmp NEXT8
    A8:
        mov edx , OFFSET player_A
        jmp NEXT8
    B8:
        mov edx , OFFSET player_B
        jmp NEXT8
    NEXT8:    
    call WriteString

    mov eax,M9color
    .IF eax == -1h
        call ORICOLOR
        .ELSEIF eax == 0h
            call StateP0 
        .ELSEIF eax == 1h
            call StateP1 
        .ELSEIF eax == 2h
            call StateP2 
        .ELSEIF eax == 3h
            mov eax,Computer
            cmp eax,0h
            je endGame
            jmp endGame2
    .ENDIF
    mov eax,P1Site
    cmp eax,9h
    je A9
    mov eax,P2Site
    cmp eax,9h
    je B9
    mov eax,ComputerSite
    cmp eax,9h
    je B9
    mov edx , OFFSET Site9 
    jmp NEXT9
    A9:
        mov edx , OFFSET player_A
        jmp NEXT9
    B9:
        mov edx , OFFSET player_B
        jmp NEXT9
    NEXT9:    
    call WriteString
    call crlf

    ret
 MAPROC ENDP 
 ;------------------------------------------------------------------------------------

 ;------------------------------------------------------------------------------------
 PLAYER PROC                        ;玩家目前位置顯示
    mov edx,OFFSET P1SiteWords
    call WriteString
    mov eax, P1Site
    call WriteDec
    call crlf
    .IF computer==1
        mov edx,OFFSET ComputerSiteWords
        call WriteString
        mov eax, computerSite
        call WriteDec
        call crlf
    .ELSE
    mov edx,OFFSET P2SiteWords
    call WriteString
    mov eax,P2Site
    call WriteDec
    .ENDIF
    ret
 PLAYER ENDP
 ;------------------------------------------------------------------------------------

 ;------------------------------------------------------------------------------------
 SHOW PROC                          ;遊戲印於視窗
    call clrscr
    call crlf
    call crlf
    call MAPROC
    call ORICOLOR
    call PLAYER                      ;玩家目前位置顯示
    ret
 SHOW ENDP
 ;------------------------------------------------------------------------------------

 ;------------------------------------------------------------------------------------
 PLACE PROC                          ;判斷玩家位置的地圖顏色
  .IF eax==1h
    add M1Color,1
    .ELSEIF eax==2h
        add M2Color,1
    .ELSEIF eax==3h
        add M3Color,1
    .ELSEIF eax==4h
        add M4Color,1
    .ELSEIF eax==5h
        add M5Color,1
    .ELSEIF eax==6h
        add M6Color,1
    .ELSEIF eax==7h
        add M7Color,1
    .ELSEIF eax==8h
        add M8Color,1
    .ELSEIF eax==9h
        add M9Color,1
   .ENDIF
  ret
 PLACE ENDP
 ;------------------------------------------------------------------------------------

 ;------------------------------------------------------------------------------------
 RUN1 PROC                           ;判斷player1可以走的地方
    .IF P1Site == 0h
        ret
    .ENDIF
    .IF P1Site == 1h
       .IF eax != 1h && eax != 2h && eax != 4h
           call ERROR
           mov eax,Computer
           cmp eax,0h
           je L1
           jmp L3
       .ENDIF
       ret
    .ENDIF

    .IF P1Site == 2h
       .IF eax != 1h && eax != 2h && eax != 3h && eax != 5h
           call ERROR
           mov eax,Computer
           cmp eax,0h
           je L1
           jmp L3
       .ENDIF
       ret
    .ENDIF

    .IF P1Site == 3h
       .IF eax != 2h && eax != 3h && eax != 6h
           call ERROR
           mov eax,Computer
           cmp eax,0h
           je L1
           jmp L3
       .ENDIF
       ret
    .ENDIF

    .IF P1Site == 4h
       .IF eax != 1h && eax != 4h && eax != 5h && eax != 7h
           call ERROR
           mov eax,Computer
           cmp eax,0h
           je L1
           jmp L3
       .ENDIF
       ret
    .ENDIF

    .IF P1Site == 5h
       .IF eax != 2h && eax != 4h && eax != 5h && eax != 6h && eax != 8h
           call ERROR
           mov eax,Computer
           cmp eax,0h
           je L1
           jmp L3
       .ENDIF
       ret
    .ENDIF

    .IF P1Site == 6h
       .IF eax != 3h && eax != 5h && eax != 6h && eax != 9h
           call ERROR
           mov eax,Computer
           cmp eax,0h
           je L1
           jmp L3
       .ENDIF
       ret
    .ENDIF

    .IF P1Site == 7h
       .IF eax != 4h && eax != 7h && eax != 8h 
           call ERROR
           mov eax,Computer
           cmp eax,0h
           je L1
           jmp L3
       .ENDIF
       ret
    .ENDIF

    .IF P1Site == 8h
       .IF eax != 5h && eax != 7h && eax != 8h && eax != 9h 
           call ERROR
           mov eax,Computer
           cmp eax,0h
           je L1
           jmp L3
       .ENDIF
       ret
    .ENDIF

    .IF P1Site == 9h
       .IF eax != 6h && eax != 8h && eax != 9h 
           call ERROR
           mov eax,Computer
           cmp eax,0h
           je L1
           jmp L3
       .ENDIF
       ret
    .ENDIF

    ret
 RUN1 ENDP
 ;------------------------------------------------------------------------------------

 ;------------------------------------------------------------------------------------
 RUN2 PROC                           ;判斷player2可以走的地方
    .IF P2Site == 0h
        ret
    .ENDIF
    .IF P2Site == 1h
       .IF eax != 1h && eax != 2h && eax != 4h
           call ERROR
           jmp L2
       .ENDIF
       ret
    .ENDIF

    .IF P2Site == 2h
       .IF eax != 1h && eax != 2h && eax != 3h && eax != 5h
           call ERROR
           jmp L2
       .ENDIF
       ret
    .ENDIF

    .IF P2Site == 3h
       .IF eax != 2h && eax != 3h && eax != 6h
           call ERROR
           jmp L2
       .ENDIF
       ret
    .ENDIF

    .IF P2Site == 4h
       .IF eax != 1h && eax != 4h && eax != 5h && eax != 7h
           call ERROR
           jmp L2
       .ENDIF
       ret
    .ENDIF

    .IF P2Site == 5h
       .IF eax != 2h && eax != 4h && eax != 5h && eax != 6h && eax != 8h
           call ERROR
           jmp L2
       .ENDIF
       ret
    .ENDIF

    .IF P2Site == 6h
       .IF eax != 3h && eax != 5h && eax != 6h && eax != 9h
           call ERROR
           jmp L2
       .ENDIF
       ret
    .ENDIF

    .IF P2Site == 7h
       .IF eax != 4h && eax != 7h && eax != 8h 
           call ERROR
           jmp L2
       .ENDIF
       ret
    .ENDIF

    .IF P2Site == 8h
       .IF eax != 5h && eax != 7h && eax != 8h && eax != 9h 
           call ERROR
           jmp L2
       .ENDIF
       ret
    .ENDIF

    .IF P2Site == 9h
       .IF eax != 6h && eax != 8h && eax != 9h 
           call ERROR
           jmp L2
       .ENDIF
       ret
    .ENDIF

    ret
 RUN2 ENDP
 ;------------------------------------------------------------------------------------

 ;------------------------------------------------------------------------------------
 RUN3 PROC                           ;判斷電腦可以走的地方
    .IF computerSite == 0h
        ret
    .ENDIF
    .IF computerSite == 1h
       .IF eax != 1h && eax != 2h && eax != 4h
           jmp L4
       .ENDIF
       ret
    .ENDIF

    .IF computerSite == 2h
       .IF eax != 1h && eax != 2h && eax != 3h && eax != 5h
           jmp L4
       .ENDIF
       ret
    .ENDIF

    .IF computerSite == 3h
       .IF eax != 2h && eax != 3h && eax != 6h
           jmp L4
       .ENDIF
       ret
    .ENDIF

    .IF computerSite == 4h
       .IF eax != 1h && eax != 4h && eax != 5h && eax != 7h
           jmp L4
       .ENDIF
       ret
    .ENDIF

    .IF computerSite == 5h
       .IF eax != 2h && eax != 4h && eax != 5h && eax != 6h && eax != 8h
           jmp L4
       .ENDIF
       ret
    .ENDIF

    .IF computerSite == 6h
       .IF eax != 3h && eax != 5h && eax != 6h && eax != 9h
           jmp L4
       .ENDIF
       ret
    .ENDIF

    .IF computerSite == 7h
       .IF eax != 4h && eax != 7h && eax != 8h 
           jmp L4
       .ENDIF
       ret
    .ENDIF

    .IF computerSite == 8h
       .IF eax != 5h && eax != 7h && eax != 8h && eax != 9h 
           jmp L4
       .ENDIF
       ret
    .ENDIF

    .IF computerSite == 9h
       .IF eax != 6h && eax != 8h && eax != 9h 
           jmp L4
       .ENDIF
       ret
    .ENDIF

    ret
 RUN3 ENDP
 ;------------------------------------------------------------------------------------

 ;------------------------------------------------------------------------------------
 ERROR PROC             ;顯示錯誤訊息
    mov edx, OFFSET ERR
    call WriteString
    call crlf
    ret
 ERROR ENDP
 ;------------------------------------------------------------------------------------

 ;------------------------------------------------------------------------------------
autonumber proc
    call Randomize   ;seed seed
    mov eax,9    ;get random 0 to 8
    call RandomRange ;
    inc  eax         ;make range 1 to 9
    ret
 autonumber endp
 ;------------------------------------------------------------------------------------

 ;------------------------------------------------------------------------------------
 TwoPlayersGame proc                ;兩人遊戲
 call SHOW
 game:
   L1::
   mov die,1
   call crlf
   mov edx,OFFSET SelectSite1
   mov ebx,P2Site

   call WriteString                  ;一號玩家選擇位置
   call readhex

   .WHILE eax == ebx || eax<=0 || eax>=10
    mov edx,OFFSET WRONG
    call WriteString                  ;錯誤訊息:重選
    call readhex
   .ENDW

   call RUN1
   call PLACE
   mov  P1Site, eax
   call SHOW

   
   mov eax,P1Site
   cmp eax,10h                       ;位置=10的時候結束遊戲          
   je endGame
   
   L2::
   mov die,2
   call crlf
   mov edx,OFFSET SelectSite2
   mov ebx,P1Site
   call WriteString                  ;二號玩家選擇位置
   call readhex

   .WHILE eax == ebx || eax<=0 || eax>=10
    mov edx,OFFSET WRONG
    call WriteString                  ;錯誤訊息:重選
    call readhex
   .ENDW
   call RUN2
   call PLACE
   mov  P2Site, eax
   call SHOW

  
   mov eax,P2Site
   cmp eax,10h
   je endGame


   jmp game

   endGame::                          ;結束遊戲
   push ecx
   INVOKE PlaySound, NULL, NULL, 20001h      ;暫停上一首音樂
   INVOKE PlaySound, OFFSET end_music, NULL, 20001h;開始音樂
   pop ecx
    call clrscr
    call clrscr
    call crlf
    call crlf
    call StateP2
    mov edx,OFFSET EndWords
    call WriteString
    call crlf
    mov eax,die
    .IF eax==1
        mov edx,OFFSET MSG2
        call WriteString
        call crlf
    .ELSE
        mov edx,OFFSET MSG1
        call WriteString
        call crlf
    .ENDIF

    call Penguin                     ;印企鵝與冰河

    invoke ExitProcess,0 
    ret
 TwoPlayersGame endp
 ;------------------------------------------------------------------------------------

 ;------------------------------------------------------------------------------------
 ComputerGame proc                  ;人機對戰
 call SHOW
 game2:
   L3::
   mov die,1
   call crlf
   mov edx,OFFSET SelectSite1
   mov ebx,computerSite

   call WriteString                  ;一號玩家選擇位置
   call readhex

   .WHILE eax == ebx || eax<=0 || eax>=10
    mov edx,OFFSET WRONG
    call WriteString                  ;錯誤訊息:重選
    call readhex
   .ENDW

   call RUN1
   call PLACE
   mov  P1Site, eax
   call SHOW


   mov eax,P1Site
   cmp eax,10h                       ;位置=10的時候結束遊戲          
   je endGame2

   L4::
   mov die,2
   call crlf
   call autonumber
   mov ebx,P1Site

   .WHILE eax == ebx || eax<=0 || eax>=10
    call autonumber
   .ENDW
   call RUN3
   call PLACE
   mov  computerSite, eax
   call SHOW

   mov eax,computerSite
   cmp eax,10h
   je endGame2

   jmp game2

   endGame2::                          ;結束遊戲
   push ecx
   INVOKE PlaySound, NULL, NULL, 20001h      ;暫停上一首音樂
   INVOKE PlaySound, OFFSET end_music, NULL, 20009h;開始音樂
   pop ecx
    call clrscr
    call clrscr
    call crlf
    call crlf
    call StateP2
    mov edx,OFFSET EndWords
    call WriteString
    call crlf
    mov ebx,die
    .IF ebx==1
        mov edx,OFFSET MSG4
        call WriteString
        call crlf
    .ELSE
        mov edx,OFFSET MSG3
        call WriteString
       call crlf
    .ENDIF

    call Penguin                     ;印企鵝與冰河

    invoke ExitProcess,0 
    ret
 computerGame ENDP
 ;------------------------------------------------------------------------------------

 ;------------------------------------------------------------------------------------
 Penguin PROC                       ;印企鵝與冰河
   mov edx, OFFSET pic0             ;印遊戲icon
   mov eax,15
   call SetTextColor
   call WriteString
   mov edx, OFFSET pic1
   mov eax,15
   call SetTextColor
   call WriteString
   mov edx, OFFSET pic2
   mov eax,15
   call SetTextColor
   call WriteString
   mov edx, OFFSET pic3
   mov eax,15
   call SetTextColor
   call WriteString
   mov edx, OFFSET pic4
   mov eax,15
   call SetTextColor
   call WriteString
   mov edx, OFFSET pic5
   mov eax,15
   call SetTextColor
   call WriteString
   mov edx, OFFSET pic6
   mov eax,15
   call SetTextColor
   call WriteString
   mov edx, OFFSET pic7
   mov eax,15
   call SetTextColor
   call WriteString
   mov edx, OFFSET pic8
   mov eax,3
   call SetTextColor
   call WriteString
   mov edx, OFFSET pic9
   mov eax,3
   call SetTextColor
   call WriteString
   mov eax,5000
   call Delay
   call clrscr
   mov eax,15
   call SetTextColor
    ret
 Penguin ENDP
 ;------------------------------------------------------------------------------------
 main proc                          ;主程式 

   INVOKE PlaySound, NULL, NULL, 20001h      ;暫停上一首音樂
   INVOKE PlaySound, OFFSET start_music, NULL, 20009h;開始音樂


   call Penguin                     ;印企鵝與冰河

   mov edx, OFFSET WelcomeWords1
   call WriteString                 ;歡迎訊息  
   mov edx, OFFSET WelcomeWords2
   call WriteString
   call WaitMsg
   call clrscr
   Cagain:
   mov edx, OFFSET ChooseWords
   call WriteString
   call readhex
   mov computer, eax
   call clrscr
   push ecx
   INVOKE PlaySound, NULL, NULL, 20001h      ;暫停上一首音樂
   INVOKE PlaySound, OFFSET play_music, NULL, 20001h;開始音樂
   pop ecx
   .If computer==0h
       call Penguin                     ;印企鵝與冰河
       call TwoPlayersGame
    .ELSEIF computer==1h
       call Penguin                     ;印企鵝與冰河
       call computerGame
    .ELSE
        jmp Cagain
   .ENDIF

 invoke ExitProcess,0            ;此為一種Windows service(function)可以告知終止程式 

 main endp                 

 end main 