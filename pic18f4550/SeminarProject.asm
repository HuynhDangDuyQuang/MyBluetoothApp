
_DisplayClock:

;SeminarProject.c,44 :: 		void DisplayClock(int th,int tm,int ts)
;SeminarProject.c,46 :: 		Lcd_Chr(2,3,' ');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;SeminarProject.c,47 :: 		Lcd_Chr_Cp('0'+(th/10));
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_DisplayClock_th+0, 0 
	MOVWF       R0 
	MOVF        FARG_DisplayClock_th+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,48 :: 		Lcd_Chr_Cp('0'+(th%10));
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_DisplayClock_th+0, 0 
	MOVWF       R0 
	MOVF        FARG_DisplayClock_th+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,49 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,50 :: 		Lcd_Chr_Cp('0'+(tm/10));
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_DisplayClock_tm+0, 0 
	MOVWF       R0 
	MOVF        FARG_DisplayClock_tm+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,51 :: 		Lcd_Chr_Cp('0'+(tm%10));
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_DisplayClock_tm+0, 0 
	MOVWF       R0 
	MOVF        FARG_DisplayClock_tm+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,52 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,53 :: 		Lcd_Chr_Cp('0'+(ts/10));
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_DisplayClock_ts+0, 0 
	MOVWF       R0 
	MOVF        FARG_DisplayClock_ts+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,54 :: 		Lcd_Chr_Cp('0'+(ts%10));
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_DisplayClock_ts+0, 0 
	MOVWF       R0 
	MOVF        FARG_DisplayClock_ts+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,55 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,56 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,57 :: 		}
L_end_DisplayClock:
	RETURN      0
; end of _DisplayClock

_DisplayCalendar:

;SeminarProject.c,59 :: 		void DisplayCalendar(int tyear,int tmonth,int tday)
;SeminarProject.c,61 :: 		Lcd_Chr(2,3,' ');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;SeminarProject.c,62 :: 		Lcd_Chr_Cp('0'+tyear/1000);
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FARG_DisplayCalendar_tyear+0, 0 
	MOVWF       R0 
	MOVF        FARG_DisplayCalendar_tyear+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,63 :: 		Lcd_Chr_Cp('0'+(tyear/100)%10);
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_DisplayCalendar_tyear+0, 0 
	MOVWF       R0 
	MOVF        FARG_DisplayCalendar_tyear+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,64 :: 		Lcd_Chr_Cp('0'+(tyear/10)%10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_DisplayCalendar_tyear+0, 0 
	MOVWF       R0 
	MOVF        FARG_DisplayCalendar_tyear+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,65 :: 		Lcd_Chr_Cp('0'+tyear%10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_DisplayCalendar_tyear+0, 0 
	MOVWF       R0 
	MOVF        FARG_DisplayCalendar_tyear+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,66 :: 		Lcd_Chr_Cp('/');
	MOVLW       47
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,67 :: 		Lcd_Chr_Cp('0'+tmonth/10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_DisplayCalendar_tmonth+0, 0 
	MOVWF       R0 
	MOVF        FARG_DisplayCalendar_tmonth+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,68 :: 		Lcd_Chr_Cp('0'+tmonth%10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_DisplayCalendar_tmonth+0, 0 
	MOVWF       R0 
	MOVF        FARG_DisplayCalendar_tmonth+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,69 :: 		Lcd_Chr_Cp('/');
	MOVLW       47
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,70 :: 		Lcd_Chr_Cp('0'+tday/10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_DisplayCalendar_tday+0, 0 
	MOVWF       R0 
	MOVF        FARG_DisplayCalendar_tday+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,71 :: 		Lcd_Chr_Cp('0'+tday%10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_DisplayCalendar_tday+0, 0 
	MOVWF       R0 
	MOVF        FARG_DisplayCalendar_tday+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,72 :: 		}
L_end_DisplayCalendar:
	RETURN      0
; end of _DisplayCalendar

_Display:

;SeminarProject.c,74 :: 		void Display(int CurrentPosition,int displayData)
;SeminarProject.c,76 :: 		if(mode==CLOCK)
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Display215
	MOVLW       0
	XORWF       _mode+0, 0 
L__Display215:
	BTFSS       STATUS+0, 2 
	GOTO        L_Display0
;SeminarProject.c,78 :: 		switch(CurrentPosition)
	GOTO        L_Display1
;SeminarProject.c,80 :: 		case 0:
L_Display3:
;SeminarProject.c,82 :: 		Lcd_Chr(2,3,' ');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;SeminarProject.c,83 :: 		break;
	GOTO        L_Display2
;SeminarProject.c,85 :: 		case 1:
L_Display4:
;SeminarProject.c,87 :: 		Lcd_Chr(2,6,':');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;SeminarProject.c,88 :: 		break;
	GOTO        L_Display2
;SeminarProject.c,90 :: 		case 2:
L_Display5:
;SeminarProject.c,92 :: 		Lcd_Chr(2,9,':');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;SeminarProject.c,93 :: 		break;
	GOTO        L_Display2
;SeminarProject.c,95 :: 		default: break;
L_Display6:
	GOTO        L_Display2
;SeminarProject.c,96 :: 		}
L_Display1:
	MOVLW       0
	XORWF       FARG_Display_CurrentPosition+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Display216
	MOVLW       0
	XORWF       FARG_Display_CurrentPosition+0, 0 
L__Display216:
	BTFSC       STATUS+0, 2 
	GOTO        L_Display3
	MOVLW       0
	XORWF       FARG_Display_CurrentPosition+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Display217
	MOVLW       1
	XORWF       FARG_Display_CurrentPosition+0, 0 
L__Display217:
	BTFSC       STATUS+0, 2 
	GOTO        L_Display4
	MOVLW       0
	XORWF       FARG_Display_CurrentPosition+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Display218
	MOVLW       2
	XORWF       FARG_Display_CurrentPosition+0, 0 
L__Display218:
	BTFSC       STATUS+0, 2 
	GOTO        L_Display5
	GOTO        L_Display6
L_Display2:
;SeminarProject.c,97 :: 		if(displayData>=0)
	MOVLW       128
	XORWF       FARG_Display_displayData+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Display219
	MOVLW       0
	SUBWF       FARG_Display_displayData+0, 0 
L__Display219:
	BTFSS       STATUS+0, 0 
	GOTO        L_Display7
;SeminarProject.c,99 :: 		Lcd_Chr_Cp('0'+(displayData/10));
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_Display_displayData+0, 0 
	MOVWF       R0 
	MOVF        FARG_Display_displayData+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,100 :: 		Lcd_Chr_Cp('0'+(displayData%10));
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_Display_displayData+0, 0 
	MOVWF       R0 
	MOVF        FARG_Display_displayData+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,101 :: 		}
	GOTO        L_Display8
L_Display7:
;SeminarProject.c,104 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,105 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,106 :: 		}
L_Display8:
;SeminarProject.c,107 :: 		}
	GOTO        L_Display9
L_Display0:
;SeminarProject.c,110 :: 		switch(CurrentPosition)
	GOTO        L_Display10
;SeminarProject.c,112 :: 		case 0:
L_Display12:
;SeminarProject.c,114 :: 		Lcd_Chr(2,3,' ');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;SeminarProject.c,115 :: 		if(displayData>=0)
	MOVLW       128
	XORWF       FARG_Display_displayData+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Display220
	MOVLW       0
	SUBWF       FARG_Display_displayData+0, 0 
L__Display220:
	BTFSS       STATUS+0, 0 
	GOTO        L_Display13
;SeminarProject.c,117 :: 		Lcd_Chr_Cp('0'+displayData/1000);
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FARG_Display_displayData+0, 0 
	MOVWF       R0 
	MOVF        FARG_Display_displayData+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,118 :: 		Lcd_Chr_Cp('0'+(displayData/100)%10);
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_Display_displayData+0, 0 
	MOVWF       R0 
	MOVF        FARG_Display_displayData+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,119 :: 		Lcd_Chr_Cp('0'+(displayData/10)%10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_Display_displayData+0, 0 
	MOVWF       R0 
	MOVF        FARG_Display_displayData+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,120 :: 		Lcd_Chr_Cp('0'+displayData%10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_Display_displayData+0, 0 
	MOVWF       R0 
	MOVF        FARG_Display_displayData+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,121 :: 		}
	GOTO        L_Display14
L_Display13:
;SeminarProject.c,124 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,125 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,126 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,127 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,128 :: 		}
L_Display14:
;SeminarProject.c,129 :: 		break;
	GOTO        L_Display11
;SeminarProject.c,131 :: 		case 1:
L_Display15:
;SeminarProject.c,133 :: 		Lcd_Chr(2,8,'/');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       47
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;SeminarProject.c,134 :: 		if(displayData>=0)
	MOVLW       128
	XORWF       FARG_Display_displayData+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Display221
	MOVLW       0
	SUBWF       FARG_Display_displayData+0, 0 
L__Display221:
	BTFSS       STATUS+0, 0 
	GOTO        L_Display16
;SeminarProject.c,136 :: 		Lcd_Chr_Cp('0'+displayData/10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_Display_displayData+0, 0 
	MOVWF       R0 
	MOVF        FARG_Display_displayData+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,137 :: 		Lcd_Chr_Cp('0'+displayData%10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_Display_displayData+0, 0 
	MOVWF       R0 
	MOVF        FARG_Display_displayData+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,138 :: 		}
	GOTO        L_Display17
L_Display16:
;SeminarProject.c,141 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,142 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,143 :: 		}
L_Display17:
;SeminarProject.c,144 :: 		break;
	GOTO        L_Display11
;SeminarProject.c,146 :: 		case 2:
L_Display18:
;SeminarProject.c,148 :: 		Lcd_Chr(2,11,'/');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       47
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;SeminarProject.c,149 :: 		if(displayData>=0)
	MOVLW       128
	XORWF       FARG_Display_displayData+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Display222
	MOVLW       0
	SUBWF       FARG_Display_displayData+0, 0 
L__Display222:
	BTFSS       STATUS+0, 0 
	GOTO        L_Display19
;SeminarProject.c,151 :: 		Lcd_Chr_Cp('0'+displayData/10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_Display_displayData+0, 0 
	MOVWF       R0 
	MOVF        FARG_Display_displayData+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,152 :: 		Lcd_Chr_Cp('0'+displayData%10);
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_Display_displayData+0, 0 
	MOVWF       R0 
	MOVF        FARG_Display_displayData+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDLW       48
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,153 :: 		}
	GOTO        L_Display20
L_Display19:
;SeminarProject.c,156 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,157 :: 		Lcd_Chr_Cp(' ');
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;SeminarProject.c,158 :: 		}
L_Display20:
;SeminarProject.c,159 :: 		break;
	GOTO        L_Display11
;SeminarProject.c,161 :: 		default: break;
L_Display21:
	GOTO        L_Display11
;SeminarProject.c,162 :: 		}
L_Display10:
	MOVLW       0
	XORWF       FARG_Display_CurrentPosition+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Display223
	MOVLW       0
	XORWF       FARG_Display_CurrentPosition+0, 0 
L__Display223:
	BTFSC       STATUS+0, 2 
	GOTO        L_Display12
	MOVLW       0
	XORWF       FARG_Display_CurrentPosition+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Display224
	MOVLW       1
	XORWF       FARG_Display_CurrentPosition+0, 0 
L__Display224:
	BTFSC       STATUS+0, 2 
	GOTO        L_Display15
	MOVLW       0
	XORWF       FARG_Display_CurrentPosition+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Display225
	MOVLW       2
	XORWF       FARG_Display_CurrentPosition+0, 0 
L__Display225:
	BTFSC       STATUS+0, 2 
	GOTO        L_Display18
	GOTO        L_Display21
L_Display11:
;SeminarProject.c,163 :: 		}
L_Display9:
;SeminarProject.c,164 :: 		}
L_end_Display:
	RETURN      0
; end of _Display

_DayMax:

;SeminarProject.c,166 :: 		int DayMax(int yr,int mth)
;SeminarProject.c,168 :: 		if(mth==1||mth==3||mth==5||mth==7||
	MOVLW       0
	XORWF       FARG_DayMax_mth+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax227
	MOVLW       1
	XORWF       FARG_DayMax_mth+0, 0 
L__DayMax227:
	BTFSC       STATUS+0, 2 
	GOTO        L__DayMax200
	MOVLW       0
	XORWF       FARG_DayMax_mth+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax228
	MOVLW       3
	XORWF       FARG_DayMax_mth+0, 0 
L__DayMax228:
	BTFSC       STATUS+0, 2 
	GOTO        L__DayMax200
	MOVLW       0
	XORWF       FARG_DayMax_mth+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax229
	MOVLW       5
	XORWF       FARG_DayMax_mth+0, 0 
L__DayMax229:
	BTFSC       STATUS+0, 2 
	GOTO        L__DayMax200
	MOVLW       0
	XORWF       FARG_DayMax_mth+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax230
	MOVLW       7
	XORWF       FARG_DayMax_mth+0, 0 
L__DayMax230:
	BTFSC       STATUS+0, 2 
	GOTO        L__DayMax200
;SeminarProject.c,169 :: 		mth==8||mth==10||mth==12)
	MOVLW       0
	XORWF       FARG_DayMax_mth+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax231
	MOVLW       8
	XORWF       FARG_DayMax_mth+0, 0 
L__DayMax231:
	BTFSC       STATUS+0, 2 
	GOTO        L__DayMax200
	MOVLW       0
	XORWF       FARG_DayMax_mth+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax232
	MOVLW       10
	XORWF       FARG_DayMax_mth+0, 0 
L__DayMax232:
	BTFSC       STATUS+0, 2 
	GOTO        L__DayMax200
	MOVLW       0
	XORWF       FARG_DayMax_mth+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax233
	MOVLW       12
	XORWF       FARG_DayMax_mth+0, 0 
L__DayMax233:
	BTFSC       STATUS+0, 2 
	GOTO        L__DayMax200
	GOTO        L_DayMax24
L__DayMax200:
;SeminarProject.c,170 :: 		return 31;
	MOVLW       31
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_DayMax
L_DayMax24:
;SeminarProject.c,171 :: 		if(mth==4||mth==6||mth==9||mth==11)
	MOVLW       0
	XORWF       FARG_DayMax_mth+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax234
	MOVLW       4
	XORWF       FARG_DayMax_mth+0, 0 
L__DayMax234:
	BTFSC       STATUS+0, 2 
	GOTO        L__DayMax199
	MOVLW       0
	XORWF       FARG_DayMax_mth+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax235
	MOVLW       6
	XORWF       FARG_DayMax_mth+0, 0 
L__DayMax235:
	BTFSC       STATUS+0, 2 
	GOTO        L__DayMax199
	MOVLW       0
	XORWF       FARG_DayMax_mth+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax236
	MOVLW       9
	XORWF       FARG_DayMax_mth+0, 0 
L__DayMax236:
	BTFSC       STATUS+0, 2 
	GOTO        L__DayMax199
	MOVLW       0
	XORWF       FARG_DayMax_mth+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax237
	MOVLW       11
	XORWF       FARG_DayMax_mth+0, 0 
L__DayMax237:
	BTFSC       STATUS+0, 2 
	GOTO        L__DayMax199
	GOTO        L_DayMax27
L__DayMax199:
;SeminarProject.c,172 :: 		return 30;
	MOVLW       30
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_DayMax
L_DayMax27:
;SeminarProject.c,173 :: 		if(mth==2&&((yr%4==0&&yr%100!=0)||yr%400==0))
	MOVLW       0
	XORWF       FARG_DayMax_mth+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax238
	MOVLW       2
	XORWF       FARG_DayMax_mth+0, 0 
L__DayMax238:
	BTFSS       STATUS+0, 2 
	GOTO        L_DayMax34
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_DayMax_yr+0, 0 
	MOVWF       R0 
	MOVF        FARG_DayMax_yr+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax239
	MOVLW       0
	XORWF       R0, 0 
L__DayMax239:
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax198
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_DayMax_yr+0, 0 
	MOVWF       R0 
	MOVF        FARG_DayMax_yr+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax240
	MOVLW       0
	XORWF       R0, 0 
L__DayMax240:
	BTFSC       STATUS+0, 2 
	GOTO        L__DayMax198
	GOTO        L__DayMax197
L__DayMax198:
	MOVLW       144
	MOVWF       R4 
	MOVLW       1
	MOVWF       R5 
	MOVF        FARG_DayMax_yr+0, 0 
	MOVWF       R0 
	MOVF        FARG_DayMax_yr+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DayMax241
	MOVLW       0
	XORWF       R0, 0 
L__DayMax241:
	BTFSC       STATUS+0, 2 
	GOTO        L__DayMax197
	GOTO        L_DayMax34
L__DayMax197:
L__DayMax196:
;SeminarProject.c,174 :: 		return 29;
	MOVLW       29
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_DayMax
L_DayMax34:
;SeminarProject.c,175 :: 		else return 28;
	MOVLW       28
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;SeminarProject.c,176 :: 		}
L_end_DayMax:
	RETURN      0
; end of _DayMax

_Timming:

;SeminarProject.c,178 :: 		void Timming(void)
;SeminarProject.c,180 :: 		second=second+1;
	INFSNZ      _second+0, 1 
	INCF        _second+1, 1 
;SeminarProject.c,181 :: 		if(second==60)
	MOVLW       0
	XORWF       _second+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Timming243
	MOVLW       60
	XORWF       _second+0, 0 
L__Timming243:
	BTFSS       STATUS+0, 2 
	GOTO        L_Timming36
;SeminarProject.c,183 :: 		second=0;
	CLRF        _second+0 
	CLRF        _second+1 
;SeminarProject.c,184 :: 		minute=minute+1;
	INFSNZ      _minute+0, 1 
	INCF        _minute+1, 1 
;SeminarProject.c,185 :: 		if(minute==60)
	MOVLW       0
	XORWF       _minute+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Timming244
	MOVLW       60
	XORWF       _minute+0, 0 
L__Timming244:
	BTFSS       STATUS+0, 2 
	GOTO        L_Timming37
;SeminarProject.c,187 :: 		minute=0;
	CLRF        _minute+0 
	CLRF        _minute+1 
;SeminarProject.c,188 :: 		hour=hour+1;
	INFSNZ      _hour+0, 1 
	INCF        _hour+1, 1 
;SeminarProject.c,189 :: 		if(hour==24)
	MOVLW       0
	XORWF       _hour+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Timming245
	MOVLW       24
	XORWF       _hour+0, 0 
L__Timming245:
	BTFSS       STATUS+0, 2 
	GOTO        L_Timming38
;SeminarProject.c,191 :: 		hour=0;
	CLRF        _hour+0 
	CLRF        _hour+1 
;SeminarProject.c,192 :: 		day=day+1;
	INFSNZ      _day+0, 1 
	INCF        _day+1, 1 
;SeminarProject.c,193 :: 		if(day==(DayMax(year,month)+1))
	MOVF        _year+0, 0 
	MOVWF       FARG_DayMax_yr+0 
	MOVF        _year+1, 0 
	MOVWF       FARG_DayMax_yr+1 
	MOVF        _month+0, 0 
	MOVWF       FARG_DayMax_mth+0 
	MOVF        _month+1, 0 
	MOVWF       FARG_DayMax_mth+1 
	CALL        _DayMax+0, 0
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVF        _day+1, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Timming246
	MOVF        R2, 0 
	XORWF       _day+0, 0 
L__Timming246:
	BTFSS       STATUS+0, 2 
	GOTO        L_Timming39
;SeminarProject.c,195 :: 		day=1;
	MOVLW       1
	MOVWF       _day+0 
	MOVLW       0
	MOVWF       _day+1 
;SeminarProject.c,196 :: 		month=month+1;
	INFSNZ      _month+0, 1 
	INCF        _month+1, 1 
;SeminarProject.c,197 :: 		if(month==13)
	MOVLW       0
	XORWF       _month+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Timming247
	MOVLW       13
	XORWF       _month+0, 0 
L__Timming247:
	BTFSS       STATUS+0, 2 
	GOTO        L_Timming40
;SeminarProject.c,199 :: 		month=1;
	MOVLW       1
	MOVWF       _month+0 
	MOVLW       0
	MOVWF       _month+1 
;SeminarProject.c,200 :: 		year=year+1;
	INFSNZ      _year+0, 1 
	INCF        _year+1, 1 
;SeminarProject.c,201 :: 		}
L_Timming40:
;SeminarProject.c,202 :: 		}
L_Timming39:
;SeminarProject.c,203 :: 		}
L_Timming38:
;SeminarProject.c,204 :: 		}
L_Timming37:
;SeminarProject.c,205 :: 		}
L_Timming36:
;SeminarProject.c,206 :: 		}
L_end_Timming:
	RETURN      0
; end of _Timming

_TimeTracking:

;SeminarProject.c,208 :: 		void TimeTracking(void)
;SeminarProject.c,210 :: 		if(cTime<=0)
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _cTime+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__TimeTracking249
	MOVF        _cTime+0, 0 
	SUBLW       0
L__TimeTracking249:
	BTFSS       STATUS+0, 0 
	GOTO        L_TimeTracking41
;SeminarProject.c,212 :: 		cTime=200;
	MOVLW       200
	MOVWF       _cTime+0 
	MOVLW       0
	MOVWF       _cTime+1 
;SeminarProject.c,213 :: 		Timming();
	CALL        _Timming+0, 0
;SeminarProject.c,214 :: 		if(setmode==OFF)
	MOVLW       0
	XORWF       _setmode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__TimeTracking250
	MOVLW       0
	XORWF       _setmode+0, 0 
L__TimeTracking250:
	BTFSS       STATUS+0, 2 
	GOTO        L_TimeTracking42
;SeminarProject.c,216 :: 		if(mode==CLOCK) DisplayClock(hour,minute,second);
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__TimeTracking251
	MOVLW       0
	XORWF       _mode+0, 0 
L__TimeTracking251:
	BTFSS       STATUS+0, 2 
	GOTO        L_TimeTracking43
	MOVF        _hour+0, 0 
	MOVWF       FARG_DisplayClock_th+0 
	MOVF        _hour+1, 0 
	MOVWF       FARG_DisplayClock_th+1 
	MOVF        _minute+0, 0 
	MOVWF       FARG_DisplayClock_tm+0 
	MOVF        _minute+1, 0 
	MOVWF       FARG_DisplayClock_tm+1 
	MOVF        _second+0, 0 
	MOVWF       FARG_DisplayClock_ts+0 
	MOVF        _second+1, 0 
	MOVWF       FARG_DisplayClock_ts+1 
	CALL        _DisplayClock+0, 0
	GOTO        L_TimeTracking44
L_TimeTracking43:
;SeminarProject.c,217 :: 		else DisplayCalendar(year,month,day);
	MOVF        _year+0, 0 
	MOVWF       FARG_DisplayCalendar_tyear+0 
	MOVF        _year+1, 0 
	MOVWF       FARG_DisplayCalendar_tyear+1 
	MOVF        _month+0, 0 
	MOVWF       FARG_DisplayCalendar_tmonth+0 
	MOVF        _month+1, 0 
	MOVWF       FARG_DisplayCalendar_tmonth+1 
	MOVF        _day+0, 0 
	MOVWF       FARG_DisplayCalendar_tday+0 
	MOVF        _day+1, 0 
	MOVWF       FARG_DisplayCalendar_tday+1 
	CALL        _DisplayCalendar+0, 0
L_TimeTracking44:
;SeminarProject.c,218 :: 		}
L_TimeTracking42:
;SeminarProject.c,219 :: 		}
L_TimeTracking41:
;SeminarProject.c,220 :: 		}
L_end_TimeTracking:
	RETURN      0
; end of _TimeTracking

_BlinkCreate:

;SeminarProject.c,222 :: 		void BlinkCreate(void)
;SeminarProject.c,225 :: 		switch(pos)
	GOTO        L_BlinkCreate45
;SeminarProject.c,227 :: 		case 0:
L_BlinkCreate47:
;SeminarProject.c,229 :: 		blinkData=(mode==CLOCK)?temh:temyear;
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BlinkCreate253
	MOVLW       0
	XORWF       _mode+0, 0 
L__BlinkCreate253:
	BTFSS       STATUS+0, 2 
	GOTO        L_BlinkCreate48
	MOVF        _temh+0, 0 
	MOVWF       R0 
	MOVF        _temh+1, 0 
	MOVWF       R1 
	GOTO        L_BlinkCreate49
L_BlinkCreate48:
	MOVF        _temyear+0, 0 
	MOVWF       R0 
	MOVF        _temyear+1, 0 
	MOVWF       R1 
L_BlinkCreate49:
	MOVF        R0, 0 
	MOVWF       BlinkCreate_blinkData_L0+0 
	MOVF        R1, 0 
	MOVWF       BlinkCreate_blinkData_L0+1 
;SeminarProject.c,230 :: 		break;
	GOTO        L_BlinkCreate46
;SeminarProject.c,232 :: 		case 1:
L_BlinkCreate50:
;SeminarProject.c,234 :: 		blinkData=(mode==CLOCK)?temm:temmonth;
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BlinkCreate254
	MOVLW       0
	XORWF       _mode+0, 0 
L__BlinkCreate254:
	BTFSS       STATUS+0, 2 
	GOTO        L_BlinkCreate51
	MOVF        _temm+0, 0 
	MOVWF       R0 
	MOVF        _temm+1, 0 
	MOVWF       R1 
	GOTO        L_BlinkCreate52
L_BlinkCreate51:
	MOVF        _temmonth+0, 0 
	MOVWF       R0 
	MOVF        _temmonth+1, 0 
	MOVWF       R1 
L_BlinkCreate52:
	MOVF        R0, 0 
	MOVWF       BlinkCreate_blinkData_L0+0 
	MOVF        R1, 0 
	MOVWF       BlinkCreate_blinkData_L0+1 
;SeminarProject.c,235 :: 		break;
	GOTO        L_BlinkCreate46
;SeminarProject.c,237 :: 		case 2:
L_BlinkCreate53:
;SeminarProject.c,239 :: 		blinkData=(mode==CLOCK)?tems:temday;
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BlinkCreate255
	MOVLW       0
	XORWF       _mode+0, 0 
L__BlinkCreate255:
	BTFSS       STATUS+0, 2 
	GOTO        L_BlinkCreate54
	MOVF        _tems+0, 0 
	MOVWF       R0 
	MOVF        _tems+1, 0 
	MOVWF       R1 
	GOTO        L_BlinkCreate55
L_BlinkCreate54:
	MOVF        _temday+0, 0 
	MOVWF       R0 
	MOVF        _temday+1, 0 
	MOVWF       R1 
L_BlinkCreate55:
	MOVF        R0, 0 
	MOVWF       BlinkCreate_blinkData_L0+0 
	MOVF        R1, 0 
	MOVWF       BlinkCreate_blinkData_L0+1 
;SeminarProject.c,240 :: 		break;
	GOTO        L_BlinkCreate46
;SeminarProject.c,242 :: 		default:break;
L_BlinkCreate56:
	GOTO        L_BlinkCreate46
;SeminarProject.c,243 :: 		}
L_BlinkCreate45:
	MOVLW       0
	XORWF       _pos+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BlinkCreate256
	MOVLW       0
	XORWF       _pos+0, 0 
L__BlinkCreate256:
	BTFSC       STATUS+0, 2 
	GOTO        L_BlinkCreate47
	MOVLW       0
	XORWF       _pos+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BlinkCreate257
	MOVLW       1
	XORWF       _pos+0, 0 
L__BlinkCreate257:
	BTFSC       STATUS+0, 2 
	GOTO        L_BlinkCreate50
	MOVLW       0
	XORWF       _pos+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BlinkCreate258
	MOVLW       2
	XORWF       _pos+0, 0 
L__BlinkCreate258:
	BTFSC       STATUS+0, 2 
	GOTO        L_BlinkCreate53
	GOTO        L_BlinkCreate56
L_BlinkCreate46:
;SeminarProject.c,244 :: 		if(cBlink<=0)
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _cBlink+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BlinkCreate259
	MOVF        _cBlink+0, 0 
	SUBLW       0
L__BlinkCreate259:
	BTFSS       STATUS+0, 0 
	GOTO        L_BlinkCreate57
;SeminarProject.c,246 :: 		cBlink=200;
	MOVLW       200
	MOVWF       _cBlink+0 
	MOVLW       0
	MOVWF       _cBlink+1 
;SeminarProject.c,247 :: 		Display(pos,-1);
	MOVF        _pos+0, 0 
	MOVWF       FARG_Display_CurrentPosition+0 
	MOVF        _pos+1, 0 
	MOVWF       FARG_Display_CurrentPosition+1 
	MOVLW       255
	MOVWF       FARG_Display_displayData+0 
	MOVLW       255
	MOVWF       FARG_Display_displayData+1 
	CALL        _Display+0, 0
;SeminarProject.c,248 :: 		}
L_BlinkCreate57:
;SeminarProject.c,249 :: 		if(cBlink==100)
	MOVLW       0
	XORWF       _cBlink+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BlinkCreate260
	MOVLW       100
	XORWF       _cBlink+0, 0 
L__BlinkCreate260:
	BTFSS       STATUS+0, 2 
	GOTO        L_BlinkCreate58
;SeminarProject.c,251 :: 		Display(pos,blinkData);
	MOVF        _pos+0, 0 
	MOVWF       FARG_Display_CurrentPosition+0 
	MOVF        _pos+1, 0 
	MOVWF       FARG_Display_CurrentPosition+1 
	MOVF        BlinkCreate_blinkData_L0+0, 0 
	MOVWF       FARG_Display_displayData+0 
	MOVF        BlinkCreate_blinkData_L0+1, 0 
	MOVWF       FARG_Display_displayData+1 
	CALL        _Display+0, 0
;SeminarProject.c,252 :: 		}
L_BlinkCreate58:
;SeminarProject.c,253 :: 		}
L_end_BlinkCreate:
	RETURN      0
; end of _BlinkCreate

_power:

;SeminarProject.c,255 :: 		int power(int a, int n)
;SeminarProject.c,257 :: 		if(n==0) return 1;
	MOVLW       0
	XORWF       FARG_power_n+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__power262
	MOVLW       0
	XORWF       FARG_power_n+0, 0 
L__power262:
	BTFSS       STATUS+0, 2 
	GOTO        L_power59
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_power
L_power59:
;SeminarProject.c,258 :: 		else if(n==1) return a;
	MOVLW       0
	XORWF       FARG_power_n+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__power263
	MOVLW       1
	XORWF       FARG_power_n+0, 0 
L__power263:
	BTFSS       STATUS+0, 2 
	GOTO        L_power61
	MOVF        FARG_power_a+0, 0 
	MOVWF       R0 
	MOVF        FARG_power_a+1, 0 
	MOVWF       R1 
	GOTO        L_end_power
L_power61:
;SeminarProject.c,259 :: 		else if(n==2) return a*a;
	MOVLW       0
	XORWF       FARG_power_n+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__power264
	MOVLW       2
	XORWF       FARG_power_n+0, 0 
L__power264:
	BTFSS       STATUS+0, 2 
	GOTO        L_power63
	MOVF        FARG_power_a+0, 0 
	MOVWF       R0 
	MOVF        FARG_power_a+1, 0 
	MOVWF       R1 
	MOVF        FARG_power_a+0, 0 
	MOVWF       R4 
	MOVF        FARG_power_a+1, 0 
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	GOTO        L_end_power
L_power63:
;SeminarProject.c,260 :: 		else if(n==3) return a*a*a;
	MOVLW       0
	XORWF       FARG_power_n+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__power265
	MOVLW       3
	XORWF       FARG_power_n+0, 0 
L__power265:
	BTFSS       STATUS+0, 2 
	GOTO        L_power65
	MOVF        FARG_power_a+0, 0 
	MOVWF       R0 
	MOVF        FARG_power_a+1, 0 
	MOVWF       R1 
	MOVF        FARG_power_a+0, 0 
	MOVWF       R4 
	MOVF        FARG_power_a+1, 0 
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVF        FARG_power_a+0, 0 
	MOVWF       R4 
	MOVF        FARG_power_a+1, 0 
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	GOTO        L_end_power
L_power65:
;SeminarProject.c,261 :: 		else return 0;
	CLRF        R0 
	CLRF        R1 
;SeminarProject.c,262 :: 		}
L_end_power:
	RETURN      0
; end of _power

_CheckKey:

;SeminarProject.c,267 :: 		void CheckKey(void)
;SeminarProject.c,269 :: 		PortValue=PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       _PortValue+0 
	MOVLW       0
	MOVWF       _PortValue+1 
;SeminarProject.c,270 :: 		if(PortValue!=0xef&&PortValue!=0xfb&&PortValue!=0xbf&&PortValue!=0x7f&&PortValue!=0xff) //Press key together ?
	MOVLW       0
	XORWF       _PortValue+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey267
	MOVLW       239
	XORWF       _PortValue+0, 0 
L__CheckKey267:
	BTFSC       STATUS+0, 2 
	GOTO        L_CheckKey69
	MOVLW       0
	XORWF       _PortValue+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey268
	MOVLW       251
	XORWF       _PortValue+0, 0 
L__CheckKey268:
	BTFSC       STATUS+0, 2 
	GOTO        L_CheckKey69
	MOVLW       0
	XORWF       _PortValue+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey269
	MOVLW       191
	XORWF       _PortValue+0, 0 
L__CheckKey269:
	BTFSC       STATUS+0, 2 
	GOTO        L_CheckKey69
	MOVLW       0
	XORWF       _PortValue+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey270
	MOVLW       127
	XORWF       _PortValue+0, 0 
L__CheckKey270:
	BTFSC       STATUS+0, 2 
	GOTO        L_CheckKey69
	MOVLW       0
	XORWF       _PortValue+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey271
	MOVLW       255
	XORWF       _PortValue+0, 0 
L__CheckKey271:
	BTFSC       STATUS+0, 2 
	GOTO        L_CheckKey69
L__CheckKey209:
;SeminarProject.c,272 :: 		cMode=100;cSet=400;cUp=100;cDown=100;
	MOVLW       100
	MOVWF       _cMode+0 
	MOVLW       0
	MOVWF       _cMode+1 
	MOVLW       144
	MOVWF       _cSet+0 
	MOVLW       1
	MOVWF       _cSet+1 
	MOVLW       100
	MOVWF       _cUp+0 
	MOVLW       0
	MOVWF       _cUp+1 
	MOVLW       100
	MOVWF       _cDown+0 
	MOVLW       0
	MOVWF       _cDown+1 
;SeminarProject.c,273 :: 		fMode=fSet=fUp=fDown=CANCEL;
	CLRF        _fDown+0 
	CLRF        _fDown+1 
	MOVF        _fDown+0, 0 
	MOVWF       _fUp+0 
	MOVF        _fDown+1, 0 
	MOVWF       _fUp+1 
	MOVF        _fUp+0, 0 
	MOVWF       _fSet+0 
	MOVF        _fUp+1, 0 
	MOVWF       _fSet+1 
	MOVF        _fSet+0, 0 
	MOVWF       _fMode+0 
	MOVF        _fSet+1, 0 
	MOVWF       _fMode+1 
;SeminarProject.c,274 :: 		return;
	GOTO        L_end_CheckKey
;SeminarProject.c,275 :: 		}
L_CheckKey69:
;SeminarProject.c,276 :: 		if(PortValue==0xef) cMode--; //Press button mode
	MOVLW       0
	XORWF       _PortValue+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey272
	MOVLW       239
	XORWF       _PortValue+0, 0 
L__CheckKey272:
	BTFSS       STATUS+0, 2 
	GOTO        L_CheckKey70
	MOVLW       1
	SUBWF       _cMode+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _cMode+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _cMode+0 
	MOVF        R1, 0 
	MOVWF       _cMode+1 
L_CheckKey70:
;SeminarProject.c,277 :: 		if(PortValue==0xfb) cSet--; // Press button set
	MOVLW       0
	XORWF       _PortValue+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey273
	MOVLW       251
	XORWF       _PortValue+0, 0 
L__CheckKey273:
	BTFSS       STATUS+0, 2 
	GOTO        L_CheckKey71
	MOVLW       1
	SUBWF       _cSet+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _cSet+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _cSet+0 
	MOVF        R1, 0 
	MOVWF       _cSet+1 
L_CheckKey71:
;SeminarProject.c,278 :: 		if(PortValue==0xbf&&setmode==ON) // Press button up
	MOVLW       0
	XORWF       _PortValue+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey274
	MOVLW       191
	XORWF       _PortValue+0, 0 
L__CheckKey274:
	BTFSS       STATUS+0, 2 
	GOTO        L_CheckKey74
	MOVLW       255
	XORWF       _setmode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey275
	MOVLW       255
	XORWF       _setmode+0, 0 
L__CheckKey275:
	BTFSS       STATUS+0, 2 
	GOTO        L_CheckKey74
L__CheckKey208:
;SeminarProject.c,280 :: 		if(--cUp<=0) fUp=SLOWACC;
	MOVLW       1
	SUBWF       _cUp+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _cUp+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _cUp+0 
	MOVF        R1, 0 
	MOVWF       _cUp+1 
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _cUp+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey276
	MOVF        _cUp+0, 0 
	SUBLW       0
L__CheckKey276:
	BTFSS       STATUS+0, 0 
	GOTO        L_CheckKey75
	MOVLW       2
	MOVWF       _fUp+0 
	MOVLW       0
	MOVWF       _fUp+1 
L_CheckKey75:
;SeminarProject.c,281 :: 		}
L_CheckKey74:
;SeminarProject.c,282 :: 		if(PortValue==0x7f&&setmode==ON) //Press button down
	MOVLW       0
	XORWF       _PortValue+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey277
	MOVLW       127
	XORWF       _PortValue+0, 0 
L__CheckKey277:
	BTFSS       STATUS+0, 2 
	GOTO        L_CheckKey78
	MOVLW       255
	XORWF       _setmode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey278
	MOVLW       255
	XORWF       _setmode+0, 0 
L__CheckKey278:
	BTFSS       STATUS+0, 2 
	GOTO        L_CheckKey78
L__CheckKey207:
;SeminarProject.c,284 :: 		if(--cDown<=0) fDown=SLOWACC;
	MOVLW       1
	SUBWF       _cDown+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _cDown+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _cDown+0 
	MOVF        R1, 0 
	MOVWF       _cDown+1 
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _cDown+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey279
	MOVF        _cDown+0, 0 
	SUBLW       0
L__CheckKey279:
	BTFSS       STATUS+0, 0 
	GOTO        L_CheckKey79
	MOVLW       2
	MOVWF       _fDown+0 
	MOVLW       0
	MOVWF       _fDown+1 
L_CheckKey79:
;SeminarProject.c,285 :: 		}
L_CheckKey78:
;SeminarProject.c,286 :: 		if((cMode!=100||cSet!=400||cUp!=100||cDown!=100)&&PortValue==0xff) //No key pressed and not default value
	MOVLW       0
	XORWF       _cMode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey280
	MOVLW       100
	XORWF       _cMode+0, 0 
L__CheckKey280:
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey206
	MOVF        _cSet+1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey281
	MOVLW       144
	XORWF       _cSet+0, 0 
L__CheckKey281:
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey206
	MOVLW       0
	XORWF       _cUp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey282
	MOVLW       100
	XORWF       _cUp+0, 0 
L__CheckKey282:
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey206
	MOVLW       0
	XORWF       _cDown+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey283
	MOVLW       100
	XORWF       _cDown+0, 0 
L__CheckKey283:
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey206
	GOTO        L_CheckKey84
L__CheckKey206:
	MOVLW       0
	XORWF       _PortValue+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey284
	MOVLW       255
	XORWF       _PortValue+0, 0 
L__CheckKey284:
	BTFSS       STATUS+0, 2 
	GOTO        L_CheckKey84
L__CheckKey205:
;SeminarProject.c,288 :: 		if(cMode>0&&cMode<=95) fMode=ACCESS;
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _cMode+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey285
	MOVF        _cMode+0, 0 
	SUBLW       0
L__CheckKey285:
	BTFSC       STATUS+0, 0 
	GOTO        L_CheckKey87
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _cMode+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey286
	MOVF        _cMode+0, 0 
	SUBLW       95
L__CheckKey286:
	BTFSS       STATUS+0, 0 
	GOTO        L_CheckKey87
L__CheckKey204:
	MOVLW       1
	MOVWF       _fMode+0 
	MOVLW       0
	MOVWF       _fMode+1 
L_CheckKey87:
;SeminarProject.c,289 :: 		if(cSet>0&&cSet<=395) fSet=ACCESS;
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _cSet+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey287
	MOVF        _cSet+0, 0 
	SUBLW       0
L__CheckKey287:
	BTFSC       STATUS+0, 0 
	GOTO        L_CheckKey90
	MOVLW       128
	XORLW       1
	MOVWF       R0 
	MOVLW       128
	XORWF       _cSet+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey288
	MOVF        _cSet+0, 0 
	SUBLW       139
L__CheckKey288:
	BTFSS       STATUS+0, 0 
	GOTO        L_CheckKey90
L__CheckKey203:
	MOVLW       1
	MOVWF       _fSet+0 
	MOVLW       0
	MOVWF       _fSet+1 
L_CheckKey90:
;SeminarProject.c,290 :: 		if(cUp>0&&cUp<=95) fUp=FASTACC;
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _cUp+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey289
	MOVF        _cUp+0, 0 
	SUBLW       0
L__CheckKey289:
	BTFSC       STATUS+0, 0 
	GOTO        L_CheckKey93
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _cUp+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey290
	MOVF        _cUp+0, 0 
	SUBLW       95
L__CheckKey290:
	BTFSS       STATUS+0, 0 
	GOTO        L_CheckKey93
L__CheckKey202:
	MOVLW       1
	MOVWF       _fUp+0 
	MOVLW       0
	MOVWF       _fUp+1 
	GOTO        L_CheckKey94
L_CheckKey93:
;SeminarProject.c,291 :: 		else fUp=CANCEL;
	CLRF        _fUp+0 
	CLRF        _fUp+1 
L_CheckKey94:
;SeminarProject.c,292 :: 		if(cDown>0&&cDown<=95) fDown=FASTACC;
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _cDown+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey291
	MOVF        _cDown+0, 0 
	SUBLW       0
L__CheckKey291:
	BTFSC       STATUS+0, 0 
	GOTO        L_CheckKey97
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _cDown+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CheckKey292
	MOVF        _cDown+0, 0 
	SUBLW       95
L__CheckKey292:
	BTFSS       STATUS+0, 0 
	GOTO        L_CheckKey97
L__CheckKey201:
	MOVLW       1
	MOVWF       _fDown+0 
	MOVLW       0
	MOVWF       _fDown+1 
	GOTO        L_CheckKey98
L_CheckKey97:
;SeminarProject.c,293 :: 		else fDown=CANCEL;
	CLRF        _fDown+0 
	CLRF        _fDown+1 
L_CheckKey98:
;SeminarProject.c,294 :: 		cMode=100;cSet=400;cUp=100;cDown=100;
	MOVLW       100
	MOVWF       _cMode+0 
	MOVLW       0
	MOVWF       _cMode+1 
	MOVLW       144
	MOVWF       _cSet+0 
	MOVLW       1
	MOVWF       _cSet+1 
	MOVLW       100
	MOVWF       _cUp+0 
	MOVLW       0
	MOVWF       _cUp+1 
	MOVLW       100
	MOVWF       _cDown+0 
	MOVLW       0
	MOVWF       _cDown+1 
;SeminarProject.c,295 :: 		}
L_CheckKey84:
;SeminarProject.c,296 :: 		}
L_end_CheckKey:
	RETURN      0
; end of _CheckKey

_KeyMode:

;SeminarProject.c,298 :: 		void KeyMode(void)
;SeminarProject.c,300 :: 		fMode=CANCEL;
	CLRF        _fMode+0 
	CLRF        _fMode+1 
;SeminarProject.c,301 :: 		if(setmode==OFF)
	MOVLW       0
	XORWF       _setmode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyMode294
	MOVLW       0
	XORWF       _setmode+0, 0 
L__KeyMode294:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyMode99
;SeminarProject.c,303 :: 		mode=~mode;
	COMF        _mode+0, 1 
	COMF        _mode+1, 1 
;SeminarProject.c,304 :: 		if(mode==CLOCK) DisplayClock(hour,minute,second);
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyMode295
	MOVLW       0
	XORWF       _mode+0, 0 
L__KeyMode295:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyMode100
	MOVF        _hour+0, 0 
	MOVWF       FARG_DisplayClock_th+0 
	MOVF        _hour+1, 0 
	MOVWF       FARG_DisplayClock_th+1 
	MOVF        _minute+0, 0 
	MOVWF       FARG_DisplayClock_tm+0 
	MOVF        _minute+1, 0 
	MOVWF       FARG_DisplayClock_tm+1 
	MOVF        _second+0, 0 
	MOVWF       FARG_DisplayClock_ts+0 
	MOVF        _second+1, 0 
	MOVWF       FARG_DisplayClock_ts+1 
	CALL        _DisplayClock+0, 0
	GOTO        L_KeyMode101
L_KeyMode100:
;SeminarProject.c,305 :: 		else DisplayCalendar(year,month,day);
	MOVF        _year+0, 0 
	MOVWF       FARG_DisplayCalendar_tyear+0 
	MOVF        _year+1, 0 
	MOVWF       FARG_DisplayCalendar_tyear+1 
	MOVF        _month+0, 0 
	MOVWF       FARG_DisplayCalendar_tmonth+0 
	MOVF        _month+1, 0 
	MOVWF       FARG_DisplayCalendar_tmonth+1 
	MOVF        _day+0, 0 
	MOVWF       FARG_DisplayCalendar_tday+0 
	MOVF        _day+1, 0 
	MOVWF       FARG_DisplayCalendar_tday+1 
	CALL        _DisplayCalendar+0, 0
L_KeyMode101:
;SeminarProject.c,306 :: 		}
	GOTO        L_KeyMode102
L_KeyMode99:
;SeminarProject.c,309 :: 		pos=0;
	CLRF        _pos+0 
	CLRF        _pos+1 
;SeminarProject.c,310 :: 		cBlink=200;
	MOVLW       200
	MOVWF       _cBlink+0 
	MOVLW       0
	MOVWF       _cBlink+1 
;SeminarProject.c,311 :: 		if(mode==CLOCK) DisplayClock(hour,minute,second);
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyMode296
	MOVLW       0
	XORWF       _mode+0, 0 
L__KeyMode296:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyMode103
	MOVF        _hour+0, 0 
	MOVWF       FARG_DisplayClock_th+0 
	MOVF        _hour+1, 0 
	MOVWF       FARG_DisplayClock_th+1 
	MOVF        _minute+0, 0 
	MOVWF       FARG_DisplayClock_tm+0 
	MOVF        _minute+1, 0 
	MOVWF       FARG_DisplayClock_tm+1 
	MOVF        _second+0, 0 
	MOVWF       FARG_DisplayClock_ts+0 
	MOVF        _second+1, 0 
	MOVWF       FARG_DisplayClock_ts+1 
	CALL        _DisplayClock+0, 0
	GOTO        L_KeyMode104
L_KeyMode103:
;SeminarProject.c,312 :: 		else DisplayCalendar(year,month,day);
	MOVF        _year+0, 0 
	MOVWF       FARG_DisplayCalendar_tyear+0 
	MOVF        _year+1, 0 
	MOVWF       FARG_DisplayCalendar_tyear+1 
	MOVF        _month+0, 0 
	MOVWF       FARG_DisplayCalendar_tmonth+0 
	MOVF        _month+1, 0 
	MOVWF       FARG_DisplayCalendar_tmonth+1 
	MOVF        _day+0, 0 
	MOVWF       FARG_DisplayCalendar_tday+0 
	MOVF        _day+1, 0 
	MOVWF       FARG_DisplayCalendar_tday+1 
	CALL        _DisplayCalendar+0, 0
L_KeyMode104:
;SeminarProject.c,313 :: 		setmode=OFF;  // cancel setmode
	CLRF        _setmode+0 
	CLRF        _setmode+1 
;SeminarProject.c,314 :: 		}
L_KeyMode102:
;SeminarProject.c,315 :: 		}
L_end_KeyMode:
	RETURN      0
; end of _KeyMode

_KeySet:

;SeminarProject.c,317 :: 		void KeySet(void)
;SeminarProject.c,319 :: 		fSet=CANCEL;
	CLRF        _fSet+0 
	CLRF        _fSet+1 
;SeminarProject.c,320 :: 		if(setmode==OFF)
	MOVLW       0
	XORWF       _setmode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeySet298
	MOVLW       0
	XORWF       _setmode+0, 0 
L__KeySet298:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeySet105
;SeminarProject.c,322 :: 		cBlink=0;
	CLRF        _cBlink+0 
	CLRF        _cBlink+1 
;SeminarProject.c,323 :: 		setmode=ON;
	MOVLW       255
	MOVWF       _setmode+0 
	MOVLW       255
	MOVWF       _setmode+1 
;SeminarProject.c,324 :: 		if(mode==CLOCK) {tems=second;temm=minute;temh=hour;}
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeySet299
	MOVLW       0
	XORWF       _mode+0, 0 
L__KeySet299:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeySet106
	MOVF        _second+0, 0 
	MOVWF       _tems+0 
	MOVF        _second+1, 0 
	MOVWF       _tems+1 
	MOVF        _minute+0, 0 
	MOVWF       _temm+0 
	MOVF        _minute+1, 0 
	MOVWF       _temm+1 
	MOVF        _hour+0, 0 
	MOVWF       _temh+0 
	MOVF        _hour+1, 0 
	MOVWF       _temh+1 
	GOTO        L_KeySet107
L_KeySet106:
;SeminarProject.c,325 :: 		else {temday=day;temmonth=month;temyear=year;}
	MOVF        _day+0, 0 
	MOVWF       _temday+0 
	MOVF        _day+1, 0 
	MOVWF       _temday+1 
	MOVF        _month+0, 0 
	MOVWF       _temmonth+0 
	MOVF        _month+1, 0 
	MOVWF       _temmonth+1 
	MOVF        _year+0, 0 
	MOVWF       _temyear+0 
	MOVF        _year+1, 0 
	MOVWF       _temyear+1 
L_KeySet107:
;SeminarProject.c,327 :: 		}
	GOTO        L_KeySet108
L_KeySet105:
;SeminarProject.c,330 :: 		cBlink=0;
	CLRF        _cBlink+0 
	CLRF        _cBlink+1 
;SeminarProject.c,331 :: 		pos++;
	MOVLW       1
	ADDWF       _pos+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _pos+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _pos+0 
	MOVF        R1, 0 
	MOVWF       _pos+1 
;SeminarProject.c,332 :: 		if(pos<3)
	MOVLW       128
	XORWF       _pos+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeySet300
	MOVLW       3
	SUBWF       _pos+0, 0 
L__KeySet300:
	BTFSC       STATUS+0, 0 
	GOTO        L_KeySet109
;SeminarProject.c,335 :: 		if(mode==CLOCK) d=(pos==1)?temh:temm;
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeySet301
	MOVLW       0
	XORWF       _mode+0, 0 
L__KeySet301:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeySet110
	MOVLW       0
	XORWF       _pos+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeySet302
	MOVLW       1
	XORWF       _pos+0, 0 
L__KeySet302:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeySet111
	MOVF        _temh+0, 0 
	MOVWF       R0 
	MOVF        _temh+1, 0 
	MOVWF       R1 
	GOTO        L_KeySet112
L_KeySet111:
	MOVF        _temm+0, 0 
	MOVWF       R0 
	MOVF        _temm+1, 0 
	MOVWF       R1 
L_KeySet112:
	MOVF        R0, 0 
	MOVWF       KeySet_d_L2+0 
	MOVF        R1, 0 
	MOVWF       KeySet_d_L2+1 
	GOTO        L_KeySet113
L_KeySet110:
;SeminarProject.c,336 :: 		else d=(pos==1)?temyear:temmonth;
	MOVLW       0
	XORWF       _pos+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeySet303
	MOVLW       1
	XORWF       _pos+0, 0 
L__KeySet303:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeySet114
	MOVF        _temyear+0, 0 
	MOVWF       R0 
	MOVF        _temyear+1, 0 
	MOVWF       R1 
	GOTO        L_KeySet115
L_KeySet114:
	MOVF        _temmonth+0, 0 
	MOVWF       R0 
	MOVF        _temmonth+1, 0 
	MOVWF       R1 
L_KeySet115:
	MOVF        R0, 0 
	MOVWF       KeySet_d_L2+0 
	MOVF        R1, 0 
	MOVWF       KeySet_d_L2+1 
L_KeySet113:
;SeminarProject.c,337 :: 		Display(pos-1,d);
	MOVLW       1
	SUBWF       _pos+0, 0 
	MOVWF       FARG_Display_CurrentPosition+0 
	MOVLW       0
	SUBWFB      _pos+1, 0 
	MOVWF       FARG_Display_CurrentPosition+1 
	MOVF        KeySet_d_L2+0, 0 
	MOVWF       FARG_Display_displayData+0 
	MOVF        KeySet_d_L2+1, 0 
	MOVWF       FARG_Display_displayData+1 
	CALL        _Display+0, 0
;SeminarProject.c,338 :: 		}
	GOTO        L_KeySet116
L_KeySet109:
;SeminarProject.c,341 :: 		pos=0;
	CLRF        _pos+0 
	CLRF        _pos+1 
;SeminarProject.c,342 :: 		cBlink=200;
	MOVLW       200
	MOVWF       _cBlink+0 
	MOVLW       0
	MOVWF       _cBlink+1 
;SeminarProject.c,343 :: 		Lcd_Chr(1,3,' ');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;SeminarProject.c,344 :: 		Lcd_Out_Cp("         ");
	MOVLW       ?lstr1_SeminarProject+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr1_SeminarProject+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;SeminarProject.c,345 :: 		if(mode == CLOCK)
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeySet304
	MOVLW       0
	XORWF       _mode+0, 0 
L__KeySet304:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeySet117
;SeminarProject.c,347 :: 		second=tems;minute=temm;hour=temh; //save new data
	MOVF        _tems+0, 0 
	MOVWF       _second+0 
	MOVF        _tems+1, 0 
	MOVWF       _second+1 
	MOVF        _temm+0, 0 
	MOVWF       _minute+0 
	MOVF        _temm+1, 0 
	MOVWF       _minute+1 
	MOVF        _temh+0, 0 
	MOVWF       _hour+0 
	MOVF        _temh+1, 0 
	MOVWF       _hour+1 
;SeminarProject.c,348 :: 		DisplayClock(hour,minute,second);
	MOVF        _hour+0, 0 
	MOVWF       FARG_DisplayClock_th+0 
	MOVF        _hour+1, 0 
	MOVWF       FARG_DisplayClock_th+1 
	MOVF        _minute+0, 0 
	MOVWF       FARG_DisplayClock_tm+0 
	MOVF        _minute+1, 0 
	MOVWF       FARG_DisplayClock_tm+1 
	MOVF        _second+0, 0 
	MOVWF       FARG_DisplayClock_ts+0 
	MOVF        _second+1, 0 
	MOVWF       FARG_DisplayClock_ts+1 
	CALL        _DisplayClock+0, 0
;SeminarProject.c,349 :: 		}
	GOTO        L_KeySet118
L_KeySet117:
;SeminarProject.c,352 :: 		day=temday;month=temmonth;year=temyear; //save new data
	MOVF        _temday+0, 0 
	MOVWF       _day+0 
	MOVF        _temday+1, 0 
	MOVWF       _day+1 
	MOVF        _temmonth+0, 0 
	MOVWF       _month+0 
	MOVF        _temmonth+1, 0 
	MOVWF       _month+1 
	MOVF        _temyear+0, 0 
	MOVWF       _year+0 
	MOVF        _temyear+1, 0 
	MOVWF       _year+1 
;SeminarProject.c,353 :: 		DisplayCalendar(year,month,day);
	MOVF        _year+0, 0 
	MOVWF       FARG_DisplayCalendar_tyear+0 
	MOVF        _year+1, 0 
	MOVWF       FARG_DisplayCalendar_tyear+1 
	MOVF        _month+0, 0 
	MOVWF       FARG_DisplayCalendar_tmonth+0 
	MOVF        _month+1, 0 
	MOVWF       FARG_DisplayCalendar_tmonth+1 
	MOVF        _day+0, 0 
	MOVWF       FARG_DisplayCalendar_tday+0 
	MOVF        _day+1, 0 
	MOVWF       FARG_DisplayCalendar_tday+1 
	CALL        _DisplayCalendar+0, 0
;SeminarProject.c,354 :: 		}
L_KeySet118:
;SeminarProject.c,355 :: 		setmode=OFF;
	CLRF        _setmode+0 
	CLRF        _setmode+1 
;SeminarProject.c,356 :: 		}
L_KeySet116:
;SeminarProject.c,357 :: 		}
L_KeySet108:
;SeminarProject.c,358 :: 		}
L_end_KeySet:
	RETURN      0
; end of _KeySet

_KeyUp:

;SeminarProject.c,359 :: 		void KeyUp(void)
;SeminarProject.c,361 :: 		if(fUp==SLOWACC)
	MOVLW       0
	XORWF       _fUp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyUp306
	MOVLW       2
	XORWF       _fUp+0, 0 
L__KeyUp306:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyUp119
;SeminarProject.c,363 :: 		if(cUp<=-20) cUp=0;
	MOVLW       127
	MOVWF       R0 
	MOVLW       128
	XORWF       _cUp+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyUp307
	MOVF        _cUp+0, 0 
	SUBLW       236
L__KeyUp307:
	BTFSS       STATUS+0, 0 
	GOTO        L_KeyUp120
	CLRF        _cUp+0 
	CLRF        _cUp+1 
	GOTO        L_KeyUp121
L_KeyUp120:
;SeminarProject.c,364 :: 		else return;
	GOTO        L_end_KeyUp
L_KeyUp121:
;SeminarProject.c,365 :: 		}
L_KeyUp119:
;SeminarProject.c,366 :: 		switch(pos)
	GOTO        L_KeyUp122
;SeminarProject.c,368 :: 		case 0:
L_KeyUp124:
;SeminarProject.c,370 :: 		if(mode==CLOCK)
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyUp308
	MOVLW       0
	XORWF       _mode+0, 0 
L__KeyUp308:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyUp125
;SeminarProject.c,372 :: 		if(++(temh)==24) temh=0;
	MOVLW       1
	ADDWF       _temh+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _temh+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _temh+0 
	MOVF        R1, 0 
	MOVWF       _temh+1 
	MOVLW       0
	XORWF       _temh+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyUp309
	MOVLW       24
	XORWF       _temh+0, 0 
L__KeyUp309:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyUp126
	CLRF        _temh+0 
	CLRF        _temh+1 
L_KeyUp126:
;SeminarProject.c,373 :: 		}
	GOTO        L_KeyUp127
L_KeyUp125:
;SeminarProject.c,374 :: 		else temyear++;
	MOVLW       1
	ADDWF       _temyear+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _temyear+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _temyear+0 
	MOVF        R1, 0 
	MOVWF       _temyear+1 
L_KeyUp127:
;SeminarProject.c,375 :: 		break;
	GOTO        L_KeyUp123
;SeminarProject.c,377 :: 		case 1:
L_KeyUp128:
;SeminarProject.c,379 :: 		if(mode==CLOCK)
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyUp310
	MOVLW       0
	XORWF       _mode+0, 0 
L__KeyUp310:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyUp129
;SeminarProject.c,381 :: 		if(++(temm)==60) temm=0;
	MOVLW       1
	ADDWF       _temm+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _temm+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _temm+0 
	MOVF        R1, 0 
	MOVWF       _temm+1 
	MOVLW       0
	XORWF       _temm+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyUp311
	MOVLW       60
	XORWF       _temm+0, 0 
L__KeyUp311:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyUp130
	CLRF        _temm+0 
	CLRF        _temm+1 
L_KeyUp130:
;SeminarProject.c,382 :: 		}
	GOTO        L_KeyUp131
L_KeyUp129:
;SeminarProject.c,384 :: 		if(++(temmonth)==13) temmonth=1;
	MOVLW       1
	ADDWF       _temmonth+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _temmonth+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _temmonth+0 
	MOVF        R1, 0 
	MOVWF       _temmonth+1 
	MOVLW       0
	XORWF       _temmonth+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyUp312
	MOVLW       13
	XORWF       _temmonth+0, 0 
L__KeyUp312:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyUp132
	MOVLW       1
	MOVWF       _temmonth+0 
	MOVLW       0
	MOVWF       _temmonth+1 
L_KeyUp132:
L_KeyUp131:
;SeminarProject.c,385 :: 		break;
	GOTO        L_KeyUp123
;SeminarProject.c,387 :: 		case 2:
L_KeyUp133:
;SeminarProject.c,389 :: 		if(mode==CLOCK)
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyUp313
	MOVLW       0
	XORWF       _mode+0, 0 
L__KeyUp313:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyUp134
;SeminarProject.c,391 :: 		if(++(tems)==60) tems=0;
	MOVLW       1
	ADDWF       _tems+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _tems+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _tems+0 
	MOVF        R1, 0 
	MOVWF       _tems+1 
	MOVLW       0
	XORWF       _tems+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyUp314
	MOVLW       60
	XORWF       _tems+0, 0 
L__KeyUp314:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyUp135
	CLRF        _tems+0 
	CLRF        _tems+1 
L_KeyUp135:
;SeminarProject.c,392 :: 		}
	GOTO        L_KeyUp136
L_KeyUp134:
;SeminarProject.c,394 :: 		if(++(temday)==DayMax(temyear,temmonth)+1) temday=1;
	MOVLW       1
	ADDWF       _temday+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _temday+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _temday+0 
	MOVF        R1, 0 
	MOVWF       _temday+1 
	MOVF        _temyear+0, 0 
	MOVWF       FARG_DayMax_yr+0 
	MOVF        _temyear+1, 0 
	MOVWF       FARG_DayMax_yr+1 
	MOVF        _temmonth+0, 0 
	MOVWF       FARG_DayMax_mth+0 
	MOVF        _temmonth+1, 0 
	MOVWF       FARG_DayMax_mth+1 
	CALL        _DayMax+0, 0
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVF        _temday+1, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyUp315
	MOVF        R2, 0 
	XORWF       _temday+0, 0 
L__KeyUp315:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyUp137
	MOVLW       1
	MOVWF       _temday+0 
	MOVLW       0
	MOVWF       _temday+1 
L_KeyUp137:
L_KeyUp136:
;SeminarProject.c,395 :: 		break;
	GOTO        L_KeyUp123
;SeminarProject.c,397 :: 		default:break;
L_KeyUp138:
	GOTO        L_KeyUp123
;SeminarProject.c,398 :: 		}
L_KeyUp122:
	MOVLW       0
	XORWF       _pos+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyUp316
	MOVLW       0
	XORWF       _pos+0, 0 
L__KeyUp316:
	BTFSC       STATUS+0, 2 
	GOTO        L_KeyUp124
	MOVLW       0
	XORWF       _pos+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyUp317
	MOVLW       1
	XORWF       _pos+0, 0 
L__KeyUp317:
	BTFSC       STATUS+0, 2 
	GOTO        L_KeyUp128
	MOVLW       0
	XORWF       _pos+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyUp318
	MOVLW       2
	XORWF       _pos+0, 0 
L__KeyUp318:
	BTFSC       STATUS+0, 2 
	GOTO        L_KeyUp133
	GOTO        L_KeyUp138
L_KeyUp123:
;SeminarProject.c,399 :: 		if(mode==CLOCK) DisplayClock(temh,temm,tems);
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyUp319
	MOVLW       0
	XORWF       _mode+0, 0 
L__KeyUp319:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyUp139
	MOVF        _temh+0, 0 
	MOVWF       FARG_DisplayClock_th+0 
	MOVF        _temh+1, 0 
	MOVWF       FARG_DisplayClock_th+1 
	MOVF        _temm+0, 0 
	MOVWF       FARG_DisplayClock_tm+0 
	MOVF        _temm+1, 0 
	MOVWF       FARG_DisplayClock_tm+1 
	MOVF        _tems+0, 0 
	MOVWF       FARG_DisplayClock_ts+0 
	MOVF        _tems+1, 0 
	MOVWF       FARG_DisplayClock_ts+1 
	CALL        _DisplayClock+0, 0
	GOTO        L_KeyUp140
L_KeyUp139:
;SeminarProject.c,400 :: 		else DisplayCalendar(temyear,temmonth,temday);
	MOVF        _temyear+0, 0 
	MOVWF       FARG_DisplayCalendar_tyear+0 
	MOVF        _temyear+1, 0 
	MOVWF       FARG_DisplayCalendar_tyear+1 
	MOVF        _temmonth+0, 0 
	MOVWF       FARG_DisplayCalendar_tmonth+0 
	MOVF        _temmonth+1, 0 
	MOVWF       FARG_DisplayCalendar_tmonth+1 
	MOVF        _temday+0, 0 
	MOVWF       FARG_DisplayCalendar_tday+0 
	MOVF        _temday+1, 0 
	MOVWF       FARG_DisplayCalendar_tday+1 
	CALL        _DisplayCalendar+0, 0
L_KeyUp140:
;SeminarProject.c,401 :: 		fUp=CANCEL;
	CLRF        _fUp+0 
	CLRF        _fUp+1 
;SeminarProject.c,402 :: 		}
L_end_KeyUp:
	RETURN      0
; end of _KeyUp

_KeyDown:

;SeminarProject.c,403 :: 		void KeyDown(void)
;SeminarProject.c,405 :: 		if(fDown==SLOWACC)
	MOVLW       0
	XORWF       _fDown+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyDown321
	MOVLW       2
	XORWF       _fDown+0, 0 
L__KeyDown321:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyDown141
;SeminarProject.c,407 :: 		if(cDown==-20) cDown=0;
	MOVLW       255
	XORWF       _cDown+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyDown322
	MOVLW       236
	XORWF       _cDown+0, 0 
L__KeyDown322:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyDown142
	CLRF        _cDown+0 
	CLRF        _cDown+1 
	GOTO        L_KeyDown143
L_KeyDown142:
;SeminarProject.c,408 :: 		else return;
	GOTO        L_end_KeyDown
L_KeyDown143:
;SeminarProject.c,409 :: 		}
L_KeyDown141:
;SeminarProject.c,410 :: 		switch(pos)
	GOTO        L_KeyDown144
;SeminarProject.c,412 :: 		case 0:
L_KeyDown146:
;SeminarProject.c,414 :: 		if(mode==CLOCK)
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyDown323
	MOVLW       0
	XORWF       _mode+0, 0 
L__KeyDown323:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyDown147
;SeminarProject.c,416 :: 		if(--(temh)==-1) temh=23;
	MOVLW       1
	SUBWF       _temh+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _temh+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _temh+0 
	MOVF        R1, 0 
	MOVWF       _temh+1 
	MOVLW       255
	XORWF       _temh+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyDown324
	MOVLW       255
	XORWF       _temh+0, 0 
L__KeyDown324:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyDown148
	MOVLW       23
	MOVWF       _temh+0 
	MOVLW       0
	MOVWF       _temh+1 
L_KeyDown148:
;SeminarProject.c,417 :: 		}
	GOTO        L_KeyDown149
L_KeyDown147:
;SeminarProject.c,418 :: 		else temyear--;
	MOVLW       1
	SUBWF       _temyear+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _temyear+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _temyear+0 
	MOVF        R1, 0 
	MOVWF       _temyear+1 
L_KeyDown149:
;SeminarProject.c,419 :: 		break;
	GOTO        L_KeyDown145
;SeminarProject.c,421 :: 		case 1:
L_KeyDown150:
;SeminarProject.c,423 :: 		if(mode==CLOCK)
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyDown325
	MOVLW       0
	XORWF       _mode+0, 0 
L__KeyDown325:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyDown151
;SeminarProject.c,425 :: 		if(--(temm)==-1) temm=59;
	MOVLW       1
	SUBWF       _temm+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _temm+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _temm+0 
	MOVF        R1, 0 
	MOVWF       _temm+1 
	MOVLW       255
	XORWF       _temm+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyDown326
	MOVLW       255
	XORWF       _temm+0, 0 
L__KeyDown326:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyDown152
	MOVLW       59
	MOVWF       _temm+0 
	MOVLW       0
	MOVWF       _temm+1 
L_KeyDown152:
;SeminarProject.c,426 :: 		}
	GOTO        L_KeyDown153
L_KeyDown151:
;SeminarProject.c,428 :: 		if(--(temmonth)==0) temmonth=12;
	MOVLW       1
	SUBWF       _temmonth+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _temmonth+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _temmonth+0 
	MOVF        R1, 0 
	MOVWF       _temmonth+1 
	MOVLW       0
	XORWF       _temmonth+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyDown327
	MOVLW       0
	XORWF       _temmonth+0, 0 
L__KeyDown327:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyDown154
	MOVLW       12
	MOVWF       _temmonth+0 
	MOVLW       0
	MOVWF       _temmonth+1 
L_KeyDown154:
L_KeyDown153:
;SeminarProject.c,429 :: 		break;
	GOTO        L_KeyDown145
;SeminarProject.c,431 :: 		case 2:
L_KeyDown155:
;SeminarProject.c,433 :: 		if(mode==CLOCK)
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyDown328
	MOVLW       0
	XORWF       _mode+0, 0 
L__KeyDown328:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyDown156
;SeminarProject.c,435 :: 		if(--(tems)==-1) tems=59;
	MOVLW       1
	SUBWF       _tems+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _tems+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _tems+0 
	MOVF        R1, 0 
	MOVWF       _tems+1 
	MOVLW       255
	XORWF       _tems+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyDown329
	MOVLW       255
	XORWF       _tems+0, 0 
L__KeyDown329:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyDown157
	MOVLW       59
	MOVWF       _tems+0 
	MOVLW       0
	MOVWF       _tems+1 
L_KeyDown157:
;SeminarProject.c,436 :: 		}
	GOTO        L_KeyDown158
L_KeyDown156:
;SeminarProject.c,438 :: 		if(--(temday)==0) temday=DayMax(temyear,temmonth);
	MOVLW       1
	SUBWF       _temday+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _temday+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _temday+0 
	MOVF        R1, 0 
	MOVWF       _temday+1 
	MOVLW       0
	XORWF       _temday+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyDown330
	MOVLW       0
	XORWF       _temday+0, 0 
L__KeyDown330:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyDown159
	MOVF        _temyear+0, 0 
	MOVWF       FARG_DayMax_yr+0 
	MOVF        _temyear+1, 0 
	MOVWF       FARG_DayMax_yr+1 
	MOVF        _temmonth+0, 0 
	MOVWF       FARG_DayMax_mth+0 
	MOVF        _temmonth+1, 0 
	MOVWF       FARG_DayMax_mth+1 
	CALL        _DayMax+0, 0
	MOVF        R0, 0 
	MOVWF       _temday+0 
	MOVF        R1, 0 
	MOVWF       _temday+1 
L_KeyDown159:
L_KeyDown158:
;SeminarProject.c,439 :: 		break;
	GOTO        L_KeyDown145
;SeminarProject.c,441 :: 		default:break;
L_KeyDown160:
	GOTO        L_KeyDown145
;SeminarProject.c,442 :: 		}
L_KeyDown144:
	MOVLW       0
	XORWF       _pos+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyDown331
	MOVLW       0
	XORWF       _pos+0, 0 
L__KeyDown331:
	BTFSC       STATUS+0, 2 
	GOTO        L_KeyDown146
	MOVLW       0
	XORWF       _pos+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyDown332
	MOVLW       1
	XORWF       _pos+0, 0 
L__KeyDown332:
	BTFSC       STATUS+0, 2 
	GOTO        L_KeyDown150
	MOVLW       0
	XORWF       _pos+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyDown333
	MOVLW       2
	XORWF       _pos+0, 0 
L__KeyDown333:
	BTFSC       STATUS+0, 2 
	GOTO        L_KeyDown155
	GOTO        L_KeyDown160
L_KeyDown145:
;SeminarProject.c,443 :: 		if(mode==CLOCK) DisplayClock(temh,temm,tems);
	MOVLW       0
	XORWF       _mode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__KeyDown334
	MOVLW       0
	XORWF       _mode+0, 0 
L__KeyDown334:
	BTFSS       STATUS+0, 2 
	GOTO        L_KeyDown161
	MOVF        _temh+0, 0 
	MOVWF       FARG_DisplayClock_th+0 
	MOVF        _temh+1, 0 
	MOVWF       FARG_DisplayClock_th+1 
	MOVF        _temm+0, 0 
	MOVWF       FARG_DisplayClock_tm+0 
	MOVF        _temm+1, 0 
	MOVWF       FARG_DisplayClock_tm+1 
	MOVF        _tems+0, 0 
	MOVWF       FARG_DisplayClock_ts+0 
	MOVF        _tems+1, 0 
	MOVWF       FARG_DisplayClock_ts+1 
	CALL        _DisplayClock+0, 0
	GOTO        L_KeyDown162
L_KeyDown161:
;SeminarProject.c,444 :: 		else DisplayCalendar(temyear,temmonth,temday);
	MOVF        _temyear+0, 0 
	MOVWF       FARG_DisplayCalendar_tyear+0 
	MOVF        _temyear+1, 0 
	MOVWF       FARG_DisplayCalendar_tyear+1 
	MOVF        _temmonth+0, 0 
	MOVWF       FARG_DisplayCalendar_tmonth+0 
	MOVF        _temmonth+1, 0 
	MOVWF       FARG_DisplayCalendar_tmonth+1 
	MOVF        _temday+0, 0 
	MOVWF       FARG_DisplayCalendar_tday+0 
	MOVF        _temday+1, 0 
	MOVWF       FARG_DisplayCalendar_tday+1 
	CALL        _DisplayCalendar+0, 0
L_KeyDown162:
;SeminarProject.c,445 :: 		fDown=CANCEL;
	CLRF        _fDown+0 
	CLRF        _fDown+1 
;SeminarProject.c,446 :: 		}
L_end_KeyDown:
	RETURN      0
; end of _KeyDown

_timer0_init:

;SeminarProject.c,451 :: 		void timer0_init() // normal mode
;SeminarProject.c,453 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;SeminarProject.c,454 :: 		INTCON.TMR0IE=1;
	BSF         INTCON+0, 5 
;SeminarProject.c,455 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;SeminarProject.c,457 :: 		T0CON=0x02;
	MOVLW       2
	MOVWF       T0CON+0 
;SeminarProject.c,458 :: 		TMR0L=0xcb;
	MOVLW       203
	MOVWF       TMR0L+0 
;SeminarProject.c,459 :: 		TMR0H=0xf3;
	MOVLW       243
	MOVWF       TMR0H+0 
;SeminarProject.c,460 :: 		cTime=200;
	MOVLW       200
	MOVWF       _cTime+0 
	MOVLW       0
	MOVWF       _cTime+1 
;SeminarProject.c,461 :: 		}
L_end_timer0_init:
	RETURN      0
; end of _timer0_init

_interrupt:

;SeminarProject.c,463 :: 		void interrupt()
;SeminarProject.c,465 :: 		if(INTCON.TMR0IF)
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt163
;SeminarProject.c,467 :: 		INTCON.TMR0IF=0; //clear interrupt flag
	BCF         INTCON+0, 2 
;SeminarProject.c,468 :: 		TMR0L=0xcb;
	MOVLW       203
	MOVWF       TMR0L+0 
;SeminarProject.c,469 :: 		TMR0H=0xf3;
	MOVLW       243
	MOVWF       TMR0H+0 
;SeminarProject.c,470 :: 		cTime--;
	MOVLW       1
	SUBWF       _cTime+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _cTime+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _cTime+0 
	MOVF        R1, 0 
	MOVWF       _cTime+1 
;SeminarProject.c,471 :: 		CheckKey();
	CALL        _CheckKey+0, 0
;SeminarProject.c,472 :: 		if(setmode==ON) cBlink--;
	MOVLW       255
	XORWF       _setmode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt338
	MOVLW       255
	XORWF       _setmode+0, 0 
L__interrupt338:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt164
	MOVLW       1
	SUBWF       _cBlink+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _cBlink+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _cBlink+0 
	MOVF        R1, 0 
	MOVWF       _cBlink+1 
L_interrupt164:
;SeminarProject.c,474 :: 		}
L_interrupt163:
;SeminarProject.c,475 :: 		}
L_end_interrupt:
L__interrupt337:
	RETFIE      1
; end of _interrupt

_main:

;SeminarProject.c,479 :: 		void main()
;SeminarProject.c,481 :: 		INTCON2.RBPU=0;
	BCF         INTCON2+0, 7 
;SeminarProject.c,482 :: 		TRISB=0xff;
	MOVLW       255
	MOVWF       TRISB+0 
;SeminarProject.c,483 :: 		TRISA=0x00;
	CLRF        TRISA+0 
;SeminarProject.c,484 :: 		cMode=100;cSet=400;cUp=100;cDown=100;
	MOVLW       100
	MOVWF       _cMode+0 
	MOVLW       0
	MOVWF       _cMode+1 
	MOVLW       144
	MOVWF       _cSet+0 
	MOVLW       1
	MOVWF       _cSet+1 
	MOVLW       100
	MOVWF       _cUp+0 
	MOVLW       0
	MOVWF       _cUp+1 
	MOVLW       100
	MOVWF       _cDown+0 
	MOVLW       0
	MOVWF       _cDown+1 
;SeminarProject.c,485 :: 		hour=0;minute=0;second=0;                      //default hour,minute,second
	CLRF        _hour+0 
	CLRF        _hour+1 
	CLRF        _minute+0 
	CLRF        _minute+1 
	CLRF        _second+0 
	CLRF        _second+1 
;SeminarProject.c,486 :: 		year=2000;month=1;day=1;          //default year,month,day
	MOVLW       208
	MOVWF       _year+0 
	MOVLW       7
	MOVWF       _year+1 
	MOVLW       1
	MOVWF       _month+0 
	MOVLW       0
	MOVWF       _month+1 
	MOVLW       1
	MOVWF       _day+0 
	MOVLW       0
	MOVWF       _day+1 
;SeminarProject.c,487 :: 		pos=0;                    //default setting position
	CLRF        _pos+0 
	CLRF        _pos+1 
;SeminarProject.c,488 :: 		mode=CLOCK;                 // default mode
	CLRF        _mode+0 
	CLRF        _mode+1 
;SeminarProject.c,489 :: 		setmode=OFF;
	CLRF        _setmode+0 
	CLRF        _setmode+1 
;SeminarProject.c,490 :: 		fMode=CANCEL; fSet=CANCEL; fUp=CANCEL; fDown=CANCEL;
	CLRF        _fMode+0 
	CLRF        _fMode+1 
	CLRF        _fSet+0 
	CLRF        _fSet+1 
	CLRF        _fUp+0 
	CLRF        _fUp+1 
	CLRF        _fDown+0 
	CLRF        _fDown+1 
;SeminarProject.c,491 :: 		fsync=OFF;
	CLRF        _fsync+0 
	CLRF        _fsync+1 
;SeminarProject.c,492 :: 		fsyncDone=ON;
	MOVLW       255
	MOVWF       _fsyncDone+0 
	MOVLW       255
	MOVWF       _fsyncDone+1 
;SeminarProject.c,493 :: 		i=0;j=0;
	CLRF        _i+0 
	CLRF        _i+1 
	CLRF        _j+0 
	CLRF        _j+1 
;SeminarProject.c,494 :: 		lcdp=0;
	CLRF        _lcdp+0 
	CLRF        _lcdp+1 
;SeminarProject.c,495 :: 		flagInfo=OFF;
	CLRF        _flagInfo+0 
	CLRF        _flagInfo+1 
;SeminarProject.c,496 :: 		flagDone=OFF;
	CLRF        _flagDone+0 
	CLRF        _flagDone+1 
;SeminarProject.c,499 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;SeminarProject.c,500 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SeminarProject.c,501 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SeminarProject.c,503 :: 		UART1_Init(9600);
	MOVLW       129
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;SeminarProject.c,504 :: 		Delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main165:
	DECFSZ      R13, 1, 1
	BRA         L_main165
	DECFSZ      R12, 1, 1
	BRA         L_main165
	DECFSZ      R11, 1, 1
	BRA         L_main165
	NOP
	NOP
;SeminarProject.c,506 :: 		DisplayClock(hour,minute,second);
	MOVF        _hour+0, 0 
	MOVWF       FARG_DisplayClock_th+0 
	MOVF        _hour+1, 0 
	MOVWF       FARG_DisplayClock_th+1 
	MOVF        _minute+0, 0 
	MOVWF       FARG_DisplayClock_tm+0 
	MOVF        _minute+1, 0 
	MOVWF       FARG_DisplayClock_tm+1 
	MOVF        _second+0, 0 
	MOVWF       FARG_DisplayClock_ts+0 
	MOVF        _second+1, 0 
	MOVWF       FARG_DisplayClock_ts+1 
	CALL        _DisplayClock+0, 0
;SeminarProject.c,507 :: 		timer0_init();
	CALL        _timer0_init+0, 0
;SeminarProject.c,508 :: 		T0CON.TMR0ON=1;
	BSF         T0CON+0, 7 
;SeminarProject.c,510 :: 		while(1)
L_main166:
;SeminarProject.c,512 :: 		if(fsync==OFF)
	MOVLW       0
	XORWF       _fsync+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main340
	MOVLW       0
	XORWF       _fsync+0, 0 
L__main340:
	BTFSS       STATUS+0, 2 
	GOTO        L_main168
;SeminarProject.c,514 :: 		TimeTracking();
	CALL        _TimeTracking+0, 0
;SeminarProject.c,515 :: 		if(fMode==ACCESS) KeyMode();
	MOVLW       0
	XORWF       _fMode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main341
	MOVLW       1
	XORWF       _fMode+0, 0 
L__main341:
	BTFSS       STATUS+0, 2 
	GOTO        L_main169
	CALL        _KeyMode+0, 0
L_main169:
;SeminarProject.c,516 :: 		if(fSet==ACCESS) KeySet();
	MOVLW       0
	XORWF       _fSet+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main342
	MOVLW       1
	XORWF       _fSet+0, 0 
L__main342:
	BTFSS       STATUS+0, 2 
	GOTO        L_main170
	CALL        _KeySet+0, 0
L_main170:
;SeminarProject.c,517 :: 		if(setmode==ON)
	MOVLW       255
	XORWF       _setmode+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main343
	MOVLW       255
	XORWF       _setmode+0, 0 
L__main343:
	BTFSS       STATUS+0, 2 
	GOTO        L_main171
;SeminarProject.c,519 :: 		if(fUp!=CANCEL) KeyUp();
	MOVLW       0
	XORWF       _fUp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main344
	MOVLW       0
	XORWF       _fUp+0, 0 
L__main344:
	BTFSC       STATUS+0, 2 
	GOTO        L_main172
	CALL        _KeyUp+0, 0
L_main172:
;SeminarProject.c,520 :: 		if(fDown!=CANCEL) KeyDown();
	MOVLW       0
	XORWF       _fDown+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main345
	MOVLW       0
	XORWF       _fDown+0, 0 
L__main345:
	BTFSC       STATUS+0, 2 
	GOTO        L_main173
	CALL        _KeyDown+0, 0
L_main173:
;SeminarProject.c,521 :: 		BlinkCreate();
	CALL        _BlinkCreate+0, 0
;SeminarProject.c,522 :: 		}
L_main171:
;SeminarProject.c,523 :: 		}
L_main168:
;SeminarProject.c,524 :: 		if (UART1_Data_Ready()) {     // If data is received,
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main174
;SeminarProject.c,525 :: 		uart_rd = UART1_Read();     // read the received data,
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;SeminarProject.c,526 :: 		if(i<6)
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main346
	MOVLW       6
	SUBWF       _i+0, 0 
L__main346:
	BTFSC       STATUS+0, 0 
	GOTO        L_main175
;SeminarProject.c,528 :: 		if(uart_rd!='-' && uart_rd!=':' && uart_rd!=' ' &&uart_rd!='/')
	MOVF        _uart_rd+0, 0 
	XORLW       45
	BTFSC       STATUS+0, 2 
	GOTO        L_main178
	MOVF        _uart_rd+0, 0 
	XORLW       58
	BTFSC       STATUS+0, 2 
	GOTO        L_main178
	MOVF        _uart_rd+0, 0 
	XORLW       32
	BTFSC       STATUS+0, 2 
	GOTO        L_main178
	MOVF        _uart_rd+0, 0 
	XORLW       47
	BTFSC       STATUS+0, 2 
	GOTO        L_main178
L__main211:
;SeminarProject.c,529 :: 		sync_time[i]+=(uart_rd-'0')*power(10,j++);
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVF        _i+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _sync_time+0
	ADDWF       R0, 0 
	MOVWF       FLOC__main+2 
	MOVLW       hi_addr(_sync_time+0)
	ADDWFC      R1, 0 
	MOVWF       FLOC__main+3 
	MOVLW       48
	SUBWF       _uart_rd+0, 0 
	MOVWF       FLOC__main+0 
	CLRF        FLOC__main+1 
	MOVLW       0
	SUBWFB      FLOC__main+1, 1 
	MOVLW       10
	MOVWF       FARG_power_a+0 
	MOVLW       0
	MOVWF       FARG_power_a+1 
	MOVF        _j+0, 0 
	MOVWF       FARG_power_n+0 
	MOVF        _j+1, 0 
	MOVWF       FARG_power_n+1 
	CALL        _power+0, 0
	MOVF        FLOC__main+0, 0 
	MOVWF       R4 
	MOVF        FLOC__main+1, 0 
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVFF       FLOC__main+2, FSR0L
	MOVFF       FLOC__main+3, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	ADDWF       R0, 1 
	MOVF        R3, 0 
	ADDWFC      R1, 1 
	MOVFF       FLOC__main+2, FSR1L
	MOVFF       FLOC__main+3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _j+0, 1 
	INCF        _j+1, 1 
	GOTO        L_main179
L_main178:
;SeminarProject.c,532 :: 		if((++i)==6)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	MOVLW       0
	XORWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main347
	MOVLW       6
	XORWF       _i+0, 0 
L__main347:
	BTFSS       STATUS+0, 2 
	GOTO        L_main180
;SeminarProject.c,534 :: 		fsync=ON;
	MOVLW       255
	MOVWF       _fsync+0 
	MOVLW       255
	MOVWF       _fsync+1 
;SeminarProject.c,535 :: 		}
L_main180:
;SeminarProject.c,536 :: 		j=0;
	CLRF        _j+0 
	CLRF        _j+1 
;SeminarProject.c,537 :: 		}
L_main179:
;SeminarProject.c,538 :: 		}
L_main175:
;SeminarProject.c,540 :: 		if(uart_rd=='/')
	MOVF        _uart_rd+0, 0 
	XORLW       47
	BTFSS       STATUS+0, 2 
	GOTO        L_main181
;SeminarProject.c,542 :: 		if(flagInfo==OFF) flagInfo=ON;
	MOVLW       0
	XORWF       _flagInfo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main348
	MOVLW       0
	XORWF       _flagInfo+0, 0 
L__main348:
	BTFSS       STATUS+0, 2 
	GOTO        L_main182
	MOVLW       255
	MOVWF       _flagInfo+0 
	MOVLW       255
	MOVWF       _flagInfo+1 
	GOTO        L_main183
L_main182:
;SeminarProject.c,545 :: 		flagInfo=OFF;
	CLRF        _flagInfo+0 
	CLRF        _flagInfo+1 
;SeminarProject.c,546 :: 		flagDone=ON;
	MOVLW       255
	MOVWF       _flagDone+0 
	MOVLW       255
	MOVWF       _flagDone+1 
;SeminarProject.c,547 :: 		}
L_main183:
;SeminarProject.c,548 :: 		}
L_main181:
;SeminarProject.c,549 :: 		if(flagInfo==ON&&uart_rd!='/')
	MOVLW       255
	XORWF       _flagInfo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main349
	MOVLW       255
	XORWF       _flagInfo+0, 0 
L__main349:
	BTFSS       STATUS+0, 2 
	GOTO        L_main186
	MOVF        _uart_rd+0, 0 
	XORLW       47
	BTFSC       STATUS+0, 2 
	GOTO        L_main186
L__main210:
;SeminarProject.c,550 :: 		txt[lcdp++]=uart_rd;
	MOVLW       _txt+0
	ADDWF       _lcdp+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(_txt+0)
	ADDWFC      _lcdp+1, 0 
	MOVWF       FSR1H 
	MOVF        _uart_rd+0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _lcdp+0, 1 
	INCF        _lcdp+1, 1 
L_main186:
;SeminarProject.c,551 :: 		}
L_main174:
;SeminarProject.c,552 :: 		if(fsync==ON)
	MOVLW       255
	XORWF       _fsync+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main350
	MOVLW       255
	XORWF       _fsync+0, 0 
L__main350:
	BTFSS       STATUS+0, 2 
	GOTO        L_main187
;SeminarProject.c,554 :: 		second=sync_time[0];
	MOVF        _sync_time+0, 0 
	MOVWF       _second+0 
	MOVF        _sync_time+1, 0 
	MOVWF       _second+1 
;SeminarProject.c,555 :: 		minute=sync_time[1];
	MOVF        _sync_time+2, 0 
	MOVWF       _minute+0 
	MOVF        _sync_time+3, 0 
	MOVWF       _minute+1 
;SeminarProject.c,556 :: 		hour=sync_time[2];
	MOVF        _sync_time+4, 0 
	MOVWF       _hour+0 
	MOVF        _sync_time+5, 0 
	MOVWF       _hour+1 
;SeminarProject.c,557 :: 		day=sync_time[3];
	MOVF        _sync_time+6, 0 
	MOVWF       _day+0 
	MOVF        _sync_time+7, 0 
	MOVWF       _day+1 
;SeminarProject.c,558 :: 		month=sync_time[4];
	MOVF        _sync_time+8, 0 
	MOVWF       _month+0 
	MOVF        _sync_time+9, 0 
	MOVWF       _month+1 
;SeminarProject.c,559 :: 		year=sync_time[5];
	MOVF        _sync_time+10, 0 
	MOVWF       _year+0 
	MOVF        _sync_time+11, 0 
	MOVWF       _year+1 
;SeminarProject.c,560 :: 		for(i=0;i<6;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_main188:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main351
	MOVLW       6
	SUBWF       _i+0, 0 
L__main351:
	BTFSC       STATUS+0, 0 
	GOTO        L_main189
;SeminarProject.c,561 :: 		sync_time[i]=0;
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVF        _i+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _sync_time+0
	ADDWF       R0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(_sync_time+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;SeminarProject.c,560 :: 		for(i=0;i<6;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;SeminarProject.c,561 :: 		sync_time[i]=0;
	GOTO        L_main188
L_main189:
;SeminarProject.c,563 :: 		fsync=OFF;
	CLRF        _fsync+0 
	CLRF        _fsync+1 
;SeminarProject.c,564 :: 		}
L_main187:
;SeminarProject.c,565 :: 		if(flagDone==ON)
	MOVLW       255
	XORWF       _flagDone+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main352
	MOVLW       255
	XORWF       _flagDone+0, 0 
L__main352:
	BTFSS       STATUS+0, 2 
	GOTO        L_main191
;SeminarProject.c,568 :: 		while(lcdp<10)
L_main192:
	MOVLW       128
	XORWF       _lcdp+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main353
	MOVLW       10
	SUBWF       _lcdp+0, 0 
L__main353:
	BTFSC       STATUS+0, 0 
	GOTO        L_main193
;SeminarProject.c,571 :: 		if(lcdp==9) txt[lcdp]='\0';
	MOVLW       0
	XORWF       _lcdp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main354
	MOVLW       9
	XORWF       _lcdp+0, 0 
L__main354:
	BTFSS       STATUS+0, 2 
	GOTO        L_main194
	MOVLW       _txt+0
	ADDWF       _lcdp+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(_txt+0)
	ADDWFC      _lcdp+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	GOTO        L_main195
L_main194:
;SeminarProject.c,572 :: 		else txt[lcdp]=' ';
	MOVLW       _txt+0
	ADDWF       _lcdp+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(_txt+0)
	ADDWFC      _lcdp+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
L_main195:
;SeminarProject.c,573 :: 		lcdp++;
	INFSNZ      _lcdp+0, 1 
	INCF        _lcdp+1, 1 
;SeminarProject.c,574 :: 		}
	GOTO        L_main192
L_main193:
;SeminarProject.c,576 :: 		Lcd_Chr(1,3,' ');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;SeminarProject.c,577 :: 		Lcd_Out_Cp(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;SeminarProject.c,578 :: 		i=0;
	CLRF        _i+0 
	CLRF        _i+1 
;SeminarProject.c,579 :: 		lcdp=0;
	CLRF        _lcdp+0 
	CLRF        _lcdp+1 
;SeminarProject.c,580 :: 		flagDone=OFF;
	CLRF        _flagDone+0 
	CLRF        _flagDone+1 
;SeminarProject.c,581 :: 		}
L_main191:
;SeminarProject.c,582 :: 		}
	GOTO        L_main166
;SeminarProject.c,583 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
