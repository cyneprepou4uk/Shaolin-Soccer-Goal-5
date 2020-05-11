.segment "BANK_07"
.include "bank_ram_copy.inc"

.import _loc_00_8000
.import _loc_00_8003
.import _loc_00_AE80
.import _loc_00_AE83
.import _loc_00_AE86
.import _loc_06_BD6A
.import _loc_06_BE42
.import _loc_06_BECC

; _b07_C344_банксвич_80xx
.import _loc_01_8000
.import _loc_01_8003
.import _loc_01_8006
.import _loc_01_8009
.import _loc_01_800C
.import _loc_02_8000
.import _loc_02_8003
.import _loc_02_8006
.import _loc_02_8009
.import _loc_02_800C
.import _loc_02_800F
.import _loc_03_8000
.import _loc_03_8003
.import _loc_03_8006
.import _loc_03_8009
.import _loc_03_800C
.import _loc_03_800F
.import _loc_03_8012
.import _loc_04_8000
.import _loc_04_8003
.import _loc_04_8006
.import _loc_04_800C
.import _loc_04_800F
.import _loc_04_8012
.import _loc_04_8015
.import _loc_04_8018
.import _loc_04_801B
.import _loc_04_801E_проверка_координат_для_возможности_сделать_супер
.import _loc_04_8021
.import _loc_04_8024
.import _loc_05_8000
.import _loc_05_8003
.import _loc_05_8006
.import _loc_05_8009
.import _loc_05_800C
.import _loc_06_8000
.import _loc_06_8003
.import _loc_06_8006
.import _loc_06_8009
.import _loc_06_800C
.import _loc_06_800F
.import _loc_06_8012
.import _loc_06_8015
.import _loc_06_8018_вычисление_скорости_удара
.import _loc_06_801B
.import _loc_06_801E
.import _loc_06_8021
.import _loc_06_8024
.import _loc_06_8027
.import _loc_06_802A

; 8000		читается из банка 03 в AADC и 05 в B207
.export table_07_C080_byte_8000_8001
table_07_C080_byte_8000_8001:
.word table_07_C080

table_07_C080:		; параметры игроков у команд
.word table_07_C080_C0A0
.word table_07_C080_C0DC
.word table_07_C080_C118
.word table_07_C080_C0FA
.word table_07_C080_C0A0
.word table_07_C080_C136
.word table_07_C080_C154
.word table_07_C080_C172
.word table_07_C080_C0A0
.word table_07_C080_C190
.word table_07_C080_C1AE
.word table_07_C080_C1CC
.word table_07_C080_C0A0
.word table_07_C080_C1EA
.word table_07_C080_C208
.word table_07_C080_C226

table_07_C080_C0A0:
.byte $A9,$B7,$A6,$FF,$FF
.byte $C7,$C9,$B3,$B9,$FF
.byte $AC,$2D,$FF,$FF,$FF
.byte $BF,$C9,$3B,$B1,$FF
.byte $A3,$CD,$A7,$3E,$FF
.byte $2A,$CF,$A5,$A3,$FF
.byte $A4,$27,$2D,$CF,$FF
.byte $A6,$B7,$B1,$AA,$FF
.byte $A9,$C4,$CF,$FF,$FF
.byte $A7,$A3,$2E,$A8,$FF
.byte $B3,$B9,$CE,$FF,$FF
.byte $A7,$CA,$CC,$AE,$FF

table_07_C080_C0DC:
.byte $B2,$D3,$CF,$A3,$CA
.byte $C7,$CF,$35,$A9,$FF
.byte $C0,$CF,$AE,$FF,$FF
.byte $C1,$CF,$BF,$FF,$FF
.byte $C7,$CF,$AE,$FF,$FF
.byte $AE,$CF,$B2,$D3,$CA

table_07_C080_C0FA:
.byte $6D,$C1,$6F,$CF,$FF
.byte $B5,$CF,$B2,$D1,$A3
.byte $AC,$AA,$D0,$B5,$FF
.byte $6C,$6D,$CF,$FF,$FF
.byte $B1,$B7,$CF,$FF,$FF
.byte $B2,$D1,$B2,$D1,$A3

table_07_C080_C118:
.byte $2D,$D3,$CA,$A8,$CF
.byte $A2,$2D,$D2,$CA,$FF
.byte $27,$2C,$CF,$FF,$FF
.byte $C4,$CF,$B5,$A9,$FF
.byte $BD,$CA,$B2,$CF,$FF
.byte $A3,$AD,$C2,$B5,$FF

table_07_C080_C136:
.byte $B8,$2A,$C0,$FF,$FF
.byte $C0,$3D,$A3,$FF,$FF
.byte $C2,$27,$3E,$FF,$FF
.byte $C4,$3D,$B3,$FF,$FF
.byte $B0,$29,$CC,$FF,$FF
.byte $A2,$34,$FF,$FF,$FF

table_07_C080_C154:
.byte $CA,$C2,$CF,$3B,$FF
.byte $A4,$D7,$CF,$3B,$FF
.byte $B8,$2D,$D3,$C0,$FF
.byte $B8,$2D,$D7,$C9,$FF
.byte $A6,$3E,$CF,$2D,$D3
.byte $C2,$CF,$2D,$D1,$C8

table_07_C080_C172:
.byte $CD,$C9,$A6,$3B,$FF
.byte $31,$AB,$AE,$B1,$FF
.byte $A6,$3B,$CF,$2B,$FF
.byte $C2,$27,$3E,$FF,$FF
.byte $A9,$CF,$2D,$D1,$C8
.byte $2D,$D1,$CD,$C8,$FF

table_07_C080_C190:
.byte $A5,$D0,$AA,$CA,$B5
.byte $BE,$CA,$C0,$D9,$FF
.byte $C9,$D9,$35,$CA,$FF
.byte $3B,$CA,$B7,$AA,$FF
.byte $AD,$D2,$CA,$B3,$FF
.byte $3D,$CB,$D9,$C3,$FF

table_07_C080_C1AE:
.byte $34,$3C,$D0,$35,$FF
.byte $B6,$A3,$2D,$D7,$CA
.byte $C0,$D9,$A9,$FF,$FF
.byte $C0,$D9,$B2,$CF,$FF
.byte $BE,$CF,$C9,$D9,$FF
.byte $A2,$CF,$34,$D5,$FF

table_07_C080_C1CC:
.byte $C8,$BD,$D4,$A5,$CB
.byte $C9,$A7,$CA,$35,$FF
.byte $2D,$D3,$CA,$2D,$D3
.byte $CA,$A7,$FF,$FF,$FF
.byte $2D,$D2,$2F,$D0,$6E
.byte $2D,$D3,$3B,$CF,$B7

table_07_C080_C1EA:
.byte $34,$D5,$A2,$2E,$FF
.byte $AC,$C8,$3C,$A2,$FF
.byte $C3,$CF,$35,$D9,$AC
.byte $3D,$D9,$B7,$D3,$FF
.byte $AC,$CF,$B5,$AE,$FF
.byte $CC,$35,$C9,$2A,$AE

table_07_C080_C208:
.byte $C8,$B5,$D9,$CB,$FF
.byte $A5,$AE,$AB,$3B,$CA
.byte $AF,$CA,$2D,$A6,$FF
.byte $A6,$C9,$3B,$CB,$AE
.byte $3B,$CA,$3B,$FF,$FF
.byte $A3,$28,$D9,$B1,$FF

table_07_C080_C226:
.byte $A2,$3C,$CB,$AE,$FF
.byte $A2,$28,$B6,$27,$FF
.byte $2B,$CF,$2C,$CB,$AE
.byte $AC,$C8,$2C,$D9,$CA
.byte $B1,$3B,$2D,$D3,$AE
.byte $A5,$CF,$C9,$AB,$FF

_loc_07_C249_банксвич_05:
	LDA #$05
	JMP _b07_C344_банксвич_80xx
_loc_07_C24E_банксвич_1E:
	LDA #$1E
	JMP _b07_C344_банксвич_80xx
_loc_07_C25D_банксвич_18:
	LDA #$18
	JMP _b07_C344_банксвич_80xx
_loc_07_C262_банксвич_2D:
	LDA #$2D
	JMP _b07_C344_банксвич_80xx
_loc_07_C267_банксвич_2E:
	LDA #$2E
	JMP _b07_C344_банксвич_80xx
_loc_07_C26C_банксвич_2F:
	LDA #$2F
	JMP _b07_C344_банксвич_80xx
_loc_07_C271_банксвич_00:
	LDA #$00
	JMP _b07_C344_банксвич_80xx
_loc_07_C285_банксвич_1B:
	LDA #$1B
	JMP _b07_C344_банксвич_80xx
.export _b07_C28F_банксвич_0C
_b07_C28F_банксвич_0C:
	LDA #$0C
	JMP _b07_C344_банксвич_80xx
_loc_07_C299_банксвич_11:
	LDA #$11
	JMP _b07_C344_банксвич_80xx
_loc_07_C29E_банксвич_14:
	LDA #$14
	JMP _b07_C344_банксвич_80xx
_loc_07_C2A3_банксвич_15:
	LDA #$15
	JMP _b07_C344_банксвич_80xx
_loc_07_C2AD_банксвич_17:
	LDA #$17
	JMP _b07_C344_банксвич_80xx
.export _b07_C2CB_банксвич_24
_b07_C2CB_банксвич_24:
	LDA #$24
	JMP _b07_C344_банксвич_80xx
_loc_07_C2D5_банксвич_10:
	LDA #$10
	JMP _b07_C344_банксвич_80xx
_loc_07_C2DA:
	LDA #$12
	JMP _b07_C344_банксвич_80xx

.export _b07_C2E4_записать_и_воспроизвести_звук
_b07_C2E4_записать_и_воспроизвести_звук:
	BIT флаг_демо
	BVS @RTS		; не писать звуки на сценках с кунио
	BPL @запись_звука
	CMP #$20		; меньше 20 это музыка а не звуки
	BCC @RTS
@запись_звука:
	STA номер_звука
	LDA $BFFF
	PHA
	LDA #$00
	JSR _главный_банксвич_PRG
	LDA номер_звука
	JSR _loc_00_8000
	PLA
	JSR _главный_банксвич_PRG
@RTS:
	RTS

_loc_07_C308:
	LDA $BFFF
	PHA
	LDA #$00
	JSR _главный_банксвич_PRG
	JSR _loc_00_8003
	JMP _восстановление_банка_PRG

.export _b07_C317
_b07_C317:
	LDA $BFFF
	PHA
	LDA #$00
	JSR _главный_банксвич_PRG
	JSR _loc_00_AE86
	JMP _восстановление_банка_PRG

_loc_07_C326:
	LDA $BFFF
	PHA
	LDA #$00
	JSR _главный_банксвич_PRG
	JSR _loc_00_AE80
	JMP _восстановление_банка_PRG

.export _b07_C335
_b07_C335:
	LDA $BFFF
	PHA
	LDA #$00
	JSR _главный_банксвич_PRG
	JSR _loc_00_AE83
	JMP _восстановление_банка_PRG

.export _b07_C344_банксвич_80xx
_b07_C344_банксвич_80xx:
; удалить коды, которые точно не используются при существующих прыжках сюда
	ASL
	TAY
	LDA $BFFF
	PHA
	LDA $F6
	PHA
	LDA $F7
	PHA
	LDA table_07_C370_номер_банка_для_переключения,Y
	JSR _главный_банксвич_PRG
	LDA table_07_C370_младший_байт_непрямого_прыжка + 1,Y
	STA $F6
	LDA #$80		; старший байт адреса
	STA $F7
	JSR _loc_07_C36D_непрямой_прыжок
	PLA
	STA $F7
	PLA
	LDA $F6
_восстановление_банка_PRG:		; для кодов, которые не используют таблицу
	PLA
	JMP _главный_банксвич_PRG
_loc_07_C36D_непрямой_прыжок:
	JMP ($00F6)

table_07_C370_номер_банка_для_переключения:
table_07_C370_младший_байт_непрямого_прыжка:
; проверил, существуют прыжки со всеми байтами
.byte $03, < _loc_03_8000		; $00
.byte $04, < _loc_04_8000		; $01
.byte $03, < _loc_03_8003		; $02
.byte $03, < _loc_03_8006		; $03
.byte $01, < _loc_01_8000		; $04
.byte $01, < _loc_01_8003		; $05
.byte $06, < _loc_06_8000		; $06
.byte $06, < _loc_06_8003		; $07
.byte $06, < _loc_06_8006		; $08
.byte $06, < _loc_06_8009		; $09
.byte $06, < _loc_06_800C		; $0A
.byte $06, < _loc_06_800F		; $0B
.byte $04, < _loc_04_8003		; $0C
.byte $04, < _loc_04_8006		; $0D
.byte $02, < _loc_02_8003		; $0E
.byte $04, < _loc_04_8018		; $0F
.byte $02, < _loc_02_8006		; $10
.byte $03, < _loc_03_8012		; $11
.byte $05, < _loc_05_8000		; $12
.byte $03, < _loc_03_8009		; $13
.byte $04, < _loc_04_800C		; $14
.byte $04, < _loc_04_800F		; $15
.byte $03, < _loc_03_800F		; $16
.byte $04, < _loc_04_8015		; $17
.byte $02, < _loc_02_8000		; $18
.byte $05, < _loc_05_8003		; $19
.byte $05, < _loc_05_8006		; $1A
.byte $03, < _loc_03_800C		; $1B
.byte $06, < _loc_06_8012		; $1C
.byte $06, < _loc_06_8015		; $1D
.byte $01, < _loc_01_8006		; $1E
.byte $01, < _loc_01_8009		; $1F		не используется через LDA 1F + JMP сюда, а сам код 8009 выполняется другим способом
.byte $04, < _loc_04_801B		; $20
.byte $04, < _loc_04_801E_проверка_координат_для_возможности_сделать_супер		; $21
.byte $04, < _loc_04_8021		; $22
.byte $04, < _loc_04_8024		; $23
.byte $04, < _loc_04_8012		; $24
.byte $06, < _loc_06_8018_вычисление_скорости_удара		; $25
.byte $06, < _loc_06_801B		; $26
.byte $06, < _loc_06_801E		; $27
.byte $06, < _loc_06_8021		; $28
.byte $01, < _loc_01_800C		; $29
.byte $06, < _loc_06_8024		; $2A
.byte $05, < _loc_05_8009		; $2B
.byte $05, < _loc_05_800C		; $2C
.byte $02, < _loc_02_8009		; $2D
.byte $02, < _loc_02_800C		; $2E
.byte $02, < _loc_02_800F		; $2F
.byte $06, < _loc_06_8027		; $30
.byte $06, < _loc_06_802A		; $31

_обработчик_RESET:
	SEI
	LDA #$08
	STA $2000
	STA байт_для_2000
	LDA #$06
	STA $2001
	STA байт_для_2001
	LDX #$FF
	TXS
	LDA #$07
	STA $0D
	TAX
	LDA #$00
	STA $0C
	TAY
@цикл_очистки_ram:		; с 0100 по 07FF
	STA ($0C),Y
	INY
	BNE @цикл_очистки_ram
	DEC $0D
	DEX
	BNE @цикл_очистки_ram
	LDX #$60
	STX $0D
@цикл_очистки_батарейки:		; с 6000 по 7FFF
	STA ($0C),Y
	INY
	BNE @цикл_очистки_батарейки
	INC $0D
	LDX $0D
	CPX #$80
	BNE @цикл_очистки_батарейки
	STA $4016
	STA $A000
	STA $E000
	LDA #$40
	STA $4017
	LDA #$0F
	STA $4015
	LDA #$80
	STA $A001
@ожидание_vblank_1:
	BIT $2002
	BPL @ожидание_vblank_1
@ожидание_vblank_2:
	BIT $2002
	BPL @ожидание_vblank_2
	LDA #$06
	JSR _главный_банксвич_PRG
	JSR _очистка_ppu_и_спрайтов
	LDA #NMI_ВКЛ_IRQ
	STA флаг_NMI
	LDA #$25
	STA адрес_рандома
	STA адрес_рандома + 1
	JSR _b07_выключить_NMI
	JSR _b07_EF54_отобразить_спрайты_слева_8_пикселей
	LDX #$57
	JSR _b07_обнуление_ZP_с_X_до_F8
	JSR _очистка_ppu_и_спрайтов
	LDA #МУЗЫКА_ВЫКЛЮЧИТЬ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$00
	STA $52
	LDA #NMI_ВКЛ_IRQ
	STA флаг_NMI
	LDA #$8C
	STA байт_для_2000
	STA $2000
	LDA #$18
	STA байт_для_2001
	STA $2001
	LDA #$F0
	STA ограничитель_Y_спрайтов
	LDA #$FF		; СЕТКА_БЕЗ_ИЗМЕНЕНИЙ
	STA байт_2006_hi_атрибуты
	STA байт_2006_hi_графика
	STA байт_2006_hi_палитра
	STA флаг_гола
	STA $054A
	LDA #$42
	STA номер_палитры_фона
	STA номер_палитры_фона + 1
	JSR _b07_D036_изменение_яркости_на_логотипе
	LDA #$22
	STA $0607
	STA $0610
	LDA #$E3
	STA $0608
	STA $060F
	LDA #$F8
	STA $0615		; перезаписывается в _loc_05_B233, на вид бесполезная хуита
	STA $061C		; перезаписывается в _loc_05_B24C, на вид бесполезная хуита
	LDA #$01
	STA номер_экрана
	CLI
_конец_игрового_скрипта:
	LDA задержка_кадра
@бесконечный_цикл_в_ожидании_NMI:
	CMP задержка_кадра
	BEQ @бесконечный_цикл_в_ожидании_NMI
	JMP _начало_игрового_скрипта
_начало_игрового_скрипта:		; игра выполняет код на кадре и возвращается сюда, направление зависит от номера экрана
	LDA #$00
	STA задержка_кадра
	INC задержка_фпс
	LDX задержка_фпс
	CPX #$03
	BNE @пропустить_обнуление
	STA задержка_фпс
	INC счетчик_фпс_кадров
@пропустить_обнуление:
	LDA #$16
	JSR _b07_C344_банксвич_80xx
	LDA подтип_экрана
	STA копия_подтипа_экрана
	INC счетчик_кадров
	LDA #$01
	JSR _b07_C344_банксвич_80xx
	JSR _b07_вращение_колеса_фортуны
	JSR _loc_07_EDCD_чтение_регистров_джойстиков
	LDA номер_экрана
	ASL
	TAY
	LDA table_07_C4A3,Y
	STA $2C
	LDA table_07_C4A3 + 1,Y
	STA $2D
	JSR @непрямой_прыжок
	JMP _конец_игрового_скрипта
@непрямой_прыжок:
	JMP ($002C)

table_07_C4A3:
.word _loc_07_C506
.word _loc_07_C25D_банксвич_18
.word _loc_07_C2DA
.word _loc_07_C26C_банксвич_2F

_ручной_пропуск_демо_или_уменьшение_таймера:
	LDY #$08
	LDA одноразовые_кнопки
	AND #(КНОПКА_СЕЛЕКТ + КНОПКА_СТАРТ)
	BNE @кнопка_нажата
	LDY #$05
	DEC таймер_демо_lo
	BNE @RTS
	DEC таймер_демо_hi
	BNE @RTS
@кнопка_нажата:
	STY $2B
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	LDA $2B
	STA подтип_экрана
	LDA #NMI_ВЫКЛ_IRQ
	STA флаг_NMI
	LDA #$01
	STA номер_экрана
	PLA
	PLA
@RTS:
	RTS

_loc_07_C506:
	LDA флаг_демо
	BPL @сейчас_не_демо
	JSR _ручной_пропуск_демо_или_уменьшение_таймера
@сейчас_не_демо:
	LDA подтип_экрана
	ASL
	TAY
	LDA table_07_C51F,Y
	STA $2C
	LDA table_07_C51F + 1,Y
	STA $2D
	JMP ($002C)

table_07_C51F:
.word table_07_C51F_C539_передИгройНаПоле
.word table_07_C51F_C57D_разводка
.word table_07_C51F_C615_играНаПоле
.word table_07_C51F_C699_гол
.word table_07_C51F_C71E
.word table_07_C51F_C77D
.word table_07_C51F_C7D0_мячВнеИгры
.word table_07_C51F_C743
.word table_07_C51F_C77D
.word table_07_C51F_C75D
.word table_07_C51F_C777
.word table_07_C51F_C743
.word table_07_C51F_C77D

table_07_C51F_C539_передИгройНаПоле:
	LDA #NMI_ВКЛ_IRQ
	STA флаг_NMI
	JSR _loc_07_EF5A_скрыть_спрайты_и_фон_слева_8_пикселей
	JSR _loc_07_CF93
	JSR _loc_07_DE0B_смена_банка_поля_при_скроллинге
	LDA #$02
	STA скорость_яркости
	LDA #$00
	STA флаг_яркости
	STA счетчик_яркости
	STA таймер_яркости
	STA таймер_катсцены
	STA счетчик_следов
	LDA #$FF
	STA приказ_боту
	STA приказ_боту + 1
	STA $067A
	STA $067B
	STA $0684
	STA $0685
	JSR _loc_06_BD6A
	JSR _loc_06_BECC
	JSR _loc_07_C29E_банксвич_14
bra_07_C57A:
	RTS

table_07_C51F_C57D_разводка:
	JSR _loc_07_C271_банксвич_00
	JSR _loc_06_BD6A
	JSR _loc_06_BECC
	JSR _loc_07_F3A5
	JSR _loc_07_C29E_банксвич_14
	JSR _b07_D073
	LDA флаг_яркости
	BPL bra_07_C57A
	LDA $05FA
	BPL bra_07_C5B0
	LDA вид_статусбара
	CMP #СТАТУСБАР_GAME_SET
	BEQ bra_07_C5B0
	CMP #СТАТУСБАР_PK
	BEQ bra_07_C5B0
	CMP #СТАТУСБАР_МИНИКАРТА
	BEQ bra_07_C5B0
	LDA #$00
	STA $05FA
	STA задержка_переливания_надписи
bra_07_C5B0:
	JSR _loc_07_C2AD_банксвич_17
	LDA режим_игры_на_поле
	AND #$20
	BEQ bra_07_C5C4
	JSR _loc_07_C87B
	LDA режим_игры_на_поле
	AND #$20
	BEQ bra_07_C5C9
	BNE bra_07_C612
bra_07_C5C4:
	BIT состояние_мяча
	BVS bra_07_C612
bra_07_C5C9:
	INC подтип_экрана
	LDA #$29
	STA номер_палитры_фона + 1
	JSR _b07_яркость_палитры_и_запись_в_буфер
	LDA #$3F
	STA байт_2006_hi_палитра
	LDA #$FF
	STA $05FA
	LDA #СТАТУСБАР_МИНИКАРТА
	STA вид_статусбара
	LDA #$00		; ПОЛЕ_НОРМАЛЬНАЯ_ИГРА
	STA режим_игры_на_поле
	STA флаг_владения_мячом_команды
	STA флаг_владения_мячом_команды + 1
	STA $05F9
	STA бит_для_2000_палитра
	LDX #$00
	LDA #$0F
@цикл:
	STA буфер_атрибутов,X
	STA буфер_графики,X
	INX
	CPX #$20
	BCC @цикл
	LDX #$06
	LDA #$FA
bra_07_C607:
	STA буфер_атрибутов,X
	STA буфер_графики,X
	INX
	CPX #$0B
	BCC bra_07_C607
bra_07_C612:
	RTS

table_07_C51F_C615_играНаПоле:
	LDA одноразовые_кнопки
	AND #КНОПКА_СТАРТ
	BEQ _loc_07_C63A_проверка_на_паузу
	LDA режим_игры_на_поле
	EOR #ПОЛЕ_ПАУЗА
	STA режим_игры_на_поле
	BMI @сейчас_пауза
	LDA номер_музыки
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JMP _loc_07_C63A_проверка_на_паузу
@сейчас_пауза:
	LDA #$00		; МУЗЫКА_ВЫКЛЮЧИТЬ
	STA $06FD
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #ЗВУК_НАРУШЕНИЕ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
_loc_07_C63A_проверка_на_паузу:
	LDA режим_игры_на_поле
	BPL bra_07_C66B_сейчас_не_пауза		; проверка на ПОЛЕ_ПАУЗА
	JSR _loc_07_DE47
	JSR _loc_07_CAEE
	JMP _loc_07_CB5F
_loc_07_C647_вычислить_счет_в_статусбаре_на_паузе:
	LDA счетчик_кадров
	AND #$01
	BNE @сейчас_нечетный_кадр
	JMP _loc_07_CB07_посчитать_тайлы_счета
@сейчас_нечетный_кадр:		; затирание счета
	LDA #$0F
	STA тайл_статусбара
	STA тайл_статусбара + 1
	STA тайл_статусбара + 2
	STA тайл_статусбара + 3
	STA тайл_статусбара + 4
	STA тайл_статусбара + 5
	RTS
bra_07_C66B_сейчас_не_пауза:
	JSR _loc_07_0001_переключение_игроков_на_селект
	JSR _loc_07_DE0B_смена_банка_поля_при_скроллинге
	JSR _loc_07_D6E7_уменьшение_игрового_времени_и_loss
	JSR _loc_07_DE47
	JSR _loc_07_CAEE
	JSR _loc_07_C24E_банксвич_1E
	JSR _loc_07_C2AD_банксвич_17
	JSR _loc_07_C271_банксвич_00
	JSR _loc_06_BD6A
	JSR _loc_07_C2A3_банксвич_15
	JSR _loc_07_C285_банксвич_1B
	JSR _loc_07_C89C
	JSR _loc_06_BECC
	JSR _loc_07_C29E_банксвич_14
	JSR _loc_07_C299_банксвич_11
	JMP _b07_D073

table_07_C51F_C699_гол:
	LDA флаг_обновления_тайлов_экрана
	AND #$CF
	STA флаг_обновления_тайлов_экрана
	JSR _loc_07_DE0B_смена_банка_поля_при_скроллинге
	JSR _loc_07_DE47
	JSR _loc_07_CAEE
	JSR _loc_07_C2AD_банксвич_17
	JSR _loc_07_C24E_банксвич_1E
	JSR _loc_07_C271_банксвич_00
	JSR _loc_06_BD6A
	JSR _loc_07_C2A3_банксвич_15
	JSR _loc_07_C285_банксвич_1B
	JSR _loc_07_F3A5
	JSR _loc_07_C29E_банксвич_14
	JSR _loc_07_C299_банксвич_11
	LDA таймер_катсцены
	CMP #$20
	BCC bra_07_C6DC
	LDA режим_игры_на_поле
	AND #$02
	BEQ bra_07_C6DC
	LDA игрок_с_мячом
	AND #$0F
	ORA #$40
	STA объект_камеры
bra_07_C6DC:
	LDA таймер_катсцены
	CMP #$40
	BCS bra_07_C6F0
	LDA одноразовые_кнопки
	AND #(КНОПКА_СЕЛЕКТ + КНОПКА_СТАРТ)
	BNE bra_07_C6F4
	INC таймер_катсцены
	JMP _loc_07_C706
bra_07_C6F0:
	CMP #$FF
	BEQ bra_07_C706
bra_07_C6F4:
	JSR _b07_поставить_флаг_уменьшения_яркости
	LDA #МУЗЫКА_ВЫКЛЮЧИТЬ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$FF
	STA таймер_катсцены
	LDA #ПОГОДА_НЕТ
	STA номер_погодного_эффекта
_loc_07_C706:
bra_07_C706:
	JSR _b07_D073
	BIT флаг_яркости
	BPL bra_07_C71B
	BVC bra_07_C71B
	JSR _loc_07_C91A
	LDA #ПОЛЕ_НОРМАЛЬНАЯ_ИГРА
	STA режим_игры_на_поле
	STA таймер_катсцены
bra_07_C71B:
	RTS

table_07_C51F_C71E:
	JSR _loc_07_C2D5_банксвич_10
	JSR _loc_07_CA1F
	JSR _loc_07_CA58
	JSR _loc_07_C249_банксвич_05
	JSR _b07_включить_рендеринг
	JSR _b07_включить_NMI
	LDA #МУЗЫКА_ЗРИТЕЛИ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
_loc_07_C735:
	LDA #$00
	STA таймер_катсцены
	JSR _b07_поставить_флаг_увеличения_яркости
	INC подтип_экрана
	SEI
	RTS

table_07_C51F_C743:
	JSR _loc_07_C2D5_банксвич_10
	JSR _loc_07_CA1F
	JSR _loc_07_CA58
	JSR _loc_07_C249_банксвич_05
	JSR _b07_включить_рендеринг
	JSR _b07_включить_NMI
	LDA #МУЗЫКА_ЭКРАН_ТАБЛО
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JMP _loc_07_C735

table_07_C51F_C75D:
	JSR _loc_07_C262_банксвич_2D
	JSR _loc_07_CA1F
	JSR _loc_07_CA58
	JSR _loc_07_C249_банксвич_05
	JSR _b07_включить_рендеринг
	JSR _b07_включить_NMI
	LDA #МУЗЫКА_ЭКРАН_ТАБЛО
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JMP _loc_07_C735

table_07_C51F_C777:
	JSR _loc_07_C267_банксвич_2E
	JMP _loc_07_C786

table_07_C51F_C77D:
	JSR _loc_07_CAEE
	JSR _loc_06_BE42
	JSR _loc_07_C285_банксвич_1B
_loc_07_C786:
	JSR _loc_07_C29E_банксвич_14
	JSR _b07_D073
	LDA флаг_яркости
	BPL bra_07_C7CD
	ASL
	BPL bra_07_C79A
	JMP _loc_07_C91A
bra_07_C79A:
	LDA таймер_катсцены
	BNE bra_07_C7A5
	LDA байт_2006_lo_след
	STA байт_2006_hi_след
bra_07_C7A5:
	INC таймер_катсцены
	LDA одноразовые_кнопки
	AND #(КНОПКА_СЕЛЕКТ + КНОПКА_СТАРТ)
	BNE bra_07_C7C2
	LDA подтип_экрана
	CMP #$05
	BEQ bra_07_C7BB
	BIT одноразовые_кнопки
	BMI bra_07_C7C2
	BVS bra_07_C7C2
bra_07_C7BB:
	LDA таймер_катсцены
	CMP #$F0
	BCC bra_07_C7CD
bra_07_C7C2:
	JSR _b07_поставить_флаг_уменьшения_яркости
	LDA #$00	; МУЗЫКА_ВЫКЛЮЧИТЬ
	STA байт_2006_hi_след
	JSR _b07_C2E4_записать_и_воспроизвести_звук
bra_07_C7CD:
	RTS

table_07_C51F_C7D0_мячВнеИгры:
	JSR _loc_07_0003_корректировка_байтов_управляемых_когда_мяч_внеИгры
	JSR _loc_07_DE0B_смена_банка_поля_при_скроллинге
	JSR _loc_07_DE47
	JSR _loc_07_CAEE
	JSR _loc_07_C2AD_банксвич_17
	JSR _loc_07_C24E_банксвич_1E
	JSR _loc_07_C271_банксвич_00
	JSR _loc_07_D6E7_уменьшение_игрового_времени_и_loss
	JSR _loc_06_BD6A
	JSR _loc_07_C2A3_банксвич_15
	JSR _loc_07_C80B
	JSR _loc_07_C285_банксвич_1B
	JSR _loc_06_BECC
	JSR _loc_07_C29E_банксвич_14
	LDA режим_игры_на_поле
	BNE bra_07_C808
	LDA #$02
	STA подтип_экрана
	LDA объект_камеры
	AND #$7F
	STA объект_камеры
bra_07_C808:
	RTS

_loc_07_C80B:
	LDY игрок_с_мячом
	LDA флаг_видимости_мяча
	BNE bra_07_C81F
	STA скорость_X_hi_мяча
	STA скорость_X_lo_мяча
	STA скорость_Y_hi_мяча
	STA скорость_Y_lo_мяча
bra_07_C81F:
	LDA режим_игры_на_поле
	AND #$04
	BEQ bra_07_C830
	LDA объект_камеры
	AND #$7F
	STA объект_камеры
	RTS
bra_07_C830:
	LDA копия_камеры_X_hi
	CMP #$00
	BEQ bra_07_C83C
	BCC bra_07_C844
	BCS bra_07_C849
bra_07_C83C:
	LDA копия_камеры_X_lo
	CMP #$80
	BCS bra_07_C849
bra_07_C844:
	LDY #$00
	JMP _loc_07_C85F
bra_07_C849:
	LDA копия_камеры_X_hi
	CMP #$02
	BEQ bra_07_C855
	BCS bra_07_C85D
	BCC bra_07_C872
bra_07_C855:
	LDA копия_камеры_X_lo
	CMP #$80
	BCC bra_07_C872
bra_07_C85D:
	LDY #$02
_loc_07_C85F:
	CLC
	LDA копия_камеры_X_lo
	ADC table_07_C877,Y
	STA копия_камеры_X_lo
	LDA копия_камеры_X_hi
	ADC table_07_C877 + 1,Y
	STA копия_камеры_X_hi
bra_07_C872:
	RTS

table_07_C877:
.byte $08,$00
.byte $F8,$FF

_loc_07_C87B:
	LDA режим_игры_на_поле
	AND #$20
	BEQ bra_07_C89B
	LDA состояние_мяча
	AND #$C0
	BNE bra_07_C88D
	INC таймер_катсцены
	BPL bra_07_C89B
bra_07_C88D:
	LDA режим_игры_на_поле
	AND #ПОЛЕ_НАРУШЕНИЕ ^ $FF
	STA режим_игры_на_поле
	LDA #$00
	STA вариант_расстановки_игроков
	STA таймер_катсцены
bra_07_C89B:
	RTS

_loc_07_C89C:
	BIT режим_игры_на_поле
	BVC bra_07_C919
	LDA режим_игры_на_поле
	AND #ПОЛЕ_НАРУШЕНИЕ
	BNE bra_07_C8F5___сейчас_нарушение
	LDA режим_игры_на_поле
	AND #$0F
	BEQ bra_07_C8C8
	AND #ПОЛЕ_ГОЛ - $40
	BNE bra_07_C8F9___сейчас_гол
	LDA опция_режим_сложность
	AND #РЕЖИМ_ПК_ИЗ_МЕНЮ
	BEQ bra_07_C8BD
	LDA #$03
	STA подтип_экрана
	RTS
bra_07_C8BD:
	LDA #$06
	STA подтип_экрана
	LDA #$29
	JMP _b07_C344_банксвич_80xx
bra_07_C8C8:
	LDA #$8C
	STA объект_камеры
	LDY #$00
	STY $1C
	STY флаг_владения_мячом_команды
	STY флаг_владения_мячом_команды + 1
	LDA счет_команды + 1
	CMP счет_команды
	BNE @пропустить_1		; прыжок если это не ничья
	INC $1C
@пропустить_1:
	BCC @пропустить_2		; прыжок если команда слева победила
	INY
@пропустить_2:
	LDA #$01
	STA флаг_владения_мячом_команды,Y
	LDA номер_тайма
	BEQ bra_07_C910
	CLC
	LDA #СТАТУСБАР_GAME_SET + $80	; или СТАТУСБАР_PK после сложения
	ADC $1C
	BNE bra_07_C8FB___запись_вида
bra_07_C8F5___сейчас_нарушение:
	LDA #СТАТУСБАР_PENALTY + $80
	BNE bra_07_C8FB___запись_вида
bra_07_C8F9___сейчас_гол:
	LDA #СТАТУСБАР_GOAL + $80
bra_07_C8FB___запись_вида:
	STA вид_статусбара
	LDA #$00
	STA $05F9
	LDA #$0F
	STA номер_палитры_фона + 1
	JSR _b07_яркость_палитры_и_запись_в_буфер
	LDA #$3F
	STA байт_2006_hi_палитра
bra_07_C910:
	LDA #$03
	STA подтип_экрана
	LDA #$00
	STA таймер_катсцены
bra_07_C919:
	RTS

_loc_07_C91A:
	LDA #$00		; СТАТУСБАР_KICK_OFF
	STA вид_статусбара
	STA сила_ветра
	STA скорость_X_hi_ветер
	STA скорость_X_lo_ветер
	STA скорость_Y_hi_ветер
	STA скорость_Y_lo_ветер
	LDA #$FF		; СЕТКА_БЕЗ_ИЗМЕНЕНИЙ
	STA флаг_гола
	STA $05FA
	LDA подтип_экрана
	CMP #$03
	BEQ bra_07_C952
	CMP #$05
	BEQ bra_07_C998
	CMP #$08
	BEQ bra_07_C99F
	CMP #$0A
	BEQ bra_07_C9AD
	CMP #$0C
	BNE bra_07_C94F
	JMP _loc_07_CA14
bra_07_C94F:
	RTS
bra_07_C952:
	LDA опция_режим_сложность
	AND #РЕЖИМ_ПК_ИЗ_МЕНЮ
	BEQ bra_07_C968
	INC счетчик_смен
	LDA режим_игры_на_поле
	AND #$02
	BNE bra_07_C97B
	LDA #$00
	STA подтип_экрана
	RTS
bra_07_C968:
	LDA режим_игры_на_поле
	AND #$20
	BEQ bra_07_C975
	LDA #$00
bra_07_C970:
	STA подтип_экрана
	RTS
bra_07_C975:
	LDA режим_игры_на_поле
	AND #$0F
	BEQ bra_07_C97F
bra_07_C97B:
	LDA #$04
	BNE bra_07_C970
bra_07_C97F:
	LDA номер_тайма
	BNE bra_07_C988
	LDA #$07
	BNE bra_07_C970
bra_07_C988:
	LDA счет_команды
	CMP счет_команды + 1
	BEQ bra_07_C994
	LDA #$09
	BNE bra_07_C970
bra_07_C994:
	LDA #$0B
	BNE bra_07_C970
bra_07_C998:
	LDA #$00
	STA подтип_экрана
	RTS
bra_07_C99F:
	LDA #$02
	STA номер_экрана
	LDA #$04
	STA подтип_экрана
	INC номер_тайма
	JMP _loc_07_C9FA
bra_07_C9AD:
	LDA опция_режим_сложность
	BMI bra_07_C9BC		; проверка на РЕЖИМ_ПРОХОЖДЕНИЕ
	LDA #$02
	STA номер_экрана
	LDA #$01
	STA подтип_экрана
	RTS
bra_07_C9BC:
	LDA $054A
	BMI bra_07_C9EE
	CMP #$03
	BNE bra_07_C9D4
	LDA флаг_владения_мячом_команды
	AND #$01
	BNE bra_07_C9D0
	LDA #$01
	BNE bra_07_C9DD
bra_07_C9D0:
	LDA #$00
	BEQ bra_07_C9DD
bra_07_C9D4:
	LDA флаг_владения_мячом_команды
	AND #$01
	BNE bra_07_C9EB
	LDA #$02
bra_07_C9DD:
	STA $061F
	LDA #$03
	STA номер_экрана
	LDA #$00
	STA подтип_экрана
	RTS
bra_07_C9EB:
	INC $054A
bra_07_C9EE:
	LDA #$02
	STA номер_экрана
	LDA #$0E
	STA подтип_экрана
	LDA #$03
	STA байт_для_подтипа_экрана
_loc_07_C9FA:
	LDA опция_режим_сложность
	BPL bra_07_CA1E		; проверка на РЕЖИМ_ПРОХОЖДЕНИЕ
	LDX #$00
bra_07_CA00:
	LDY номер_игрока,X
	LDA позиция_управление,X
	AND #$0F
	STA $05D5,Y
	INX
	INX
	CPX #$0C
	BCC bra_07_CA00
	RTS
_loc_07_CA14:
	LDA опция_режим_сложность
	ORA #РЕЖИМ_ПК_ИЗ_МЕНЮ
	STA опция_режим_сложность
	LDA #$00
	STA подтип_экрана
bra_07_CA1E:
	RTS

_loc_07_CA1F:
	LDA #$F0
	STA ограничитель_Y_спрайтов
	LDA #$64
	STA банк_фона
	LDA #$66
	STA банк_фона + 1
	LDA #$00
	STA $A000
	STA камера_X_lo
	STA камера_Y_lo
	STA камера_Y_hi
	STA копия_камеры_X_lo
	STA копия_камеры_Y_lo
	STA копия_камеры_Y_hi
	LDA #$01
	STA камера_X_hi
	STA копия_камеры_X_hi
	JSR _b07_ECA9
	JSR _b07_выключить_NMI
	JMP _b07_выключить_рендеринг

_loc_07_CA58:
	LDA счет_команды
	AND #$F0
	STA $1C
	LDA счет_команды + 1
	AND #$F0
	CMP $1C
	BNE bra_07_CA75
	LDA счет_команды
	STA $1C
	LDA счет_команды + 1
	STA $1D
	JMP _loc_07_CA94
bra_07_CA75:
	BCS bra_07_CA87
	LDA счет_команды + 1
	CLC
	ADC #$04
	STA $1D
	LDA счет_команды
	STA $1C
	JMP _loc_07_CA94
bra_07_CA87:
	LDA счет_команды
	CLC
	ADC #$04
	STA $1C
	LDA счет_команды + 1
	STA $1D
_loc_07_CA94:
	LDA опция_режим_сложность
	BPL bra_07_CAC0		; проверка на РЕЖИМ_ПРОХОЖДЕНИЕ
	LDA флаг_владения_мячом_команды
	AND #$01
	BEQ bra_07_CAB4
	LDA $1C
	SEC
	SBC $1D
	BMI bra_07_CADE
_loc_07_CAA7:
	BEQ bra_07_CADE
	CMP #$01
	BEQ bra_07_CAD9
	CMP #$02
	BEQ bra_07_CAD4
	JMP _loc_07_CACF
bra_07_CAB4:
	LDA $1C
	SEC
	SBC $1D
	BMI bra_07_CAE8
	BEQ bra_07_CAE3
	JMP _loc_07_CADE
bra_07_CAC0:
	LDA $1C
	SEC
	SBC $1D
	BPL bra_07_CACC
	EOR #$FF
	CLC
	ADC #$01
bra_07_CACC:
	JMP _loc_07_CAA7
_loc_07_CACF:
	LDA #$80
	BNE _loc_07_CAEA_запись_в_0630
bra_07_CAD4:
	LDA #$81
	BNE _loc_07_CAEA_запись_в_0630
bra_07_CAD9:
	LDA #$01
	BNE _loc_07_CAEA_запись_в_0630
_loc_07_CADE:
bra_07_CADE:
	LDA #$00
	BEQ _loc_07_CAEA_запись_в_0630
bra_07_CAE3:
	LDA #$02
	BNE _loc_07_CAEA_запись_в_0630
bra_07_CAE8:
	LDA #$82
_loc_07_CAEA_запись_в_0630:
	STA $0630
	RTS

_loc_07_CAEE:
	LDA копия_камеры_X_lo
	STA камера_X_lo
	LDA копия_камеры_X_hi
	STA камера_X_hi
	LDA копия_камеры_Y_lo
	STA камера_Y_lo
	LDA копия_камеры_Y_hi
	STA камера_Y_hi
	RTS

_loc_07_CB07_посчитать_тайлы_счета:
	LDA счет_команды
	LSR
	LSR
	LSR
	LSR
	BEQ @счет_меньше_16_1
	CLC
	ADC #$80
	BNE @перепрыгнуть
@счет_меньше_16_1:
	LDA #$FF
@перепрыгнуть:
	STA тайл_статусбара + 5
	LDA счет_команды
	AND #$0F
	CLC
	ADC #$80
	STA тайл_статусбара + 4
	LDA #$EE
	STA тайл_статусбара + 3
	LDA #$EF
	STA тайл_статусбара + 2
	LDA счет_команды + 1
	AND #$F0
	BEQ @счет_меньше_16_2
	LSR
	LSR
	LSR
	LSR
	CLC
	ADC #$80
	STA тайл_статусбара + 1
	JSR _loc_07_CB56
	STA тайл_статусбара
	RTS
@счет_меньше_16_2:
	JSR _loc_07_CB56
	STA тайл_статусбара + 1
	LDA #$FF
	STA тайл_статусбара
	RTS

_loc_07_CB56:
	LDA счет_команды + 1
	AND #$0F
	CLC
	ADC #$80
	RTS

_loc_07_CB5F:
	LDA опция_режим_сложность
	BPL bra_07_CB8F		; проверка на РЕЖИМ_ПРОХОЖДЕНИЕ
	LDY $06FD
	CPY #$0F
	BEQ bra_07_CB92
	LDA одноразовые_кнопки
	CMP table_07_CBC7,Y
	BNE bra_07_CB85
	INC $06FD
	LDA $06FD
	CMP #$0F
	BNE bra_07_CB82
	LDA #ЗВУК_ГВИНЕЙСКАЯ_КРУТИЛКА
	JSR _b07_C2E4_записать_и_воспроизвести_звук
bra_07_CB82:
	JMP _loc_07_C647_вычислить_счет_в_статусбаре_на_паузе
bra_07_CB85:
	LDA одноразовые_кнопки
	BEQ bra_07_CB8F
	LDA #$00
	STA $06FD
bra_07_CB8F:
	JMP _loc_07_C647_вычислить_счет_в_статусбаре_на_паузе
bra_07_CB92:
	LDA #$BC
	STA тайл_статусбара + 5
	LDA #$D0
	STA тайл_статусбара + 4
	LDA #$AC
	STA тайл_статусбара + 3
	LDA #$B3
	STA тайл_статусбара + 2
	LDA #$80
	STA тайл_статусбара + 1
	LDA #$9F
	STA тайл_статусбара
	LDA #$FF
	STA номер_скилла
	STA номер_скилла + 2
	STA номер_скилла + 4
	STA номер_скилла + 6
	STA номер_скилла + 8
	STA номер_скилла + $0A
	RTS

table_07_CBC7:
.byte КНОПКА_А
.byte КНОПКА_А
.byte КНОПКА_А
.byte КНОПКА_Б
.byte КНОПКА_А
.byte КНОПКА_А
.byte КНОПКА_А
.byte КНОПКА_Б
.byte КНОПКА_А
.byte КНОПКА_А
.byte КНОПКА_А
.byte КНОПКА_А
.byte КНОПКА_А
.byte КНОПКА_А
.byte КНОПКА_А

.export _b07_CBD6_отображение_циферок_на_экране
_b07_CBD6_отображение_циферок_на_экране:
	LDA номер_циферки - 14,X
	ASL
	TAY
	LDA table_07_CBE8,Y
	STA $2C
	LDA table_07_CBE8 + 1,Y
	STA $2D
	JMP ($002C)

table_07_CBE8:
.word _общий_RTS
.word table_07_CBE8_CBF5
.word table_07_CBE8_CC0B
.word table_07_CBE8_CC0B
.word table_07_CBE8_CC0B
.word table_07_CBE8_CC0B

table_07_CBE8_CBF5:
	LDA номер_циферки - 14,X
	BMI bra_07_CBFF
	ORA #$80		; запись +80, так как на разводке записано 01
					; только пока что не понятно почему бы заранее +80 не написать. аналогично с циферками
	STA номер_циферки - 14,X
bra_07_CBFF:
	LDA #$84
	STA номер_анимации_циферки - 14,X
	LDY #$0C
	STY $44
	JMP _CC9C_вывести_циферку_на_миникарту

table_07_CBE8_CC0B:
	LDA номер_циферки - 14,X
	BMI bra_07_CC15
	ORA #$80
	STA номер_циферки - 14,X
bra_07_CC15:
	LDA номер_циферки - 14,X
	AND #$7F
	TAY
	LDA table_07_CD23,Y
	STA номер_анимации_циферки - 14,X
	LDA table_07_CD29,Y
	BPL bra_07_CC48
	AND #$7F
	TAY
	LDA номер_управляемого,Y
	BMI @скрыть_циферку
	STA $44
	TAY
	LDA позиция_управление,Y		; проверка на бота
	BMI @скрыть_циферку
	LDA опция_режим_сложность
	AND #РЕЖИМ_ПК_ИЗ_МЕНЮ
	BEQ bra_07_CC4A
	LDA флаг_видимости,Y
	BNE bra_07_CC4A
@скрыть_циферку:
	LDA #$7F
	STA номер_анимации_циферки - 14,X		; предположительно тут можно выходить из кода, а он специально продолжает как будто это циферка 1
	LDA #$00
bra_07_CC48:
	STA $44
bra_07_CC4A:
	LDY $44
	LDA координата_X_lo,Y
	STA координата_X_lo_циферки - 14,X
	SBC копия_камеры_X_lo
	STA $1C
	LDA координата_X_hi,Y
	STA координата_X_hi_циферки - 14,X
	SBC копия_камеры_X_hi
	BNE _CC9C_вывести_циферку_на_миникарту
	LDA $1C
	CMP #$08
	BCC _CC9C_вывести_циферку_на_миникарту
	LDA координата_Y_lo,Y
	STA координата_Y_lo_циферки - 14,X
	SBC копия_камеры_Y_lo
	STA $1C
	LDA координата_Y_hi,Y
	STA координата_Y_hi_циферки - 14,X
	SBC копия_камеры_Y_hi
	BNE _CC9C_вывести_циферку_на_миникарту
	LDA $1C
	CMP #$18
	BCC _CC9C_вывести_циферку_на_миникарту
	CMP #$E0
	BCS _CC9C_вывести_циферку_на_миникарту
	CLC		; вывести циферку над головой у игрока
	LDA координата_Z_lo,Y
	ADC #$20
	STA координата_Z_lo_циферки - 14,X
	LDA координата_Z_hi,Y
	ADC #$00
	STA координата_Z_hi_циферки - 14,X
	RTS
_CC9C_вывести_циферку_на_миникарту:
	LDA подтип_экрана
	CMP #ЭКРАН_SUB_РАЗВОДКА
	BNE @не_скрывать_циферку
	LDA #$7F
	STA номер_анимации,X
	RTS
@не_скрывать_циферку:
	LDA координата_X_lo,Y
	STA $2C
	LDA координата_X_hi,Y
	STA $2D
	LDA координата_Y_lo,Y
	STA $2E
	LDA координата_Y_hi,Y
	STA $2F
	LDY #$00
@цикл:
	LSR $2D
	ROR $2C
	LSR $2F
	ROR $2E
	INY
	CPY #$04
	BCC @цикл
	CLC
	LDA копия_камеры_X_lo
	ADC #$60
	STA координата_X_lo_циферки - 14,X
	LDA копия_камеры_X_hi
	ADC #$00
	STA координата_X_hi_циферки - 14,X
	CLC
	LDA координата_X_lo_циферки - 14,X
	ADC $2C
	STA координата_X_lo_циферки - 14,X
	LDA координата_X_hi_циферки - 14,X
	ADC $2D
	STA координата_X_hi_циферки - 14,X
	CLC
	LDA копия_камеры_Y_lo
	ADC #$CD
	STA координата_Y_lo_циферки - 14,X
	LDA копия_камеры_Y_hi
	ADC #$00
	STA координата_Y_hi_циферки - 14,X
	CLC
	LDA координата_Y_lo_циферки - 14,X
	ADC $2E
	STA координата_Y_lo_циферки - 14,X
	LDA координата_Y_hi_циферки - 14,X
	ADC $2F
	STA координата_Y_hi_циферки - 14,X
	LDA #$00
	STA координата_Z_lo_циферки - 14,X
	STA координата_Z_hi_циферки - 14,X
	RTS

table_07_CD23:
.byte $00,$84,$80,$81,$82,$83

table_07_CD29:
.byte $00,$0C,$80,$81,$82,$83

.export _b07_CD2F
_b07_CD2F:
	LDA координата_Z_hi,X
	BMI bra_07_CD37
	RTS
bra_07_CD37:
	LDA игрок_на_поверхности,X
	BNE bra_07_CD3F
	JSR _b07_E6F0
bra_07_CD3F:
	LDA игрок_на_поверхности,X
	BEQ bra_07_CD4A
	CMP #$02
	BCS bra_07_CD66
	BCC bra_07_CD58
bra_07_CD4A:
	LDA #$00
	STA гравитация_hi,X
	STA гравитация_lo,X
	STA скорость_Z_hi,X
	STA скорость_Z_lo,X
bra_07_CD58:
	LDA #$00
	STA координата_Z_hi,X
	STA координата_Z_lo,X
	STA координата_Z_sub,X
	RTS
bra_07_CD66:
	LDY игрок_на_поверхности,X
	DEY
	DEY
	LDA координата_Z_lo,X
	CMP table_07_CDC7,Y
	BCS bra_07_CD79
	LDA table_07_CDC9,Y
	STA координата_Z_lo,X
bra_07_CD79:
	LDA игрок_на_поверхности,X
	CMP #$02
	BNE bra_07_CDC6
	LDA скорость_X_hi,X
	ORA скорость_X_lo,X
	ORA скорость_Y_hi,X
	ORA скорость_Y_lo,X
	BEQ bra_07_CDC6
	JSR _b07_E6F0
	LDA игрок_на_поверхности,X
	CMP #$02
	BEQ bra_07_CDC6
	LDA #$02
	STA игрок_на_поверхности,X
	LDA $0513
	STA координата_X_lo,X
	LDA $0514
	STA координата_X_hi,X
	LDA $0515
	STA координата_Y_lo,X
	LDA $0516
	STA координата_Y_hi,X
	CLC
	LDA координата_Z_lo,X
	ADC #$02
	STA координата_Z_lo,X
	LDA координата_Z_hi,X
	ADC #$00
	STA координата_Z_hi,X
bra_07_CDC6:
	RTS

table_07_CDC7:
.byte $E8,$F8

table_07_CDC9:
.byte $EE,$FA

.export _b07_CDCB
_b07_CDCB:
	LDA координата_Z_hi,X
	BMI bra_07_CDE2
	ORA координата_Z_lo,X
	BEQ bra_07_CDE2
	LDA #$80
	STA гравитация_lo,X
	LDA #$00
	STA гравитация_hi,X
	RTS
bra_07_CDE2:
	LDA игрок_на_поверхности,X
	CMP #$02
	BCS bra_07_CDF7
	LDA #$00
	STA координата_Z_sub,X
	STA координата_Z_lo,X
	STA координата_Z_hi,X
	RTS
bra_07_CDF7:
	LDA номер_движения,X
	ASL
	TAY
	LDA игрок_на_поверхности,X
	AND #$01
	BEQ bra_07_CE04
	INY
bra_07_CE04:
	BIT режим_игры_на_поле
	BVC bra_07_CE0D
	LDY #$0C
	JMP _loc_07_CE14
bra_07_CE0D:
	LDA table_07_CE40,Y
	BMI bra_07_CE27
	ASL
	TAY
_loc_07_CE14:
	LDA table_07_CE30,Y
	STA скорость_Z_lo,X
	LDA table_07_CE30 + 1,Y
	STA скорость_Z_hi,X
	BMI bra_07_CE2F
	LDA координата_Z_hi,X
	BMI bra_07_CE2F
bra_07_CE27:
	LDA #$00
	STA скорость_Z_lo,X
	STA скорость_Z_hi,X
bra_07_CE2F:
	RTS

table_07_CE30:
.byte $E0,$FF
.byte $C0,$FF
.byte $80,$FF
.byte $40,$FF
.byte $20,$00
.byte $40,$00
.byte $80,$00
.byte $00,$01

table_07_CE40:
.byte $FF,$FF,$01,$FF,$00,$FF,$04,$FF,$06,$FF,$06,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$05,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$04,$FF,$FF,$FF,$FF,$05,$05,$FF,$04,$FF,$FF,$FF,$FF,$03,$FF,$FF,$FF,$00,$FF,$07,$07,$07,$07,$07,$07,$04,$FF,$FF,$FF,$FF,$FF,$07,$FF,$07,$FF,$FF,$FF

.export _b07_CEBD
_b07_CEBD:		; кадры анимации игрока исходя из его позы
	ASL
	TAY
	LDA ($30),Y
	STA $2C
	STA $2E
	INY
	LDA ($30),Y
	STA $2D
	STA $2F
	LDY #$00
	LDA ($2E),Y
	CMP #$FD
	BNE bra_07_CEE5
	LDA подтип_анимации,X
	ASL
	TAY
	INY
	LDA ($2E),Y
	STA $2C
	INY
	LDA ($2E),Y
	STA $2D
	STA $2D
_loc_07_CEE5:
bra_07_CEE5:
	LDA номер_кадра_анимации,X
	ASL
	TAY
	LDA ($2C),Y
	BEQ bra_07_CF1F
	CMP #$FF
	BEQ bra_07_CF30
	CMP #$FE
	BEQ bra_07_CF26
	CMP #$FC
	BEQ bra_07_CF61
	CMP #$F0
	BEQ bra_07_CF42
	CMP #$F1
	BEQ bra_07_CF55
	CMP #$F2
	BEQ bra_07_CF6F

; 60fps	!!! утроение тайминга анимации, временное решение
	STA $0190
	ASL
	CLC
	ADC $0190

	STA $1C
	INC таймер_кадра_анимации,X
	LDA таймер_кадра_анимации,X
	CMP $1C
	BEQ bra_07_CF1F
	BCC bra_07_CF1F
	INC номер_кадра_анимации,X
	LDA #$00
	STA таймер_кадра_анимации,X
	JMP _loc_07_CEE5
bra_07_CF1F:
	INY
	LDA ($2C),Y
	STA номер_анимации,X
	RTS
bra_07_CF26:
	LDA #$00
	STA номер_кадра_анимации,X
	STA таймер_кадра_анимации,X
	BEQ bra_07_CEE5
bra_07_CF30:
	STY $44
	JSR _loc_07_CF90_выполнить_непрямой_прыжок_0032
	LDY $44
	DEY
	LDA ($2C),Y
	STA номер_анимации,X
	RTS
bra_07_CF42:
	INY
	LDA состояние_игрока,X
	AND #$40
	BEQ bra_07_CF4F
	LDA ($2C),Y
	STA номер_действия_мяча
bra_07_CF4F:
	INC номер_кадра_анимации,X
	JMP _loc_07_CEE5
bra_07_CF55:
	INY
	LDA ($2C),Y
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	INC номер_кадра_анимации,X
	JMP _loc_07_CEE5
bra_07_CF61:
	INY
	LDA ($2C),Y
	STA номер_кадра_анимации,X
	LDA #$00
	STA таймер_кадра_анимации,X
	JMP _loc_07_CEE5
bra_07_CF6F:
	INY
	LDA ($2C),Y
	STA режим_игры_на_поле
	LDA позиция_управление + $0A
	AND #$7F
	ORA управление_кипером
	STA позиция_управление + $0A
	LDA позиция_управление + $0B
	AND #$7F
	ORA управление_кипером + 1
	STA позиция_управление + $0B
	INC номер_кадра_анимации,X
	JMP _loc_07_CEE5

_loc_07_CF90_выполнить_непрямой_прыжок_0032:
	JMP ($0032)

_loc_07_CF93:
	LDA #$00
	STA счетчик_следов
	STA флаг_обновления_тайлов_экрана
	STA сила_ветра
	LDA #$FF		; СЕТКА_БЕЗ_ИЗМЕНЕНИЙ
	STA $05FA
	STA флаг_кипера_в_штрафной - $0A
	STA флаг_кипера_в_штрафной - $0B + 2
	STA флаг_гола
	JSR _loc_07_E7D9
	JSR _loc_07_C326
	JSR _b07_запись_банков_спрайтов
	LDA цвет_поля
	STA номер_палитры_фона
	LDA #$0F
	STA номер_палитры_фона + 1
	LDA #$01
	STA $A000
	LDA банк_для_поля
	STA банк_фона
	LDA банк_для_поля
	CLC
	ADC #$04
	STA банк_фона + 1
	JSR _loc_07_EE7D_запись_банков_фона
	LDA #$B1
	STA ограничитель_Y_спрайтов
	JSR _b07_ECA9
	JSR _b07_выключить_NMI
	JSR _b07_выключить_рендеринг
	JSR _loc_07_E3D9
	LDA #$03
	JSR _b07_C344_банксвич_80xx
	LDA опция_режим_сложность
	AND #РЕЖИМ_ПК_ИЗ_МЕНЮ
	BNE bra_07_CFF9
	LDA вариант_расстановки_игроков
	BEQ bra_07_D002
	LDA #$85
	BNE bra_07_D004
bra_07_CFF9:
	LDA #МУЗЫКА_ПЕНАЛЬТИ
	STA номер_музыки
	LDA #СТАТУСБАР_PK + $80
	BNE bra_07_D004
bra_07_D002:
	LDA #СТАТУСБАР_KICK_OFF + $80
bra_07_D004:
	STA вид_статусбара
	LDA #$00
	STA $05F9
	LDA номер_музыки
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _b07_включить_NMI
	JSR _b07_включить_рендеринг
	CLI
	RTS

.export _b07_D036_изменение_яркости_на_логотипе
_b07_D036_изменение_яркости_на_логотипе:
	LDA #$40
	STA текущая_яркость
	LDA #$01
	STA скорость_яркости
	JSR _b07_яркость_палитры_и_запись_в_буфер
	JMP _loc_07_D187_изменение_яркости_на_логотипе

.export _b07_поставить_флаг_уменьшения_яркости
_b07_поставить_флаг_уменьшения_яркости:
	LDA #$40
	STA флаг_яркости
	JMP _указать_скорость_изменения_яркости

.export _b07_поставить_флаг_увеличения_яркости
_b07_поставить_флаг_увеличения_яркости:
	LDA #$00
	STA флаг_яркости
_указать_скорость_изменения_яркости:
	LDA #$02
	STA скорость_яркости
	LDA #$00
	STA счетчик_яркости
	STA таймер_яркости
	RTS

.export _b07_D062
_b07_D062:
@цикл:
	JSR _b07_D073
	LDA задержка_кадра
@бесконечный_цикл:
	CMP задержка_кадра
	BEQ @бесконечный_цикл
	LDA флаг_яркости
	BPL @цикл
	RTS

.export _b07_D073
_b07_D073:
	BIT флаг_яркости
	BMI @RTS
	BVS @затемнение
	LDY счетчик_яркости
	LDA table_07_D0CB_яркость_осветления,Y
	JMP @запись_яркости
@затемнение:
	LDY счетчик_яркости
	LDA table_07_D0CB_яркость_затемнения,Y
@запись_яркости:
	STA текущая_яркость
	LDA таймер_яркости
	BNE @пропуск
	JSR _b07_яркость_палитры_и_запись_в_буфер
	LDA #$00
	STA бит_для_2000_атрибуты
	LDA #$3F
	STA байт_2006_hi_палитра
@пропуск:
	INC таймер_яркости
	LDA таймер_яркости
	CMP скорость_яркости
	BCC @RTS
	LDA #$00
	STA таймер_яркости
	INC счетчик_яркости
	LDA счетчик_яркости
	CMP #$05
	BCC @RTS
	LDA #$00
	STA счетчик_яркости
	LDA флаг_яркости
	ORA #$80
	STA флаг_яркости
@RTS:
	RTS

table_07_D0CB_яркость_осветления:
.byte $00,$10,$20,$30,$40

table_07_D0CB_яркость_затемнения:
.byte $40,$30,$20,$10,$00

; D0D5
.export _b07_яркость_палитры_и_запись_в_буфер
_b07_яркость_палитры_и_запись_в_буфер:
; аккуратнее с X, код его все время возит с собой и регулярно проверяет
	LDX #$00
	STX байт_2006_lo_палитра
	LDA #$10
	STA счетчик_буфера_палитры
	LDA #$00
	STA $1C
@цикл_вычисления_яркости_цветов_фона:
	TXA
	LSR
	LSR
	LSR
	AND #$01
	TAY
	LDA номер_палитры_фона,Y
	ASL
	TAY
	LDA table_07_D2FB_поинтеры_на_набор_палитры_фона,Y
	STA $2C
	LDA table_07_D2FB_поинтеры_на_набор_палитры_фона + 1,Y
	STA $2D
@яркость_двух_наборов_по_4_цвета:
	TXA
	LSR
	LSR
	AND #$01
	ASL
	TAY
	LDA ($2C),Y
	STA $30
	INY
	LDA ($2C),Y
	STA $31
	LDY #$00
	JSR _loc_07_D15F_изменение_яркости_набора_цветов
	TXA
	AND #$07
	BNE @яркость_двух_наборов_по_4_цвета
	TXA
	AND #$0F
	BNE @цикл_вычисления_яркости_цветов_фона		; код пропустит прыжок при X = 10
	LDA флаг_яркости
	AND #$01		; не похоже что где-то к флагу может добавиться 01, ненужная проверка
					; предоложительно должна пропускаться запись палитры спрайтов в буфер в этом случае
	BNE @пропуск_палитры_спрайтов
	CLC
	LDA счетчик_буфера_палитры
	ADC #$10		; если проверка действительно лишняя, то в самом начале кода писать 20, а сложение удалить
	STA счетчик_буфера_палитры
@цикл_вычисления_яркости_цветов_спрайтов:
	TXA
	LSR
	LSR
	AND #$03
	TAY
	LDA номер_палитры_спрайтов,Y
	ASL
	TAY
	LDA table_07_D1B7_поинтеры_на_набор_палитры_спрайтов,Y
	STA $30
	LDA table_07_D1B7_поинтеры_на_набор_палитры_спрайтов + 1,Y
	STA $31
	LDY #$00
	JSR _loc_07_D15F_изменение_яркости_набора_цветов
	TXA
	AND #$0F
	BNE @цикл_вычисления_яркости_цветов_спрайтов
@пропуск_палитры_спрайтов:
	LDA счетчик_буфера_палитры
	BEQ @RTS
	LDA буфер_палитры
	LDY #$04
@цикл:
	STA буфер_палитры,Y
	INY
	INY
	INY
	INY
	CPY #$20
	BCC @цикл
@RTS:
	RTS

_loc_07_D15F_изменение_яркости_набора_цветов:
@цикл:
	LDA текущая_яркость
	BEQ @запись_черного_цвета
	LDA ($30),Y
	CPX $1C		; вероятно всегда 00 в адресе, ненужная проверка
	BCC @запись_в_буфер
	CMP текущая_яркость
	BCC @запись_в_буфер
	AND #$0F
	ORA текущая_яркость
	SEC
	SBC #$10
	JMP @запись_в_буфер
@запись_черного_цвета:
	LDA #$0F
@запись_в_буфер:
	STA буфер_палитры,X
	INY
	INX
	TXA
	AND #$03
	BNE @цикл
	RTS

_loc_07_D187_изменение_яркости_на_логотипе:
; походу только на лого и используется
	LDA #$00
	STA бит_для_2000_палитра
	LDA #$3F
	STA байт_2006_hi_палитра
@бесконечный_цикл_ожидание_записи_палитры:
	CMP байт_2006_hi_палитра
	BEQ @бесконечный_цикл_ожидание_записи_палитры
	LDA #$00
	STA таймер_яркости
	LDA скорость_яркости
	BEQ @выход
@цикл_увеличения_яркости:
	LDA задержка_кадра
@бесконечный_цикл:
	CMP задержка_кадра
	BEQ @бесконечный_цикл
	INC таймер_яркости
	LDA таймер_яркости
	CMP скорость_яркости
	BCC @цикл_увеличения_яркости
@выход:
	LDA #$00
	STA задержка_кадра
	RTS

table_07_D1B7_поинтеры_на_набор_палитры_спрайтов:
.word table_07_D1B7_D223 + $00
.word table_07_D1B7_D223 + $04
.word table_07_D1B7_D223 + $08
.word table_07_D1B7_D223 + $0C
.word table_07_D1B7_D223 + $10
.word table_07_D1B7_D223 + $14
.word table_07_D1B7_D223 + $18
.word table_07_D1B7_D223 + $1C
.word table_07_D1B7_D223 + $20
.word table_07_D1B7_D223 + $24
.word table_07_D1B7_D223 + $28
.word table_07_D1B7_D223 + $2C
.word table_07_D1B7_D223 + $30
.word table_07_D1B7_D223 + $34
.word table_07_D1B7_D223 + $38
.word table_07_D1B7_D223 + $3C
.word table_07_D1B7_D223 + $40
.word table_07_D1B7_D223 + $44
.word table_07_D1B7_D223 + $48
.word table_07_D1B7_D223 + $4C
.word table_07_D1B7_D223 + $50
.word table_07_D1B7_D223 + $54
.word table_07_D1B7_D223 + $58
.word table_07_D1B7_D223 + $5C
.word table_07_D1B7_D223 + $60
.word table_07_D1B7_D223 + $64
.word table_07_D1B7_D223 + $68
.word table_07_D1B7_D223 + $6C
.word table_07_D1B7_D223 + $70
.word table_07_D1B7_D223 + $74
.word table_07_D1B7_D223 + $78
.word table_07_D1B7_D223 + $7C
.word table_07_D1B7_D223 + $80
.word table_07_D1B7_D223 + $84
.word table_07_D1B7_D223 + $88
.word table_07_D1B7_D223 + $8C
.word table_07_D1B7_D223 + $90
.word table_07_D1B7_D223 + $94
.word table_07_D1B7_D223 + $98
.word table_07_D1B7_D223 + $9C
.word table_07_D1B7_D223 + $A0
.word table_07_D1B7_D223 + $A4
.word table_07_D1B7_D223 + $A8
.word table_07_D1B7_D223 + $AC
.word table_07_D1B7_D223 + $B0
.word table_07_D1B7_D223 + $B4
.word table_07_D1B7_D223 + $B8
.word table_07_D1B7_D223 + $BC
.word table_07_D1B7_D223 + $C0
.word table_07_D1B7_D223 + $C4
.word table_07_D1B7_D223 + $C8
.word table_07_D1B7_D223 + $CC
.word table_07_D1B7_D223 + $D0
.word table_07_D1B7_D223 + $D4

table_07_D1B7_D223:
table_07_D2FB_D38F_D223:
.byte $0F,$0F,$0F,$0F	; $00
.byte $0F,$0F,$30,$26	; $04
.byte $0F,$1C,$30,$2C	; $08
.byte $0F,$1C,$3C,$2C	; $0C
.byte $0F,$0F,$30,$26	; $10
.byte $0F,$0F,$30,$17	; $14
.byte $0F,$07,$30,$27	; $18
.byte $0F,$0F,$30,$27	; $1C
.byte $0F,$0F,$16,$26	; $20
.byte $0F,$0F,$18,$26	; $24
.byte $0F,$0F,$14,$26	; $28
.byte $0F,$0F,$21,$26	; $2C
.byte $0F,$0F,$23,$17	; $30
.byte $0F,$0F,$29,$17	; $34
.byte $0F,$0F,$2C,$17	; $38
.byte $0F,$07,$1A,$27	; $3C
.byte $0F,$07,$12,$27	; $40
.byte $0F,$07,$16,$27	; $44
.byte $0F,$0F,$19,$27	; $48
.byte $0F,$0F,$3C,$27	; $4C
.byte $0F,$0F,$24,$27	; $50
.byte $0F,$30,$12,$16	; $54
.byte $0F,$30,$1A,$16	; $58
.byte $0F,$0F,$1A,$16	; $5C
.byte $0F,$30,$2C,$16	; $60
.byte $0F,$30,$1A,$12	; $64
.byte $0F,$0F,$30,$16	; $68
.byte $0F,$0F,$30,$10	; $6C
.byte $0F,$0F,$30,$12	; $70
.byte $0C,$07,$30,$26	; $74
.byte $30,$07,$30,$26	; $78
.byte $0C,$0F,$07,$26	; $7C
.byte $30,$0F,$07,$26	; $80
.byte $0C,$0F,$30,$26	; $84
.byte $30,$0F,$30,$26	; $88
.byte $0F,$0F,$30,$28	; $8C
.byte $0F,$0F,$30,$2C	; $90
.byte $0F,$0F,$30,$27	; $94
.byte $0F,$0F,$1A,$27	; $98
.byte $0F,$0F,$30,$26	; $9C
.byte $0F,$0F,$29,$26	; $A0
.byte $0F,$0F,$29,$30	; $A4
.byte $0F,$0F,$30,$15	; $A8
.byte $07,$07,$37,$26	; $AC
.byte $07,$07,$17,$26	; $B0
.byte $07,$07,$27,$26	; $B4
.byte $07,$07,$30,$17	; $B8
.byte $07,$07,$27,$17	; $BC
.byte $07,$07,$30,$27	; $C0
.byte $07,$07,$17,$27	; $C4
.byte $07,$06,$30,$27	; $C8
.byte $07,$07,$17,$27	; $CC
.byte $07,$07,$30,$26	; $D0
.byte $07,$07,$26,$27	; $D4

table_07_D2FB_поинтеры_на_набор_палитры_фона:
.word table_07_D2FB_D38F + $04
.word table_07_D2FB_D38F + $08
.word table_07_D2FB_D38F + $0C
.word table_07_D2FB_D38F + $10
.word table_07_D2FB_D38F + $14
.word table_07_D2FB_D38F + $18
.word table_07_D2FB_D38F + $1C
.word table_07_D2FB_D38F + $20
.word table_07_D2FB_D38F + $24
.word table_07_D2FB_D38F + $28
.word table_07_D2FB_D38F + $2C
.word table_07_D2FB_D38F + $30
.word table_07_D2FB_D38F + $34
.word table_07_D2FB_D38F + $38
.word table_07_D2FB_D38F + $3C
.word table_07_D2FB_D38F + $40
.word table_07_D2FB_D38F + $44
.word table_07_D2FB_D38F + $48
.word table_07_D2FB_D38F + $4C
.word table_07_D2FB_D38F + $50
.word table_07_D2FB_D38F + $54
.word table_07_D2FB_D38F + $58
.word table_07_D2FB_D38F + $5C
.word table_07_D2FB_D38F + $60
.word table_07_D2FB_D38F + $64
.word table_07_D2FB_D38F + $68
.word table_07_D2FB_D38F + $6C
.word table_07_D2FB_D38F + $70
.word table_07_D2FB_D38F + $74
.word table_07_D2FB_D38F + $78
.word table_07_D2FB_D38F + $7C
.word table_07_D2FB_D38F + $80
.word table_07_D2FB_D38F + $84
.word table_07_D2FB_D38F + $88
.word table_07_D2FB_D38F + $8C
.word table_07_D2FB_D38F + $90
.word table_07_D2FB_D38F + $94
.word table_07_D2FB_D38F + $98
.word table_07_D2FB_D38F + $9C
.word table_07_D2FB_D38F + $A0
.word table_07_D2FB_D38F + $A4
.word table_07_D2FB_D38F + $A8
.word table_07_D2FB_D38F + $AC
.word table_07_D2FB_D38F + $B0
.word table_07_D2FB_D38F + $B4
.word table_07_D2FB_D38F + $B8
.word table_07_D2FB_D38F + $BC
.word table_07_D2FB_D38F + $C0
.word table_07_D2FB_D38F + $C4
.word table_07_D2FB_D38F + $C8
.word table_07_D2FB_D38F + $CC
.word table_07_D2FB_D38F + $D0
.word table_07_D2FB_D38F + $D4
.word table_07_D2FB_D38F + $D8
.word table_07_D2FB_D38F + $DC
.word table_07_D2FB_D38F + $E0
.word table_07_D2FB_D38F + $E4
.word table_07_D2FB_D38F + $E8
.word table_07_D2FB_D38F + $EC
.word table_07_D2FB_D38F + $F0
.word table_07_D2FB_D38F + $F4
.word table_07_D2FB_D38F + $F8
.word table_07_D2FB_D38F + $FC
.word table_07_D2FB_D38F + $100
.word table_07_D2FB_D38F + $104
.word table_07_D2FB_D38F + $108
.word table_07_D2FB_D38F + $00
.word table_07_D2FB_D38F + $10C
.word table_07_D2FB_D38F + $110
.word table_07_D2FB_D38F + $114
.word table_07_D2FB_D38F + $118
.word table_07_D2FB_D38F + $11C
.word table_07_D2FB_D38F + $120
.word table_07_D2FB_D38F + $124

table_07_D2FB_D38F:
.word table_07_D2FB_D38F_D223		; $00
.word table_07_D2FB_D38F_D223
.word off_07_D4B7		; $04
.word off_07_D4BB
.word off_07_D4C7		; $08
.word off_07_D4CB
.word off_07_D4CF		; $0C
.word off_07_D4D3
.word off_07_D4D7		; $10
.word off_07_D4DB
.word off_07_D4EF		; $14
.word off_07_D4F3
.word off_07_D4DF		; $18
.word off_07_D4DF
.word off_07_D4E3		; $1C
.word off_07_D4E3
.word off_07_D4E7		; $20
.word off_07_D4E7
.word off_07_D4EB		; $24
.word off_07_D4EB
.word off_07_D4F7		; $28
.word off_07_D4FB
.word off_07_D4FF		; $2C
.word off_07_D503
.word off_07_D4BF		; $30
.word off_07_D4BF
.word off_07_D4BF		; $34
.word off_07_D4C3
.word off_07_D4C3		; $38
.word off_07_D4BF
.word off_07_D4C3		; $3C
.word off_07_D4C3
.word off_07_D507		; $40
.word off_07_D50B
.word off_07_D50F		; $44
.word off_07_D513
.word off_07_D50F		; $48
.word off_07_D51F
.word off_07_D50F		; $4C
.word off_07_D517
.word off_07_D50F		; $50
.word off_07_D523
.word off_07_D50F		; $54
.word off_07_D51B
.word off_07_D547		; $58
.word off_07_D54B
.word off_07_D54F		; $5C
.word off_07_D553
.word off_07_D557		; $60
.word off_07_D557
.word off_07_D557		; $64
.word off_07_D557
.word off_07_D55B		; $68
.word off_07_D55F
.word off_07_D563		; $6C
.word off_07_D567
.word off_07_D54F		; $70
.word off_07_D54F
.word off_07_D56B		; $74
.word off_07_D56F
.word off_07_D56B		; $78
.word off_07_D573
.word off_07_D56B		; $7C
.word off_07_D577
.word off_07_D56B		; $80
.word off_07_D57B
.word off_07_D56B		; $84
.word off_07_D57F
.word off_07_D56B		; $88
.word off_07_D583
.word off_07_D56B		; $8C
.word off_07_D587
.word off_07_D56B		; $90
.word off_07_D58B
.word off_07_D56B		; $94
.word off_07_D58F
.word off_07_D56B		; $98
.word off_07_D593
.word off_07_D56B		; $9C
.word off_07_D597
.word off_07_D56B		; $A0
.word off_07_D59B
.word off_07_D56B		; $A4
.word off_07_D59F
.word off_07_D5DF		; $A8
.word off_07_D5DF
.word off_07_D5DF		; $AC
.word off_07_D5E3
.word off_07_D5DF		; $B0
.word off_07_D5E7
.word off_07_D5DF		; $B4
.word off_07_D5EB
.word off_07_D5E3		; $B8
.word off_07_D5DF
.word off_07_D5E3		; $BC
.word off_07_D5E3
.word off_07_D5E3		; $C0
.word off_07_D5E7
.word off_07_D5E3		; $C4
.word off_07_D5EB
.word off_07_D5E7		; $C8
.word off_07_D5DF
.word off_07_D5E7		; $CC
.word off_07_D5E3
.word off_07_D5E7		; $D0
.word off_07_D5E7
.word off_07_D5E7		; $D4
.word off_07_D5EB
.word off_07_D5EB		; $D8
.word off_07_D5DF
.word off_07_D5EB		; $DC
.word off_07_D5E3
.word off_07_D5EB		; $E0
.word off_07_D5E7
.word off_07_D5EB		; $E4
.word off_07_D5EB
.word off_07_D563		; $E8
.word off_07_D553
.word off_07_D5A3		; $EC
.word off_07_D5A7
.word off_07_D5AB		; $F0
.word off_07_D5AB
.word off_07_D5AF		; $F4
.word off_07_D5B3
.word off_07_D527		; $F8
.word off_07_D533
.word off_07_D527		; $FC
.word off_07_D537
.word off_07_D52B		; $100
.word off_07_D53B
.word off_07_D52B		; $104
.word off_07_D53F
.word off_07_D52F		; $108
.word off_07_D543
.word off_07_D5BF		; $10C
.word off_07_D5C3
.word off_07_D5B7		; $110
.word off_07_D5BB
.word off_07_D5B7		; $114
.word off_07_D5C7
.word off_07_D5B7		; $118
.word off_07_D5CB
.word off_07_D5B7		; $11C
.word off_07_D5CF
.word off_07_D5B7		; $120
.word off_07_D5D3
.word off_07_D5D7		; $124
.word off_07_D5DB

off_07_D4B7:
.byte $2A,$30,$0F,$1B

off_07_D4BB:
.byte $2A,$30,$3A,$1B

off_07_D4BF:
.byte $2A,$30,$0F,$26

off_07_D4C3:
.byte $2A,$30,$0F,$17

off_07_D4C7:
.byte $2A,$30,$0F,$3A

off_07_D4CB:
.byte $2A,$30,$1B,$3A

off_07_D4CF:
.byte $27,$37,$0F,$17

off_07_D4D3:
.byte $27,$37,$18,$17

off_07_D4D7:
.byte $18,$37,$0F,$17

off_07_D4DB:
.byte $18,$37,$27,$17

off_07_D4DF:
.byte $30,$0F,$30,$30

off_07_D4E3:
.byte $20,$30,$10,$0F

off_07_D4E7:
.byte $1A,$20,$2A,$0B

off_07_D4EB:
.byte $0F,$30,$0F,$0F

off_07_D4EF:
.byte $37,$30,$0F,$27

off_07_D4F3:
.byte $37,$0F,$0F,$0F

off_07_D4F7:
.byte $0F,$30,$21,$11

off_07_D4FB:
.byte $0F,$30,$2A,$1B

off_07_D4FF:
.byte $0F,$30,$00,$27

off_07_D503:
.byte $0F,$30,$2B,$26

off_07_D507:
.byte $00,$37,$0F,$27

off_07_D50B:
.byte $00,$30,$0F,$30

off_07_D50F:
.byte $0F,$30,$21,$11

off_07_D513:
.byte $0F,$30,$2A,$1B

off_07_D517:
.byte $0F,$30,$27,$17

off_07_D51B:
.byte $0F,$30,$37,$27

off_07_D51F:
.byte $0F,$30,$2A,$3A

off_07_D523:
.byte $0F,$30,$18,$17

off_07_D527:
.byte $0F,$30,$21,$11

off_07_D52B:
.byte $0F,$30,$2A,$1A

off_07_D52F:
.byte $0F,$30,$28,$18

off_07_D533:
.byte $0F,$30,$2A,$1B

off_07_D537:
.byte $0F,$30,$3A,$2A

off_07_D53B:
.byte $0F,$30,$27,$17

off_07_D53F:
.byte $0F,$17,$18,$17

off_07_D543:
.byte $0F,$30,$37,$27

off_07_D547:
.byte $0F,$30,$0C,$0F

off_07_D54B:
.byte $0F,$30,$2A,$0C

off_07_D54F:
.byte $0F,$30,$0C,$00

off_07_D553:
.byte $0F,$1C,$0C,$0F

off_07_D557:
.byte $00,$30,$0C,$16

off_07_D55B:
.byte $0F,$30,$2A,$26

off_07_D55F:
.byte $0F,$30,$2A,$0C

off_07_D563:
.byte $0F,$30,$0C,$0F

off_07_D567:
.byte $0F,$30,$0C,$26

off_07_D56B:
.byte $0F,$30,$0C,$27

off_07_D56F:
.byte $0F,$30,$26,$16

off_07_D573:
.byte $0F,$30,$26,$2A

off_07_D577:
.byte $0F,$30,$27,$15

off_07_D57B:
.byte $0F,$30,$26,$2A

off_07_D57F:
.byte $0F,$30,$26,$16

off_07_D583:
.byte $0F,$30,$16,$1A

off_07_D587:
.byte $0F,$30,$27,$16

off_07_D58B:
.byte $0F,$30,$37,$29

off_07_D58F:
.byte $0F,$30,$27,$06

off_07_D593:
.byte $0F,$30,$27,$16

off_07_D597:
.byte $0F,$30,$27,$16

off_07_D59B:
.byte $0F,$30,$27,$17

off_07_D59F:
.byte $0F,$30,$27,$06

off_07_D5A3:
.byte $11,$30,$22,$0F

off_07_D5A7:
.byte $11,$30,$0F,$15

off_07_D5AB:
.byte $11,$30,$11,$0F

off_07_D5AF:
.byte $20,$0F,$10,$00

off_07_D5B3:
.byte $20,$0F,$31,$21

off_07_D5B7:
.byte $0C,$0F,$0C,$0C

off_07_D5BB:
.byte $0C,$0F,$01,$01

off_07_D5BF:
.byte $0C,$00,$0C,$0C

off_07_D5C3:
.byte $0C,$30,$0C,$0C

off_07_D5C7:
.byte $0C,$0F,$11,$11

off_07_D5CB:
.byte $0C,$0F,$21,$21

off_07_D5CF:
.byte $0C,$0F,$31,$31

off_07_D5D3:
.byte $0C,$0F,$30,$30

off_07_D5D7:
.byte $07,$30,$0F,$0F

off_07_D5DB:
.byte $07,$37,$27,$17

off_07_D5DF:
.byte $2A,$30,$0F,$26

off_07_D5E3:
.byte $2A,$30,$0F,$17

off_07_D5E7:
.byte $2A,$30,$0F,$27

off_07_D5EB:
.byte $2A,$30,$0F,$27

.export _b07_D5EF_обновить_палитру_мокрого_мяча
_b07_D5EF_обновить_палитру_мокрого_мяча:
	LDA номер_погодного_эффекта
	AND #$7F
	CMP #ПОГОДА_МОЛНИЯ
	BEQ @RTS
	LDY #$00
	BIT таймер_мокрого_мяча
	BMI @чтение_таблицы
	INY
	BVS @чтение_таблицы
	INY
@чтение_таблицы:
	LDA table_07_D617,Y
	CMP номер_палитры_спрайтов
	BEQ @RTS
	STA номер_палитры_спрайтов
	JSR _b07_яркость_палитры_и_запись_в_буфер
	LDA #$3F
	STA байт_2006_hi_палитра
@RTS:
	RTS

table_07_D617:
.byte $03,$02,$01

_loc_07_D61A_нарисовать_информацию_статусбара:
.SCOPE
	LDA подтип_экрана
	CMP копия_подтипа_экрана
	BNE @RTS
	CMP #ЭКРАН_SUB_ИГРА_НА_ПОЛЕ
	BEQ _рисовать
	CMP #ЭКРАН_SUB_МЯЧ_ВНЕ_ИГРЫ
	BEQ _рисовать
@RTS:
	RTS

_рисовать:
	LDA байт_для_2000
	AND #$FB
	STA байт_для_2000
	STA $2000
	LDA флаг_обновления_тайлов_экрана
	AND #$20
	BNE @рожи_в_статусбаре_слева
	JMP _рожи_в_статусбаре_справа
@рожи_в_статусбаре_слева:
	LDA $2002
	LDA #$2A
	STA $2006
	LDA #$61
	STA $2006
	LDA буфер_атрибутов
	STA $2007
	LDX #$01
	LDA $2002
	LDA #$2A
	STA $2006
	LDA #$81
	JSR _записать_из_буфера_в_видеопамять
	LDA #$07
	JSR _записать_из_буфера_в_видеопамять
	LDA #$27
	JSR _записать_из_буфера_в_видеопамять
	LDA #$47
	JSR _записать_из_буфера_в_видеопамять
	LDA #$67
	JSR _записать_из_буфера_в_видеопамять
	LDA #$87
	JSR _записать_из_буфера_в_видеопамять
	LDA #$00
	STA $2006

_рожи_в_статусбаре_справа:
	LDA флаг_обновления_тайлов_экрана
	AND #$10
	BNE @обновить_рожи
	JMP _очистить_флаг
@обновить_рожи:
	LDA $2002
	LDA #$2A
	STA $2006
	LDA #$74
	STA $2006
	LDA буфер_графики
	STA $2007
	LDX #$24
	LDA $2002
	LDA #$2A
	STA $2006
	LDA #$94
	JSR _записать_из_буфера_в_видеопамять
	LDA #$1A
	JSR _записать_из_буфера_в_видеопамять
	LDA #$3A
	JSR _записать_из_буфера_в_видеопамять
	LDA #$5A
	JSR _записать_из_буфера_в_видеопамять
	LDA #$7A
	JSR _записать_из_буфера_в_видеопамять
	LDA #$9A
	JSR _записать_из_буфера_в_видеопамять
	LDA #$00
	STA $2006

_очистить_флаг:
	LDA флаг_обновления_тайлов_экрана
	AND #$CF
	STA флаг_обновления_тайлов_экрана
	RTS

_записать_из_буфера_в_видеопамять:
; на вход подается младший байт для 2006, а старший пишется в самом конце для следующего раза
; но в самый первый раз перед прыжком заранее пишется старший байт
	STA $2006
	LDY #$04
@цикл:
	LDA буфер_атрибутов,X
	STA $2007
	INX
	DEY
	BPL @цикл
	LDA $2002
	LDA #$2A
	STA $2006
	RTS
.ENDSCOPE

_loc_07_D6E7_уменьшение_игрового_времени_и_loss:
.SCOPE
	LDA опция_режим_сложность
	AND #РЕЖИМ_ПК_ИЗ_МЕНЮ
	BNE @не_увеличивать_loss_и_проверить_основной_таймер
	LDA подтип_экрана
	CMP #ЭКРАН_SUB_МЯЧ_ВНЕ_ИГРЫ
	BEQ @увеличить_loss
	LDY игрок_с_мячом
	CPY #$0A
	BCC @не_увеличивать_loss_и_проверить_основной_таймер		; владеть мячом должен кипер
	LDA состояние_мяча
	AND #$40
	BEQ @не_увеличивать_loss_и_проверить_основной_таймер
	LDA флаг_кипера_в_штрафной - $0A,Y		; кипер должен быть в штрафной
	BMI @не_увеличивать_loss_и_проверить_основной_таймер
@увеличить_loss:
	JSR _увеличить_время_loss
@не_увеличивать_loss_и_проверить_основной_таймер:
	LDA время_тайма_минуты
	ORA время_тайма_секунды_десятки
	ORA время_тайма_секунды_единицы
	BEQ @основное_время_вышло
	DEC время_тайма_терции
	BPL @RTS_терции_еще_остались
	JSR _b07_вращение_колеса_фортуны
	AND #$A0
	CMP #$A0
	BNE @пропустить_код_погоды
	LDA #$13
	JSR _b07_C344_банксвич_80xx
@пропустить_код_погоды:
	DEC время_тайма_секунды_единицы
	BPL @записать_терции
	DEC время_тайма_секунды_десятки
	BPL @записать_единицы_секунд
	DEC время_тайма_минуты
	LDA #$05
	STA время_тайма_секунды_десятки
@записать_единицы_секунд:
	LDA #$09
	STA время_тайма_секунды_единицы
@записать_терции:
	LDA #$3B		; 60fps максимальные терции основного времени тайма
	STA время_тайма_терции
@RTS_терции_еще_остались:
	RTS
@основное_время_вышло:
	LDA loss_минуты
	ORA loss_секунды_десятки
	ORA loss_секунды_единицы
	BEQ @время_loss_вышло
	DEC loss_терции
	BPL @RTS_терции_loss_еще_остались
	DEC loss_секунды_единицы
	BPL @записать_loss__терции
	DEC loss_секунды_десятки
	BPL @записать_loss__единицы__секунд
	DEC loss_минуты		; код в любом случае прыгнет в худшем случае здесь
	LDA #$05
	STA loss_секунды_десятки
@записать_loss__единицы__секунд:
	LDA #$09
	STA loss_секунды_единицы
@записать_loss__терции:
	LDA #$3B		; 60fps максимальные терции loss при его уменьшении
	STA loss_терции
@RTS_терции_loss_еще_остались:
	RTS
@время_loss_вышло:
	LDA номер_погодного_эффекта
	AND #$7F
	CMP #ПОГОДА_МОЛНИЯ
	BNE @это_не_молния
	LDA #$50
	STA длительность_погоды_ХЗ
	BNE @пропуск_очистки_погоды
@это_не_молния:
	LDA #ПОГОДА_НЕТ
	STA номер_погодного_эффекта
@пропуск_очистки_погоды:
	LDA подтип_экрана
	CMP #$06
	BEQ @выход_RTS
	LDA #ПОЛЕ_ВРЕМЯ_ВЫШЛО
	STA режим_игры_на_поле
	LDA #ЗВУК_ВРЕМЯ_ВЫШЛО
	JSR _b07_C2E4_записать_и_воспроизвести_звук
@выход_RTS:
	RTS

_увеличить_время_loss:
	INC loss_терции
	LDA loss_терции
	CMP #$78		; 60fps максимальные терции loss при его увеличении
	BCC @RTS
	INC loss_секунды_единицы
	LDA loss_секунды_единицы
	CMP #$0A
	BCC @обнулить_терции
	INC loss_секунды_десятки
	LDA loss_секунды_десятки
	CMP #$06
	BCC @обнулить_единицы_секунд
	INC loss_минуты
	LDA loss_минуты
	CMP #$02
	BCC @обнулить_десятки_секунд
; максимальное время лося, если тот достиг 2 минуты
	LDA #$01
	STA loss_минуты
	LDA #$05
	STA loss_секунды_десятки
	LDA #$09
	STA loss_секунды_единицы
	LDA #$00
	STA loss_терции
	RTS
@обнулить_десятки_секунд:
	LDA #$00
	STA loss_секунды_десятки
@обнулить_единицы_секунд:
	LDA #$00
	STA loss_секунды_единицы
@обнулить_терции:
	LDA #$00
	STA loss_терции
@RTS:
	RTS
.ENDSCOPE

.export _b07_D7F3_вычисление_следов_на_поле
_b07_D7F3_вычисление_следов_на_поле:		; выполняется когда игрок уже коснулся лужи или грязи
	LDA счетчик_следов
	CMP #$04
	BCS @RTS		; не больше 4х следов за кадр
	LDA флаг_видимости,X
	BEQ @RTS		; игрок должен быть виден
	LDA скорость_X_hi,X
	ORA скорость_X_lo,X
	ORA скорость_Y_hi,X
	ORA скорость_Y_lo,X
	BEQ @RTS		; должен двигаться
	LDA координата_X_hi,X
	CMP #$04
	BCS @RTS		; быть в пределах поля по горизонтали
	LDA координата_Y_hi,X
	BEQ @сравнить_вертикаль
	CMP #$02
	BCS @RTS		; быть в пределах поля по вертикали
	LDA координата_Y_lo,X
	CMP #$68
	BCS @RTS		; быть не больше 67 по вертикали
	JMP @условия_выполнены
@сравнить_вертикаль:
	LDA координата_Y_lo,X
	CMP #$10
	BCC @RTS		; быть не меньше 10 по вертикали
	JMP @условия_выполнены
@RTS:
	RTS
@условия_выполнены:
	TXA
	EOR счетчик_кадров
	AND #$01
	BEQ @RTS		; на четных кадрах обрабатывать команду справа, на нечетных команду слева
	STX $43
	TXA
	TAY
	LDX счетчик_следов
	LDA координата_X_lo,Y
	LSR
	LSR
	LSR
	STA $1C
	LDA координата_Y_lo,Y
	AND #$F8
	STA $1E
	LDA координата_Y_hi,Y
	STA $1F
	LDA $1F
	BNE bra_07_D869
	LDA $1E
	CMP #$F0
	BCS bra_07_D869
	LDA #$08
	STA байт_2006_hi_след,X
	JMP _loc_07_D875
bra_07_D869:
	LDA #$0A
	STA байт_2006_hi_след,X
	LDA $1E
	SEC
	SBC #$F0
	STA $1E
_loc_07_D875:
	LDA $1E
	STA $1D
	ASL $1D
	ROL байт_2006_hi_след,X
	ASL $1D
	ROL байт_2006_hi_след,X
	LDA $1D
	CLC
	ADC $1C
	STA байт_2006_lo_след,X
	INC счетчик_следов
	LDX $43
	RTS

; !!! здесь все выделено зеленым, таблицы какие-то непонятные
_loc_07_D891:
table_07_D891:
	LDA номер_погодного_эффекта
	CMP #ПОГОДА_ДОЖДЬ + $80
	BEQ bra_07_D89D
	CMP #ПОГОДА_ДОЖДЬ
	BEQ bra_07_D8C5
	RTS
bra_07_D89D:
	LDY #$00
bra_07_D89F:
	TYA
	LSR
	STA $010C,Y
	LDA table_07_D891 + 8,Y
	ROL
	STA $0100,Y
	LDA table_07_D891 + 16,Y
	AND #$3F
	CMP #$2F
	BCC bra_07_D8B6
	LDA #$00
bra_07_D8B6:
	ORA #$80
	STA $0118,Y
	INY
	CPY #$0C
	BNE bra_07_D89F
	LDA #ПОГОДА_ДОЖДЬ
	STA номер_погодного_эффекта
bra_07_D8C5:
	LDA $0140
	BEQ bra_07_D8EA
	BMI bra_07_D8DB
	CMP #$03
	BCC bra_07_D8EA
	LDA #$74
	STA $0C
	LDA #$41
	STA $0D
	JMP _loc_07_D8F2
bra_07_D8DB:
	CMP #$FE
	BCS bra_07_D8EA
	LDA #$74
	STA $0C
	LDA #$01
	STA $0D
	JMP _loc_07_D8F2
bra_07_D8EA:
	LDA #$73
	STA $0C
	LDA #$01
	STA $0D
_loc_07_D8F2:
	LDY #$00
bra_07_D8F4:
	LDA $0100,Y
	CLC
	ADC #$80
	STA $0100,Y
	LDA $0118,Y
	SEC
	SBC #$01
	STA $0118,Y
	BPL bra_07_D91E
	LDA $010C,Y
	CLC
	ADC #$04
	STA $010C,Y
	LDA $0100,Y
	CLC
	ADC $0140
	STA $0100,Y
	JMP _loc_07_D947
bra_07_D91E:
	CMP #$77
	BCS bra_07_D947
	INC $05E4
	LDA $05E4
	TAX
	LDA table_07_D891,X
	AND #$3C
	CMP #$2F
	BCC bra_07_D934
	LDA #$00
bra_07_D934:
	ORA #$80
	STA $0118,Y
	LDA #$00
	STA $010C,Y
	LDA $0100,Y
	CLC
	ADC #$58
	STA $0100,Y
_loc_07_D947:
bra_07_D947:
	INY
	CPY #$0C
	BNE bra_07_D8F4
	LDA счетчик_спрайтов
	BEQ bra_07_D992
	LDA #$00
	TAX
	TAY
_loc_07_D955:
	CPY объем_дождя
	BEQ bra_07_D962
	BCS bra_07_D962
	LDA $010C,Y
	JMP _loc_07_D964
bra_07_D962:
	LDA #$F9
_loc_07_D964:
	STA спрайт_Y,X
	LDA $0118,Y
	BPL bra_07_D971
	LDA $0C
	JMP _loc_07_D973
bra_07_D971:
	LDA #$76
_loc_07_D973:
	STA спрайт_тайл,X
	LDA $0D
	STA спрайт_атрибут,X
	LDA $0100,Y
	STA спрайт_X,X
	INX
	INX
	INX
	INX
	INY
	CPY #$0C
	BEQ bra_07_D992
	CPY счетчик_спрайтов
	BEQ bra_07_D992
	JMP _loc_07_D955
bra_07_D992:
	RTS

_loc_07_D993:
	LDA номер_погодного_эффекта
	CMP #ПОГОДА_МОЛНИЯ + $80
	BEQ bra_07_D99F
	CMP #ПОГОДА_МОЛНИЯ
	BEQ bra_07_D9D8
	RTS
bra_07_D99F:
	LDA #$00
	STA $0C
bra_07_D9A3:
	LDA $0C
	TAY
	ASL
	ASL
	TAX
	LDA table_07_DA5E,Y
	STA спрайт_Y,X
	STA $010C,Y
	LDA table_07_DA6A,Y
	STA спрайт_тайл,X
	LDA #$01
	STA спрайт_атрибут,X
	LDA table_07_DA46,Y
	CLC
	ADC $013D
	STA спрайт_X,X
	STA $0100,Y
	INC $0C
	LDA $0C
	CMP #$0C
	BNE bra_07_D9A3
	LDA #ПОГОДА_МОЛНИЯ
	STA номер_погодного_эффекта
	RTS
bra_07_D9D8:
	LDX #$00
bra_07_D9DA:
	INC $03AE
	LDA $03AE
	CMP #$0B
	BCC bra_07_D9E9
	LDA #$00
	STA $03AE
bra_07_D9E9:
	LDY $03AE
	LDA $010C,X
	CLC
	ADC #$40
	CMP #$BD
	BCC bra_07_D9F9
	SEC
	SBC #$BD
bra_07_D9F9:
	STA $010C,X
	TXA
	BNE bra_07_DA01
	LDX #$0C
bra_07_DA01:
	LDA a: $FF,X		; думдей предупреждал об этом месте
	CPX #$0C
	BNE bra_07_DA0A
	LDX #$00
bra_07_DA0A:
	CLC
	ADC table_07_DA52,X
	CLC
	ADC table_07_DA76,Y
	STA $0100,X
	INX
	CPX #$0C
	BNE bra_07_D9DA
	LDA #$00
	TAX
	TAY
bra_07_DA1E:
	LDA $010C,Y
	CMP $013E
	BCC bra_07_DA28
	LDA #$F8
bra_07_DA28:
	STA спрайт_Y,X
	INX
	LDA table_07_DA6A,Y
	STA спрайт_Y,X
	INX
	LDA #$00
	STA спрайт_Y,X
	INX
	LDA $0100,Y
	STA спрайт_Y,X
	INX
	INY
	CPY #$0C
	BNE bra_07_DA1E
	RTS

table_07_DA46:
.byte $08,$08,$0D,$08,$08,$08,$03,$08,$0D,$08,$0D,$08

table_07_DA52:
.byte $00,$00,$05,$FB,$00,$00,$FB,$05,$05,$FB,$05,$FB

table_07_DA5E:
.byte $00,$08,$08,$10,$18,$20,$20,$28,$28,$30,$30,$38

table_07_DA6A:		; читается здесь 2 раза
.byte $E0,$F0,$F1,$E2,$F2,$E4,$E3,$F4,$F5,$E5,$E6,$F6

table_07_DA76:
.byte $01,$01,$01,$01,$01,$FF,$FF,$FF,$FF,$FF,$00

_loc_07_DA81:
	LDA номер_погодного_эффекта
	CMP #ПОГОДА_ВЕТЕР + $80
	BEQ bra_07_DA8F
	CMP #ПОГОДА_ВЕТЕР
	BEQ bra_07_DAD1
	RTS
bra_07_DA8F:
	LDY #$0B
	LDA адрес_рандома
	STA $0C
	AND #$07
	TAX
	LDA адрес_рандома + 1
	STA $0D
_loc_07_DA9E:
bra_07_DA9E:
	LDA $0C
	STA $0100,X
	EOR $0D
	STA $0118,X
	TYA
	ASL
	ASL
	ASL
	ASL
	STA $010C,X
	LDA $0C
	EOR $0D
	STA $0D
	ADC $0C
	STA $0C
	DEX
	BPL bra_07_DABF
	LDX #$0B
bra_07_DABF:
	DEY
	DEY
	BPL bra_07_DA9E
	CPY #$FE
	BEQ bra_07_DACC
	LDY #$0A
	JMP _loc_07_DA9E
bra_07_DACC:
	LDA #ПОГОДА_ВЕТЕР
	STA номер_погодного_эффекта
bra_07_DAD1:
	LDA $0140
	STA $0C
	LDA $0141
	STA $0D
	LDX #$0B
bra_07_DADD:
	LDA $0100,X
	CLC
	ADC $0C
	CLC
	ADC #$80
	STA $0100,X
	LDA $010C,X
	CLC
	ADC $0D
	STA $010C,X
	LDA $0118,X
	AND #$40
	BEQ bra_07_DB0D
	LDA $0100,X
	CLC
	ADC $0140
	STA $0100,X
	LDA $010C,X
	CLC
	ADC $0141
	STA $010C,X
bra_07_DB0D:
	LDA $010C,X
	CMP #$B2
	BCC bra_07_DB2B
	LDA $0141
	BMI bra_07_DB21
	LDA $0118,X
	AND #$07
	JMP _loc_07_DB28
bra_07_DB21:
	LDA $0118,X
	AND #$03
	ORA #$B0
_loc_07_DB28:
	STA $010C,X
bra_07_DB2B:
	LDA $0118,X
	ADC #$01
	STA $0118,X
	DEX
	BPL bra_07_DADD
	LDA #$00
	TAY
	TAX
	LDA счетчик_спрайтов
	BEQ bra_07_DB77
_loc_07_DB3F:
	CPY объем_дождя
	BEQ bra_07_DB4C
	BCS bra_07_DB4C
	LDA $010C,Y
	JMP _loc_07_DB4E
bra_07_DB4C:
	LDA #$F9
_loc_07_DB4E:
	STA спрайт_Y,X
	LDA #$07
	STA спрайт_тайл,X
	LDA $0118,Y
	AND #$C0
	ORA #$01
	STA спрайт_атрибут,X
	LDA $0100,Y
	STA спрайт_X,X
	INX
	INX
	INX
	INX
	INY
	CPY счетчик_спрайтов
	BEQ bra_07_DB77
	CPX #$30
	BEQ bra_07_DB77
	JMP _loc_07_DB3F
bra_07_DB77:
	RTS

_loc_07_DB78:
	LDA номер_погодного_эффекта
	CMP #ПОГОДА_СМЕРЧ + $80
	BEQ bra_07_DB84
	CMP #ПОГОДА_СМЕРЧ
	BEQ bra_07_DBBA
	RTS
bra_07_DB84:
	LDX #$0B
	LDA #$80
	STA $013D
	STA $013E
	LDA адрес_рандома
	STA $0C
	LDA адрес_рандома + 1
	STA $0D
bra_07_DB98:
	LDA $0C
	EOR $0D
	STA $0D
	ADC $0C
	STA $0C
	LDA #$00
	STA $0124,X
	LDA table_07_DCA5,X
	STA $0118,X
	LDA $0C
	STA $0100,X
	DEX
	BPL bra_07_DB98
	LDA #ПОГОДА_СМЕРЧ
	STA номер_погодного_эффекта
bra_07_DBBA:
	LDA режим_игры_на_поле
	BPL bra_07_DBC1
	JMP _loc_07_DC64
bra_07_DBC1:
	LDX #$0B
_loc_07_DBC3:
	INC $0118,X
	LDA $0118,X
	CMP #$6E
	BCC bra_07_DBE4
	LDA #$00
	STA $0118,X
	STA $0124,X
	LDA адрес_рандома
	AND #$1E
	SEC
	SBC #$0F
	CLC
	ADC $013D
	STA $0100,X
bra_07_DBE4:
	LDA $013E
	SEC
	SBC $0118,X
	BCC bra_07_DBF4
	CMP #$C0
	BCS bra_07_DBF4
	JMP _loc_07_DBF6
bra_07_DBF4:
	LDA #$F9
_loc_07_DBF6:
	STA $010C,X
	LDA $0118,X
	CMP #$14
	BCC bra_07_DC0D
	CMP #$28
	BCC bra_07_DC16
	LDA #$01
	STA $0D
	STA $0C
	JMP _loc_07_DC1E
bra_07_DC0D:
	LDA #$00
	STA $0D
	STA $0C
	JMP _loc_07_DC1E
bra_07_DC16:
	LDA #$01
	STA $0D
	LDA #$00
	STA $0C
_loc_07_DC1E:
	LDA $013D
	CMP $0100,X
	BMI bra_07_DC3D
	LDA $0124,X
	CLC
	ADC #$01
	STA $0124,X
	BMI bra_07_DC54
	LDA $0100,X
	SEC
	SBC $0C
	STA $0100,X
	JMP _loc_07_DC54
bra_07_DC3D:
	LDA $0124,X
	SEC
	SBC #$01
	STA $0124,X
	BMI bra_07_DC4B
	JMP _loc_07_DC54
bra_07_DC4B:
	LDA $0100,X
	CLC
	ADC $0D
	STA $0100,X
_loc_07_DC54:
bra_07_DC54:
	LDA $0100,X
	CLC
	ADC $0124,X
	STA $0100,X
	DEX
	BMI bra_07_DC64
	JMP _loc_07_DBC3
_loc_07_DC64:
bra_07_DC64:
	LDA #$00
	TAX
	TAY
_loc_07_DC68:
	CPY объем_дождя
	BEQ bra_07_DC79
	BCS bra_07_DC79
	LDA $010C,Y
	CMP ограничитель_Y_спрайтов
	BCS bra_07_DC79
	JMP _loc_07_DC7B
bra_07_DC79:
	LDA #$F9
_loc_07_DC7B:
	STA спрайт_Y,X
	LDA #$07
	STA спрайт_тайл,X
	LDA $0124,Y
	BMI bra_07_DC8D
	LDA #$01
	JMP _loc_07_DC8F
bra_07_DC8D:
	LDA #$41
_loc_07_DC8F:
	STA спрайт_атрибут,X
	LDA $0100,Y
	STA спрайт_X,X
	INX
	INX
	INX
	INX
	CPX #$30
	BEQ bra_07_DCA4
	INY
	JMP _loc_07_DC68
bra_07_DCA4:
	RTS

table_07_DCA5:
.byte $6C,$33,$64,$28,$5C,$1D,$50,$12,$46,$0A,$3D,$00

_loc_07_DCB1:
	LDA номер_погодного_эффекта
	AND #$7F
	CMP #ПОГОДА_СЕТКА_СПРАВА
	BEQ bra_07_DCBF
	CMP #ПОГОДА_СЕТКА_СЛЕВА
	BEQ bra_07_DCBF
	RTS
bra_07_DCBF:
	LDA номер_погодного_эффекта
	BPL bra_07_DD1C
	LDY #$0B
	LDA номер_погодного_эффекта
	AND #$7F
	CMP #ПОГОДА_СЕТКА_СПРАВА
	BNE bra_07_DCF2
bra_07_DCCF:
	LDA table_07_DDDB,Y
	STA $0100,Y
	LDA table_07_DDE7,Y
	SBC камера_Y_lo
	STA $010C,Y
	STA $0118,Y
	LDA table_07_DDF3,Y
	STA $0124,Y
	DEY
	BPL bra_07_DCCF
	LDA #ПОГОДА_СЕТКА_СПРАВА
	STA номер_погодного_эффекта
	JMP _loc_07_DD17
bra_07_DCF2:
	LDA table_07_DDDB,Y
	EOR #$FF
	SEC
	SBC #$07
	STA $0100,Y
	LDA table_07_DDE7,Y
	SBC камера_Y_lo
	STA $010C,Y
	STA $0118,Y
	LDA table_07_DDF3,Y
	STA $0124,Y
	DEY
	BPL bra_07_DCF2
	LDA #ПОГОДА_СЕТКА_СЛЕВА
	STA номер_погодного_эффекта
_loc_07_DD17:
	LDA #$00
	STA длительность_погоды_ХЗ
bra_07_DD1C:
	LDA режим_игры_на_поле
	BPL bra_07_DD23
	JMP _loc_07_DD91
bra_07_DD23:
	INC длительность_погоды_ХЗ
	LDA длительность_погоды_ХЗ
	AND #$03
	STA $0C
	LDY #$00
bra_07_DD2F:
	TYA
	AND #$03
	STA $0D
	CMP $0C
	BCC bra_07_DD5E
	LDA номер_погодного_эффекта
	AND #$7F
	CMP #ПОГОДА_СЕТКА_СПРАВА
	BNE bra_07_DD51
	LDA $0100,Y
	CLC
	ADC #$02
	BCC bra_07_DD4B
	LDA #$FF
bra_07_DD4B:
	STA $0100,Y
	JMP _loc_07_DD5E
bra_07_DD51:
	LDA $0100,Y
	SEC
	SBC #$02
	BCS bra_07_DD5B
	LDA #$00
bra_07_DD5B:
	STA $0100,Y
_loc_07_DD5E:
bra_07_DD5E:
	LDA $0D
	CMP $0C
	BNE bra_07_DD77
	LDA $0124,Y
	SEC
	SBC #$01
	STA $0124,Y
	LDA $010C,Y
	SEC
	SBC $0124,Y
	STA $010C,Y
bra_07_DD77:
	LDA $0118,Y
	SEC
	SBC #$01
	STA $0118,Y
	BPL bra_07_DD8C
	LDA #$05
	STA $0124,Y
	LDA #$70
	STA $0118,Y
bra_07_DD8C:
	INY
	CPY #$0C
	BNE bra_07_DD2F
_loc_07_DD91:
	LDY #$00
	LDX #$00
bra_07_DD95:
	LDA $010C,Y
	STA спрайт_Y,X
	LDA $0100,Y
	STA спрайт_X,X
	CPY #$09
	BCS bra_07_DDB5
	LDA $0118,Y
	AND #$07
	BNE bra_07_DDB5
	LDA спрайт_атрибут,X
	CLC
	ADC #$40
	JMP _loc_07_DDBA
bra_07_DDB5:
	LDA спрайт_атрибут,X
	AND #$C1
_loc_07_DDBA:
	ORA #$01
	STA спрайт_атрибут,X
	LDA table_07_DDFF,Y
	STA спрайт_тайл,X
	INX
	INX
	INX
	INX
	INY
	CPY #$0C
	BNE bra_07_DD95
	LDA длительность_погоды_ХЗ
	CMP #$38
	BCC bra_07_DDDA
	LDA #ПОГОДА_НЕТ
	STA номер_погодного_эффекта
bra_07_DDDA:
	RTS

table_07_DDDB:		; читается здесь 2 раза
.byte $C8,$C8,$D0,$D8,$CA,$C9,$D6,$D9,$CC,$C7,$D1,$D2

table_07_DDE7:		; читается здесь 2 раза
.byte $60,$68,$70,$78,$84,$82,$86,$87,$78,$72,$90,$92

table_07_DDF3:		; читается здесь 2 раза
.byte $03,$0A,$07,$05,$09,$05,$02,$08,$02,$03,$04,$02

table_07_DDFF:
.byte $CA,$CA,$CA,$CA,$EA,$EA,$CA,$CA,$CA,$CA,$EA,$CA


_loc_07_DE0B_смена_банка_поля_при_скроллинге:
	LDA банк_для_поля
	STA банк_фона
	LDA камера_X_hi
	CMP #$02
	BCS @камера_на_правой_половине
	LDA банк_для_поля
	CLC
	ADC #$04
	CMP банк_фона + 1
	BEQ @RTS
	LDA банк_для_поля
	CLC
	ADC #$04
	STA банк_фона + 1
	JMP _loc_07_EE7D_запись_банков_фона
@камера_на_правой_половине:
	LDA банк_для_поля
	CLC
	ADC #$02
	CMP банк_фона + 1
	BEQ @RTS
	LDA банк_для_поля
	CLC
	ADC #$02
	STA банк_фона + 1
	JMP _loc_07_EE7D_запись_банков_фона
@RTS:
	RTS

_loc_07_DE47:
	LDA $BFFF
	PHA
	LDA номер_prg_банка
	JSR _главный_банксвич_PRG
	LDA подтип_экрана
	CMP #ЭКРАН_SUB_ИГРА_НА_ПОЛЕ
	BEQ @экран_совпадает
	CMP #ЭКРАН_SUB_МЯЧ_ВНЕ_ИГРЫ
	BEQ @экран_совпадает
	JMP _loc_07_DED3
@экран_совпадает:
	LDA сторона_ветра_дождя
	LSR
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA table_07_E153,Y
	STA тайл_статусбара + 5
	LDA сила_ветра
	BEQ bra_07_DE7B
	CLC
	ADC #$8F
	STA тайл_статусбара + 4
	BNE bra_07_DE83
bra_07_DE7B:
	LDA #$0F
	STA тайл_статусбара + 4
	STA тайл_статусбара + 5
bra_07_DE83:
	LDA время_тайма_минуты
	ORA время_тайма_секунды_десятки
	ORA время_тайма_секунды_единицы
	BNE bra_07_DEB3
	LDA loss_терции
	ORA loss_секунды_единицы
	ORA loss_секунды_десятки
	ORA loss_минуты
	BEQ bra_07_DEB3
	LDA #$4D
	STA тайл_статусбара + 3
	LDA #$80
	STA тайл_статусбара + 2
	LDA #$4E
	STA тайл_статусбара + 1
	LDA #$4E
	STA тайл_статусбара
	JMP _loc_07_DED3
bra_07_DEB3:
	LDA время_тайма_минуты
	CLC
	ADC #$80
	STA тайл_статусбара + 3
	LDA #$4F
	STA тайл_статусбара + 2
	LDA время_тайма_секунды_десятки
	CLC
	ADC #$80
	STA тайл_статусбара + 1
	LDA время_тайма_секунды_единицы
	CLC
	ADC #$80
	STA тайл_статусбара
_loc_07_DED3:
	LDA камера_X_lo
	SEC
	SBC копия_камеры_X_lo
	LDA камера_X_hi
	SBC копия_камеры_X_hi
	STA $1D
	BMI bra_07_DEF8
	LDA камера_X_lo
	AND #$F8
	STA $27
	LDA копия_камеры_X_lo
	ORA #$07
	SEC
	SBC $27
	BMI bra_07_DF12
	JMP _loc_07_E14E
bra_07_DEF8:
	LDA копия_камеры_X_lo
	SEC
	SBC #$01
	AND #$F8
	STA $27
	LDA камера_X_lo
	SEC
	SBC #$01
	ORA #$07
	SEC
	SBC $27
	BMI bra_07_DF24
	JMP _loc_07_E14E
bra_07_DF12:
	LDA копия_камеры_X_lo
	CLC
	ADC #$08
	STA $1E
	LDA копия_камеры_X_hi
	ADC #$00
	STA $1F
	JMP _loc_07_DF33
bra_07_DF24:
	LDA копия_камеры_X_lo
	CLC
	ADC #$FF
	STA $1E
	LDA копия_камеры_X_hi
	ADC #$00
	STA $1F
_loc_07_DF33:
	LDA $1E
	LSR
	LSR
	LSR
	STA байт_2006_lo_NMT_2
	STA $1E
	CLC
	ADC #$80
	STA байт_2006_lo_NMT_1
	LDY $1F
	JSR _loc_07_E15B
	LDA $1F
	ASL
	CLC
	ADC $28
	TAY
	LDA ($40),Y
	STA $2C
	INY
	LDA ($40),Y
	STA $2D
	LDX #$00
bra_07_DF5A:
	TXA
	CLC
	ADC #$04
	ASL
	TAY
	LDA ($2C),Y
	STA $2E
	INY
	LDA ($2C),Y
	STA $2F
	LDY $1E
	LDA ($2E),Y
	STA тайлы_поля_NMT_1,X
	INX
	CPX #$1A
	BNE bra_07_DF5A
	LDA $1F
	CLC
	ADC #$04
	STA $1F
	LDY $1F
	JSR _loc_07_E15B
	LDA $1F
	ASL
	CLC
	ADC $28
	TAY
	LDA ($40),Y
	STA $2C
	INY
	LDA ($40),Y
	STA $2D
	LDX #$00
bra_07_DF93:
	TXA
	ASL
	TAY
	LDA ($2C),Y
	STA $2E
	INY
	LDA ($2C),Y
	STA $2F
	LDY $1E
	LDA ($2E),Y
	STA тайлы_поля_NMT_2,X
	INX
	CPX #$10
	BNE bra_07_DF93
	LDA флаг_обновления_тайлов_экрана
	ORA #$80		; флаг необходимости дорисовать поле при скроллинге
	STA флаг_обновления_тайлов_экрана
	LDA байт_2006_lo_NMT_1
	AND #$01
	BNE bra_07_DFBD
	JMP _loc_07_E14E
bra_07_DFBD:
	LDA $1D
	BMI bra_07_DFE9
	LDA копия_камеры_X_lo
	STA $1E
	LDA копия_камеры_X_hi
	STA $1F
	STA $21
	LDA $1E
	LSR
	LSR
	LSR
	LSR
	LSR
	STA $1E
	STA $20
	STA $22
	LDA байт_2006_lo_NMT_1
	AND #$02
	BNE bra_07_DFE4
	JMP _loc_07_E01A
bra_07_DFE4:
	INC $1F
	JMP _loc_07_E01A
bra_07_DFE9:
	LDA копия_камеры_X_lo
	SEC
	SBC #$01
	STA $27
	LDA копия_камеры_X_hi
	SBC #$00
	STA $1F
	STA $21
	LDA $27
	LSR
	LSR
	LSR
	LSR
	LSR
	STA $1E
	STA $20
	STA $22
	LDA байт_2006_lo_NMT_1
	AND #$02
	BNE bra_07_E013
	INC $21
	JMP _loc_07_E01A
bra_07_E013:
	INC $1F
	INC $21
	JMP _loc_07_E01A
_loc_07_E01A:
	LDA байт_2006_lo_NMT_1
	AND #$02
	BNE bra_07_E02C
	LDA #$CC
	STA $23
	LDA #$33
	STA $24
	JMP _loc_07_E034
bra_07_E02C:
	LDA #$33
	STA $23
	LDA #$CC
	STA $24
_loc_07_E034:
	LDA покрытие_поля_лужами
	ASL
	TAY
	LDA $801C,Y
	STA $2C
	LDA $801D,Y
	STA $2D
	LDY $1F
	JSR _loc_07_E15B
	LDA $1F
	ASL
	CLC
	ADC $28
	TAY
	LDA ($2C),Y
	STA $2E
	INY
	LDA ($2C),Y
	STA $2F
	LDX #$00
	LDA $1E
	STA $26
bra_07_E05E:
	LDA $26
	CLC
	ADC #$08
	STA $26
	LDY $26
	LDA ($2E),Y
	AND $23
	STA $059A,X
	INX
	CPX #$07
	BNE bra_07_E05E
	LDA $1F
	CLC
	ADC #$04
	STA $1F
	TAY
	JSR _loc_07_E15B
	LDA $1F
	ASL
	CLC
	ADC $28
	TAY
	LDA ($2C),Y
	STA $2E
	INY
	LDA ($2C),Y
	STA $2F
	LDX #$00
	LDA $1E
	STA $26
bra_07_E094:
	LDY $26
	LDA ($2E),Y
	AND $23
	STA $05A1,X
	LDA $26
	CLC
	ADC #$08
	STA $26
	INX
	CPX #$04
	BNE bra_07_E094
	LDY $21
	JSR _loc_07_E15B
	LDA $21
	ASL
	CLC
	ADC $28
	TAY
	LDA ($2C),Y
	STA $2E
	INY
	LDA ($2C),Y
	STA $2F
	LDX #$00
	LDA $1E
	STA $26
bra_07_E0C4:
	LDA $26
	CLC
	ADC #$08
	STA $26
	LDY $26
	LDA ($2E),Y
	AND $24
	ORA $059A,X
	STA $059A,X
	INX
	CPX #$07
	BNE bra_07_E0C4
	LDA $21
	CLC
	ADC #$04
	STA $21
	LDY $21
	JSR _loc_07_E15B
	LDA $21
	ASL
	CLC
	ADC $28
	TAY
	LDA ($2C),Y
	STA $2E
	INY
	LDA ($2C),Y
	STA $2F
	LDX #$00
	LDA $1E
	STA $26
bra_07_E0FE:
	LDY $26
	LDA ($2E),Y
	AND $24
	ORA $05A1,X
	STA $05A1,X
	LDA $26
	CLC
	ADC #$08
	STA $26
	INX
	CPX #$04
	BNE bra_07_E0FE
	LDA $22
	CLC
	ADC #$C8
	STA $25
	LDX #$00
bra_07_E11F:
	LDA $25
	STA $058F,X
	CLC
	ADC #$08
	STA $25
	INX
	CPX #$07
	BNE bra_07_E11F
	LDA $22
	CLC
	ADC #$C0
	STA $25
	LDX #$00
bra_07_E137:
	LDA $25
	STA $0596,X
	CLC
	ADC #$08
	STA $25
	INX
	CPX #$04
	BNE bra_07_E137
	LDA флаг_обновления_тайлов_экрана
	ORA #$40
	STA флаг_обновления_тайлов_экрана
_loc_07_E14E:
	PLA
	JMP _главный_банксвич_PRG

table_07_E153:
.byte $5C,$5D,$5E,$5F,$6C,$6D,$6E,$6F

_loc_07_E15B:
	LDA #$00
	STA $28
	LDA набор_луж
	STA $29
bra_07_E164:
	LSR $29
	DEY
	BPL bra_07_E164
	BCC bra_07_E16F
	LDA #$10
	STA $28
bra_07_E16F:
	RTS

_loc_07_E170_нарисовать_надпись_в_статусбаре:
	LDA вид_статусбара
	BMI @продолжить
	RTS
@продолжить:
	LDA байт_для_2000
	AND #$FB
	STA байт_для_2000
	STA $2000
	LDA $05F9
	BEQ bra_07_E1F8
	LDA вид_статусбара
	AND #$7F
	ASL
	TAY
	LDA table_07_E219,Y
	STA $0C
	LDA table_07_E219 + 1,Y
	STA $0D
	LDA $2002
	LDA #$2B
	STA $2006
	LDA #$06
	STA $2006
	LDY #$00
bra_07_E1A4:
	LDA ($0C),Y
	STA $2007
	INY
	CPY #$15
	BCC bra_07_E1A4
	LDA $2002
	LDA #$2B
	STA $2006
	LDA #$26
	STA $2006
bra_07_E1BB:
	LDA ($0C),Y
	STA $2007
	INY
	CPY #$29
	BCC bra_07_E1BB
	LDA $2002
	LDA #$2B
	STA $2006
	LDA #$46
	STA $2006
bra_07_E1D2:
	LDA ($0C),Y
	STA $2007
	INY
	CPY #$3E
	BCC bra_07_E1D2
	LDA вид_статусбара
	AND #$7F
	STA вид_статусбара
	CMP #СТАТУСБАР_GOAL
	BEQ bra_07_E1EF
	CMP #СТАТУСБАР_GAME_SET
	BEQ bra_07_E1EF
	RTS
bra_07_E1EF:
	LDA #$00
	STA $05FA
	STA задержка_переливания_надписи
	RTS
bra_07_E1F8:
	LDA $2002
	LDA #$2B
	STA $2006
	LDA #$F0
	STA $2006
	LDX #$07
	LDA #$AA
bra_07_E209:
	STA $2007
	DEX
	BPL bra_07_E209
	INC $05F9
	RTS

table_07_E219:		; везде по 62 (3E) байта
.word table_07_E219_E227
.word table_07_E219_E265
.word table_07_E219_E2A3
.word table_07_E219_E2E1
.word table_07_E219_E31F
.word table_07_E219_E35D
.word table_07_E219_E39B

table_07_E219_E227:
.byte $02,$32,$62,$63,$64,$65,$66,$67,$0C,$68,$69,$02,$07,$08,$09,$6B,$37,$6D,$6E,$61,$02,$02,$42,$72,$73,$74,$75,$76,$02,$77,$78,$02,$02,$17,$18,$6A,$7B,$7C,$7D,$7E,$7F,$02,$10,$11,$12,$13,$20,$21,$22,$23,$34,$35,$79,$27,$28,$7A,$71,$02,$48,$58,$02,$02

table_07_E219_E265:
.byte $02,$02,$02,$02,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$4C,$02,$02,$02,$02,$02,$02,$02,$02,$02,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$02,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F,$02,$02,$02,$02,$02

table_07_E219_E2A3:
.byte $04,$05,$06,$30,$31,$32,$33,$0A,$4C,$36,$37,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F,$60,$61,$14,$15,$16,$40,$41,$42,$43,$44,$45,$46,$47,$02,$49,$4A,$4B,$42,$4D,$4E,$4F,$70,$24,$25,$1D,$50,$51,$52,$53,$54,$55,$56,$57,$02,$59,$5A,$5B,$5C,$5D,$5E,$5F,$71,$02

table_07_E219_E2E1:
.byte $02,$02,$02,$02,$02,$02,$32,$80,$81,$0C,$68,$69,$0E,$4C,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$42,$90,$91,$77,$78,$02,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$52,$02,$02,$23,$34,$35,$2E,$2F,$02,$02,$02,$02,$02,$02,$02

table_07_E219_E31F:
.byte $02,$0C,$6C,$09,$A0,$B1,$84,$85,$86,$93,$33,$87,$88,$89,$8A,$97,$B5,$B6,$B7,$B8,$02,$02,$77,$6F,$82,$B0,$47,$94,$95,$96,$A3,$B2,$7D,$98,$99,$9A,$02,$A7,$A8,$B9,$BA,$02,$83,$02,$92,$A1,$A2,$A4,$A5,$A6,$B3,$B4,$48,$5D,$A9,$AA,$02,$83,$02,$8B,$02,$02

table_07_E219_E35D:
.byte $0C,$80,$8F,$9B,$9C,$9D,$6B,$37,$6D,$6E,$61,$32,$62,$63,$64,$65,$66,$67,$0C,$68,$69,$77,$8C,$8D,$AB,$AC,$AD,$7B,$7C,$7D,$7E,$7F,$42,$72,$73,$74,$75,$76,$02,$77,$78,$8E,$02,$5F,$BB,$BC,$5F,$9E,$9F,$48,$AE,$AF,$10,$11,$12,$13,$20,$21,$22,$23,$34,$35

table_07_E219_E39B:
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02

_loc_07_E3D9:
	LDA $BFFF
	PHA
	LDA номер_prg_банка
	JSR _главный_банксвич_PRG
	LDA байт_для_2000
	AND #$FB
	STA байт_для_2000
	STA $2000
	LDA покрытие_поля_лужами
	ASL
	TAY
; чтение из банка 01 до разводки
	LDA $8014,Y
	STA $2C
	LDA $8015,Y
	STA $2D
	LDA камера_X_lo
	LSR
	LSR
	LSR
	STA $1C
	STA $1F
	LDA камера_X_hi
	JSR _loc_07_E481
	LDA #$1E
	STA $1D
	LDA #$20
	STA $20
	LDY #$00
	JSR _loc_07_E4AF
	LDA камера_X_hi
	CLC
	ADC #$04
	JSR _loc_07_E481
	LDA #$10
	STA $1D
	LDA #$28
	STA $20
	LDA $1C
	STA $1F
	LDY #$00
	JSR _loc_07_E4AF
	LDA покрытие_поля_лужами
	ASL
	TAY
; чтение из банка 01 после разводки
	LDA $801C,Y
	STA $2C
	LDA $801D,Y
	STA $2D
	LDA камера_X_lo
	LSR
	LSR
	LSR
	LSR
	LSR
	CLC
	ADC #$C0
	STA $1C
	STA $1F
	LDA камера_X_hi
	JSR _loc_07_E481
	LDA #$08
	STA $1D
	LDA #$23
	STA $20
	JSR _loc_07_E538
	LDA камера_X_hi
	CLC
	ADC #$04
	JSR _loc_07_E481
	LDA #$04
	STA $1D
	LDA #$2B
	STA $20
	LDA $1C
	STA $1F
	JSR _loc_07_E538
	JSR _loc_07_E5A1
	PLA
	JMP _главный_банксвич_PRG

_loc_07_E481:
	STA $22
	TAY
	JSR _loc_07_E15B
	LDA $22
	ASL
	CLC
	ADC $28
	TAY
	LDA ($2C),Y
	STA $2E
	INY
	LDA ($2C),Y
	STA $2F
	INC $22
	LDY $22
	JSR _loc_07_E15B
	LDA $22
	ASL
	CLC
	ADC $28
	TAY
	LDA ($2C),Y
	STA $30
	INY
	LDA ($2C),Y
	STA $31
	RTS

_loc_07_E4AF:
	LDA #$00
	STA $1E
_loc_07_E4B3:
	JSR _loc_07_E52A
	LDA #$00
	STA $21
	LDA $2E
	STA $32
	LDA $2F
	STA $33
_loc_07_E4C2:
bra_07_E4C2:
	LDA $1E
	ASL
	TAY
	LDA ($32),Y
	STA $34
	INY
	LDA ($32),Y
	STA $35
	LDA $1F
	AND #$1F
	TAY
	LDA ($34),Y
	STA $2007
	INC $21
	LDA $21
	CMP #$20
	BEQ bra_07_E500
	INC $1F
	LDA $1F
	ORA #$E0
	CMP #$E0
	BNE bra_07_E4C2
	LDA $1F
	SEC
	SBC #$20
	STA $1F
	JSR _loc_07_E52A
	LDA $30
	STA $32
	LDA $31
	STA $33
	JMP _loc_07_E4C2
bra_07_E500:
	INC $1F
	LDA $1F
	ORA #$E0
	CMP #$E0
	BNE bra_07_E511
	LDA $1F
	SEC
	SBC #$20
	STA $1F
bra_07_E511:
	INC $1E
	LDA $1E
	CMP $1D
	BEQ bra_07_E529
	LDA $1F
	CLC
	ADC #$20
	STA $1F
	LDA $20
	ADC #$00
	STA $20
	JMP _loc_07_E4B3
bra_07_E529:
	RTS

_loc_07_E52A:
	LDA $2002
	LDA $20
	STA $2006
	LDA $1F
	STA $2006
	RTS

_loc_07_E538:
	LDA #$00
	STA $1E
_loc_07_E53C:
	JSR _loc_07_E52A
	LDA #$00
	STA $21
	LDA $2E
	STA $32
	LDA $2F
	STA $33
_loc_07_E54B:
bra_07_E54B:
	LDA $1F
	SEC
	SBC #$C0
	TAY
	LDA ($32),Y
	STA $2007
	INC $21
	LDA $21
	CMP #$08
	BEQ bra_07_E57D
	INC $1F
	LDA $1F
	ORA #$F8
	CMP #$F8
	BNE bra_07_E54B
	LDA $1F
	SEC
	SBC #$08
	STA $1F
	JSR _loc_07_E52A
	LDA $30
	STA $32
	LDA $31
	STA $33
	JMP _loc_07_E54B
bra_07_E57D:
	INC $1F
	LDA $1F
	ORA #$F8
	CMP #$F8
	BNE bra_07_E58E
	LDA $1F
	SEC
	SBC #$08
	STA $1F
bra_07_E58E:
	INC $1E
	LDA $1E
	CMP $1D
	BEQ bra_07_E5A0
	LDA $1F
	CLC
	ADC #$08
	STA $1F
	JMP _loc_07_E53C
bra_07_E5A0:
	RTS

_loc_07_E5A1:
	LDA $2002
	LDA #$2A
	STA $2006
	LDA #$00
	STA $2006
	LDY #$00
bra_07_E5B0:
	LDA table_07_E610,Y
	STA $2007
	INY
	CPY #$E0
	BNE bra_07_E5B0
	LDA $2002
	LDA #$2A
	STA $2006
	LDA #$E0
	STA $2006
	LDY #$00
	LDA #$0F
bra_07_E5CC:
	STA $2007
	INY
	CPY #$E0
	BNE bra_07_E5CC
	LDA $2002
	LDA #$2B
	STA $2006
	LDA #$E0
	STA $2006
	LDY #$00
	LDA #$AA
bra_07_E5E5:
	STA $2007
	INY
	CPY #$20
	BNE bra_07_E5E5
	LDA $2002
	LDA #$2B
	STA $2006
	LDA #$E0
	STA $2006
	LDY #$00
bra_07_E5FC:
	LDA table_07_E608,Y
	STA $2007
	INY
	CPY #$08
	BNE bra_07_E5FC
	RTS

table_07_E608:
.byte $AA,$AA,$AA,$AA,$AA,$FA,$EA,$BA

table_07_E610:
.byte $0F,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte $FA,$FA,$FA,$FA,$FD,$FA,$FA,$FA
.byte $FA,$FA,$FA,$FD,$FA,$FA,$FA,$FA
.byte $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
.byte $0F,$0F,$0F,$0F,$7E,$0F,$0F,$0F
.byte $0F,$0F,$0F,$7E,$0F,$0F,$0F,$0F
.byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
.byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
.byte $0F,$0F,$0F,$0F,$7E,$1D,$3C,$1C
.byte $3C,$3C,$1C,$7E,$0F,$0F,$0F,$0F
.byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
.byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
.byte $0F,$0F,$0F,$0F,$7E,$2E,$0E,$2C
.byte $2D,$0E,$2F,$7E,$0F,$0F,$0F,$0F
.byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
.byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
.byte $0F,$0F,$0F,$0F,$7E,$1F,$3D,$1E
.byte $3D,$3D,$1E,$7E,$0F,$0F,$0F,$0F
.byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
.byte $0F,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte $FA,$FA,$FA,$FA,$7C,$FA,$FA,$FA
.byte $FA,$FA,$FA,$7C,$FA,$FA,$FA,$FA
.byte $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
.byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
.byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
.byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F

.export _b07_E6F0
_b07_E6F0:
	LDA $BFFF
	PHA
	LDA номер_prg_банка
	JSR _главный_банксвич_PRG
	LDA координата_X_lo,X
	LSR
	LSR
	LSR
	STA $1C
	LDA координата_X_hi,X
	STA $1D
	LDA координата_Y_hi,X
	BNE bra_07_E725
	LDA координата_Y_lo,X
	CMP #$F0
	BCC bra_07_E737
	LDA #$04
	STA $1F
	LDA координата_Y_lo,X
	SEC
	SBC #$F0
	LSR
	LSR
	LSR
	STA $1E
	JMP _loc_07_E743
bra_07_E725:
	LDA #$04
	STA $1F
	LDA координата_Y_lo,X
	CLC
	ADC #$10
	LSR
	LSR
	LSR
	STA $1E
	JMP _loc_07_E743
bra_07_E737:
	LDA #$00
	STA $1F
	LDA координата_Y_lo,X
	LSR
	LSR
	LSR
	STA $1E
_loc_07_E743:
	LDA $1D
	CLC
	ADC $1F
	STA $20
	TAY
	LDA набор_луж
	STA $29
	LDA #$00
	STA $21
bra_07_E754:
	LSR $29
	DEY
	BPL bra_07_E754
	BCC bra_07_E75F
	LDA #$10
	STA $21
bra_07_E75F:
	LDA $20
	ASL
	CLC
	ADC $21
	TAY
; тут походу регулярно проверяется каждый видимый объект с поверхностью поля
	LDA ($40),Y
	STA $2E
	INY
	LDA ($40),Y
	STA $2F
	LDA $1E
	ASL
	TAY
	LDA ($2E),Y
	STA $2C
	INY
	LDA ($2E),Y
	STA $2D
	LDY $1C
	LDA ($2C),Y
	BMI bra_07_E78D
	CMP #$40
	BCC bra_07_E798
	CMP #$6C
	BCC bra_07_E7C8
	JMP _loc_07_E7BD
bra_07_E78D:
	CMP #$95
	BCC bra_07_E798
	CMP #$E8
	BCC bra_07_E7C8
	JMP _loc_07_E7BD
bra_07_E798:
	LDA цвет_поля
	CMP #$04
	BEQ bra_07_E7B3
	AND #$01
	BEQ bra_07_E7C8
	LDA опция_поверхность_влажность
	AND #$0F
	CLC
	ADC #$01
	BNE _loc_07_E7D1_запись_в_013x
bra_07_E7B3:
	LDA #$03
	BNE _loc_07_E7D1_запись_в_013x
_loc_07_E7BD:
	LDA цвет_поля
	AND #$01
	BEQ bra_07_E7C9
bra_07_E7C8:
	LDA #$00
	JMP _loc_07_E7D1_запись_в_013x
bra_07_E7C9:
	LDA опция_поверхность_влажность
	AND #$0F
	CLC
	ADC #$01
_loc_07_E7D1_запись_в_013x:
	STA игрок_на_поверхности,X
	PLA
	JMP _главный_банксвич_PRG

_loc_07_E7D9:
	LDA $BFFF
	PHA
	LDA #$01
	JSR _главный_банксвич_PRG
; покрытие поля лужами, нужен импорт из банка 01
	LDA покрытие_поля_лужами
	ASL
	TAY
	LDA $8014,Y
	STA $40
	LDA $8015,Y
	STA $41
	PLA
	JMP _главный_банксвич_PRG

.export _b07_E828
_b07_E828:		; вероятно чтение хедера экранов, а дальше чтение подключение нужных банков схр, чтение сжатой нмт из ппу и запись распаковки
	STA $2C
	LDA #$00
	STA $2D
	ASL $2C
	ROL $2D
	ASL $2C
	ROL $2D
	ASL $2C
	ROL $2D
	LDA $2C
	ADC #< table_07_EA18
	STA $2C
	LDA $2D
	ADC #> table_07_EA18
	STA $2D
	LDY #$00
	LDA ($2C),Y
	STA $1F
	INY
	LDA ($2C),Y
	STA $20
	INY
	INY
	LDA ($2C),Y
	STA $26
	INY
	LDA ($2C),Y
	STA $27
	INY
	LDA ($2C),Y
	STA $28
	INY
	LDA ($2C),Y
	STA $29
	INY
	LDA ($2C),Y
	STA $2B
	LDY #$02
	LDA ($2C),Y
	ASL
	TAY
	LDA table_07_EA12,Y
	STA $2E
	LDA table_07_EA12 + 1,Y
	STA $2F
	LDA #МУЗЫКА_ВЫКЛЮЧИТЬ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _b07_ECA9
	JSR _b07_выключить_NMI
	JSR _b07_выключить_рендеринг
	BIT $1F
	BVS bra_07_E895
; еще не использовалось, выяснить можно ли удалить
	JSR _loc_07_E8BA
	JMP _loc_07_E898
bra_07_E895:
	JSR _loc_07_E8E6
_loc_07_E898:
	LDA $2B
	BMI bra_07_E89F
	STA $A000
bra_07_E89F:
	LDA $26
	STA банк_фона
	LDA $27
	STA банк_фона + 1
	LDA $28
	STA номер_палитры_фона
	LDA $29
	STA номер_палитры_фона + 1
	JSR _b07_включить_рендеринг
	JMP _b07_включить_NMI

_loc_07_E8BA:		; еще не использовался
					; чтение 800F 8010 либо из банка 01, либо из 2, судя по цепочке кода и импорту (или нет, хз)
					; видимо никогда не будет использован, поскольку в E828
						; в адрес 1F пишется байт, в котором всегда бит 6 = 1, поэтому проверка на этот бит
						; всегда перескакивает прыжок на этот код. можно удалить
	LDA $BFFF
	PHA
	LDA $1F
	JSR _главный_банксвич_PRG
	LDA $800F
	STA $34
	LDA $8010
	STA $35
	LDA $20
	ASL
	TAY
	LDA ($34),Y
	STA $2C
	INY
	LDA ($34),Y
	STA $2D
	LDA #$FF
	STA $2A
	JSR _loc_07_E941
	PLA
	JMP _главный_банксвич_PRG

_loc_07_E8E6:
	LDA банк_спрайтов
	PHA
	LDA банк_спрайтов + 1
	PHA
	LDA банк_спрайтов + 2
	PHA
	LDA банк_спрайтов + 3
	PHA
	LDA $1F
	TAX
	STX банк_фона
	INX
	INX
	STX банк_фона + 1
	INX
	INX
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 1
	INX
	STX банк_спрайтов + 2
	INX
	STX банк_спрайтов + 3
	LDA $20
	ASL
	TAY
	LDA table_07_EB42,Y
	STA $2C
	LDA table_07_EB42 + 1,Y
	STA $2D
	LDA #$00
	STA $2A
	JSR _b07_запись_банков_спрайтов
	JSR _loc_07_EE7D_запись_банков_фона
	JSR _loc_07_E941
	PLA
	STA банк_спрайтов + 3
	PLA
	STA банк_спрайтов + 2
	PLA
	STA банк_спрайтов + 1
	PLA
	STA банк_спрайтов
	JMP _b07_запись_банков_спрайтов

_loc_07_E941:
	LDA #$00
	STA $A000
_loc_07_E946:
	JSR _loc_07_E9D2
	LDA $1C
	BEQ bra_07_E95D
	AND #$C0
	ASL
	ROL
	ROL
	JSR _b07_EC8F

table_07_E955:		; байты после JSR
.word table_07_E955_E95E
.word table_07_E955_E96F
.word table_07_E955_E980
.word table_07_E955_E9A3

bra_07_E95D:		; прыжок на RTS можно переместить повыше, взяв другой RTS (который я уже удалил), а этот удалить. проверить что не нужен
	RTS

table_07_E955_E95E:
	LDA $1C
	AND #$3F
	TAX
	JSR _loc_07_E9D2
bra_07_E966:
	JSR _loc_07_E9F9
	DEX
	BNE bra_07_E966
	JMP _loc_07_E946

table_07_E955_E96F:
	LDA $1C
	AND #$3F
	TAX
bra_07_E974:
	JSR _loc_07_E9D2
	JSR _loc_07_E9F9
	DEX
	BNE bra_07_E974
	JMP _loc_07_E946

table_07_E955_E980:
	LDA $1C
	AND #$3F
	STA $1D
	JSR _loc_07_E9D2
	LDA $1C
	STA $1E
	JSR _loc_07_E9D2
	LDX $1D
bra_07_E992:
	JSR _loc_07_E9F9
	DEX
	BNE bra_07_E992
	LDX $1E
bra_07_E99A:
	JSR _loc_07_E9F9
	DEX
	BNE bra_07_E99A
	JMP _loc_07_E946

table_07_E955_E9A3:
	LDA $1C
	AND #$3F
	STA $1D
	JSR _loc_07_E9D2
	LDA $1C
	STA $1E
	LDA $2C
	STA $32
	LDA $2D
	STA $33
bra_07_E9B8:
	LDX $1E
	LDA $32
	STA $2C
	LDA $33
	STA $2D
bra_07_E9C2:
	JSR _loc_07_E9D2
	JSR _loc_07_E9F9
	DEX
	BNE bra_07_E9C2
	DEC $1D
	BNE bra_07_E9B8
	JMP _loc_07_E946

_loc_07_E9D2:
	LDY #$00
	LDA ($2C),Y
	BIT $2A
	BMI bra_07_E9F0
	LDA $2002
	LDA $2D
	STA $0415
	STA $2006
	LDA $2C
	STA $2006
	LDA $2007
	LDA $2007
bra_07_E9F0:
	STA $1C
	INC $2C
	BNE @RTS
	INC $2D
@RTS:
	RTS

_loc_07_E9F9:
	LDA $2002
	LDA $2F
	STA $2006
	LDA $2E
	STA $2006
	LDA $1C
	STA $2007
	INC $2E
	BNE @RTS
	INC $2F
@RTS:
	RTS

table_07_EA12:
.byte $00,$20
.byte $60,$22
.byte $E0,$20

table_07_EA18:		; сделать в таблице байт чтобы отвечал за необходимость выключить музыку перед переходом на новый экран
.byte $76,$00,$00,$6E,$02,$44,$43,$FF
.byte $76,$01,$00,$6C,$02,$3A,$3B,$FF
.byte $76,$02,$00,$5E,$02,$15,$16,$FF
.byte $76,$03,$00,$5E,$02,$15,$16,$FF
.byte $76,$04,$00,$30,$02,$15,$16,$FF
.byte $76,$05,$00,$30,$02,$19,$39,$01
.byte $76,$06,$00,$5E,$02,$15,$16,$FF
.byte $76,$07,$00,$5E,$02,$15,$16,$01
.byte $76,$08,$00,$5E,$02,$17,$18,$FF
.byte $76,$09,$00,$30,$02,$15,$16,$FF
.byte $76,$0A,$00,$60,$02,$19,$1A,$00
.byte $76,$0B,$00,$62,$02,$1C,$1C,$FF
.byte $76,$0C,$00,$30,$02,$19,$1A,$FF
.byte $7A,$10,$00,$5E,$02,$1B,$1B,$FF
.byte $76,$0D,$00,$5E,$02,$15,$16,$FF
.byte $7A,$0E,$00,$5E,$02,$15,$16,$FF
.byte $7A,$13,$00,$64,$66,$10,$0A,$FF
.byte $7A,$11,$00,$64,$66,$10,$0A,$FF
.byte $7A,$12,$00,$64,$66,$10,$0A,$FF
.byte $7A,$0F,$00,$30,$02,$15,$16,$FF
.byte $7A,$14,$00,$5E,$02,$15,$16,$FF
.byte $7A,$15,$00,$5E,$02,$15,$16,$FF
.byte $7A,$16,$01,$30,$02,$19,$39,$01
.byte $7A,$17,$01,$30,$02,$19,$39,$01
.byte $7A,$18,$01,$30,$02,$19,$39,$01
.byte $7A,$19,$01,$30,$02,$19,$39,$01
.byte $7A,$1A,$01,$30,$02,$19,$39,$01
.byte $7A,$1B,$01,$30,$02,$19,$39,$01
.byte $7E,$1C,$00,$12,$02,$49,$49,$FF
.byte $7E,$1D,$02,$12,$02,$49,$49,$FF
.byte $7E,$1E,$02,$12,$02,$49,$49,$FF
.byte $7E,$1F,$02,$12,$02,$49,$49,$FF
.byte $7E,$20,$02,$12,$02,$49,$49,$FF
.byte $7E,$21,$02,$12,$02,$49,$49,$FF
.byte $7E,$22,$02,$12,$02,$49,$49,$FF
.byte $7E,$23,$02,$12,$02,$49,$49,$FF
.byte $7E,$24,$02,$12,$02,$49,$49,$FF

table_07_EB42:
.byte $00,$00
.byte $7A,$00
.byte $71,$01
.byte $46,$02
.byte $DF,$03
.byte $14,$05
.byte $64,$08
.byte $12,$09
.byte $AF,$0A
.byte $07,$0B
.byte $00,$0C
.byte $AA,$0D
.byte $A4,$0E
.byte $6A,$0F
.byte $9A,$00
.byte $9A,$00
.byte $B6,$01
.byte $39,$03
.byte $64,$07
.byte $51,$09
.byte $3E,$0B
.byte $FF,$0B
.byte $D3,$0C
.byte $61,$0D
.byte $E3,$0D
.byte $6E,$0E
.byte $FB,$0E
.byte $89,$0F
.byte $0F,$00
.byte $DD,$00
.byte $EF,$01
.byte $D6,$02
.byte $9B,$03
.byte $6B,$04
.byte $1A,$05
.byte $EF,$05
.byte $BF,$06

.export _b07_EB8C
_b07_EB8C:
	LDA #$00
	STA $1C
	STA $1D
	LDY $F4
	LDA номер_экрана
	BEQ bra_07_EBAD
	CMP #$01
	BEQ bra_07_EBAD
	CMP #$03
	BEQ bra_07_EBAD
	LDA номер_анимации,X
	AND #$7F
	CMP #$7F
	BEQ bra_07_EBEC
	TXA
	JMP _loc_07_EBE7
bra_07_EBAD:
	LDA координата_Z_hi,X
	BPL bra_07_EBBF
	BEQ bra_07_EBBF
	TXA
	ORA #$40
	STA приоритет_отрисовки_спрайта,Y
	INY
	INC $F4
	INC $1C
bra_07_EBBF:
	LDA номер_анимации,X
	AND #$7F
	CMP #$7F
	BEQ bra_07_EBD6
	CPX #$0C
	BNE bra_07_EBCE
	JSR _loc_07_EBED
bra_07_EBCE:
	TXA
	ORA $1D
	STA приоритет_отрисовки_спрайта,Y
	INC $F4
bra_07_EBD6:
	LDA $1C
	BNE bra_07_EBEC
	CPX #$0D
	BCS bra_07_EBEC
	LDA состояние_игрока,X
	BPL bra_07_EBEC
	TXA
	ORA #$20
	INY
_loc_07_EBE7:
	STA приоритет_отрисовки_спрайта,Y
	INC $F4
bra_07_EBEC:
	RTS

_loc_07_EBED:
	LDA флаг_прозрачного_мяча
	BNE bra_07_EC13
	SEC
	LDA координата_X_lo,X
	SBC #$88
	LDA координата_X_hi,X
	SBC #$00
	BMI bra_07_EC7E
	SEC
	LDA координата_X_lo,X
	SBC #$78
	LDA координата_X_hi,X
	SBC #$03
	BPL bra_07_EC7E
	RTS
bra_07_EC13:
	BMI bra_07_EC84
	AND #$01
	BNE bra_07_EC84
	LDA флаг_прозрачного_мяча
	AND #$02
	BEQ bra_07_EC82
	SEC
	LDA координата_Y_lo,X
	SBC #$E4
	LDA координата_Y_hi,X
	SBC #$00
	BCS bra_07_EC84
	SEC
	LDA координата_Y_lo,X
	SBC координата_Z_lo,X
	STA $2C
	LDA координата_Y_hi,X
	SBC координата_Z_hi,X
	STA $2D
	SEC
	LDA $2C
	SBC #$70
	LDA $2D
	SBC #$00
	BMI bra_07_EC5D
	SEC
	LDA $2C
	SBC #$A5
	LDA $2D
	SBC #$00
	BPL bra_07_EC84
	JMP _loc_07_EC7E
bra_07_EC5D:
	SEC
	LDA координата_Y_lo,X
	SBC #$70
	LDA координата_Y_hi,X
	SBC #$00
	BMI bra_07_EC84
	SEC
	LDA координата_Y_lo,X
	SBC #$E4
	LDA координата_Y_hi,X
	SBC #$00
	BPL bra_07_EC84
	JMP _loc_07_EC82
_loc_07_EC7E:
bra_07_EC7E:
	LDA #$80
	STA $1D
_loc_07_EC82:
bra_07_EC82:
	INC $1C
bra_07_EC84:
	RTS

.export _b07_EC8F
_b07_EC8F:
	ASL
	TAY
	INY
	PLA
	STA $0C
	PLA
	STA $0D
	TXA
	PHA
	LDA ($0C),Y
	TAX
	INY
	LDA ($0C),Y
	STA $0D
	STX $0C
	PLA
	TAX
	JMP ($000C)

.export _b07_ECA9
_b07_ECA9:
	PHA
	LDA флаг_NMI
	PHA
	LDA #NMI_ОТКЛЮЧИТЬ
	STA флаг_NMI
	LDA байт_для_2000		; тут лучше сделать jsr на _b07_включить_NMI
	ORA #$80
	STA байт_для_2000
	STA $2000
	LDA #$0F
	STA $4015
@ожидание_vblank:
	BNE @ожидание_vblank
.export _b07_выключить_рендеринг
_b07_выключить_рендеринг:
	LDA байт_для_2001
	AND #$E7
_запись_в_2001:
	STA байт_для_2001
	STA $2001
	RTS

.export _b07_включить_рендеринг
_b07_включить_рендеринг:
	LDA байт_для_2001
	ORA #$18
	BNE _запись_в_2001

; ECEB
_очистка_nametable_и_палитры:
	LDA байт_для_2000
	AND #$FB		; писать в 2006 с увеличением 01
	STA $2000
	STA байт_для_2000
	LDA $2002
	LDY #$20
	STY $2006
	LDX #$00
	STX $2006
	LDY #$0F
@цикл_очистки_nmt:	; начальный X = 00
	STX $2007
	INX
	BNE @цикл_очистки_nmt
	DEY
	BPL @цикл_очистки_nmt
	LDA #$3F
	STA $2006
	LDA #$00
	STA $2006
	LDX #$20
	LDA #$0F
@цикл_очистки_палитры:
	STA $2007
	DEX
	BNE @цикл_очистки_палитры
	RTS

_loc_07_EDCD_чтение_регистров_джойстиков:
; свободные адреса $0C и $0D
	LDX #$01
	STX $4016
	DEX
	STX $4016
@цикл_опроса_регистров:
	LDY #$08
@цикл_записи_кнопок:
	LDA $4016
	LSR
	ROL одноразовые_кнопки,X
	LDA $4017
	LSR
	ROL одноразовые_кнопки + 1,X
	DEY
	BNE @цикл_записи_кнопок
	INX
	INX
	CPX #$04
	BCC @цикл_опроса_регистров
	LDX #$03
@цикл_удержанных_кнопок:
	LDA одноразовые_кнопки,X
	TAY
	EOR удержанные_кнопки,X
	AND одноразовые_кнопки,X
	STA одноразовые_кнопки,X
	TYA
	STA удержанные_кнопки,X
	DEX
	BPL @цикл_удержанных_кнопок
	RTS

.export _b07_вращение_колеса_фортуны
_b07_вращение_колеса_фортуны:
; bzk улучшить рандом
.SCOPE
temp = $0C
	TXA
	PHA
	TYA
	PHA
	LDX #$00
	LDY #$02
	LDA адрес_рандома,X
	AND #$02
	STA temp
	LDA адрес_рандома + 1,X
	AND #$02
	EOR temp
	CLC
	BEQ @цикл
	SEC
@цикл:
	ROR адрес_рандома,X
	INX
	DEY
	BNE @цикл
	PLA
	TAY
	PLA
	TAX
	LDA адрес_рандома
	RTS
.ENDSCOPE

; EE5A
_запись_2003_4014:
	LDA #$00
	STA $2003
	LDA #$02
	STA $4014
	RTS

.export _b07_включить_NMI
_b07_включить_NMI:
	PHA
	LDA байт_для_2000
	ORA #$80
	STA байт_для_2000
	STA $2000
	PLA
	RTS

.export _b07_выключить_NMI
_b07_выключить_NMI:
	PHA
	LDA байт_для_2000
	AND #$7F
	STA байт_для_2000
	STA $2000
	PLA
	RTS

_loc_07_EE7D_запись_банков_фона:
	LDA #$00
	STA байт_для_8000
	STA $8000
	LDA банк_фона
	STA $8001
	LDA #$01
	STA байт_для_8000
	STA $8000
	LDA банк_фона + 1
	STA $8001
	RTS

.export _b07_запись_банков_спрайтов
_b07_запись_банков_спрайтов:
	LDA #$02
	STA байт_для_8000
	STA $8000
	LDA банк_спрайтов
	STA $8001
	LDA #$03
	STA байт_для_8000
	STA $8000
	LDA банк_спрайтов + 1
	STA $8001
	LDA #$04
	STA байт_для_8000
	STA $8000
	LDA банк_спрайтов + 2
	STA $8001
	LDA #$05
	STA байт_для_8000
	STA $8000
	LDA банк_спрайтов + 3
	STA $8001
	RTS

; EED3
_главный_банксвич_PRG:
; на вход подается A, хранящий номер банка, на который нужно переключиться
; этот A пихается в стек, затем читается из стека и умножается на 2
; добавляется 01 и пишется пишется в 8001 с 07, потом снова читается, умножается на 2 и пишется в 8001 с 06
; вроде бы предварительно сохраняется байт из BFFF в стеке, чтобы знать куда вернуться
	; затем прыжок сюда, затем выполнение кода банка, затем восстановление байта и снова прыжок сюда
	PHP
	PHA
	TXA
	PHA
	LDA #$07
	STA байт_для_8000
	STA $8000
	TSX
	LDA $0102,X
	ASL
	ORA #$01
	STA $8001
	LDA #$06
	STA байт_для_8000
	STA $8000
	LDA $0102,X
	ASL
	STA $8001
	PLA
	TAX
	PLA
	PLP
	RTS

.export _b07_обнуление_ZP_с_X_до_F8
_b07_обнуление_ZP_с_X_до_F8:
; на выходе должно остаться A = 00
	LDA #$00
@цикл:
	STA $00,X
	INX
	CPX #$F9		; 00F9-00FF не обнуляются
	BCC @цикл
	RTS

_скрытие_всех_спрайтов:
	LDX #$FC
	LDA #$F8
@цикл:
	STA спрайт_Y,X
	CPX #$00
	BEQ @RTS
	DEX
	DEX
	DEX
	DEX
	JMP @цикл
@RTS:
	RTS

.export _b07_EF54_отобразить_спрайты_слева_8_пикселей
_b07_EF54_отобразить_спрайты_слева_8_пикселей:
	LDA байт_для_2001
	ORA #$02
	BNE bra_07_EF5E___запись_в_2001
_loc_07_EF5A_скрыть_спрайты_и_фон_слева_8_пикселей:
	LDA байт_для_2001
	AND #$F9
bra_07_EF5E___запись_в_2001:
	STA байт_для_2001
	STA $2001
	RTS

_очистка_ppu_и_спрайтов:		; 2 прыжка
	JSR _b07_выключить_рендеринг
	JSR _очистка_nametable_и_палитры
	JSR _скрытие_всех_спрайтов
	JSR _b07_ECA9
	JMP _запись_2003_4014

.export _b07_EFAD_работа_с_видеопамятью
_b07_EFAD_работа_с_видеопамятью:
	LDA номер_экрана
	BNE _loc_07_EFE5_запись_в_видеопамять_трех_буферов
	LDA подтип_экрана
	BEQ _loc_07_EFE5_запись_в_видеопамять_трех_буферов
	CMP #$05
	BCC bra_07_EFD4		; проверка на 00-04
	BEQ bra_07_EFCC		; проверка на 05
	CMP #$06
	BEQ bra_07_EFD4
	CMP #$08
	BEQ bra_07_EFCC
	CMP #$0A
	BEQ bra_07_EFCC
	JMP _loc_07_EFE5_запись_в_видеопамять_трех_буферов
bra_07_EFCC:
	LDA байт_2006_hi_след
	BEQ _loc_07_EFE5_запись_в_видеопамять_трех_буферов
	LDA #$04
	JMP _b07_C344_банксвич_80xx
bra_07_EFD4:	; 60fps !!! любые отрисовки выполняются ежекадрово
	JSR _loc_07_EFE5_запись_в_видеопамять_трех_буферов
	JSR _loc_07_F0B4_нарисовать_поле_при_скроллинге
	JSR _loc_07_F166_нарисовать_сетку_ворот_после_гола
	JSR _loc_07_E170_нарисовать_надпись_в_статусбаре
	JSR _loc_07_D61A_нарисовать_информацию_статусбара
	JSR _loc_07_F340_нарисовать_таймер_и_следы
	RTS

_loc_07_EFE5_запись_в_видеопамять_трех_буферов:		; сюда есть 3 bxx
	LDA байт_2006_hi_атрибуты
	BMI @графика
	LDA байт_для_2000
	AND #$FB
	ORA бит_для_2000_атрибуты
	STA байт_для_2000
	STA $2000
	LDA $2002
	LDA байт_2006_hi_атрибуты
	STA $2006
	LDA байт_2006_lo_атрибуты
	STA $2006
	LDX #$00
	STX бит_для_2000_атрибуты
	LDY счетчик_буфера_атрибутов
@цикл_атрибутов:
	LDA буфер_атрибутов,X
	STA $2007
	INX
	DEY
	BNE @цикл_атрибутов
	LDA #$FF
	STA байт_2006_hi_атрибуты
@графика:
	LDA байт_2006_hi_графика
	BMI @палитра
	LDA байт_для_2000
	AND #$FB
	ORA бит_для_2000_графика
	STA байт_для_2000
	STA $2000
	LDA $2002
	LDA байт_2006_hi_графика
	STA $2006
	LDA байт_2006_lo_графика
	STA $2006
	LDX #$00
	STX бит_для_2000_графика
	LDY счетчик_буфера_графики
@цикл_графики:
	LDA буфер_графики,X
	STA $2007
	INX
	DEY
	BNE @цикл_графики
	LDA #$FF
	STA байт_2006_hi_графика
@палитра:
	LDA байт_2006_hi_палитра
	BMI @RTS
	LDA байт_для_2000
	AND #$FB
	ORA бит_для_2000_палитра
	STA байт_для_2000
	STA $2000
	LDA $2002
	LDA байт_2006_hi_палитра
	STA $2006
	LDA байт_2006_lo_палитра
	STA $2006
	LDX #$00
	STX бит_для_2000_палитра
	LDY счетчик_буфера_палитры
@цикл_палитры:
	LDA буфер_палитры,X
	STA $2007
	INX
	DEY
	BNE @цикл_палитры
	LDA байт_2006_hi_палитра
	CMP #$3F
	BNE @это_была_не_палитра
	LDA #$3F
	STA $2006
	LDA #$00
	STA $2006
	STA $2006
	STA $2006
@это_была_не_палитра:
	LDA #$FF
	STA байт_2006_hi_палитра
@RTS:
	RTS

_loc_07_F0B4_нарисовать_поле_при_скроллинге:
	LDA флаг_обновления_тайлов_экрана
	AND #$80
	BNE @скролл_поля_требует_отрисовки
	RTS
@скролл_поля_требует_отрисовки:
	LDA байт_для_2000
	ORA #$04		; увеличивать 2006 на 32 после запис
	STA байт_для_2000
	STA $2000
	LDA $2002
	LDA #$20
	STA $2006
	LDA байт_2006_lo_NMT_1
	STA $2006
	LDY #$1A
	LDX #$00
@цикл1:
	LDA тайлы_поля_NMT_1,X
	STA $2007
	INX
	DEY
	BNE @цикл1
	LDA $2002
	LDA #$28
	STA $2006
	LDA байт_2006_lo_NMT_2
	STA $2006
	LDX #$00
	LDY #$10
@цикл2:
	LDA тайлы_поля_NMT_2,X
	STA $2007
	INX
	DEY
	BNE @цикл2
	LDA флаг_обновления_тайлов_экрана
	AND #$7F		; очистить бит требования отрисовки поля при скролле
	STA флаг_обновления_тайлов_экрана
	LDA флаг_обновления_тайлов_экрана
	AND #$40
	BNE bra_07_F121
	JMP _loc_07_F15D
bra_07_F121:
	LDX #$00
_loc_07_F123:
	LDA $2002
	LDA #$23
	STA $2006
	LDA $058F,X
	STA $2006
	LDA $059A,X
	STA $2007
	INX
	CPX #$07
	BNE _loc_07_F123
	LDX #$00
_loc_07_F141:
	LDA $2002
	LDA #$2B
	STA $2006
	LDA $0596,X
	STA $2006
	LDA $05A1,X
	STA $2007
	INX
	CPX #$04
	BNE _loc_07_F141
_loc_07_F15D:
	LDA флаг_обновления_тайлов_экрана
	AND #$BF
	STA флаг_обновления_тайлов_экрана
	RTS

_loc_07_F166_нарисовать_сетку_ворот_после_гола:
.SCOPE
temp = $48		; хранение X
	LDA флаг_гола
	CMP #СЕТКА_БЕЗ_ИЗМЕНЕНИЙ
	BEQ @RTS
	JSR _продолжить
	LDA #СЕТКА_БЕЗ_ИЗМЕНЕНИЙ
	STA флаг_гола
@RTS:
	RTS

_продолжить:
	LDA байт_для_2000
	ORA #$04		; увеличивать 2006 на 32 после записи
	STA байт_для_2000
	STA $2000
	LDA $2002
	LDA флаг_гола
	AND #$7F
	CMP #СЕТКА_РВАНАЯ
	BNE _тайлы_обычной_сетки
	JMP _тайлы_рваной_сетки

_тайлы_обычной_сетки:
; флаг гола 80 = правая сетка
; в A сейчас 00 или 01
	ASL
	BIT флаг_гола
	BPL @чтение_таблицы
	ADC #$04
@чтение_таблицы:
	TAY
	LDA таблица_поинтеры_1,Y
	STA $0C
	LDA таблица_поинтеры_1 + 1,Y
	STA $0D
	LDX #$00
	BIT флаг_гола
	BPL @запись_в_temp
	LDX #$06
@запись_в_temp:
	STX temp
	LDA таблица_2006_1,X
	STA $2006
	LDA таблица_2006_1 + 1,X
	STA $2006
	LDY #$00
	LDX #$05
@цикл_1:
	LDA ($0C),Y
	STA $2007
	INY
	DEX
	BPL @цикл_1
	LDX temp
	LDA таблица_2006_1 + 2,X
	STA $2006
	LDA таблица_2006_1 + 3,X
	STA $2006
	LDX #$0A
@цикл_2:
	LDA ($0C),Y
	STA $2007
	INY
	DEX
	BPL @цикл_2
	LDX temp
	LDA таблица_2006_1 + 4,X
	STA $2006
	LDA таблица_2006_1 + 5,X
	STA $2006
	LDX #$05
@цикл_3:
	LDA ($0C),Y
	STA $2007
	INY
	DEX
	BPL @цикл_3
	RTS

таблица_2006_1:
.dbyt $2294, $2213, $21D2
.dbyt $228B, $220C, $21CD

таблица_поинтеры_1:
.word tbl_сетка_слева_обычная
.word tbl_сетка_слева_изогнутая
.word tbl_сетка_справа_обычная
.word tbl_сетка_справа_изогнутая

tbl_сетка_слева_обычная:
.byte $04,$00,$00,$04,$04,$00
.byte $04,$00,$00,$04,$04,$B4,$99,$D4,$CA,$9A,$AA
.byte $B4,$C4,$D4,$97,$A8,$B8

tbl_сетка_слева_изогнутая:
.byte $AE,$BE,$CE,$DE,$CF,$DF
.byte $BC,$CC,$DC,$9E,$AD,$BD,$CD,$DD,$9F,$AF,$BF
.byte $9C,$AC,$BB,$CB,$DB,$9D

tbl_сетка_справа_обычная:
.byte $04,$00,$00,$04,$04,$00
.byte $04,$00,$00,$04,$04,$B0,$99,$D0,$A9,$B9,$C9
.byte $B0,$C0,$D0,$95,$A5,$B5

tbl_сетка_справа_изогнутая:
.byte $AD,$BD,$CD,$DD,$9F,$AF
.byte $BB,$CB,$DB,$9D,$AE,$BE,$CE,$DE,$BF,$CF,$DF
.byte $AB,$AC,$BC,$CC,$DC,$9E

_тайлы_рваной_сетки:
; флаг гола 80 = правая сетка
	LDY #$00
	BIT флаг_гола
	BPL @чтение_таблицы
	LDY #$02
@чтение_таблицы:
	LDA таблица_поинтеры_2,Y
	STA $0C
	LDA таблица_поинтеры_2 + 1,Y
	STA $0D
	LDX #$00
	LDA флаг_гола
	BPL @пропуск
	LDX #$04
@пропуск:
	LDA таблица_2006_2,X
	STA $2006
	LDA таблица_2006_2 + 1,X
	STA $2006
	LDY #$00
@цикл_1:
	LDA ($0C),Y
	STA $2007
	INY
	CPY #$04
	BNE @цикл_1
	LDA таблица_2006_2 + 2,X
	STA $2006
	LDA таблица_2006_2 + 3,X
	STA $2006
@цикл_2:
	LDA ($0C),Y
	STA $2007
	INY
	CPY #$09
	BNE @цикл_2
	RTS

таблица_2006_2:
.dbyt $21D1, $21D2
.dbyt $21CE, $21CD

таблица_поинтеры_2:
.word tbl_сетка_слева_рваная, tbl_сетка_справа_рваная

tbl_сетка_слева_рваная:
.byte $9E,$9E,$9E,$9E,		$BE,$BC,$BC,$CC,$CC

tbl_сетка_справа_рваная:
.byte $9D,$9D,$9D,$9D,		$AF,$BB,$BB,$CB,$CB
.ENDSCOPE

_loc_07_F340_нарисовать_таймер_и_следы:
.SCOPE
	LDA подтип_экрана
	CMP копия_подтипа_экрана
	BNE @RTS
	CMP #$02
	BEQ @игра_на_поле_включая_ауты
	CMP #$06
	BEQ @игра_на_поле_включая_ауты
	JMP @отрисовка_следов
@игра_на_поле_включая_ауты:
	LDA байт_для_2000
	AND #$FB
	STA байт_для_2000
	STA $2000
	LDA $2002
	LDA #$2A
	STA $2006
	LDA #$2D
	STA $2006
	LDX #$05
@цикл_записи_тайлов_статусбара:
	LDA тайл_статусбара,X
	STA $2007
	DEX
	BPL @цикл_записи_тайлов_статусбара
@отрисовка_следов:
	LDX счетчик_следов
	BEQ @RTS
	DEX
@цикл_записи_тайла_следа:
	LDA $2002
	LDA байт_2006_hi_след,X
	STA $2006
	LDA байт_2006_lo_след,X
	STA $2006
	LDA #$FF
	STA $2007
	DEX
	BPL @цикл_записи_тайла_следа
	LDA #$00
	STA счетчик_следов
@RTS:
	RTS
.ENDSCOPE

_loc_07_F3A5:
	LDA $05FA
	BMI @RTS_1
	CMP #$07
	BEQ bra_07_F3D4
	LDA #$AA
	STA буфер_графики
	LDA #$FF
	STA буфер_графики + 1
	LDA #$02
	STA счетчик_буфера_графики
	LDA $05FA
	CLC
	ADC #$F0
	STA байт_2006_lo_графика
	LDA #$00
	STA бит_для_2000_графика
	LDA #$2B
	STA байт_2006_hi_графика
	INC $05FA
@RTS_1:
	RTS
bra_07_F3D4:
	LDA счетчик_кадров
	AND #$01
	BNE bra_07_F3DE
	INC задержка_переливания_надписи
bra_07_F3DE:
	LDA задержка_переливания_надписи
	CMP #$FF
	BNE @RTS_2
	LDA #$FE
	STA задержка_переливания_надписи
	LDA $05FA
	CMP #$07
	BNE @RTS_2
	LDA #$00
	STA $05FA
@RTS_2:
	RTS

.export _b07_F469
_b07_F469:
	TXA
	PHA
	TYA
	PHA
	LDA #$00
	STA $31
	STA $30
	LDA $2E
	ORA $2F
	BNE bra_07_F47F
	STA $2C
	STA $2D
	BEQ bra_07_F4BC
bra_07_F47F:
	LDX #$10
	CLC
bra_07_F482:
	ROL $2C
	ROL $2D
	DEX
	BEQ bra_07_F4BC
	BCC bra_07_F482
	LDA $2C
	ORA #$01
	STA $2C
	INX
	STX $1C
	BCS bra_07_F49B
bra_07_F496:
	SEC
	ROL $2C
	ROL $2D
bra_07_F49B:
	ROL $30
	ROL $31
	LDX $30
	LDY $31
	LDA $30
	SEC
	SBC $2E
	STA $30
	LDA $31
	SBC $2F
	STA $31
	BCS bra_07_F4B8
	STX $30
	STY $31
	DEC $2C
bra_07_F4B8:
	DEC $1C
	BNE bra_07_F496
bra_07_F4BC:
	PLA
	TAY
	PLA
	TAX
	RTS

.export _b07_F4C1
_b07_F4C1:
	TXA
	PHA
	TYA
	PHA
	LDA #$00
	STA $1F
	STA $20
	STA $21
	LDA $2C
	ORA $2D
	BNE bra_07_F4DB
	STA $1C
	STA $1D
	STA $1E
	BEQ bra_07_F534
bra_07_F4DB:
	LDX #$18
	CLC
bra_07_F4DE:
	ROL $1C
	ROL $1D
	ROL $1E
	DEX
	BEQ bra_07_F534
	BCC bra_07_F4DE
	LDA $1C
	ORA #$01
	STA $1C
	INX
	STX $2B
	BCS bra_07_F4FB
bra_07_F4F4:
	SEC
	ROL $1C
	ROL $1D
	ROL $1E
bra_07_F4FB:
	ROL $1F
	ROL $20
	ROL $21
	LDA $1F
	STA $22
	LDA $20
	STA $23
	LDA $21
	STA $24
	LDA $1F
	SEC
	SBC $2C
	STA $1F
	LDA $20
	SBC $2D
	STA $20
	LDA $21
	SBC #$00
	STA $21
	BCS bra_07_F530
	LDA $22
	STA $1F
	LDA $23
	STA $20
	LDA $24
	STA $21
	DEC $1C
bra_07_F530:
	DEC $2B
	BNE bra_07_F4F4
bra_07_F534:
	PLA
	TAY
	PLA
	TAX
	RTS

.export _b07_F564
_b07_F564:
	TXA
	PHA
	TYA
	PHA
	LDA #$00
	STA $30
	STA $31
bra_07_F56E:
	LDA $2D
	ORA $2C
	BEQ bra_07_F595
	LSR $2D
	ROR $2C
	BCC bra_07_F589
	CLC
	LDA $30
	ADC $2E
	STA $30
	LDA $31
	ADC $2F
	STA $31
	BCS bra_07_F58F
bra_07_F589:
	ASL $2E
	ROL $2F
	BCC bra_07_F56E
bra_07_F58F:
	PLA
	TAY
	PLA
	TAX
	SEC
	RTS
bra_07_F595:
	PLA
	TAY
	PLA
	TAX
	CLC
	RTS

.export _b07_F59B
_b07_F59B:
	TXA
	PHA
	TYA
	PHA
	LDA $1C
	STA $23
	LDA $1D
	STA $24
	LDA $1E
	STA $25
	LDA #$00
	STA $20
	STA $21
	STA $22
bra_07_F5B3:
	LDA $1F
	BEQ bra_07_F5DE
	LSR $1F
	BCC bra_07_F5D0
	CLC
	LDA $20
	ADC $23
	STA $20
	LDA $21
	ADC $24
	STA $21
	LDA $22
	ADC $25
	STA $22
	BCS bra_07_F5D8
bra_07_F5D0:
	ASL $23
	ROL $24
	ROL $25
	BCC bra_07_F5B3
bra_07_F5D8:
	PLA
	TAY
	PLA
	TAX
	SEC
	RTS
bra_07_F5DE:
	PLA
	TAY
	PLA
	TAX
	CLC
	RTS

_loc_07_F5E4:
	TXA
	PHA
	TYA
	PHA
	LDA $1C
	STA $23
	LDA $1D
	STA $24
	LDA $1E
	STA $25
	LDA #$00
	STA $20
	STA $21
	STA $22
bra_07_F5FC:
	LDA $26
	ORA $27
	BEQ bra_07_F62B
	LSR $27
	ROR $26
	BCC bra_07_F61D
	CLC
	LDA $20
	ADC $23
	STA $20
	LDA $21
	ADC $24
	STA $21
	LDA $22
	ADC $25
	STA $22
	BCS bra_07_F625
bra_07_F61D:
	ASL $23
	ROL $24
	ROL $25
	BCC bra_07_F5FC
bra_07_F625:	; логгер пока не зафиксировал
	PLA
	TAY
	PLA
	TAX
	SEC
	RTS
bra_07_F62B:
	PLA
	TAY
	PLA
	TAX
	CLC
	RTS

.export _b07_F67D		; логгер пока не зафиксировал
_b07_F67D:
	LDA координата_X_lo,Y
	STA $2E
	LDA координата_X_hi,Y
	STA $2F
	LDA координата_Y_lo,Y
	STA $30
	LDA координата_Y_hi,Y
	STA $31
.export _b07_F691
_b07_F691:
	LDA #$00
	STA $1C
	LDA $2E
	SEC
	SBC координата_X_lo,X
	STA $34
	LDA $2F
	SBC координата_X_hi,X
	STA $35
	LDA $30
	SEC
	SBC координата_Y_lo,X
	STA $36
	LDA $31
	SBC координата_Y_hi,X
	STA $37
_loc_07_F6B3:
	LDA $2A
	PHA
	LDA $2B
	PHA
	TYA
	PHA
	LDY #$02
bra_07_F6BD:
	LDA $0035,Y
	BPL bra_07_F6DD
	EOR #$FF
	STA $0039,Y
	LDA $0034,Y
	EOR #$FF
	CLC
	ADC #$01
	STA $0038,Y
	LDA $0039,Y
	ADC #$00
	STA $0039,Y
	JMP _loc_07_F6E6
bra_07_F6DD:
	STA $0039,Y
	LDA $0034,Y
	STA $0038,Y
_loc_07_F6E6:
	DEY
	DEY
	BPL bra_07_F6BD
	PLA
	TAY
	LDA $35
	BMI bra_07_F767
	LDA $37
	BMI bra_07_F72A
	JSR _loc_07_F7F8
	BNE bra_07_F712
	LDA #$B3
	STA $2E
	STA $30
	LDA #$00
	STA $2F
	STA $31
	LDA #$69
	STA $32
	LDA #$01
	STA $33
	LDA #$60
	JMP _loc_07_F7ED
bra_07_F712:
	BCS bra_07_F71D
	JSR _loc_07_F813
	CLC
	ADC #$40
	JMP _loc_07_F7ED
bra_07_F71D:
	JSR _loc_07_F86B
	STA $23
	LDA #$80
	SEC
	SBC $23
	JMP _loc_07_F7ED
bra_07_F72A:
	JSR _loc_07_F7F8
	BNE bra_07_F74C
	LDA #$B3
	STA $2E
	LDA #$00
	STA $2F
	LDA #$4D
	STA $30
	LDA #$FF
	STA $31
	LDA $69
	STA $32
	LDA #$01
	STA $33
	LDA #$20
	JMP _loc_07_F7ED
bra_07_F74C:
	BCS bra_07_F75C
	JSR _loc_07_F813
	JSR _loc_07_F8D5
	LDA #$40
	SEC
	SBC $2A
	JMP _loc_07_F7ED
bra_07_F75C:
	JSR _loc_07_F86B
	JSR _loc_07_F8D5
	LDA $2A
	JMP _loc_07_F7ED
bra_07_F767:
	LDA $37
	BMI bra_07_F7AB
	JSR _loc_07_F7F8
	BNE bra_07_F78D
	LDA #$B3
	STA $30
	LDA #$00
	STA $31
	LDA #$4D
	STA $2E
	LDA #$FF
	STA $2F
	LDA #$69
	STA $32
	LDA #$01
	STA $33
	LDA #$A0
	JMP _loc_07_F7ED
bra_07_F78D:
	BCS bra_07_F79D
	JSR _loc_07_F813
	JSR _loc_07_F8C3
	LDA #$C0
	SEC
	SBC $2A
	JMP _loc_07_F7ED
bra_07_F79D:
	JSR _loc_07_F86B
	JSR _loc_07_F8C3
	LDA $2A
	CLC
	ADC #$80
	JMP _loc_07_F7ED
bra_07_F7AB:
	JSR _loc_07_F7F8
	BNE bra_07_F7C9
	LDA #$4D
	STA $2E
	STA $30
	LDA #$FF
	STA $2F
	STA $31
	LDA #$69
	STA $32
	LDA #$01
	STA $33
	LDA #$E0
	JMP _loc_07_F7ED
bra_07_F7C9:
	BCS bra_07_F7DC
	JSR _loc_07_F813
	JSR _loc_07_F8C3
	JSR _loc_07_F8D5
	LDA $2A
	CLC
	ADC #$C0
	JMP _loc_07_F7ED
bra_07_F7DC:
	JSR _loc_07_F86B
	JSR _loc_07_F8C3
	JSR _loc_07_F8D5
	LDA #$00
	SEC
	SBC $2A
_loc_07_F7ED:
	STA $42
	PLA
	STA $2B
	PLA
	STA $2A
	LDA $42
	RTS

_loc_07_F7F8:
	LDA $39
	CMP $3B
	BCC bra_07_F80F
	BNE bra_07_F80B
	LDA $38
	CMP $3A
	BCC bra_07_F80F
	BNE bra_07_F80B
	LDA #$00
	RTS
bra_07_F80B:
	LDA #$01
	CLC
	RTS
bra_07_F80F:
	LDA #$01
	SEC
	RTS

_loc_07_F813:
	LDA $3B
	STA $1E
	LDA $3A
	STA $1D
	LDA $39
	STA $2D
	LDA $38
	STA $2C
	JSR _b07_F4C1
	LDA $1C
	CLC
	ADC #$03
	BCC bra_07_F82F
	LDA #$FF
bra_07_F82F:
	LSR
	LSR
	LSR
	STY $2B
	TAY
	LDA table_07_F8E7,Y
	STA $2A
	LDA #$00
	STA $2E
	STA $2F
	STA $30
	STA $31
	LDA #$01
	STA $33
	LDY $2A
	BEQ bra_07_F85E
	LDA table_07_F907,Y
	STA $30
	LDA table_07_F928,Y
	STA $2E
	LDA table_07_F949,Y
	STA $32
	JMP _loc_07_F866
bra_07_F85E:
	LDA #$01
	STA $2F
	LDA #$00
	STA $32
_loc_07_F866:
	LDY $2B
	LDA $2A
	RTS

_loc_07_F86B:
	LDA $39
	STA $1E
	LDA $38
	STA $1D
	LDA $3B
	STA $2D
	LDA $3A
	STA $2C
	JSR _b07_F4C1
	LDA $1C
	CLC
	ADC #$03
	BCC bra_07_F887
	LDA #$FF
bra_07_F887:
	LSR
	LSR
	LSR
	STY $2B
	TAY
	LDA table_07_F8E7,Y
	STA $2A
	LDA #$00
	STA $2E
	STA $2F
	STA $30
	STA $31
	LDA #$01
	STA $33
	LDY $2A
	BEQ bra_07_F8B6
	LDA table_07_F907,Y
	STA $2E
	LDA table_07_F928,Y
	STA $30
	LDA table_07_F949,Y
	STA $32
	JMP _loc_07_F8BE
bra_07_F8B6:
	LDA #$01
	STA $31
	LDA #$00
	STA $32
_loc_07_F8BE:
	LDY $2B
	LDA $2A
	RTS

_loc_07_F8C3:
	LDA $2E
	EOR #$FF
	CLC
	ADC #$01
	STA $2E
	LDA $2F
	EOR #$FF
	ADC #$00
	STA $2F
	RTS

_loc_07_F8D5:
	LDA $30
	EOR #$FF
	CLC
	ADC #$01
	STA $30
	LDA $31
	EOR #$FF
	ADC #$00
	STA $31
	RTS

table_07_F8E7:		; читается по 2 раза
.byte $00,$01,$02,$04,$05,$06,$08,$09,$0A,$0B,$0C,$0D,$0E,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1C,$1D,$1E,$1F,$1F,$20

table_07_F907:		; читается по 2 раза
.byte $00,$07,$0F,$14,$19,$21,$26,$30,$33,$38,$40,$45,$4C,$51,$57,$5E,$63,$6B,$6E,$73,$7A,$80,$85,$8A,$8C,$94,$99,$9E,$A3,$A6,$AE,$B0,$B3

table_07_F928:		; читается по 2 раза
.byte $FF,$FF,$FF,$FE,$FE,$FD,$FD,$FB,$FA,$F9,$F8,$F6,$F5,$F3,$F0,$EE,$EB,$E8,$E6,$E3,$E1,$DE,$DC,$D7,$D4,$CF,$CC,$CA,$C5,$C2,$BD,$B8,$B3

table_07_F949:		; читается по 2 раза
.byte $00,$00,$00,$00,$00,$01,$02,$03,$04,$05,$07,$08,$0A,$0F,$10,$14,$15,$18,$1A,$1C,$21,$24,$26,$2D,$31,$38,$3C,$40,$49,$4D,$58,$63,$69

.export _b07_F96A
_b07_F96A:
	LDA #$FF
	STA $3C
	STA $3E
	LDA #$7F
	STA $3D
_loc_07_F974:
	CPY игрок_с_мячом
	BNE bra_07_F97C
	JMP _loc_07_F9CD
bra_07_F97C:
	JSR _b07_F67D
	SEC
	SBC $2A
	BPL bra_07_F989
	EOR #$FF
	CLC
	ADC #$01
bra_07_F989:
	CMP $2B
	BEQ bra_07_F992
	BCC bra_07_F992
	JMP _loc_07_F9CD
bra_07_F992:
	JSR _loc_07_F7F8
	BEQ bra_07_F9A1
	BCC bra_07_F9A1
	LDA $3A
	STA $38
	LDA $3B
	STA $39
bra_07_F9A1:
	LDA $38
	STA $1C
	LDA $39
	STA $1D
	LDA #$00
	STA $1E
	LDA $32
	STA $26
	LDA $33
	STA $27
	JSR _loc_07_F5E4
	LDA $3C
	SEC
	SBC $21
	LDA $3D
	SBC $22
	BMI bra_07_F9CD
	LDA $21
	STA $3C
	LDA $22
	STA $3D
	STY $3E
_loc_07_F9CD:
bra_07_F9CD:
	TYA
	CLC
	ADC $29
	CMP $28
	BEQ bra_07_F9DA
	BCC bra_07_F9DA
	LDY $3E
	RTS
bra_07_F9DA:
	TAY
	JMP _loc_07_F974

.export _b07_F9DE
_b07_F9DE:
	TXA
	PHA
	TYA
	PHA
	LDA $27
	ASL
	TAY
	DEY
	LDA #$FF
bra_07_F9E9:
	STA $002C,Y
	DEY
	BPL bra_07_F9E9
	LDX $22
	LDY $23
_loc_07_F9F3:
	JSR _b07_FA6D
	STY $2A
	LDA $27
	ASL
	TAY
	DEY
	DEY
bra_07_F9FE:
	LDA $24
	CMP $002D,Y
	BEQ bra_07_FA0A
	BCC bra_07_FA0A
	JMP _loc_07_FA24
bra_07_FA0A:
	LDA $002C,Y
	STA $002E,Y
	LDA $002D,Y
	STA $002F,Y
	LDA $24
	STA $002D,Y
	LDA $2A
	STA $002C,Y
	DEY
	DEY
	BPL bra_07_F9FE
_loc_07_FA24:
	LDA $2A
	CLC
	ADC $29
	TAY
	CPY $28
	BCC bra_07_FA33
	BEQ bra_07_FA33
	JMP _loc_07_FA36
bra_07_FA33:
	JMP _loc_07_F9F3
_loc_07_FA36:
	LDY $2C
	LDA состояние_игрока,Y
	AND #$01
	BEQ bra_07_FA68
	LDX $2E
	LDA координата_Z_lo,Y
	SEC
	SBC координата_Z_lo,X
	LDA координата_Z_hi,Y
	SBC координата_Z_hi,X
	BPL bra_07_FA68
	LDA $2C
	STA $28
	LDA $2D
	STA $29
	LDA $2E
	STA $2C
	LDA $2F
	STA $2D
	LDA $28
	STA $2E
	LDA $29
	STA $2F
bra_07_FA68:
	PLA
	TAY
	PLA
	TAX
	RTS

.export _b07_FA6D
_b07_FA6D:
	LDA координата_X_lo,Y
	SEC
	SBC координата_X_lo,X
	STA $24
	LDA координата_X_hi,Y
	SBC координата_X_hi,X
	BEQ bra_07_FA97
	CMP #$FF
	BEQ bra_07_FA85
	JMP _loc_07_FAE9
bra_07_FA85:
	LDA $24
	BEQ bra_07_FA93
	EOR #$FF
	CLC
	ADC #$01
	STA $24
	JMP _loc_07_FA97
bra_07_FA93:
	LDA #$FF
	STA $24
_loc_07_FA97:
bra_07_FA97:
	LDA координата_Y_lo,Y
	SEC
	SBC координата_Y_lo,X
	STA $25
	LDA координата_Y_hi,Y
	SBC координата_Y_hi,X
	BEQ bra_07_FAC1
	CMP #$FF
	BEQ bra_07_FAAF
	JMP _loc_07_FAE9
bra_07_FAAF:
	LDA $25
	BEQ bra_07_FABD
	EOR #$FF
	CLC
	ADC #$01
	STA $25
	JMP _loc_07_FAC1
bra_07_FABD:
	LDA #$FF
	STA $25
_loc_07_FAC1:
bra_07_FAC1:
	LDA $24
	CMP $25
	BCS bra_07_FAD1
	STA $26
	LDA $25
	STA $24
	LDA $26
	STA $25
bra_07_FAD1:
	LDA $24
	SEC
	SBC $25
	LSR
	LSR
	LSR
	LSR
	LSR
	STA $26
	LDA $24
bra_07_FADF:
	LSR
	DEC $26
	BPL bra_07_FADF
	CLC
	ADC $24
	BCC bra_07_FAEB
_loc_07_FAE9:
	LDA #$FF
bra_07_FAEB:
	STA $24
	RTS

.export _b07_FAEE
_b07_FAEE:
	LDA удержанные_кнопки,X
	LSR
	STA $1C
	AND #(КНОПКА_СЕЛЕКТ | КНОПКА_А | КНОПКА_Б)
	BNE bra_07_FB19
	LDA предыдущая_удержанная_кнопка_А_или_Б,X
	BEQ bra_07_FB09
	STA $1C
	LDA #$00
	STA предыдущая_удержанная_кнопка_А_или_Б,X
	LDA $1C
	JMP _loc_07_FB26
bra_07_FB09:	; запись 00 в адреса
	STA предыдущая_удержанная_кнопка_А_или_Б,X
	STA таймер_удержания_А_или_Б,X
	STA сумма_удержанных_кнопок,X
	STA сумма_нажатых_кнопок_А_и_Б,X
bra_07_FB15:
	JMP _loc_07_FB5F
bra_07_FB19:
	ASL
	ASL
	AND удержанные_кнопки,X
	BPL bra_07_FB36
	LDA $1C
	ORA #$80
	STA $1C
_loc_07_FB26:
	EOR сумма_удержанных_кнопок,X
	AND $1C
	STA сумма_нажатых_кнопок_А_и_Б,X
	LDA $1C
	STA сумма_удержанных_кнопок,X
	JMP _loc_07_FB5F
bra_07_FB36:
	LDA $1C
	AND предыдущая_удержанная_кнопка_А_или_Б,X
	BEQ bra_07_FB52
	INC таймер_удержания_А_или_Б,X
	LDA таймер_удержания_А_или_Б,X
	CMP #$02
	BCC bra_07_FB15
	LDA предыдущая_удержанная_кнопка_А_или_Б,X
	AND $1C
	STA $1C
	JMP _loc_07_FB26
bra_07_FB52:
	LDA $1C
	STA предыдущая_удержанная_кнопка_А_или_Б,X
	LDA #$00
	STA таймер_удержания_А_или_Б,X
_loc_07_FB5F:
	LDA #$00
	STA двойное_нажатие_кнопки_движения,X
	LDA одноразовые_кнопки,X
	AND #(КНОПКА_ВВЕРХ + КНОПКА_ВНИЗ + КНОПКА_ВЛЕВО + КНОПКА_ВПРАВО)
	BEQ bra_07_FB9B
	STA $1C
	AND предыдущая_кнопка_движения,X
	BEQ bra_07_FB89
	STA $1C
	LDA таймер_предыдущей_кнопки_движения,X
	CMP #$12		; 60fps интервал между нажатием вперед + вперед или вверх + вверх
	BCS bra_07_FB89
	LDA двойное_нажатие_кнопки_движения,X
	AND #$F0
	ORA $1C
	STA двойное_нажатие_кнопки_движения,X
	RTS
bra_07_FB89:
	LDA #$00
	STA таймер_предыдущей_кнопки_движения,X
	LDA предыдущая_кнопка_движения,X
	AND #$F0
	ORA $1C
	STA предыдущая_кнопка_движения,X
	RTS
bra_07_FB9B:
	INC таймер_предыдущей_кнопки_движения,X
	LDA таймер_предыдущей_кнопки_движения,X
	BPL @RTS
	LDA #$7F
	STA таймер_предыдущей_кнопки_движения,X
@RTS:
	RTS

_обработчик_NMI:
.SCOPE
	BIT флаг_NMI
	BMI _флаг_80_C0
	LDA байт_для_2000		; флаг NMI 00
	AND #$7F
	STA байт_для_2000
	STA $2000
	LDA $2002
	PLP
	PLA
	PLA
	PLA
	STA флаг_NMI
	PLA
	RTS

_флаг_80_C0:
	PHA
	TXA
	PHA
	TYA
	PHA
	LDA #$01
	STA $401C
	LDA байт_для_8000
	PHA
	LDA $BFFF
	PHA
	LDA $0C
	PHA
	LDA $0D
	PHA
	JSR _запись_2003_4014
	JSR _b07_EFAD_работа_с_видеопамятью
	LDX #$00
	STX $8000
	LDA банк_фона
	STA $8001
	INX
	STX $8000
	LDA банк_фона + 1
	STA $8001
	LDA $2002
	LDA камера_X_lo
	STA $2005
	LDA камера_Y_lo
	STA $2005
	LDA камера_X_hi
	AND #$01
	STA $0C
	LDA камера_Y_hi
	AND #$01
	ASL
	ORA $0C
	STA $0C
	LDA байт_для_2000
	AND #$FC
	ORA $0C
	STA байт_для_2000
	STA $2000
	BIT флаг_NMI
	BVC @общее_для_NMI
	LDX #$05
	STX $8000
	LDA банк_спрайтов + 3
	STA $8001
	LDA #$B8
	STA $C000
	STA $C001
	STA $E001
	JSR _loc_07_D993
	JSR _loc_07_D891
	JSR _loc_07_DB78
	JSR _loc_07_DA81
	JSR _loc_07_DCB1
@общее_для_NMI:
	JSR _loc_07_C308
	INC задержка_кадра
.ENDSCOPE

; продолжение NMI
_выход_из_NMI_и_IRQ:
	LDA #$00
	STA $401C
	PLA
	STA $0D
	PLA
	STA $0C
	PLA
	JSR _главный_банксвич_PRG
	PLA
	STA байт_для_8000
	STA $8000
	PLA
	TAY
	PLA
	TAX
	PLA
	RTI

_обработчик_IRQ:
	PHA
	TXA
	PHA
	TYA
	PHA
	LDA #$01
	STA $401C
	STA $E000
	STA $E001
	LDA байт_для_8000
	PHA
	LDA $BFFF
	PHA
	LDA $0C
	PHA
	LDA $0D
	PHA
	STA $E000
	LDA $2002
	LDX #$00
	STX $2005
	STX $2005
	LDA подтип_экрана
	CMP #ЭКРАН_SUB_РАЗВОДКА
	BEQ bra_07_FD0F
	CMP #ЭКРАН_SUB_ГОЛ
	BNE _loc_07_FD4C
	LDA режим_игры_на_поле
	AND #$03
	ORA номер_тайма
	ORA вариант_расстановки_игроков
	BNE bra_07_FD0F
	JMP _loc_07_FD4C
bra_07_FD0F:
	LDA байт_для_2000
	AND #$FC
	ORA #$02
	STA байт_для_2000
	STA $2000
	LDA $2002
	LDA #$2A	; позиция статусбара с миникартой
	STA $2006
	LDA #$E0
	STA $2006
	STX $8000		; игра рассчитывает на X = 00
	STX $8001
	INX
	STX $8000
	LDA #$10
	STA $8001
	JMP _выход_из_NMI_и_IRQ
_loc_07_FD4C:
	LDA байт_для_2000
	AND #$FC
	STA байт_для_2000
	STA $2000
	LDA $2002
	LDA #$2A	; позиция статусбара с надписями
	STA $2006
	LDA #$00
	STA $2006
	LDA #$04
	BIT номер_команды + 1
	BVC bra_07_FD7E
	LDA #$06
bra_07_FD7E:
	STX $8000		; игра рассчитывает на X = 00
	STA $8001
	INX
	STX $8000
	INX
	STX $8001
	JMP _выход_из_NMI_и_IRQ

_loc_07_0001_переключение_игроков_на_селект:
.SCOPE
	LDA опция_режим_сложность
	TAX		; сохраняем А для будущего если понадобится
	AND #РЕЖИМ_ПК_ИЗ_МЕНЮ
	BNE _выход		; в пенальти переключаться нельзя
	LDA количество_игроков
	BEQ _выход		; сейчас демка, 0 игроков, переключаться нельзя
	CMP #$01
	BEQ @пропуск_проверки_второго		; если 1 игрок, значит режим на прохождение, первый может переключаться, второй не может
	CMP #$04
	BEQ _выход		; если 4 игрока, никто не может переключаться
	CMP #$03
	BNE @сейчас_2_игрока		; если 3 игрока, первый не может переключаться, сразу переходим ко второму
	LDX #$01
	JMP @попытка_смены_управления
@сейчас_2_игрока:
	TXA
	AND #РЕЖИМ_ПРОХОЖДЕНИЕ
	BNE _выход		; если 2 игрока в режиме прохождения, никто не может переключаться
	LDX #01
	JSR @попытка_смены_управления
@пропуск_проверки_второго:
	LDX #00
@попытка_смены_управления:
	LDA одноразовые_кнопки,X
	AND #КНОПКА_СЕЛЕКТ
	BEQ _выход		; должна быть нажата кнопка
	LDA номер_управляемого,X
	TAY		; смотрим кем сейчас управляет капитан
	LDA позиция_управление,Y
	ORA #$80	; превращаем его в бота
	STA позиция_управление,Y
	TYA
	EOR #$0A		; меняем индекс на противоположный (капитан/кипер)
	STA номер_управляемого,X
	TAY		; копируем новый индекс
	LDA позиция_управление,Y
	AND #$7F	; снимаем флаг бота
	STA позиция_управление,Y
_выход:
	RTS
.ENDSCOPE

.export _b07_0002_корректировка_байтов_управляемых_до_игры
_b07_0002_корректировка_байтов_управляемых_до_игры:		; 2 прыжка
.SCOPE
	LDX #$0B
@цикл_превращений_в_бота:
	LDA позиция_управление,X
	ORA #$80
	STA позиция_управление,X
	DEX
	BPL @цикл_превращений_в_бота
	LDX #$03
@цикл:
	JSR _цикл_превращений_в_управляемого
	DEX
	BPL @цикл
	LDA флаг_демо
	BPL _выход
	LDA позиция_управление
	ORA #$80
	STA позиция_управление
_выход:
	RTS

_цикл_превращений_в_управляемого:
	LDA копия_номера_управляемого,X
	BMI _выход
	TAY
	LDA позиция_управление,Y
	AND #$7F
	STA позиция_управление,Y
	RTS
.ENDSCOPE

_loc_07_0003_корректировка_байтов_управляемых_когда_мяч_внеИгры:
.SCOPE
	LDX #$03
@цикл:
	LDA копия_номера_управляемого,X
	STA номер_управляемого,X
	DEX
	BPL @цикл
	JMP _b07_0002_корректировка_байтов_управляемых_до_игры
.ENDSCOPE

.export _b07_0004_запись_FF_в_номера_управляемых
_b07_0004_запись_FF_в_номера_управляемых:
	LDA #$FF
	STA номер_управляемого
	STA номер_управляемого + 1
	STA номер_управляемого + 2
	STA номер_управляемого + 3
	STA копия_номера_управляемого
	STA копия_номера_управляемого + 1
	STA копия_номера_управляемого + 2
	STA копия_номера_управляемого + 3
	RTS

.export _b07_деление_и_умножение_скоростей_16bit_на_3
_b07_деление_и_умножение_скоростей_16bit_на_3:		; 60fps !!!
.SCOPE
флаг_операции = $0191		; деления скорости X (00), Y (01) или Z (02). если 03, то на вход заранее подаются байты в 0192 и 0193
							; по умолчанию деление +00, а умножение если +80
							; +20 = учитывать отрицательные числа и после операции делать отрицательным при необходимости (+40, выставляется кодом)
							; +10 = поделить на 9, а не на 3
младший_байт = $0192
старший_байт = $0193
хранение_X = $0194
хранение_Y = $0195
счетчик_операции = $0196
; на вход подается A для деления скорости X 00, Y 01 или Z 02
	STX хранение_X
	STY хранение_Y
	STA флаг_операции
	LDY #$00
	AND #$10
	BEQ @счетчик_не_нужно_увеличивать
	INY
@счетчик_не_нужно_увеличивать:
	STY счетчик_операции
	LDA флаг_операции
	AND #$03		; проверка какую скорость надо обработать
	CMP #$03
	BEQ @пропуск_копии_скоростей
	TAY
	TXA
	CLC
	ADC таблица_смещение_X_для_адреса,Y
	TAX
	LDA скорость_X_lo,X
	STA младший_байт
	LDA скорость_X_hi,X
	STA старший_байт
@пропуск_копии_скоростей:
	LDA флаг_операции
	AND #$20		; при необходимости выполнить проверку на минус
	BEQ @пропустить_EOR
	LDA старший_байт
	BPL @пропустить_EOR
	JSR _EOR_16bit
@пропустить_EOR:
	LDA флаг_операции
	BMI @умножение
	JSR _деление
	JMP @записать_результат
@умножение:
	JSR _умножение
@записать_результат:
	LDA флаг_операции
	AND #$40		; при необходимости вернуть минус обратно, если изначально был минус
	BEQ @пропустить_EOR_2
	JSR _EOR_16bit
@пропустить_EOR_2:
	LDA флаг_операции
	AND #$03
	CMP #$03
	BEQ @пропуск_восстановления_скоростей
	LDA младший_байт
	STA скорость_X_lo,X
	LDA старший_байт
	STA скорость_X_hi,X
@пропуск_восстановления_скоростей:
	LDX хранение_X
	LDY хранение_Y
	RTS

таблица_смещение_X_для_адреса:
.byte $00,$1C,$38

_деление:
; можно получить остаток от деления, но на старом меднафене не работает DAV, потом поправить
	LDA старший_байт
;.byte $0C,$03		; DAV 03 получить остаток от деления
	TAY
;	LDA старший_байт
.byte $F3,$03		; DVA 03 поделить на 3
	STA старший_байт
	LDA младший_байт
.byte $F3,$03		; DVA 03 поделить на 3
	CLC
	ADC таблица_остаток_деления,Y
	STA младший_байт
	LDA старший_байт
	ADC #$00
	STA старший_байт
	DEC счетчик_операции
	BPL _деление
	RTS

таблица_остаток_деления:	; таблица расширена изза отсутствия DAV
.byte $00,$55,$AB,$00,$55,$AB,$00,$55,$AB,$00,$55,$AB,$00,$55,$AB,$00,$55,$AB,$00,$55,$AB

_умножение:
	LDA старший_байт
.byte $F2,$03		; DMA 03 умножить на 3
	STA старший_байт
	LDA младший_байт
	LDY #$00
	CMP #$56
	BCC @меньше_проверки
	INY
	CMP #$AB
	BCC @меньше_проверки
	INY
@меньше_проверки:
.byte $F2,$03		; DMA 03 умножить на 3
	STA младший_байт
	TYA
	CLC
	ADC старший_байт
	STA старший_байт
	DEC счетчик_операции
	BPL _умножение
	RTS

_EOR_16bit:		; выполняется дважды, при проверке на минус и перед выходом из главной подпрограммы
	CLC
	LDA младший_байт
	EOR #$FF
	ADC #$01
	STA младший_байт
	LDA старший_байт
	EOR #$FF
	ADC #$00
	STA старший_байт
	LDA флаг_операции
	ORA #$40		; чтобы перед выходом из кода восстановить минус
	STA флаг_операции
	RTS
.ENDSCOPE

.export _общий_RTS
_общий_RTS:
	RTS

.segment "DMC_DATA"
.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$B6,$42,$04,$00,$00,$00,$00,$00,$20,$49,$B5,$AA,$AA,$4A,$24,$01,$51,$DA,$B6,$AA,$6D,$F7,$FF,$FF,$FF,$FF,$FF,$F6,$76,$DB,$AB,$55,$A5,$44,$10,$20,$00,$00,$04,$08,$90,$28,$51,$AA,$5A,$B5,$6D,$7B,$F7,$EE,$DD,$B7,$77,$5B,$5B,$B5,$52,$49,$12,$12,$09,$12,$22,$49,$48,$A5,$2A,$55,$65,$B5,$B5,$AD,$B6,$6D,$DB,$B6,$6D,$DB,$B6,$B5,$AD,$D6,$AA,$2A,$55,$4A,$A5,$24,$49,$2A,$09,$95,$A2,$54,$49,$53,$B5,$44,$6A,$D5,$6A,$AD,$D6,$44,$00,$AB,$6A,$D5,$44,$44,$AD,$44,$44,$44,$54,$44,$95,$44,$52,$00,$00,$FF,$B7,$20,$0B,$00,$00,$00,$00,$C0,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$C0,$0B,$00,$00,$80,$FD,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$17,$00,$00,$00,$00,$00,$00,$00,$F0,$FF,$FF,$FF,$FF,$FF,$7E,$51,$ED,$44,$81,$10,$01,$82,$18,$2B,$42,$53,$81,$6F,$D8,$DB,$EB,$E7,$BF,$EB,$1F,$FB,$95,$24,$48,$00,$02,$00,$E0,$C5,$C0,$BF,$F8,$FF,$FF,$BA,$0E,$7E,$C4,$50,$68,$2A,$56,$02,$6F,$77,$4E,$F8,$45,$95,$20,$56,$50,$63,$3F,$F4,$FF,$F0,$9D,$F8,$21,$B2,$20,$8E,$0D,$18,$CF,$82,$AF,$8A,$E3,$3F,$78,$FD,$18,$CE,$02,$87,$58,$E0,$C4,$47,$E9,$DF,$F1,$53,$3B,$8A,$97,$38,$08,$A9,$03,$DE,$E2,$F8,$0F,$9E,$EC,$89,$B2,$07,$38,$E2,$63,$F1,$E3,$C3,$7B,$42,$AF,$28,$8E,$2A,$8E,$42,$83,$5A,$1D,$FA,$B1,$EB,$AB,$D6,$62,$DA,$A1,$E2,$D0,$34,$9C,$85,$8E,$AE,$C4,$7A,$72,$1D,$A6,$55,$1C,$B9,$52,$3D,$8B,$9E,$9D,$4E,$96,$2A,$0B,$E2,$A8,$A4,$95,$2D,$BB,$72,$AD,$F4,$91,$5A,$8B,$52,$25,$4E,$9C,$5A,$79,$6A,$D7,$A4,$8E,$9C,$74,$B0,$A2,$B4,$89,$67,$35,$6D,$2B,$37,$B6,$45,$A5,$A9,$C5,$A4,$42,$34,$26,$54,$44,$44,$04,$44,$00,$4A,$44,$00,$00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00

.segment "VECTORS"
.word _обработчик_NMI
.word _обработчик_RESET
.word _обработчик_IRQ
