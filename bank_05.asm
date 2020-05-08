.segment "BANK_05"
.include "ram_copy.inc"
.include "val_copy.inc"

.import table_07_C080_byte_8000_8001
.import _b07_C2E4_записать_и_воспроизвести_звук
.import _b07_вращение_рандома
.import _b07_запись_банков_спрайтов
.import _b07_ECA9
.import _b07_включить_NMI
.import _b07_выключить_NMI
.import _b07_включить_рендеринг
.import _b07_выключить_рендеринг
.import _b07_поставить_флаг_уменьшения_яркости
.import _b07_D062
.import _b07_C344_банксвич_80xx
.import _b07_EC8F
.import _b07_CEBD
.import _b07_поставить_флаг_увеличения_яркости
.import _b07_D073
.import _b07_EF54
.import _b07_EB8C
.import _b07_E828
.import _b07_EFAD
.import _b07_яркость_палитры_и_запись_в_буфер
.import _b07_C317
.import _b07_C335
.import _общий_RTS

.export _loc_05_8000
_loc_05_8000:
	JMP _loc_05_8055
.export _loc_05_8003
_loc_05_8003:
	JMP _loc_05_BD38
.export _loc_05_8006
_loc_05_8006:
	JMP _loc_05_BDB0
.export _loc_05_8009
_loc_05_8009:
	JMP _loc_05_BB47
.export _loc_05_800C
_loc_05_800C:
	JMP _loc_05_BB84

_loc_05_800F:
	LDA #$1F
	JMP _b07_C344_банксвич_80xx
_loc_05_8014:
	LDA #$14
	JMP _b07_C344_банксвич_80xx
	LDA #$17
	JMP _b07_C344_банксвич_80xx
_loc_05_801E:
	LDA #$06
	JMP _b07_C344_банксвич_80xx
	LDA #$07
	JMP _b07_C344_банксвич_80xx
	LDA #$08
	JMP _b07_C344_банксвич_80xx
	LDA #$09
	JMP _b07_C344_банксвич_80xx
	LDA #$0A
	JMP _b07_C344_банксвич_80xx
	LDA #$0B
	JMP _b07_C344_банксвич_80xx
	LDA #$1C
	JMP _b07_C344_банксвич_80xx
_loc_05_8041:
	LDA #$1D
	JMP _b07_C344_банксвич_80xx
	LDA #$26
	JMP _b07_C344_банксвич_80xx
	LDA #$27
	JMP _b07_C344_банксвич_80xx
	LDA #$28
	JMP _b07_C344_банксвич_80xx
_loc_05_8055:
	LDA подтип_экрана
	JSR _b07_EC8F

table_05_805A:		; байты после JSR
.word table_05_805A_8083
.word table_05_805A_808B
.word table_05_805A_8091
.word table_05_805A_8097
.word table_05_805A_809D
.word table_05_805A_80A3
.word table_05_805A_80A9
.word table_05_805A_80AF
.word table_05_805A_80B5
.word table_05_805A_80BB
.word table_05_805A_80C1
.word table_05_805A_80C7
.word table_05_805A_80CD
.word table_05_805A_80CD
.word table_05_805A_80D3
.word table_05_805A_80D9

table_05_805A_8083:
	LDA #$01
	STA подтип_экрана
	RTS

table_05_805A_808B:
	JSR _loc_05_8338
	RTS

table_05_805A_8091:
	JSR _loc_05_871A
	RTS

table_05_805A_8097:
	JSR _loc_05_8DBC
	RTS

table_05_805A_809D:
	JSR _loc_05_8FF9
	RTS

table_05_805A_80A3:
	JSR _loc_05_8ABE
	RTS

table_05_805A_80A9:
	JSR _loc_05_9357
	RTS

table_05_805A_80AF:
	JSR _loc_05_97F5
	RTS

table_05_805A_80B5:
	JSR _loc_05_A0E0
	RTS

table_05_805A_80BB:
	JSR _loc_05_8893
	RTS

table_05_805A_80C1:
	JSR _loc_05_A281
	RTS

table_05_805A_80C7:
	JSR _loc_05_A576
	RTS

table_05_805A_80CD:
	JSR _loc_05_A778
	RTS

table_05_805A_80D3:
	JSR _loc_05_B2B2
	RTS

table_05_805A_80D9:
	JSR _loc_05_B47C
	RTS
_loc_05_80DF:
	LDA #$80
	STA разновидность_NMI
	LDA #$00		; сделать тут цикл для экономии байтов
	STA камера_X_lo
	STA камера_X_hi
	STA камера_Y_lo
	STA камера_Y_hi
	STA копия_камеры_X_lo
	STA копия_камеры_X_hi
	STA копия_камеры_Y_lo
	STA копия_камеры_Y_hi
	STA скорость_игры
	STA счетчик_опций
	STA $05CE
	LDA #$F0
	STA ограничитель_Y_спрайтов
	LDY подтип_экрана
	LDA table_05_816E,Y
	BMI bra_05_816D
	JSR _b07_E828
	JSR _b07_EF54
	JSR _b07_поставить_флаг_увеличения_яркости
	LDX #$0C
bra_05_811E:
	LDA #$00
	STA номер_движения,X
	STA состояние_игрока,X
	STA направление_движения,X
	STA смена_угла_движения,X
	STA скорость_X_lo,X
	STA скорость_X_hi,X
	STA скорость_Y_lo,X
	STA скорость_Y_hi,X
	STA скорость_Z_lo,X
	STA скорость_Z_hi,X
	STA координата_X_sub,X
	STA координата_X_lo,X
	STA координата_X_hi,X
	STA координата_Y_sub,X
	STA координата_Y_lo,X
	STA координата_Y_hi,X
	STA координата_Z_sub,X
	STA координата_Z_lo,X
	STA координата_Z_hi,X
	STA гравитация_hi,X
	STA гравитация_lo,X
	LDA #$FF
	STA номер_действия,X
	DEX
	BPL bra_05_811E
	LDA подтип_экрана
	ORA #$80
	STA подтип_экрана
bra_05_816D:
	RTS

table_05_816E:
.byte $FF,$02,$03,$0B,$04,$06,$07,$05,$08,$0D,$0C,$09,$0F,$0A,$14,$15

_loc_05_817E:
	LDA одноразовые_кнопки
	AND #(КНОПКА_СЕЛЕКТ + КНОПКА_СТАРТ)
	BEQ bra_05_8192
	AND #$10
	BEQ bra_05_818D
	LDA #$01
	JMP _loc_05_81CF
bra_05_818D:
	LDA #$02
	JMP _loc_05_81CF
bra_05_8192:
	LDY счетчик_смен
	LDA одноразовые_кнопки,Y
	BMI bra_05_81A0
	ASL
	BMI bra_05_81A5
	JMP _loc_05_81AA
bra_05_81A0:
	LDA #$03
	JMP _loc_05_81CF
bra_05_81A5:
	LDA #$04
	JMP _loc_05_81CF
_loc_05_81AA:
	LDA одноразовые_кнопки,Y
	LSR
	BCS bra_05_81CD
	LSR
	BCS bra_05_81C8
	LSR
	BCS bra_05_81C3
	LSR
	BCS bra_05_81BE
	LDA #$00
	JMP _loc_05_81CF
bra_05_81BE:
	LDA #$05
	JMP _loc_05_81CF
bra_05_81C3:
	LDA #$06
	JMP _loc_05_81CF
bra_05_81C8:
	LDA #$07
	JMP _loc_05_81CF
bra_05_81CD:
	LDA #$08
_loc_05_81CF:
	STA номер_кнопки_опций
	RTS
_loc_05_81D3:
	LDA номер_кнопки_опций
	CMP #$05
	BCC bra_05_81DC
	LDA #$05
bra_05_81DC:
	RTS

_loc_05_81DD:
	LDA номер_кнопки_опций
	CMP #$05
	BCC bra_05_8204
	SEC
	SBC #$05
	STA $1C
	TXA
	AND #$01
	TAY
	LDA номер_опции,Y
	ASL
	ASL
	ADC $1C
	TAY
	LDA ($2E),Y
	STA $1C
	TXA
	AND #$01
	TAY
	LDA $1C
bra_05_81FF:
	BMI bra_05_81FF
	STA номер_опции,Y
bra_05_8204:
	RTS

_loc_05_8205:
	LDA счетчик_опций
	ASL
	ASL
	TAY
	CLC
	PLA
	ADC #$01
	STA $30
	PLA
	ADC #$00
	STA $31
	LDA ($30),Y
	STA $2C
	INY
	LDA ($30),Y
	STA $2D
	INY
	LDA ($30),Y
	STA $2E
	INY
	LDA ($30),Y
	STA $2F
	RTS

_loc_05_822A:
	TXA
	AND #$01
	TAY
	LDA номер_опции,Y
	ASL
	TAY
	LDA ($2C),Y
	STA координата_X_lo,X
	INY
	LDA ($2C),Y
	CMP #$20
	BCC bra_05_8241
	SBC #$02
bra_05_8241:
	STA координата_Y_lo,X
	LDA #$00
	STA координата_X_hi,X
	STA координата_Y_hi,X
	LDY #$00
bra_05_824E:
	ASL координата_X_lo,X
	ROL координата_X_hi,X
	ASL координата_Y_lo,X
	ROL координата_Y_hi,X
	INY
	CPY #$03
	BCC bra_05_824E
	LDA $05CE
	AND #$0F
	CLC
	ADC координата_X_lo,X
	STA координата_X_lo,X
	LDA координата_X_hi,X
	ADC #$00
	STA координата_X_hi,X
	CLC
	LDA координата_Y_lo,X
	ADC #$07
	STA координата_Y_lo,X
	LDA координата_Y_hi,X
	ADC #$00
	STA координата_Y_hi,X
	LDA #$00
	STA координата_Z_lo,X
	STA координата_Z_hi,X
	RTS

_loc_05_828D:
	STA $1C
	TXA
	AND #$01
	TAY
	LDA номер_опции,Y
	ASL
	BMI bra_05_82AA
	LDA счетчик_кадров
	AND #$03
	BEQ bra_05_82AA
	LDA $1C
	ORA #$80
	STA номер_анимации,X
	RTS
bra_05_82AA:
	LDA #$7F
	STA номер_анимации,X
	RTS

_loc_05_82B0:
	AND #$01
	ORA #$DC
_loc_05_82B4:
	STA $1C
	JSR _loc_05_82F4
	TXA
	AND #$01
	TAY
	LDA номер_опции,Y
	TYA
	BEQ bra_05_82DA
	LDA $1C
	STA буфер_графики
	LDA #$01
	STA счетчик_буфера_графики
	LDA $30
	STA байт_2006_lo_графика
	LDA $31
	STA байт_2006_hi_графика
	RTS
bra_05_82DA:
	LDA $1C
	STA буфер_атрибутов
	LDA #$01
	STA счетчик_буфера_атрибутов
	LDA $30
	STA байт_2006_lo_атрибуты
	LDA $31
	STA байт_2006_hi_атрибуты
	RTS

_loc_05_82EF:
	LDA #$02
	JMP _loc_05_82B4
_loc_05_82F4:
	TXA
	AND #$01
	TAY
	LDA номер_опции,Y
	ASL
	TAY
	LDA ($2C),Y
	AND #$1F
	STA $1D
	LDA ($2C),Y
	AND #$20
	STA $31
	INY
	LDA ($2C),Y
	AND #$1F
	STA $30
	LDA ($2C),Y
	AND #$20
	ASL
	ORA $31
	ORA $30
	STA $30
	LDA #$00
	STA $31
	LDY #$00
bra_05_8321:
	ASL $30
	ROL $31
	INY
	CPY #$05
	BCC bra_05_8321
	CLC
	LDA $1D
	ADC $30
	STA $30
	LDA #$20
	ADC $31
	STA $31
	RTS
_loc_05_8338:
	LDA подтип_экрана
	BMI bra_05_8342
	JSR _loc_05_80DF
	JSR _loc_05_8355
bra_05_8342:
	JSR _loc_05_8593
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_834B:		; байты после JSR
.word table_05_834B_83CA
.word table_05_834B_83DE
.word table_05_834B_8475
.word table_05_834B_84B8
.word table_05_834B_84FD

_loc_05_8355:
	LDA #$FF
	STA номер_опции
	LDA #$00
	STA счетчик_смен
	STA $61
	STA $62
	STA флаг_владения_мячом_команды
	STA флаг_владения_мячом_команды + 1
	STA номер_команды
	STA номер_команды + 1
	STA лицо_игрока
	LDA #$05
	STA $63
	LDA #$01
	STA $6D
	STA номер_палитры_спрайтов
	STA номер_палитры_спрайтов + 1
	STA номер_движения
	STA номер_движения_мяча
	LDA #$80
	STA координата_X_lo
	LDA #$8C
	STA координата_X_lo_мяча
	LDA #$A4
	STA координата_Y_lo
	LDA #$A5
	STA координата_Y_lo_мяча
	JSR _loc_05_8041
	JSR _loc_05_8014
	LDX #$26
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 1
	LDX #$20
	STX банк_спрайтов + 2
	LDX #$09
	STX банк_спрайтов + 3
	JSR _b07_запись_банков_спрайтов
	LDA #МУЗЫКА_МЕНЮ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDX #$09
	LDA #$00
bra_05_83C3:
	STA $046E,X
	DEX
	BPL bra_05_83C3
	RTS

table_05_834B_83CA:
	LDA флаг_яркости
	BPL bra_05_83D2
	INC счетчик_опций
bra_05_83D2:
	JSR _b07_D073
	JSR _loc_05_8041
	JSR _loc_05_8014
	RTS

table_05_834B_83DE:
	LDX #$02
	LDA номер_опции
	BPL bra_05_83EE
	JSR _loc_05_860C_записать_номер_опц_относительно_режима
	JSR _loc_05_8673_запись_режима_и_колва_игроков
	JSR _loc_05_82EF
bra_05_83EE:
	JSR _loc_05_817E
	JSR _loc_05_81D3
	JSR _b07_EC8F

table_05_83F7:		; байты после JSR
.word table_05_83F7_8455
.word table_05_83F7_8403
.word table_05_83F7_8455
.word table_05_83F7_840E
.word table_05_83F7_843D
.word table_05_83F7_844A

table_05_83F7_8403:
table_05_848E_8403:
table_05_84D1_8403:
table_05_850F_8403:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_86AA
	JMP _loc_05_8455

table_05_83F7_840E:
table_05_848E_840E:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$11
	STA номер_действия
	LDX #$02
	LDA #$00
	JSR _loc_05_82B0
	LDA #$FF
	STA номер_опции
	LDA счетчик_опций
	CMP #$02
	BNE bra_05_8437
	LDA опция_режим_сложность
	BPL bra_05_8437		; проверка на РЕЖИМ_ПРОХОЖДЕНИЕ
	LDA #$04
	STA счетчик_опций
	JMP _loc_05_8455
bra_05_8437:
	INC счетчик_опций
	JMP _loc_05_8455

_loc_05_843D:
table_05_83F7_843D:
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$11
	STA номер_действия
	JMP _loc_05_8455

table_05_83F7_844A:
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_81DD
	JSR _loc_05_8673_запись_режима_и_колва_игроков

_loc_05_8455:
table_05_83F7_8455:
table_05_848E_8455:
table_05_84D1_8455:
table_05_850F_8455:
	LDA номер_опции
	BMI bra_05_846E
	LDX #$02
	JSR _loc_05_822A
	LDA счетчик_опций
	AND #$04
	BEQ bra_05_8468
	LDA #$01
bra_05_8468:
	JSR _loc_05_828D
	JSR _b07_EB8C
bra_05_846E:
	JSR _loc_05_8041
	JSR _loc_05_8014
	RTS

table_05_834B_8475:
	LDX #$02
	LDA номер_опции
	BPL bra_05_8485
	JSR _loc_05_863A_вычисление_номера_опц_на_количестве_игроков_режима
	JSR _loc_05_868F_запись_колва_игроков
	JSR _loc_05_82EF
bra_05_8485:
	JSR _loc_05_817E
	JSR _loc_05_81D3
	JSR _b07_EC8F

table_05_848E:		; байты после JSR
.word table_05_848E_8455
.word table_05_848E_8403
.word table_05_848E_8455
.word table_05_848E_840E
.word table_05_848E_849A
.word table_05_848E_84AA

table_05_848E_849A:
	LDX #$02
	JSR _loc_05_82EF
	LDA #$FF
	STA номер_опции
	DEC счетчик_опций
	JMP _loc_05_843D

table_05_848E_84AA:
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_81DD
	JSR _loc_05_868F_запись_колва_игроков
	JMP _loc_05_8455

table_05_834B_84B8:
	LDX #$02
	LDA номер_опции
	BPL bra_05_84C8
	JSR _loc_05_866B_запись_номера_опции_из_текущей_сложности
	JSR _loc_05_86A0_изменить_сложность
	JSR _loc_05_82EF
bra_05_84C8:
	JSR _loc_05_817E
	JSR _loc_05_81D3
	JSR _b07_EC8F

table_05_84D1:		; байты после JSR
.word table_05_84D1_8455
.word table_05_84D1_8403
.word table_05_84D1_8455
.word table_05_84D1_8403
.word table_05_84D1_84DD
.word table_05_84D1_84EF

table_05_84D1_84DD:
	LDX #$02
	LDA #$00
	JSR _loc_05_82B0
	DEC счетчик_опций
	LDA #$FF
	STA номер_опции
	JMP _loc_05_843D

table_05_84D1_84EF:
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_81DD
	JSR _loc_05_86A0_изменить_сложность
	JMP _loc_05_8455

table_05_834B_84FD:
	LDX #$02
	LDA номер_опции
	BPL bra_05_8509
	LDA #$00
	STA номер_опции
bra_05_8509:
	JSR _loc_05_817E
	JSR _b07_EC8F

table_05_850F:		; байты после JSR
.word table_05_850F_8455
.word table_05_850F_8403
.word table_05_850F_8455
.word table_05_850F_8521
.word table_05_850F_8533
.word table_05_850F_8540
.word table_05_850F_8568
.word table_05_850F_8574
.word table_05_850F_8584

table_05_850F_8521:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$FF
	STA номер_опции
	LDA #$03
	STA счетчик_опций
	JMP _loc_05_8455

table_05_850F_8533:
	LDA #$FF
	STA номер_опции
	LDA #$02
	STA счетчик_опций
	JMP _loc_05_843D

table_05_850F_8540:
	LDY номер_опции
	CLC
	LDA $046E,Y
	ADC #$01
_loc_05_8549:
	AND #$0F
	STA $046E,Y
	JSR _loc_05_8A79
	LDA #$0C
	STA счетчик_буфера_атрибутов
	LDA #$0F
	STA байт_2006_lo_атрибуты
	LDA #$21
	STA байт_2006_hi_атрибуты
_loc_05_8560:
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JMP _loc_05_8455

table_05_850F_8568:
	LDY номер_опции
	SEC
	LDA $046E,Y
	SBC #$01
	JMP _loc_05_8549

table_05_850F_8574:
	SEC
	LDA номер_опции
	SBC #$01
	BPL bra_05_857E
	LDA #$09
_loc_05_857E:
bra_05_857E:
	STA номер_опции
	JMP _loc_05_8560

table_05_850F_8584:
	CLC
	LDA номер_опции
	ADC #$01
	CMP #$0A
	BCC bra_05_857E
	LDA #$00
	JMP _loc_05_857E
_loc_05_8593:
	JSR _loc_05_8205

table_05_8596:		; байты после JSR
.word table_05_8596_85DE
.word table_05_8596_85AA
.word table_05_8596_85DE
.word table_05_8596_85AA
.word table_05_8596_85E4
.word table_05_8596_85B6
.word table_05_8596_85F2
.word table_05_8596_85D2
.word table_05_8596_85F8
.word table_05_8596_85AA

table_05_8596_85AA:
.byte $02,$01,$00,$00,$00,$02,$01,$01,$01,$00,$02,$02

table_05_8596_85B6:
.byte $00,$00,$01,$01,$01,$01,$00,$00,$02,$02,$04,$03,$03,$03,$02,$04,$04,$04,$03,$02,$05,$05,$06,$06,$06,$06,$05,$05

table_05_8596_85D2:
.byte $00,$00,$02,$01,$01,$01,$00,$02,$02,$02,$01,$00

table_05_8596_85DE:
.byte $07,$06,$07,$0B,$07,$0E

table_05_8596_85E4:
.byte $11,$06,$14,$06,$11,$0B,$14,$0B,$17,$0B,$11,$0E,$14,$0E

table_05_8596_85F2:
.byte $07,$1A,$0E,$1A,$14,$1A

table_05_8596_85F8:
.byte $0F,$07,$10,$07,$11,$07,$13,$07,$14,$07,$15,$07,$17,$07,$18,$07,$19,$07,$1A,$07

_loc_05_860C_записать_номер_опц_относительно_режима:
; bzk 021 переписан код
; используется при первой отмене выбранного режима в главном меню
.SCOPE
	LDA опция_режим_сложность
.byte $F3,$20		; DVA 20
	TAY
	BNE @таблица		; если это первый заход в опции, то выставить сложность
						; но лучше присунуть запись начальной сложности куда-то в другое место
	LDA #СЛОЖНОСТЬ_СРЕДНЕ
	STA опция_режим_сложность
@таблица:
	LDA таблица,Y
	STA номер_опции
	RTS

таблица:
; самый первый байт будет считан при первом заходе в опции
; режима 60 нету в опциях, но для пк после матча лучше сделать 00
.byte $00,$02,$01,$00,$00
.ENDSCOPE


_loc_05_863A_вычисление_номера_опц_на_количестве_игроков_режима:
; выставляет курсор на количестве игроков соответствующего режима
; при первом выборе этого режима и при возврате к этому выбору из выбора сложности
; bzk 022 переписан код
.SCOPE
	LDA опция_режим_сложность
.byte $F3,$20		; DVA 20	делить на 20
	TAY
	LDA таблица - 1,Y		; добавляет базовое смещение к номеру опции, минус 1 потому что режима 00 нету
	CLC
	ADC количество_игроков
	STA номер_опции
	RTS

таблица:		
.byte $04	; пенальти
.byte $00	; минибатл
.byte $FF	; не используется, режима не существует
.byte $FF	; прохождение
.ENDSCOPE


_loc_05_866B_запись_номера_опции_из_текущей_сложности:
	LDA опция_режим_сложность
	AND #$03
	STA номер_опции
	RTS


_loc_05_8673_запись_режима_и_колва_игроков:
.SCOPE
; выставить базовые параметры при наведении на одну из трех опций режима игры
; bzk 021 удалены лишние 2 байта таблиц, так как четвертого режима не существует
; bzk 022 укорочен код
	LDY номер_опции
	LDA опция_режим_сложность
	AND #$03
	ORA таблица_режим,Y		; благодаря ORA сложность не меняется при отмене
	STA опция_режим_сложность
	LDA таблица_колво_игроков,Y
	STA количество_игроков
	RTS

таблица_режим:
.byte РЕЖИМ_ПРОХОЖДЕНИЕ
.byte РЕЖИМ_МИНИБАТЛ
.byte РЕЖИМ_ПК_ИЗ_МЕНЮ

таблица_колво_игроков:
.byte $01
.byte $02
.byte $01
.ENDSCOPE


_loc_05_868F_запись_колва_игроков:
.SCOPE
	LDY номер_опции
	LDA таблица_колво_игроков,Y
	STA количество_игроков
	RTS

таблица_колво_игроков:
.byte $01,$02,$02,$03,$04,$01,$02,$01
.ENDSCOPE


_loc_05_86A0_изменить_сложность:
	LDA опция_режим_сложность
	AND #$F8
	ORA номер_опции
	STA опция_режим_сложность
	RTS

_loc_05_86AA:
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	JSR _loc_05_B913
	LDY #$00
	LDA #$00
	STA флаг_владения_мячом_команды
	STA флаг_владения_мячом_команды + 1
bra_05_86BD:
	STA номер_игрока,Y
	INY
	STA номер_игрока,Y
	INY
	CLC
	ADC #$01
	CPY #$0C
	BCC bra_05_86BD
	LDA опция_режим_сложность
	BPL bra_05_86D9		; проверка на РЕЖИМ_ПРОХОЖДЕНИЕ
	LDY #$03
	STY номер_игрока + 8
	INY
	STY номер_игрока + 6
bra_05_86D9:
	LDA #$FF
	STA $054A
	LDY #$00
	LDA #$08
bra_05_86E2:
	STA $05D5,Y
	STA позиция_управление,Y
	INY
	CPY #$0C
	BCC bra_05_86E2
	LDA #$55
	STA $05D3
	STA $05D4
	LDY #$00
	LDA опция_режим_сложность
	BMI @записать_экран		; проверка на РЕЖИМ_ПРОХОЖДЕНИЕ
	INY		; значит сейчас РЕЖИМ_МИНИБАТЛ или РЕЖИМ_ПК_ИЗ_МЕНЮ
@записать_экран:		; bzk 021 удалены лишние предварительные проверки
	LDA #$02
	STA номер_экрана
	LDA table_05_8712_подтип__экрана,Y
	STA подтип_экрана
	RTS

table_05_8712_подтип__экрана:		; bzk 021 удалены последние 2 байта
.byte $0E,$05

_loc_05_871A:
	LDA подтип_экрана
	BMI @пропустить
	JSR _loc_05_80DF
	JSR _loc_05_8731
@пропустить:
	JSR _loc_05_87DC
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_872D:		; байты после JSR
.word table_05_872D_875D
.word table_05_872D_876B

_loc_05_8731:
	LDA #$FF
	STA номер_опции
	LDA #$05
	STA $61
	LDA #$00
	STA номер_команды
	LDA #$01
	STA номер_палитры_спрайтов
	STA номер_палитры_спрайтов + 1
	LDX #$26
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 1
	JSR _b07_запись_банков_спрайтов
	JSR _loc_05_8953
	LDA #МУЗЫКА_ПРОХОЖДЕНИЕ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	RTS

table_05_872D_875D:
	LDA флаг_яркости
	BPL bra_05_8765
	INC счетчик_опций
bra_05_8765:
	JSR _b07_D073
	RTS

table_05_872D_876B:
	LDX #$00
	LDA номер_опции
	BPL bra_05_877A
	JSR _loc_05_882F
	JSR _loc_05_88D0
	LDX #$00
bra_05_877A:
	JSR _loc_05_817E
	JSR _b07_EC8F

table_05_8780:		; байты после JSR
.word table_05_8780_87CB
.word table_05_8780_8792
.word table_05_8780_87CB
.word table_05_8780_8792
.word table_05_8780_87A5
.word table_05_8780_87AD
.word table_05_8780_87AD
.word table_05_8780_87C0
.word table_05_8780_87C0

table_05_8780_8792:
	JSR _loc_05_8868
	BCC bra_05_87CB
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_884F
	JSR _loc_05_8885
	JMP _loc_05_87CB

table_05_8780_87A5:
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JMP _loc_05_87CB

table_05_8780_87AD:
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_88FF
	LDX #$00
	JSR _loc_05_81DD
	JSR _loc_05_88D0
	JMP _loc_05_87CB

table_05_8780_87C0:
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_81DD
	JMP _loc_05_87CB

_loc_05_87CB:
bra_05_87CB:
table_05_8780_87CB:
	LDX #$00
	JSR _loc_05_822A
	LDA #$00
	JSR _loc_05_828D
	JSR _b07_EB8C
	JSR _loc_05_8014
	RTS

_loc_05_87DC:
	JSR _loc_05_8205

table_05_87DF:		; байты после JSR
.word table_05_87DF_8817
.word table_05_87DF_87E7
.word table_05_87DF_8817
.word table_05_87DF_87E7

table_05_87DF_87E7:
.byte $03,$01,$08,$04,$00,$02,$09,$05,$01,$03,$0A,$06,$02,$00,$0B,$07,$07,$05,$00,$08,$04,$06,$01,$09,$05,$07,$02,$0A,$06,$04,$03,$0B,$0B,$09,$04,$00,$08,$0A,$05,$01,$09,$0B,$06,$02,$0A,$08,$07,$03

table_05_87DF_8817:
.byte $0D,$06,$0D,$0B,$0D,$10,$0D,$15,$14,$06,$14,$0B,$14,$10,$14,$15,$19,$06,$19,$0B,$19,$10,$19,$15

_loc_05_882F:
	LDY #$00
	LDA номер_команды + 1
	AND #$0F
	STA $1C
bra_05_8838:
	LDA table_05_89F9,Y
	AND #$0F
	CMP $1C
	BEQ bra_05_8849
	INY
	INY
	CPY #$18
	BCC bra_05_8838
	LDY #$00
bra_05_8849:
	TYA
	LSR
	STA номер_опции
	RTS
_loc_05_884F:
	LDA номер_опции
	ASL
	TAY
	LDA table_05_89F9,Y
	ORA #$80
	STA номер_команды + 1
	AND #$0F
	LSR
	LSR
	TAY
	LDA table_05_A6D1_музыка_материка,Y
	STA номер_музыки
	RTS
_loc_05_8868:
	LDA номер_опции
	ASL
	TAY
	LDA table_05_89F9 + 1,Y
	TAY
	LDA $053E,Y
	AND #$03
	CMP #$03
	BNE bra_05_8883
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	CLC
	RTS
bra_05_8883:
	SEC
	RTS

_loc_05_8885:
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	JSR _loc_05_BB47
	LDA #$03
	STA подтип_экрана
	RTS
_loc_05_8893:
	LDA подтип_экрана
	BMI bra_05_88A2
	JSR _loc_05_80DF
	JSR _loc_05_8953
	LDA #МУЗЫКА_МЕНЮ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
bra_05_88A2:
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_88A8:		; байты после JSR
.word table_05_88A8_88AC
.word table_05_88A8_88BA

table_05_88A8_88AC:
	LDA флаг_яркости
	BPL bra_05_88B4
	INC счетчик_опций
bra_05_88B4:
	JSR _b07_D073
	RTS

table_05_88A8_88BA:
	LDA одноразовые_кнопки
	AND #(КНОПКА_СЕЛЕКТ + КНОПКА_СТАРТ + КНОПКА_А + КНОПКА_Б)
	BEQ bra_05_88CF
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	LDA #$04
	STA подтип_экрана
bra_05_88CF:
	RTS

_loc_05_88D0:
	LDA номер_опции
	AND #$03
	ASL
	TAY
	LDA table_05_892B,Y
	STA $30
	LDA table_05_892B + 1,Y
	STA $31
	LDX #$00
bra_05_88E3:
	LDA table_05_893F,Y
	STA буфер_графики,X
	INX
	TXA
	AND #$07
	BNE bra_05_88F0
	INY
bra_05_88F0:
	CPX #$10
	BCC bra_05_88E3
	LDY #$02
bra_05_88F6:
	LDA ($30),Y
	STA байт_2006_hi_графика,Y
	DEY
	BPL bra_05_88F6
	RTS
_loc_05_88FF:
	STY $44
	LDA номер_опции
	AND #$03
	ASL
	TAY
	LDA table_05_892B,Y
	STA $30
	LDA table_05_892B + 1,Y
	STA $31
	LDX #$00
bra_05_8914:
	LDA #$FF
	STA буфер_атрибутов,X
	INX
	CPX #$10
	BCC bra_05_8914
	LDY #$02
bra_05_8920:
	LDA ($30),Y
	STA байт_2006_hi_атрибуты,Y
	DEY
	BPL bra_05_8920
	LDY $44
	RTS

table_05_892B:		; читается из 2х мест
.word table_05_892B_8933
.word table_05_892B_8936
.word table_05_892B_8939
.word table_05_892B_893C

table_05_892B_8933:
.byte $23,$C8,$10

table_05_892B_8936:
.byte $23,$D0,$10

table_05_892B_8939:
.byte $23,$D8,$10

table_05_892B_893C:
.byte $23,$E0,$10

table_05_893F:
.byte  $AA,$FA,$AF,$FA,$AF,$AA,$FF,$AA

_loc_05_8947:
	JSR _b07_ECA9
	JSR _b07_выключить_NMI
	JSR _b07_выключить_рендеринг
	JMP _loc_05_899E
_loc_05_8953:
	JSR _b07_ECA9
	JSR _b07_выключить_NMI
	JSR _b07_выключить_рендеринг
	LDX #$00
bra_05_895E:
	TXA
	ASL
	TAY
	LDA table_05_89F9 + 1,Y
	TAY
	LDA $053E,Y
	STA $1C
	AND #$03
	BEQ bra_05_8999
	STA $1D
	TXA
	ASL
	TAY
	LDA $2002
	LDA table_05_89E1 + 1,Y
	STA $2006
	LDA table_05_89E1,Y
	STA $2006
	LDY #$00
bra_05_8984:
	LDA $1C
	BPL bra_05_898D
	LDA #$16
	JMP _loc_05_898F
bra_05_898D:
	LDA #$17
_loc_05_898F:
	STA $2007
	ASL $1C
	INY
	CPY $1D
	BCC bra_05_8984
bra_05_8999:
	INX
	CPX #$0C
	BCC bra_05_895E
_loc_05_899E:
	LDA $0558
	JSR _loc_05_8A11
	LDY #$00
	JSR _loc_05_8A34
	LDA $0557
	JSR _loc_05_8A11
	LDY #$02
	JSR _loc_05_8A34
	LDA $0555
	JSR _loc_05_8A11
	LDY #$04
	JSR _loc_05_8A34
	JSR _loc_05_B8A5
	JSR _loc_05_8A6D
	JSR _loc_05_8A79
	LDA #$0C
	STA счетчик_буфера_атрибутов
	LDA #$6B
	STA байт_2006_lo_атрибуты
	LDA #$23
	STA байт_2006_hi_атрибуты
	JSR _b07_EFAD
	JSR _b07_включить_рендеринг
	JSR _b07_включить_NMI
	RTS

table_05_89E1:		; байты для 2006
.byte $EE,$20
.byte $8E,$21
.byte $2E,$22
.byte $CE,$22
.byte $F5,$20
.byte $95,$21
.byte $35,$22
.byte $D5,$22
.byte $FA,$20
.byte $9A,$21
.byte $3A,$22
.byte $DA,$22

table_05_89F9:		; читается из 2х мест
.byte $41,$00
.byte $07,$05
.byte $0E,$0A
.byte $4A,$07
.byte $43,$02
.byte $45,$03
.byte $0D,$09
.byte $0B,$08
.byte $02,$01
.byte $46,$04
.byte $4F,$0B
.byte $09,$06

_loc_05_8A11:
	STA $30
	LDA #$00
	STA $31
	STA $32
_loc_05_8A19:
bra_05_8A19:
	SEC
	LDA $30
	SBC #$0A
	BCS bra_05_8A21
	RTS
bra_05_8A21:
	STA $30
	INC $31
	LDA $31
	CMP #$0A
	BCC bra_05_8A19
	LDA #$00
	STA $31
	INC $32
	JMP _loc_05_8A19
_loc_05_8A34:
	LDA $2002
	LDA table_05_8A67 + 1,Y
	STA $2006
	LDA table_05_8A67,Y
	STA $2006
	LDA #$00
	STA $21
	LDA $30
	ORA #$80
	STA $30
	LDY #$02
bra_05_8A4F:
	LDA $0030,Y
	BNE bra_05_8A5C
	BIT $21
	BMI bra_05_8A5E
	LDA #$02
	BNE bra_05_8A60
bra_05_8A5C:
	DEC $21
bra_05_8A5E:
	ORA #$80
bra_05_8A60:
	STA $2007
	DEY
	BPL bra_05_8A4F
	RTS

table_05_8A67:		; байты для 2006
.byte $2A,$23
.byte $30,$23
.byte $36,$23

_loc_05_8A6D:
	LDY #$09
bra_05_8A6F:
	LDA $002C,Y
	STA $046E,Y
	DEY
	BPL bra_05_8A6F
	RTS
_loc_05_8A79:
	LDX #$00
	LDY #$00
	LDA #$03
	STA $1C
	JSR _loc_05_8AA8
	JSR _loc_05_8AB7
	LDA #$06
	STA $1C
	JSR _loc_05_8AA8
	JSR _loc_05_8AB7
	LDA #$0A
	STA $1C
	JSR _loc_05_8AA8
	LDA #$0C
	STA счетчик_буфера_атрибутов
	LDA #$6B
	STA байт_2006_lo_атрибуты
	LDA #$23
	STA байт_2006_hi_атрибуты
	RTS
_loc_05_8AA8:
bra_05_8AA8:
	LDA $046E,Y
	ORA #$80
	STA буфер_атрибутов,X
	INX
	INY
	CPY $1C
	BCC bra_05_8AA8
	RTS
_loc_05_8AB7:
	LDA #$FF
	STA буфер_атрибутов,X
	INX
	RTS
_loc_05_8ABE:
	LDA подтип_экрана
	BMI bra_05_8AC8
	JSR _loc_05_80DF
	JSR _loc_05_8AD5
bra_05_8AC8:
	JSR _loc_05_8C73
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_8AD1:		; байты после JSR
.word table_05_8AD1_8B6E
.word table_05_8AD1_8B80

_loc_05_8AD5:
	LDA #$00
	STA номер_опции
	STA номер_анимации_мяча
	LDA #$06
	STA номер_опции + 1
	LDA #$05
	STA $63
	STA $64
	LDA #$01
	STA $6D
	STA номер_палитры_спрайтов
	LDX #$08
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 3
	JSR _loc_05_BD38
	JSR _loc_05_BDB0
	JSR _b07_запись_банков_спрайтов
	LDX #$00
bra_05_8B06:
	LDA #$00
	STA $61,X
	STA координата_X_hi,X
	STA координата_Y_hi,X
	STA координата_Z_lo,X
	STA координата_Z_hi,X
	STA скорость_X_lo,X
	STA скорость_X_hi,X
	STA скорость_Y_lo,X
	STA скорость_Y_hi,X
	STA скорость_Z_lo,X
	STA скорость_Z_hi,X
	LDA #$FF
	STA номер_действия,X
	LDA #$01
	STA номер_движения,X
	TXA
	ASL
	TAY
	LDA table_05_8B7C,Y
	STA координата_X_lo,X
	LDA table_05_8B7C + 1,Y
	STA координата_Y_lo,X
	INX
	CPX #$02
	BCC bra_05_8B06
	LDA #$00
	STA игрок_с_мячом
	STA направление_движения
	LDA #$80
	STA направление_движения + 1
	STA координата_X_lo_мяча
	LDA #$D0
	STA координата_Y_lo_мяча
	LDA #$00
	STA координата_X_hi_мяча
	STA координата_Y_hi_мяча
	STA координата_Z_lo_мяча
	STA координата_Z_hi_мяча
	JSR _loc_05_8D0A
	RTS

table_05_8AD1_8B6E:
	LDA флаг_яркости
	BPL bra_05_8B76
	INC счетчик_опций
bra_05_8B76:
	JSR _b07_D073
	JMP _loc_05_8C2D

table_05_8B7C:
.byte $40,$D0
.byte $C0,$D0

table_05_8AD1_8B80:
	LDA опция_режим_сложность
	AND #РЕЖИМ_ПК_ИЗ_МЕНЮ
	BEQ bra_05_8B99
	LDA количество_игроков
	CMP #$01
	BNE bra_05_8B99
	LDA #$00
	STA одноразовые_кнопки + 1
	LDA номер_опции
	BPL bra_05_8B99
	LDA одноразовые_кнопки
	STA одноразовые_кнопки + 1
bra_05_8B99:
	LDY #$00
	LDX #$02
_loc_05_8B9D:
	STY счетчик_смен
	LDA номер_опции
	AND номер_опции + 1
	BMI bra_05_8BC5
	JSR _loc_05_817E
	JSR _b07_EC8F

table_05_8BAE:		; байты после JSR
.word table_05_8BAE_8C16
.word table_05_8BAE_8BC0
.word table_05_8BAE_8C16
.word table_05_8BAE_8BCE
.word table_05_8BAE_8BEB
.word table_05_8BAE_8C06
.word table_05_8BAE_8C06
.word table_05_8BAE_8C06
.word table_05_8BAE_8C06

table_05_8BAE_8BC0:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
bra_05_8BC5:
	JSR _loc_05_8CC6
	JSR _loc_05_8CEE
	JMP _loc_05_8C2D

table_05_8BAE_8BCE:
	LDY счетчик_смен
	LDA номер_опции,Y
	BMI _loc_05_8C16
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA номер_опции,Y
	ORA #$80
	STA номер_опции,Y
	LDA #$00
	JSR _loc_05_82B0
	JMP _loc_05_8C16

table_05_8BAE_8BEB:
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDY счетчик_смен
	LDA номер_опции,Y
	BPL _loc_05_8C16
	LDA номер_опции,Y
	AND #$7F
	STA номер_опции,Y
	JSR _loc_05_82EF
	JMP _loc_05_8C16

table_05_8BAE_8C06:
	LDY счетчик_смен
	LDA номер_опции,Y
	BMI _loc_05_8C16
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_81DD

_loc_05_8C16:
table_05_8BAE_8C16:
	JSR _loc_05_822A
	LDA #$0D
	JSR _loc_05_828D
	JSR _b07_EB8C
	INX
	LDY счетчик_смен
	INY
	CPY #$02
	BCS _loc_05_8C2D
	JMP _loc_05_8B9D
_loc_05_8C2D:		; сюда 2 прыжка и 1 переход
	JSR _loc_05_8041
	JSR _loc_05_8014
	JSR _b07_запись_банков_спрайтов
	LDA $66
	STA банк_спрайтов + 1
	LDA $67
	STA банк_спрайтов + 2
	JSR _loc_05_BD38
	LDA $66
	PHA
	LDA $67
	PHA
	LDA банк_спрайтов + 1
	STA $66
	LDA банк_спрайтов + 2
	STA $67
	PLA
	STA банк_спрайтов + 2
	PLA
	STA банк_спрайтов + 1
	JSR _loc_05_8CC6
	JSR _loc_05_BDB0
	JSR _b07_яркость_палитры_и_запись_в_буфер
	LDA #$3F
	STA байт_2006_hi_палитра
	RTS
_loc_05_8C73:
	JSR _loc_05_8205

table_05_8C76:		; байты после JSR
.word table_05_8C76_8CAE
.word table_05_8C76_8C7E
.word table_05_8C76_8CAE
.word table_05_8C76_8C7E

table_05_8C76_8C7E:
.byte $05,$01,$05,$01,$00,$02,$00,$02,$01,$03,$01,$03,$02,$04,$02,$04,$03,$05,$03,$05,$04,$00,$04,$00,$0B,$07,$0B,$07,$06,$08,$06,$08,$07,$09,$07,$09,$08,$0A,$08,$0A,$09,$0B,$09,$0B,$0A,$06,$0A,$06

table_05_8C76_8CAE:
.byte $06,$08,$06,$0A,$06,$0C,$06,$0E,$06,$10,$06,$12,$13,$08,$13,$0A,$13,$0C,$13,$0E,$13,$10,$13,$12

_loc_05_8CC6:
	LDX #$00
bra_05_8CC8:
	LDA номер_опции,X
	AND #$0F
	TAY
	LDA table_05_8CFE,Y
	STA номер_команды,X
	INX
	CPX #$02
	BCC bra_05_8CC8
	LDA опция_режим_сложность
	AND #РЕЖИМ_ПК_ИЗ_МЕНЮ
	BEQ @RTS
	LDA количество_игроков
	CMP #$01
	BNE @RTS
	LDA номер_команды + 1
	ORA #$80
	STA номер_команды + 1
@RTS:
	RTS

_loc_05_8CEE:
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	LDA #$00
	STA счетчик_смен
	LDA #$06
	STA подтип_экрана
	RTS

table_05_8CFE:
.byte $00,$0B,$09,$0E,$0D,$07,$00,$0B,$09,$0E,$0D,$07

_loc_05_8D0A:
	JSR _b07_ECA9
	JSR _b07_выключить_NMI
	JSR _b07_выключить_рендеринг
	BIT опция_режим_сложность
	BVS bra_05_8D22		; проверка на РЕЖИМ_МИНИБАТЛ или РЕЖИМ_ПК_ПОСЛЕ_МАТЧА
	LDY #$04
bra_05_8D19:
	LDA table_05_8D61,Y
	STA байт_2006_hi_атрибуты,Y
	DEY
	BPL bra_05_8D19
bra_05_8D22:
	LDA количество_игроков
	ORA #$80
	STA буфер_графики
	LDY #$02
bra_05_8D2B:
	LDA table_05_8D66,Y
	STA байт_2006_hi_графика,Y
	DEY
	BPL bra_05_8D2B
	LDA количество_игроков
	ASL
	TAY
	LDA table_05_8D69,Y
	STA $2C
	LDA table_05_8D69 + 1,Y
	STA $2D
	LDY #$02
	LDA ($2C),Y
	CLC
	ADC #$03
	TAY
bra_05_8D4A:
	LDA ($2C),Y
	STA байт_2006_hi_палитра,Y
	DEY
	BPL bra_05_8D4A
	JSR _b07_EFAD
	JSR _b07_включить_рендеринг
	JSR _b07_включить_NMI
	LDA #МУЗЫКА_МЕНЮ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	RTS

table_05_8D61:
.byte $20,$6A,$02,$9D,$9F

table_05_8D66:
.byte $20,$74,$01

table_05_8D69:
.word table_05_8D69_8D73
.word table_05_8D69_8D73
.word table_05_8D69_8D85
.word table_05_8D69_8D97
.word table_05_8D69_8DA9

table_05_8D69_8D73:
.byte $20,$CA,$0F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$8C,$9D,$3D,$02,$02

table_05_8D69_8D85:
.byte $20,$CA,$0F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$82,$9D,$02,$02,$02

table_05_8D69_8D97:
.byte $20,$CA,$0F,$83,$9D,$02,$02,$02,$02,$02,$02,$02,$02,$82,$9D,$02,$02,$02

table_05_8D69_8DA9:
.byte $20,$CA,$0F,$83,$9D,$02,$02,$02,$02,$02,$02,$02,$02,$82,$9D,$02,$84,$9D

_loc_05_8DBC:
	LDA подтип_экрана
	BMI bra_05_8DC6
	JSR _loc_05_80DF
	JSR _loc_05_8DD0
bra_05_8DC6:
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_8DCC:		; байты после JSR
.word table_05_8DCC_8DFD
.word table_05_8DCC_8E08

_loc_05_8DD0:
	LDX #$28
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 1
	INX
	STX банк_спрайтов + 2
	INX
	STX банк_спрайтов + 3
	JSR _b07_запись_банков_спрайтов
	LDA #$00
	STA лицо_игрока + 1
	STA лицо_игрока + 3
	LDA #$38
	STA $05D2
	JSR _loc_05_8E3C
	JSR _loc_05_8F79
	LDA #МУЗЫКА_ЭКРАН_VS
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	RTS

table_05_8DCC_8DFD:
	LDA флаг_яркости
	BPL bra_05_8E05
	INC счетчик_опций
bra_05_8E05:
	JMP _loc_05_8E32

table_05_8DCC_8E08:
	BIT флаг_яркости
	BPL bra_05_8E32
	BVC bra_05_8E15
	JSR _loc_05_8F73
	RTS
bra_05_8E15:
	LDA одноразовые_кнопки
	AND #(КНОПКА_СТАРТ)
	BEQ bra_05_8E26
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
bra_05_8E20:
	JSR _b07_поставить_флаг_уменьшения_яркости
	JMP _loc_05_8E32
bra_05_8E26:
	LDA счетчик_кадров
	AND #$0F
	BNE bra_05_8E32
	DEC $05D2
	BMI bra_05_8E20
_loc_05_8E32:
bra_05_8E32:
	JSR _loc_05_8EE5
	JSR _loc_05_8014
	JSR _b07_D073
	RTS

_loc_05_8E3C:
	LDX #$00
bra_05_8E3E:
	STX $43
	CPX #$02
	BCS bra_05_8E59
	LDA номер_команды,X
	AND #$0F
	TAY
	LDA table_05_8EC3,Y
	STA номер_палитры_спрайтов,X
	LDA table_05_8EB3,Y

; зачем тут повторная загрузка Y?
	LDY table_05_8EFB,X
	STA $0074,Y
bra_05_8E59:
	LDY table_05_8EFB,X

	LDA #$06
	STA $0061,Y
	TXA
	ASL
	ASL
	TAX
	LDA table_05_8ED5,X
	STA координата_X_lo,Y
	LDA table_05_8ED5 + 1,X
	STA координата_X_hi,Y
	LDA table_05_8ED5 + 2,X
	STA координата_Y_lo,Y
	LDA table_05_8ED5 + 3,X
	STA координата_Y_hi,Y
	LDX $43
	INX
	CPX #$04
	BCC bra_05_8E3E
	LDA #$01
	STA $045C
	LDA опция_материка
	ASL
	ADC опция_материка
	TAY
	LDA table_05_8EA4,Y
	STA номер_движения + 1
	LDA table_05_8EA4 + 1,Y
	STA номер_палитры_спрайтов + 2
	LDA table_05_8EA4 + 2,Y
	STA номер_палитры_спрайтов + 3
	RTS

table_05_8EA4:
.byte $04,$24,$24
.byte $03,$23,$23
.byte $04,$25,$25
.byte $02,$1A,$1B
.byte $03,$23,$23

table_05_8EB3:
.byte $8C,$80,$81,$82,$8C,$83,$84,$85,$8C,$86,$87,$88,$8C,$89,$8A,$8B

table_05_8EC3:
.byte $15,$15,$15,$15,$15,$17,$17,$17,$15,$17,$15,$16,$15,$19,$18,$16,$00,$00

table_05_8ED5:
.byte $40,$00,$97,$00
.byte $B8,$00,$97,$00
.byte $20,$01,$C8,$00
.byte $20,$01,$C8,$00


_loc_05_8EE5:
	LDX #$00
bra_05_8EE7:
	STX $43
	LDA table_05_8EFB,X
	TAX
	JSR _loc_05_8EFF
	JSR _b07_EB8C
	LDX $43
	INX
	CPX #$04
	BCC bra_05_8EE7
	RTS

table_05_8EFB:		; читается из 3х мест
.byte $0C,$00,$01,$03

_loc_05_8EFF:
	LDA номер_движения,X
	JSR _b07_EC8F

table_05_8F05:		; байты после JSR
.word _общий_RTS
.word table_05_8F05_8F10
.word table_05_8F05_8F40
.word table_05_8F05_8F40
.word table_05_8F05_8F40

table_05_8F05_8F10:
	TXA
	TAY
	DEY
	DEY
	LDA координата_X_lo,Y
	STA координата_X_lo,X
	LDA координата_X_hi,Y
	STA координата_X_hi,X
	LDA координата_Y_lo,Y
	STA координата_Y_lo,X
	LDA координата_Y_hi,Y
	STA координата_Y_hi,X
	LDA координата_Z_lo,Y
	STA координата_Z_lo,X
	LDA координата_Z_hi,Y
	STA координата_Z_hi,X
	LDA $0074,Y
	STA номер_анимации,X
	INC номер_анимации,X
	RTS

table_05_8F05_8F40:
	LDA номер_движения,X
	BMI bra_05_8F52
	ORA #$80
	STA номер_движения,X
	LDA #$00
	STA таймер_кадра_анимации,X
	STA номер_кадра_анимации,X
bra_05_8F52:
	JSR _loc_05_8FCF
	LDA номер_движения,X
	SEC
	SBC #$02
	ASL
	TAY
	LDA table_05_8F6D_скорость_X,Y
	STA скорость_X_lo,X
	LDA table_05_8F6D_скорость_X + 1,Y
	STA скорость_X_hi,X
	JSR _loc_05_801E
	RTS

; 60fps скорость X	+++
table_05_8F6D_скорость_X:
.byte $80,$FF
.byte $A0,$FF
.byte $C0,$FF

_loc_05_8F73:
	LDA #$04
	STA подтип_экрана
	RTS
_loc_05_8F79:
	JSR _b07_ECA9
	JSR _b07_выключить_NMI
	JSR _b07_выключить_рендеринг
	LDX #$00
	STX $1C
bra_05_8F86:
	LDA номер_команды,X
	AND #$0F
	ASL
	TAY
	LDA table_05_8FAB + 4,Y
	STA номер_палитры_фона,X
	LDA table_05_8FAB + 5,Y
	STA банк_фона + 1
	INX
	CPX #$02
	BCC bra_05_8F86
	JSR _loc_05_BE9F
	JSR _loc_05_BEFA
	JSR _b07_включить_рендеринг
	JSR _b07_включить_NMI
	RTS

table_05_8FAB:		; вероятно первые 4 байта не нужны
.byte $E6,$20
.byte $F5,$20
.byte $1C,$68
.byte $23,$68
.byte $22,$68
.byte $24,$6A
.byte $1C,$68
.byte $26,$6A
.byte $25,$6A
.byte $1D,$68
.byte $1C,$68
.byte $20,$68
.byte $28,$6A
.byte $21,$68
.byte $1C,$68
.byte $1F,$68
.byte $1E,$68
.byte $27,$6A

_loc_05_8FCF:
	LDA table_05_8FE0
	STA $30
	LDA table_05_8FE0 + 1
	STA $31
	LDA номер_движения,X
	JSR _b07_CEBD
	RTS

table_05_8FE0:
.word table_05_8FE0_8FE2

table_05_8FE0_8FE2:
.word table_05_8FE0_8FE2_8FEC
.word table_05_8FE0_8FE2_8FEC
.word table_05_8FE0_8FE2_8FED
.word table_05_8FE0_8FE2_8FEF
.word table_05_8FE0_8FE2_8FF4

table_05_8FE0_8FE2_8FEC:
.byte $FF

table_05_8FE0_8FE2_8FED:		; дальше продолжение
.byte $00,$8D

table_05_8FE0_8FE2_8FEF:
.byte $08,$8F,$08,$91
.byte $FE

table_05_8FE0_8FE2_8FF4:
.byte $08,$93,$08,$95
.byte $FE

_loc_05_8FF9:
	LDA подтип_экрана
	BMI bra_05_900F
	JSR _loc_05_80DF
	BIT опция_режим_сложность
	BVC bra_05_900C		; проверка на РЕЖИМ_МИНИБАТЛ или РЕЖИМ_ПК_ПОСЛЕ_МАТЧА
	LDA #$13
	JSR _b07_E828
	JSR _loc_05_92CD
bra_05_900C:
	JSR _loc_05_901C
bra_05_900F:
	JSR _loc_05_90C7
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_9018:		; байты после JSR
.word table_05_9018_9060
.word table_05_9018_906E

_loc_05_901C:
	LDA #$FF
	STA номер_опции
	LDA #$05
	STA $61
	STA $62
	STA $64
	LDA #$00
	STA камера_X_lo
	STA камера_X_hi
	STA камера_Y_lo
	STA камера_Y_hi
	STA копия_камеры_X_lo
	STA копия_камеры_X_hi
	STA копия_камеры_Y_lo
	STA копия_камеры_Y_hi
	JSR _loc_05_9102
	LDX #$26
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 1
	LDA #$11
	STA банк_спрайтов + 3
	JSR _b07_запись_банков_спрайтов
	LDA #МУЗЫКА_МЕНЮ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	RTS

table_05_9018_9060:
	LDA флаг_яркости
	BPL bra_05_9068
	INC счетчик_опций
bra_05_9068:
	JSR _b07_D073
	JMP _loc_05_90A9

table_05_9018_906E:
	LDX #$00
	LDA номер_опции
	BPL bra_05_9078
	JSR _loc_05_90FC
bra_05_9078:
	JSR _loc_05_817E
	JSR _b07_EC8F

table_05_907E:		; байты после JSR
.word table_05_907E_90A9
.word table_05_907E_9090
.word table_05_907E_90A9
.word table_05_907E_9090
.word table_05_907E_9096
.word table_05_907E_90A1
.word table_05_907E_90A1
.word table_05_907E_90A1
.word table_05_907E_90A1

table_05_907E_9090:
	JSR _loc_05_924D
	JMP _loc_05_90A9

table_05_907E_9096:
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_90FC
	JMP _loc_05_90A9

table_05_907E_90A1:
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_81DD

_loc_05_90A9:
table_05_907E_90A9:
	LDX #$00
	JSR _loc_05_822A
	LDA #$00
	JSR _loc_05_828D
	JSR _b07_EB8C
	INX
bra_05_90B7:
	JSR _loc_05_9194
	JSR _b07_EB8C
	INX
	INX
	CPX #$04
	BCC bra_05_90B7
	JSR _loc_05_8014
	RTS
_loc_05_90C7:
	JSR _loc_05_8205

table_05_90CA:		; байты после JSR
.word table_05_90CA_90EE
.word table_05_90CA_90D2
.word table_05_90CA_90EE
.word table_05_90CA_90D2

table_05_90CA_90D2:
.byte $02,$01,$03,$03,$00,$02,$04,$04,$01,$00,$06,$06,$06,$04,$00,$00,$03,$05,$01,$01,$04,$06,$02,$02,$05,$03,$02,$02

table_05_90CA_90EE:
.byte $05,$12,$05,$14,$05,$18,$11,$12,$11,$14,$11,$16,$11,$18

_loc_05_90FC:
	LDA #$02
	STA номер_опции
	RTS
_loc_05_9102:
	LDX счетчик_смен
	LDA номер_команды,X
	AND #$0F
	BEQ bra_05_910E
	LDA #$0C
bra_05_910E:
	CLC
	ADC номер_игрока,X
	STA лицо_игрока + 1
	LDA номер_команды,X
	AND #$0F
	ASL
	TAY
	LDA table_05_BDF6,Y
	STA банк_спрайтов + 2
	LDA table_05_BDD6,Y
	STA номер_палитры_спрайтов + 2
	LDA счетчик_смен
	BNE bra_05_9133
	LDA номер_палитры_спрайтов + 2
	JMP _loc_05_9136
bra_05_9133:
	LDA table_05_BDD6 + 1,Y
_loc_05_9136:
	STA номер_палитры_спрайтов + 3
	LDA #$01
	STA номер_палитры_спрайтов
	STA номер_палитры_спрайтов + 1
	LDY #$00
	LDX #$00
	LDA счет_команды
	CMP счет_команды + 1
	BEQ bra_05_9151
	INY
	BCC bra_05_9151
	INY
bra_05_9151:
	TYA
	ASL
	ASL
	TAY
	LDA счетчик_смен
	BEQ bra_05_915C
	INY
	INY
bra_05_915C:
	LDA table_05_9184,Y
	STA номер_движения + 1,X
	LDA table_05_9190,X
	STA координата_X_lo + 1,X
	LDA table_05_9190 + 1,X
	STA координата_Y_lo + 1,X
	LDA #$00
	STA координата_X_hi + 1,X
	STA координата_Y_hi + 1,X
	STA координата_Z_lo + 1,X
	STA координата_Z_hi + 1,X
	INX
	INX
	INY
	CPX #$04
	BCC bra_05_915C
	RTS

table_05_9184:
.byte $01,$04,$01,$04,$03,$06,$02,$05,$02,$05,$03,$06

table_05_9190:
.byte $64,$72
.byte $3C,$74

_loc_05_9194:
	LDA номер_движения,X
	JSR _b07_EC8F

table_05_919A:		; байты после JSR
.word table_05_919A_91AE
.word table_05_919A_91AF
.word table_05_919A_91AF
.word table_05_919A_91AF
.word table_05_919A_91AF
.word table_05_919A_91AF
.word table_05_919A_91AF
.word table_05_919A_91AF
.word table_05_919A_91AF
.word table_05_919A_91AF

table_05_919A_91AE:
	RTS

table_05_919A_91AF:
	LDA номер_движения,X
	BMI bra_05_91B7
	JSR _loc_05_91BB
bra_05_91B7:
	JSR _loc_05_91D5
	RTS
_loc_05_91BB:
	ORA #$80
	STA номер_движения,X
	LDA #$00
	STA таймер_кадра_анимации,X
	STA номер_кадра_анимации,X
	STA подтип_анимации,X
	RTS

_loc_05_91CC:
	LDA номер_движения,X
	AND #$7F
	STA номер_движения,X
	RTS

_loc_05_91D5:
	LDA table_05_91F0
	STA $30
	LDA table_05_91F0 + 1
	STA $31
	LDA table_05_91F2
	STA $32
	LDA table_05_91F2 + 1
	STA $33
	LDA номер_движения,X
	JSR _b07_CEBD
	RTS

table_05_91F0:
.word table_05_91F0_91F4

table_05_91F2:
.word _loc_05_91CC

table_05_91F0_91F4:		; самый первый видимо не используется
.word table_05_91F0_91F4_9208
.word table_05_91F0_91F4_9208
.word table_05_91F0_91F4_921A
.word table_05_91F0_91F4_9224
.word table_05_91F0_91F4_920D
.word table_05_91F0_91F4_921F
.word table_05_91F0_91F4_9229
.word table_05_91F0_91F4_922E
.word table_05_91F0_91F4_9233
.word table_05_91F0_91F4_9244

table_05_91F0_91F4_9208:
.byte $09,$82,$09,$83,$FE

table_05_91F0_91F4_920D:
.byte $20,$8E,$06,$8F,$06,$8E,$06,$8F,$06,$8E,$06,$8F,$FE

table_05_91F0_91F4_921A:
.byte $08,$86,$18,$87,$FE

table_05_91F0_91F4_921F:
.byte $08,$92,$18,$93,$FE

table_05_91F0_91F4_9224:
.byte $09,$84,$09,$85,$FE

table_05_91F0_91F4_9229:
.byte $04,$90,$04,$91,$FE

table_05_91F0_91F4_922E:
.byte $14,$87,$14,$8A,$FE

table_05_91F0_91F4_9233:
.byte $06,$9B,$06,$9C,$06,$9B,$06,$9C,$06,$9B,$06,$9C,$36,$9B,$15,$9D,$FE

table_05_91F0_91F4_9244:
.byte $10,$80,$10,$9E,$10,$80,$10,$9F,$FE

_loc_05_924D:
	LDY счетчик_смен
	LDA номер_игрока,Y
	STA $05D1
	LDA номер_опции
	ASL
	TAY
	LDA опция_режим_сложность
	BMI bra_05_9260		; проверка на РЕЖИМ_ПРОХОЖДЕНИЕ
	INY
bra_05_9260:
	LDA table_05_92BF,Y
	BPL bra_05_9270
	ASL
	BPL bra_05_9270
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	RTS
bra_05_9270:
	STY $44
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	LDY $44
	LDA table_05_92BF,Y
	BEQ bra_05_929B
	BMI bra_05_92B0
	CMP #$09
	BNE bra_05_9291
	LDY $054A
	BMI bra_05_9291
	LDA #$0F
bra_05_9291:
	STA подтип_экрана
	LDA #$04
	STA $5B
	RTS
bra_05_929B:
	JSR _b07_C335
	LDA #$00
	STA счетчик_смен
	STA номер_экрана
	STA подтип_экрана
	JSR _loc_05_BB84
	JSR _loc_05_800F
	RTS
bra_05_92B0:
	LDA счетчик_смен
	BNE bra_05_929B
	INC счетчик_смен
	LDA подтип_экрана
	AND #$7F
	STA подтип_экрана
	RTS

table_05_92BF:		; читается из 2х мест
.byte $07,$07,$0D,$FF,$00,$80,$08,$08,$09,$FF,$0A,$FF,$0B,$0B

_loc_05_92CD:
	LDY счетчик_смен
	LDA номер_команды,Y
	AND #$0F
	ASL
	TAY
	LDA table_05_9313,Y
	STA $30
	LDA table_05_9313 + 1,Y
	STA $31
	LDA #$FF
	STA $1C
	LDY #$DA
	STY $1D
	INY
	STY $1E
	LDA #$06
	STA $1F
	STA счетчик_буфера_атрибутов
	STA счетчик_буфера_графики
	JSR _loc_05_AD91
	LDA $1F
	LDA #$4B
	STA байт_2006_lo_атрибуты
	LDA #$6B
	STA байт_2006_lo_графика
	LDA #$20
	STA байт_2006_hi_атрибуты
	STA байт_2006_hi_графика
bra_05_930D:
	LDA байт_2006_hi_атрибуты
	BPL bra_05_930D
	RTS

table_05_9313:		; читается из 2х мест
.word table_05_9313_9333
.word table_05_9313_9339
.word table_05_9313_9339
.word table_05_9313_9339
.word table_05_9313_9339
.word table_05_9313_9339
.word table_05_9313_9339
.word table_05_9313_9339
.word table_05_9313_933F
.word table_05_9313_933F
.word table_05_9313_9345
.word table_05_9313_9345
.word table_05_9313_934B
.word table_05_9313_934B
.word table_05_9313_9351
.word table_05_9313_9357		; этот поинтер ссылается на код ниже

table_05_9313_9333:
.byte $B9,$D0,$AA,$B3,$8F,$8C

table_05_9313_9339:
.byte $A7,$C3,$CA,$D9,$CF,$FF

table_05_9313_933F:
.byte $35,$A3,$B3,$FF,$FF,$FF

table_05_9313_9345:
.byte $A3,$B1,$C9,$A2,$FF,$FF

table_05_9313_934B:
.byte $3D,$C8,$2D,$CA,$FF,$FF

table_05_9313_9351:
.byte $A2,$CA,$2F,$CF,$B2,$CF

_loc_05_9357:
table_05_9313_9357:
	LDA подтип_экрана
	BMI bra_05_9361
	JSR _loc_05_80DF
	JSR _loc_05_9396
bra_05_9361:
	JSR _loc_05_94C2
	LDA копия_камеры_X_lo
	STA камера_X_lo
	LDA копия_камеры_X_hi
	STA камера_X_hi
	LDA копия_камеры_Y_lo
	STA камера_Y_lo
	LDA копия_камеры_Y_hi
	STA камера_Y_hi
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_9382:		; байты после JSR
.word table_05_9382_9403
.word table_05_9382_9403
.word table_05_9382_9414
.word table_05_9382_9414
.word table_05_9382_9414
.word table_05_9382_9414
.word table_05_9382_9414
.word table_05_9382_9414
.word table_05_9382_9414
.word table_05_9382_9414

_loc_05_9396:
	LDA #$FF
	STA номер_опции
	LDA #$7F
	STA номер_анимации
	STA номер_анимации + 1
	STA номер_анимации + 2
	STA номер_анимации + 3
	LDA #$05
	STA $61
	STA $62
	LDA #$01
	STA номер_палитры_спрайтов
	STA номер_палитры_спрайтов + 1
	STA номер_палитры_спрайтов + 2
	STA номер_палитры_спрайтов + 3
	LDX #$26
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 1
	JSR _b07_запись_банков_спрайтов
	LDA счетчик_опций
	PHA
	JSR _b07_ECA9
	JSR _b07_выключить_NMI
	JSR _b07_выключить_рендеринг
	LDA #$02
	STA счетчик_опций
bra_05_93DD:
	JSR _loc_05_955D
	JSR _loc_05_96AA
	JSR _b07_EFAD
	INC счетчик_опций
	LDA счетчик_опций
	CMP #$0A
	BCC bra_05_93DD
	JSR _b07_включить_рендеринг
	JSR _b07_включить_NMI
	PLA
	STA счетчик_опций
	JSR _loc_05_955D
	LDA #МУЗЫКА_МЕНЮ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	RTS

table_05_9382_9403:
	LDA флаг_яркости
	BPL bra_05_940E
	INC счетчик_опций
	INC счетчик_опций
bra_05_940E:
	JSR _b07_D073
	JMP _loc_05_949A

table_05_9382_9414:
	LDX #$00
	LDA номер_опции
	BPL bra_05_9420
	LDA #$00
	STA номер_опции
bra_05_9420:
	JSR _loc_05_817E
	JSR _b07_EC8F

table_05_9426:		; байты после JSR
.word table_05_9426_949A
.word table_05_9426_9438
.word table_05_9426_949A
.word table_05_9426_9443
.word table_05_9426_9456
.word table_05_9426_946F
.word table_05_9426_9480
.word table_05_9426_945E
.word table_05_9426_945E

table_05_9426_9438:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
bra_05_943D:
	JSR _loc_05_97C3
	JMP _loc_05_949A

table_05_9426_9443:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA счетчик_опций
	CMP #$04
	BEQ bra_05_943D
	CMP #$09
	BEQ bra_05_943D
	JMP _loc_05_9485

table_05_9426_9456:
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JMP _loc_05_9474

table_05_9426_945E:
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_81DD
	JSR _loc_05_95E6
	JSR _loc_05_96AA
	JMP _loc_05_949A

table_05_9426_946F:
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
_loc_05_9474:
	JSR _loc_05_95E6
	LDY счетчик_опций
	LDA table_05_94AE,Y
	JMP _loc_05_948E

table_05_9426_9480:
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
_loc_05_9485:
	JSR _loc_05_95E6
	LDY счетчик_опций
	LDA table_05_94B8,Y
_loc_05_948E:
	STA счетчик_опций
	JSR _loc_05_955D
	JSR _loc_05_9C05
	RTS

_loc_05_949A:
table_05_9426_949A:
	JSR _loc_05_9C05
	LDX #$00
	JSR _loc_05_822A
	LDA #$00
	JSR _loc_05_828D
	JSR _b07_EB8C
	JSR _loc_05_8014
	RTS

table_05_94AE:
.byte $00,$00,$02,$02,$03,$04,$05,$06,$07,$08

table_05_94B8:
.byte $00,$00,$03,$04,$05,$06,$07,$08,$09,$09

_loc_05_94C2:
	JSR _loc_05_8205

table_05_94C5:		; байты после JSR
.word table_05_94C5_951D
.word table_05_94C5_94ED
.word table_05_94C5_951D
.word table_05_94C5_94ED
.word table_05_94C5_951D
.word table_05_94C5_94ED
.word table_05_94C5_9525
.word table_05_94C5_94FD
.word table_05_94C5_952B
.word table_05_94C5_94ED
.word table_05_94C5_9533
.word table_05_94C5_9509
.word table_05_94C5_953D
.word table_05_94C5_9509
.word table_05_94C5_9547
.word table_05_94C5_94FD
.word table_05_94C5_954D
.word table_05_94C5_94ED
.word table_05_94C5_9555
.word table_05_94C5_94ED

table_05_94C5_94ED:
.byte $00,$00,$00,$01,$00,$00,$00,$02,$00,$00,$01,$03,$00,$00,$02,$03

table_05_94C5_94FD:
.byte $00,$00,$00,$01,$00,$00,$00,$02,$00,$00,$01,$02

table_05_94C5_9509:
.byte $00,$00,$00,$01,$00,$00,$00,$02,$00,$00,$01,$03,$00,$00,$02,$04,$00,$00,$03,$04

table_05_94C5_951D:
.byte $05,$07,$0A,$07,$10,$07,$16,$07

table_05_94C5_9525:
.byte $0A,$0F,$0E,$0F,$12,$0F

table_05_94C5_952B:
.byte $05,$17,$0B,$17,$11,$17,$16,$17

table_05_94C5_9533:
.byte $04,$29,$08,$29,$0D,$29,$12,$29,$17,$29

table_05_94C5_953D:
.byte $04,$2D,$08,$2D,$0D,$2D,$12,$2D,$17,$2D

table_05_94C5_9547:
.byte $0B,$31,$0E,$31,$12,$31

table_05_94C5_954D:
.byte $06,$35,$0A,$35,$0F,$35,$14,$35

table_05_94C5_9555:
.byte $06,$39,$0A,$39,$0F,$39,$14,$39

_loc_05_955D:
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_9563:		; байты после JSR
.word table_05_9563_9577
.word table_05_9563_9577
.word table_05_9563_9578
.word table_05_9563_9583
.word table_05_9563_958E
.word table_05_9563_95A5
.word table_05_9563_95B0
.word table_05_9563_95BF
.word table_05_9563_95CA
.word table_05_9563_95D7

_loc_05_9577:
table_05_9563_9577:
	RTS

table_05_9563_9578:
	LDA опция_материка
	AND #$03
	STA номер_опции
	JMP _loc_05_9577

table_05_9563_9583:
	LDA опция_поверхность_влажность
	AND #$0F
	STA номер_опции
	JMP _loc_05_9577

table_05_9563_958E:
	LDA опция_поверхность_влажность
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA table_05_959F,Y
	STA номер_опции
	JMP _loc_05_9577

table_05_959F:
.byte $00,$01,$01,$02,$02,$03

table_05_9563_95A5:
	LDA опция_дождь_ветер
	AND #$0F
	STA номер_опции
	JMP _loc_05_9577

table_05_9563_95B0:
	LDA опция_дождь_ветер
	AND #$F0
	LSR
	LSR
	LSR
	LSR
	STA номер_опции
	JMP _loc_05_9577

table_05_9563_95BF:
	LDA опция_направление_молния_смерч
	AND #$03
	STA номер_опции
	JMP _loc_05_9577

table_05_9563_95CA:
	LDA опция_направление_молния_смерч
	AND #$0C
	LSR
	LSR
	STA номер_опции
	JMP _loc_05_9577

table_05_9563_95D7:
	LDA опция_направление_молния_смерч
	AND #$30
	LSR
	LSR
	LSR
	LSR
	STA номер_опции
	JMP _loc_05_9577
_loc_05_95E6:
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_95EC:		; байты после JSR
.word table_05_95EC_9600
.word table_05_95EC_9600
.word table_05_95EC_9601
.word table_05_95EC_960C
.word table_05_95EC_961A
.word table_05_95EC_9632
.word table_05_95EC_9648
.word table_05_95EC_9662
.word table_05_95EC_9678
.word table_05_95EC_9690

_loc_05_9600:
table_05_95EC_9600:
	RTS

table_05_95EC_9601:
	LDA номер_опции
	AND #$03
	STA опция_материка
	JMP _loc_05_9600

table_05_95EC_960C:
	LDA опция_поверхность_влажность
	AND #$F0
	ORA номер_опции
	STA опция_поверхность_влажность
	JMP _loc_05_9600

table_05_95EC_961A:
	LDA номер_опции
	AND #$03
	TAY
	LDA опция_поверхность_влажность
	AND #$0F
	ORA table_05_962E,Y
	STA опция_поверхность_влажность
	JMP _loc_05_9600

table_05_962E:
.byte $00,$10,$40,$50

table_05_95EC_9632:
	LDA опция_дождь_ветер
	AND #$F0
	STA опция_дождь_ветер
	LDA номер_опции
	AND #$0F
	ORA опция_дождь_ветер
	STA опция_дождь_ветер
	JMP _loc_05_9600

table_05_95EC_9648:
	LDA опция_дождь_ветер
	AND #$0F
	STA опция_дождь_ветер
	LDA номер_опции
	AND #$0F
	ASL
	ASL
	ASL
	ASL
	ORA опция_дождь_ветер
	STA опция_дождь_ветер
	JMP _loc_05_9600

table_05_95EC_9662:
	LDA опция_направление_молния_смерч
	AND #$FC
	STA опция_направление_молния_смерч
	LDA номер_опции
	AND #$03
	ORA опция_направление_молния_смерч
	STA опция_направление_молния_смерч
	JMP _loc_05_9600

table_05_95EC_9678:
	LDA опция_направление_молния_смерч
	AND #$F3
	STA опция_направление_молния_смерч
	LDA номер_опции
	AND #$03
	ASL
	ASL
	ORA опция_направление_молния_смерч
	STA опция_направление_молния_смерч
	JMP _loc_05_9600

table_05_95EC_9690:
	LDA опция_направление_молния_смерч
	AND #$CF
	STA опция_направление_молния_смерч
	LDA номер_опции
	AND #$03
	ASL
	ASL
	ASL
	ASL
	ORA опция_направление_молния_смерч
	STA опция_направление_молния_смерч
	JMP _loc_05_9600
_loc_05_96AA:
	LDA счетчик_опций
	ASL
	TAY
	LDA table_05_96F7,Y
	STA $32
	LDA table_05_96F7 + 1,Y
	STA $33
	LDA номер_опции
	ASL
	ASL
	ASL
	TAY
	LDX #$00
bra_05_96C2:
	LDA ($32),Y
	STA буфер_графики,X
	INX
	INY
	CPX #$08
	BCC bra_05_96C2
	LDA счетчик_опций
	SEC
	SBC #$02
	ASL
	TAY
	LDA #$08
	STA счетчик_буфера_графики
	LDA table_05_96E7,Y
	STA байт_2006_lo_графика
	LDA table_05_96E7 + 1,Y
	STA байт_2006_hi_графика
	RTS

table_05_96E7:
.byte $C8,$23
.byte $D8,$23
.byte $E8,$23
.byte $D0,$2B
.byte $D8,$2B
.byte $E0,$2B
.byte $E8,$2B
.byte $F0,$2B

table_05_96F7:		; читается их 2х мест
.word table_05_96F7_970B
.word table_05_96F7_970B
.word table_05_96F7_970B
.word table_05_96F7_972B
.word table_05_96F7_9743
.word table_05_96F7_9763
.word table_05_96F7_9763
.word table_05_96F7_978B
.word table_05_96F7_97A3
.word table_05_96F7_97A3

table_05_96F7_970B:
.byte $AA,$AA,$EA,$FA,$FA,$FA,$FA,$AA,$AA,$FA,$BA,$AA,$FA,$FA,$FA,$AA,$AA,$FA,$FA,$FA,$AA,$EA,$FA,$AA,$AA,$FA,$FA,$FA,$FA,$BA,$AA,$AA

table_05_96F7_972B:
.byte $AA,$AA,$AA,$EA,$FA,$FA,$AA,$AA,$AA,$AA,$FA,$BA,$EA,$FA,$AA,$AA,$AA,$AA,$FA,$FA,$BA,$AA,$AA,$AA

table_05_96F7_9743:
.byte $AA,$AA,$AA,$FA,$FA,$FA,$FA,$AA,$AA,$FA,$FA,$AA,$FA,$FA,$FA,$AA,$AA,$FA,$FA,$FA,$AA,$EA,$FA,$AA,$AA,$FA,$FA,$FA,$FA,$BA,$AA,$AA

table_05_96F7_9763:
.byte $AA,$AA,$AF,$AF,$AF,$AF,$AF,$AA,$AA,$AF,$AA,$AF,$AF,$AF,$AF,$AA,$AA,$AF,$AF,$AA,$AE,$AF,$AF,$AA,$AA,$AF,$AF,$AF,$AB,$AA,$AF,$AA,$AA,$AF,$AF,$AF,$AF,$AF,$AA,$AA

table_05_96F7_978B:
.byte $AA,$AA,$AA,$AE,$AF,$AA,$AA,$AA,$AA,$AA,$AA,$AB,$AE,$AA,$AA,$AA,$AA,$AA,$AA,$AF,$AB,$AA,$AA,$AA

table_05_96F7_97A3:
.byte $AA,$AA,$AE,$AF,$AF,$AF,$AF,$AA,$AA,$AF,$AB,$AA,$AF,$AF,$AF,$AA,$AA,$AF,$AF,$AF,$AA,$AF,$AF,$AA,$AA,$AF,$AF,$AF,$AF,$AA,$AA,$AA

_loc_05_97C3:
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	LDA банк_для_поля
	AND #$0F
	STA банк_для_поля
	JSR _loc_05_BB47
	JSR _loc_05_BB84
	JSR _loc_05_800F
	LDY опция_материка
	LDA table_05_A6D1_музыка_материка,Y
	STA номер_музыки
	LDY #$00
	BIT опция_режим_сложность
	BVS bra_05_97EF		; проверка на РЕЖИМ_МИНИБАТЛ или РЕЖИМ_ПК_ПОСЛЕ_МАТЧА
	LDA #$00
	STA номер_экрана
	BEQ bra_05_97F1
bra_05_97EF:
	LDA #$03
bra_05_97F1:
	STA подтип_экрана
	RTS
_loc_05_97F5:
	LDA подтип_экрана
	BMI bra_05_97FF
	JSR _loc_05_80DF
	JSR _loc_05_982C
bra_05_97FF:
	JSR _loc_05_9B1D
	LDA копия_камеры_X_lo
	STA камера_X_lo
	LDA копия_камеры_X_hi
	STA камера_X_hi
	LDA копия_камеры_Y_lo
	STA камера_Y_lo
	LDA копия_камеры_Y_hi
	STA камера_Y_hi
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_9820:		; байты после JSR
.word table_05_9820_98B8
.word table_05_9820_98C6
.word table_05_9820_9934
.word table_05_9820_9996
.word table_05_9820_99F5
.word table_05_9820_9AAD

_loc_05_982C:
	LDA опция_режим_сложность
	BMI bra_05_9841		; проверка на РЕЖИМ_ПРОХОЖДЕНИЕ
	LDY счетчик_смен
	LDA номер_команды,Y
	AND #$0F
	TAY
	LDA table_05_98A8,Y
	BMI bra_05_9841
	JSR _b07_E828
bra_05_9841:
	JSR _loc_05_9FEB
	LDA #$FF
	STA номер_опции
	STA номер_опции + 1
	LDX #$00
	LDA #$05
bra_05_9850:
	STA $61,X
	INX
	CPX #$0D
	BCC bra_05_9850
	LDX счетчик_смен
	LDA расстановка_команды,X
	AND #$03
	STA расстановка_команды,X
	LDX #$00
bra_05_9865:
	TXA
	ORA счетчик_смен
	TAX
	JSR _loc_05_9D59
	INX
	CPX #$0C
	BCC bra_05_9865
	LDX счетчик_смен
	LDA номер_команды,X
	AND #$0F
	ASL
	TAY
	LDA table_05_BDF6,Y
	STA банк_спрайтов + 2
	LDA table_05_BDD6,Y
	STA номер_палитры_спрайтов
	STA номер_палитры_спрайтов + 1
	STA номер_палитры_спрайтов + 2
	STA номер_палитры_спрайтов + 3
	LDX #$26
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 1
	LDA #$09
	STA банк_спрайтов + 3
	JSR _b07_запись_банков_спрайтов
	LDA #МУЗЫКА_МЕНЮ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	RTS

table_05_98A8:
.byte $1B,$FF,$FF,$FF,$FF,$FF,$FF,$1A,$FF,$17,$FF,$16,$FF,$19,$18,$FF

table_05_9820_98B8:
	LDA флаг_яркости
	BPL bra_05_98C0
	INC счетчик_опций
bra_05_98C0:
	JSR _b07_D073
	JMP _loc_05_992D	
table_05_9820_98C6:
	LDX #$0C
	LDA номер_опции
	BPL bra_05_98D6
	JSR _loc_05_9C6C
	JSR _loc_05_82EF
	JSR _loc_05_9D9B
bra_05_98D6:
	LDX #$0C
	JSR _loc_05_817E
	JSR _loc_05_81D3
	JSR _b07_EC8F

table_05_98E1:		; байты после JSR
.word table_05_98E1_992D
.word table_05_98E1_98ED
.word table_05_98E1_992D
.word table_05_98E1_98F8
.word table_05_98E1_9918
.word table_05_98E1_9920

table_05_98E1_98ED:
table_05_994A_98ED:
table_05_99AF_98ED:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_9D90
	RTS

table_05_98E1_98F8:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$00
	JSR _loc_05_82B0
	JSR _loc_05_9D1F
	INC счетчик_опций
	LDA номер_опции
	BEQ bra_05_9910
	INC счетчик_опций
bra_05_9910:
	LDA #$FF
	STA номер_опции
	JMP _loc_05_992D

table_05_98E1_9918:
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JMP _loc_05_992D

table_05_98E1_9920:
table_05_99AF_9920:
	LDA номер_опции
	EOR #$01
	STA номер_опции
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук

_loc_05_992D:
table_05_98E1_992D:
table_05_994A_992D:
table_05_99AF_992D:
table_05_9A08_992D:
table_05_9AC2_992D:
	JSR _loc_05_9C05
	JSR _loc_05_9BE2
	RTS

table_05_9820_9934:
	LDX #$0C
	LDA номер_опции
	BPL bra_05_9941
	JSR _loc_05_9C83
	JSR _loc_05_82EF
bra_05_9941:
	JSR _loc_05_817E
	JSR _loc_05_81D3
	JSR _b07_EC8F

table_05_994A:		; байты после JSR
.word table_05_994A_992D
.word table_05_994A_98ED
.word table_05_994A_992D
.word table_05_994A_9956
.word table_05_994A_996B
.word table_05_994A_9982

table_05_994A_9956:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$00
	JSR _loc_05_82B0
	INC счетчик_опций
	LDA #$FF
	STA номер_опции
	JMP _loc_05_992D

table_05_994A_996B:
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$00
	JSR _loc_05_82B0
	LDA #$FF
	STA номер_опции
	LDA #$01
	STA счетчик_опций
	JMP _loc_05_992D

table_05_994A_9982:
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_A07B
	JSR _loc_05_81DD
	JSR _loc_05_A054
	JSR _loc_05_9D39
	JMP _loc_05_992D

table_05_9820_9996:
	LDX #$0C
	LDA номер_опции
	BPL bra_05_99A6
	JSR _loc_05_9C7C
	JSR _loc_05_82EF
	JSR _loc_05_9DA0
bra_05_99A6:
	JSR _loc_05_817E
	JSR _loc_05_81D3
	JSR _b07_EC8F

table_05_99AF:		; байты после JSR
.word table_05_99AF_992D
.word table_05_99AF_98ED
.word table_05_99AF_992D
.word table_05_99AF_99BB
.word table_05_99AF_99DB
.word table_05_99AF_9920

table_05_99AF_99BB:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$00
	JSR _loc_05_82B0
	INC счетчик_опций
	LDA номер_опции
	BEQ bra_05_99D0
	INC счетчик_опций
bra_05_99D0:
	LDA #$FF
	STA номер_опции
	STA номер_опции + 1
	JMP _loc_05_992D

table_05_99AF_99DB:
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$00
	JSR _loc_05_82B0
	JSR _loc_05_9D2B
	LDA #$FF
	STA номер_опции
	LDA #$01
	STA счетчик_опций
	JMP _loc_05_992D

table_05_9820_99F5:
	LDA номер_опции + 1
	BPL bra_05_9A00
	JSR _loc_05_9C8F
	JSR _loc_05_9C95
bra_05_9A00:
	LDX #$0C
	JSR _loc_05_817E
	JSR _b07_EC8F

table_05_9A08:		; байты после JSR
.word table_05_9A08_992D
.word table_05_9A08_9A1A
.word table_05_9A08_992D
.word table_05_9A08_9A1A
.word table_05_9A08_9A63
.word table_05_9A08_9A7E
.word table_05_9A08_9A7E
.word table_05_9A08_9AA4
.word table_05_9A08_9AA4

table_05_9A08_9A1A:
	LDA номер_опции + 1
	CMP #$06
	BNE bra_05_9A33
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$05
	STA счетчик_опций
	LDA #$FF
	STA номер_опции
	JMP _loc_05_992D
bra_05_9A33:
	JSR _loc_05_9D43
	JSR _loc_05_9D73
	BCS bra_05_9A43
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JMP _loc_05_992D
bra_05_9A43:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_9E60
	INC номер_опции + 1
	LDA номер_опции + 1
	CMP #$06
	BEQ bra_05_9A5B
	JSR _loc_05_9C95
	JMP _loc_05_992D
bra_05_9A5B:
	LDA #$FF
	STA номер_опции
	JMP _loc_05_992D

table_05_9A08_9A63:
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	SEC
	LDA номер_опции + 1
	SBC #$01
	BPL bra_05_9A72
	LDA #$00
bra_05_9A72:
	STA номер_опции + 1
	JSR _loc_05_9C95
	JSR _loc_05_9E9C
	JMP _loc_05_992D

table_05_9A08_9A7E:
	LDA номер_опции + 1
	CMP #$06
	BEQ bra_05_9AA1
	BIT опция_режим_сложность
	BMI bra_05_9A94		; проверка на РЕЖИМ_ПРОХОЖДЕНИЕ
	LDA номер_опции
	EOR #$01
	STA номер_опции
	JMP _loc_05_9A99
bra_05_9A94:
	LDX #$0C
	JSR _loc_05_81DD
_loc_05_9A99:
	JSR _loc_05_9D43
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
bra_05_9AA1:
	JMP _loc_05_992D

table_05_9A08_9AA4:
	LDA номер_опции + 1
	CMP #$06
	BEQ bra_05_9AA1
	BNE bra_05_9A94

table_05_9820_9AAD:
	LDX #$0C
	LDA номер_опции
	BPL bra_05_9ABC
	LDA #$00
	STA номер_опции
	JSR _loc_05_9CB3
bra_05_9ABC:
	JSR _loc_05_817E
	JSR _b07_EC8F

table_05_9AC2:		; байты после JSR
.word table_05_9AC2_992D
.word table_05_9AC2_9AD4
.word table_05_9AC2_992D
.word table_05_9AC2_9ADF
.word table_05_9AC2_9AF9
.word table_05_9AC2_9B03
.word table_05_9AC2_9B03
.word table_05_9AC2_9B14
.word table_05_9AC2_9B14

table_05_9AC2_9AD4:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
bra_05_9AD9:
	JSR _loc_05_9D90
	RTS

table_05_9AC2_9ADF:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDY номер_опции
	CPY #$09
	BCS bra_05_9AD9
	LDA #$06
_loc_05_9AED:
	STA номер_кнопки_опций
	JSR _loc_05_81DD
	JSR _loc_05_9CB3
	JMP _loc_05_992D

table_05_9AC2_9AF9:
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$05
	JMP _loc_05_9AED

table_05_9AC2_9B03:
	JSR _loc_05_81DD
	JSR _loc_05_9CB3
_loc_05_9B09:
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_9F64
	JMP _loc_05_992D

table_05_9AC2_9B14:
	JSR _loc_05_81DD
	JSR _loc_05_9CEA
	JMP _loc_05_9B09
_loc_05_9B1D:
	JSR _loc_05_8205

table_05_9B20:		; байты после JSR
.word table_05_9B20_9BA4
.word table_05_9B20_9B38
.word table_05_9B20_9BA4
.word table_05_9B20_9B38
.word table_05_9B20_9BA8
.word table_05_9B20_9B38
.word table_05_9B20_9BAE
.word table_05_9B20_9B38
.word table_05_9B20_9BB2
.word table_05_9B20_9B44
.word table_05_9B20_9BCA
.word table_05_9B20_9B74

table_05_9B20_9B38:
.byte $02,$01,$00,$00,$00,$02,$01,$01,$01,$00,$02,$02

table_05_9B20_9B44:
.byte $03,$01,$08,$04,$00,$02,$09,$05,$01,$03,$0A,$06,$02,$00,$0B,$07,$07,$05,$00,$08,$04,$06,$01,$09,$05,$07,$02,$0A,$06,$04,$03,$0B,$0B,$09,$04,$00,$08,$0A,$05,$01,$09,$0B,$06,$02,$0A,$08,$07,$03

table_05_9B20_9B74:
.byte $00,$03,$00,$01,$00,$03,$00,$02,$00,$03,$01,$02,$00,$06,$03,$04,$00,$06,$03,$05,$00,$06,$04,$05,$03,$09,$06,$07,$03,$09,$06,$08,$03,$09,$07,$08,$06,$09,$09,$0A,$06,$09,$09,$0B,$06,$09,$0A,$0B

table_05_9B20_9BA4:
.byte $17,$03,$1A,$03

table_05_9B20_9BA8:
.byte $18,$0A,$18,$0C,$18,$0E

table_05_9B20_9BAE:
.byte $17,$11,$1A,$11

table_05_9B20_9BB2:
.byte $03,$14,$03,$16,$03,$18,$03,$1A,$0C,$14,$0C,$16,$0C,$18,$0C,$1A,$15,$14,$15,$16,$15,$18,$15,$1A

table_05_9B20_9BCA:
.byte $03,$29,$0D,$29,$14,$29,$03,$2D,$0D,$2D,$14,$2D,$03,$35,$0D,$35,$14,$35,$03,$39,$0D,$39,$14,$39

_loc_05_9BE2:
	LDA номер_опции
	BMI bra_05_9BF4
	LDX #$0C
	JSR _loc_05_822A
	LDA #$00
	JSR _loc_05_828D
	JSR _b07_EB8C
bra_05_9BF4:
	LDX #$00
bra_05_9BF6:
	JSR _loc_05_9DC2
	JSR _b07_EB8C
	INX
	CPX #$0C
	BCC bra_05_9BF6
	JSR _loc_05_8014
	RTS
_loc_05_9C05:
	LDA счетчик_опций
	CMP #$05
	BCC bra_05_9C32
	LDA копия_камеры_Y_lo
	BNE bra_05_9C18
	LDA копия_камеры_Y_hi
	CMP #$01
	BEQ bra_05_9C6B
bra_05_9C18:
	CLC
	LDA копия_камеры_Y_lo
	ADC #$04
	STA копия_камеры_Y_lo
	CMP #$F0
	BCC bra_05_9C6B
	LDA #$00
	STA копия_камеры_Y_lo
	LDA #$01
	STA копия_камеры_Y_hi
	RTS
bra_05_9C32:
	LDA копия_камеры_Y_lo
	BNE bra_05_9C3C
	LDA копия_камеры_Y_hi
	BEQ bra_05_9C6B
bra_05_9C3C:
	SEC
	LDA копия_камеры_Y_lo
	SBC #$04
	STA копия_камеры_Y_lo
	CMP #$F0
	BCC bra_05_9C57
	SBC #$10
	STA копия_камеры_Y_lo
	SEC
	LDA копия_камеры_Y_hi
	SBC #$01
	STA копия_камеры_Y_hi
bra_05_9C57:
	LDA копия_камеры_Y_hi
	BMI bra_05_9C63
	BNE bra_05_9C6B
	LDA копия_камеры_Y_lo
	BNE bra_05_9C6B
bra_05_9C63:
	LDA #$00
	STA копия_камеры_Y_lo
	STA копия_камеры_Y_hi
bra_05_9C6B:
	RTS

_loc_05_9C6C:
	LDA номер_опции + 1
	BPL bra_05_9C76
	LDA #$03
	STA номер_опции + 1
_loc_05_9C76:
bra_05_9C76:
	AND #$01
	STA номер_опции
	RTS
_loc_05_9C7C:
	LDA номер_опции + 1
	LSR
	JMP _loc_05_9C76
_loc_05_9C83:
	LDY счетчик_смен
	LDA расстановка_команды,Y
	AND #$03
	STA номер_опции
	RTS
_loc_05_9C8F:
	LDA #$00
	STA номер_опции + 1
	RTS
_loc_05_9C95:
	LDA номер_опции + 1
	ASL
	ORA счетчик_смен
	TAX
	LDA номер_игрока,X
	LDY #$00
bra_05_9CA2:
	CMP table_05_9F2E,Y
	BEQ bra_05_9CAE
	INY
	CPY #$0C
	BCC bra_05_9CA2
	LDY #$00
bra_05_9CAE:
	TYA
	STA номер_опции
	RTS
_loc_05_9CB3:
	LDY счетчик_смен
	LDA $05D3,Y
	STA $1C
	LDY номер_опции
	LDA table_05_9CDE,Y
	TAY
_loc_05_9CC2:
	BEQ bra_05_9CCC
	LSR $1C
	LSR $1C
	DEY
	JMP _loc_05_9CC2
bra_05_9CCC:
	LDA $1C
	AND #$03
	CMP #$03
	BNE bra_05_9CD6
	LDA #$00
bra_05_9CD6:
	CLC
	ADC номер_опции
	STA номер_опции
	RTS

table_05_9CDE:
.byte $00,$00,$00,$01,$01,$01,$02,$02,$02,$03,$03,$03

_loc_05_9CEA:
	LDA номер_опции
	ASL
	TAY
	LDA table_05_9D07,Y
	STA $1C
	LDA table_05_9D07 + 1,Y
	STA $1D
	LDY счетчик_смен
	LDA $05D3,Y
	AND $1C
	ORA $1D
	STA $05D3,Y
	RTS

table_05_9D07:
.byte $FC,$00
.byte $FC,$01
.byte $FC,$02
.byte $F3,$00
.byte $F3,$04
.byte $F3,$08
.byte $CF,$00
.byte $CF,$10
.byte $CF,$20
.byte $3F,$00
.byte $3F,$40
.byte $3F,$80

_loc_05_9D1F:
	LDA номер_опции + 1
	AND #$FE
	ORA номер_опции
	STA номер_опции + 1
	RTS
_loc_05_9D2B:
	LDA номер_опции + 1
	AND #$FD
	ROR
	ORA номер_опции
	ROL
	STA номер_опции + 1
	RTS
_loc_05_9D39:
	LDY счетчик_смен
	LDA номер_опции
	STA расстановка_команды,Y
	RTS
_loc_05_9D43:
	LDA номер_опции + 1
	ASL
	ORA счетчик_смен
	TAX
	LDA номер_опции
	TAY
	LDA table_05_9F2E,Y
	STA номер_игрока,X
	JSR _loc_05_9D59
	RTS
_loc_05_9D59:
	LDY счетчик_смен
	LDA номер_команды,Y
	AND #$0F
	BEQ bra_05_9D65
	LDA #$0C
bra_05_9D65:
	CLC
	ADC номер_игрока,X
	TAY
	TXA
	ORA #$01
	TAX
	TYA
	STA лицо_игрока,X
	RTS
_loc_05_9D73:
	LDA номер_опции + 1
	ASL
	ORA счетчик_смен
	TAY
	LDA номер_игрока,Y
	STA $1C
bra_05_9D80:
	DEY
	DEY
	BMI bra_05_9D8E
	LDA номер_игрока,Y
	CMP $1C
	BNE bra_05_9D80
	CLC
	BCC bra_05_9D8F
bra_05_9D8E:
	SEC
bra_05_9D8F:
	RTS

_loc_05_9D90:
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	LDA #$04
	STA подтип_экрана
	RTS
_loc_05_9D9B:
	LDY #$00
	JMP _loc_05_9DA2
_loc_05_9DA0:
	LDY #$02
_loc_05_9DA2:
	LDA table_05_9DBE + 1,Y
	STA буфер_графики + 1
	LDA table_05_9DBE,Y
	STA буфер_графики
	LDA #$02
	STA счетчик_буфера_графики
	LDA #$44
	STA байт_2006_lo_графика
	LDA #$21
	STA байт_2006_hi_графика
	RTS

table_05_9DBE:
.byte $9E,$9F
.byte $02,$02

_loc_05_9DC2:
	LDY счетчик_смен
	LDA расстановка_команды,Y
	ASL
	ADC расстановка_команды,Y
	ASL
	STA $1C
	TXA
	LSR
	CLC
	ADC $1C
	STA $1C
	TAY
	LDA table_05_9F08,Y
	ASL
	TAY
	LDA table_05_9F1A,Y
	STA координата_X_lo,X
	LDA table_05_9F1A + 1,Y
	STA координата_Y_lo,X
	TXA
	AND #$01
	BNE bra_05_9E22
	LDY $1C
	LDA table_05_9EF6,Y
	STA номер_анимации,X
	CMP #$88
	BNE bra_05_9E05
	LDA счетчик_опций
	CMP #$03
	BCS bra_05_9E05
	LDA #$7F
	STA номер_анимации,X
bra_05_9E05:
	LDA счетчик_опций
	CMP #$04
	BNE bra_05_9E5F
	TXA
	LSR
	CMP номер_опции + 1
	BNE bra_05_9E5F
	LDA счетчик_кадров
	AND #$03
	BNE bra_05_9E5F
	LDA #$7F
	STA номер_анимации,X
	RTS
bra_05_9E22:
	LDA #$00
	STA $1D
	LDA опция_режим_сложность
	BPL bra_05_9E42		; проверка на РЕЖИМ_ПРОХОЖДЕНИЕ
	LDA лицо_игрока,X
	ASL
	TAY
	LDA table_05_9EDB,Y
	BMI bra_05_9E42
	INC $1D
	LDA table_05_9EDB + 1,Y
	LDY $1C
	CMP table_05_9EF6,Y
	BEQ bra_05_9E42
	INC $1D
bra_05_9E42:
	LDY $1D
	LDA table_05_9EF3,Y
	STA номер_анимации,X
	LDA счетчик_опций
	CMP #$04
	BNE bra_05_9E5F
	TXA
	LSR
	CMP номер_опции + 1
	BCC bra_05_9E5F
	BEQ bra_05_9E5F
	LDA #$7F
	STA номер_анимации,X
bra_05_9E5F:
	RTS

_loc_05_9E60:
	LDX #$0C
	JSR _loc_05_82F4
	LDY счетчик_смен
	LDA расстановка_команды,Y
	ASL
	TAY
	LDA table_05_9F3A,Y
	STA $32
	LDA table_05_9F3A + 1,Y
	STA $33
	LDA номер_опции + 1
	ASL
	TAY
	LDA ($32),Y
	STA буфер_графики + 2
	INY
	LDA ($32),Y
	STA буфер_графики + 1
_loc_05_9E87:
	LDA #$02
	STA буфер_графики
	LDA #$03
	STA счетчик_буфера_графики
	LDA $30
	STA байт_2006_lo_графика
	LDA $31
	STA байт_2006_hi_графика
	RTS
_loc_05_9E9C:
	LDX #$0C
	JSR _loc_05_82F4
	LDA #$02
	STA буфер_графики + 2
	LDY счетчик_смен
	LDA номер_команды,Y
	AND #$0F
	BEQ bra_05_9EB9
	CLC
	LDA номер_опции
	ADC #$0C
	TAY
	BNE bra_05_9EBC
bra_05_9EB9:
	LDY номер_опции
bra_05_9EBC:
	LDA table_05_9EC5,Y
	STA буфер_графики + 1
	JMP _loc_05_9E87

table_05_9EC5:
.byte $98,$91,$93,$96,$97,$92,$94,$9A,$99,$90,$95,$9B,$90,$93,$00,$00,$91,$94,$00,$00,$92,$95

table_05_9EDB:
.byte $00,$8A
.byte $FF,$8B
.byte $00,$8B
.byte $FF,$89
.byte $00,$89
.byte $FF,$88
.byte $FF,$89
.byte $00,$8A
.byte $FF,$8A
.byte $FF,$8A
.byte $00,$8B
.byte $00,$88

table_05_9EF3:
.byte $8C,$94,$95

table_05_9EF6:		; читается из 2х мест
.byte $8A,$8B,$8B,$89,$89,$88,$8A,$8B,$8B,$8A,$89,$88,$8A,$8B,$8A,$89,$89,$88

table_05_9F08:
.byte $05,$07,$09,$01,$03,$00,$06,$07,$09,$04,$02,$00,$06,$08,$04,$01,$03,$00

table_05_9F1A:
.byte $30,$57
.byte $50,$3F
.byte $50,$57
.byte $50,$6F
.byte $78,$3F
.byte $78,$57
.byte $78,$6F
.byte $A0,$3F
.byte $A0,$57
.byte $A0,$6F

table_05_9F2E:		; читается из 2х мест
.byte $00,$03,$06,$09,$01,$04,$07,$0A,$02,$05,$08,$0B

table_05_9F3A:
.byte $40,$9F
.byte $4C,$9F
.byte $58,$9F
.byte $18,$17
.byte $1A,$19
.byte $1A,$19
.byte $16,$15
.byte $16,$15
.byte $14,$13
.byte $18,$17
.byte $1A,$19
.byte $1A,$19
.byte $18,$17
.byte $16,$15
.byte $14,$13
.byte $18,$17
.byte $1A,$19
.byte $18,$17
.byte $16,$15
.byte $16,$15
.byte $14,$13

_loc_05_9F64:
	LDA номер_опции
	ASL
	ASL
	ASL
	TAY
	LDA table_05_9F8B,Y
	STA байт_2006_lo_атрибуты
	LDA #$07
	STA счетчик_буфера_атрибутов
	LDX #$00
bra_05_9F78:
	LDA table_05_9F8B + 1,Y
	STA буфер_атрибутов,X
	INX
	INY
	CPX счетчик_буфера_атрибутов
	BCC bra_05_9F78
	LDA #$2B
	STA байт_2006_hi_атрибуты
	RTS

table_05_9F8B:
.byte $D1, 		$AA,$AA,$AF,$AF,$AF,$AF,$AA
.byte $D1, 		$AF,$AF,$AA,$AA,$AF,$AF,$AA
.byte $D1, 		$AF,$AF,$AF,$AF,$AA,$AA,$AA
.byte $D9, 		$AA,$AA,$AF,$AF,$AF,$AF,$AA
.byte $D9, 		$AF,$AF,$AA,$AA,$AF,$AF,$AA
.byte $D9, 		$AF,$AF,$AF,$AF,$AA,$AA,$AA
.byte $E9, 		$AA,$AA,$AF,$AF,$AF,$AF,$AA
.byte $E9, 		$AF,$AF,$AA,$AA,$AF,$AF,$AA
.byte $E9, 		$AF,$AF,$AF,$AF,$AA,$AA,$AA
.byte $F1, 		$AA,$AA,$AF,$AF,$AF,$AF,$AA
.byte $F1, 		$AF,$AF,$AA,$AA,$AF,$AF,$AA
.byte $F1, 		$AF,$AF,$AF,$AF,$AA,$AA,$AA

_loc_05_9FEB:
	LDA счетчик_опций
	PHA
	JSR _b07_ECA9
	JSR _b07_выключить_NMI
	JSR _b07_выключить_рендеринг
	JSR _loc_05_A0A0
	LDA #$03
	STA счетчик_опций
bra_05_A000:
	JSR _loc_05_9B1D
	LDA #$01
	STA номер_опции
	LDA счетчик_опций
	CMP #$02
	BNE bra_05_A015
	JSR _loc_05_9C83
	JSR _loc_05_A054
bra_05_A015:
	LDX #$00
	LDA #$00
	JSR _loc_05_82B0
	JSR _b07_EFAD
	DEC счетчик_опций
	BNE bra_05_A000
	LDA #$00
	STA счетчик_опций
bra_05_A029:
	LDY счетчик_опций
	LDA table_05_A050,Y
	STA номер_опции
	JSR _loc_05_9CB3
	JSR _loc_05_9F64
	JSR _b07_EFAD
	INC счетчик_опций
	LDA счетчик_опций
	CMP #$04
	BCC bra_05_A029
	JSR _b07_включить_рендеринг
	JSR _b07_включить_NMI
	PLA
	STA счетчик_опций
	RTS

table_05_A050:
.byte $00,$03,$06,$09

_loc_05_A054:
	LDA номер_опции
	AND #$0F
	ASL
	TAY
	CLC
	LDA #$1B
	ADC счетчик_смен
	STA буфер_графики
	LDA #$1F
	STA буфер_графики + 1
	LDA #$02
	STA счетчик_буфера_графики
	LDA table_05_A09A,Y
	STA байт_2006_lo_графика
	LDA table_05_A09A + 1,Y
	STA байт_2006_hi_графика
	RTS
_loc_05_A07B:
	LDA номер_опции
	AND #$0F
	ASL
	TAY
	LDA #$02
	STA буфер_атрибутов
	STA буфер_атрибутов + 1
	STA счетчик_буфера_атрибутов
	LDA table_05_A09A,Y
	STA байт_2006_lo_атрибуты
	LDA table_05_A09A + 1,Y
	STA байт_2006_hi_атрибуты
	RTS

table_05_A09A:		; читается из 2х мест
.byte $2D,$21
.byte $8D,$21
.byte $8D,$21

_loc_05_A0A0:
	LDA количество_игроков
	CMP #$02
	BCC bra_05_A0D6
	SEC
	SBC #$02
	STA $1C
	ASL
	ADC $1C
	TAY
	BIT опция_режим_сложность
	BMI bra_05_A0BA		; проверка на РЕЖИМ_ПРОХОЖДЕНИЕ
	INY
	LDA счетчик_смен
	BEQ bra_05_A0BA
	INY
bra_05_A0BA:
	LDA table_05_A0D7,Y
	BMI bra_05_A0D6
	STA буфер_палитры
	LDA #$1F
	STA буфер_палитры + 1
	LDA #$02
	STA счетчик_буфера_палитры
	LDA #$24
	STA байт_2006_lo_палитра
	LDA #$21
	STA байт_2006_hi_палитра
bra_05_A0D6:
	RTS

table_05_A0D7:
.byte $1C,$FF,$FF,$FF,$1D,$FF,$FF,$1D,$1E

_loc_05_A0E0:
	LDA подтип_экрана
	BMI bra_05_A0EA
	JSR _loc_05_80DF
	JSR _loc_05_A0F4
bra_05_A0EA:
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_A0F0:		; байты после JSR
.word table_05_A0F0_A134
.word table_05_A0F0_A142

_loc_05_A0F4:
	LDA #$05
	STA $61
	LDA #$08
	STA номер_движения
	LDA #$01
	STA номер_палитры_спрайтов
	STA номер_палитры_спрайтов + 1
	LDX #$26
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 1
	JSR _b07_запись_банков_спрайтов
	LDA #$28
	STA координата_X_lo
	LDA #$B8
	STA координата_Y_lo
	JSR _b07_ECA9
	JSR _b07_выключить_NMI
	JSR _b07_выключить_рендеринг
	JSR _loc_05_A16A
	JSR _b07_включить_рендеринг
	JSR _b07_включить_NMI
	LDA #МУЗЫКА_МЕНЮ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	RTS

table_05_A0F0_A134:
	LDA флаг_яркости
	BPL bra_05_A13C
	INC счетчик_опций
bra_05_A13C:
	JSR _b07_D073
	JMP _loc_05_A153

table_05_A0F0_A142:
	LDX счетчик_смен
	LDA одноразовые_кнопки,X
	AND #(КНОПКА_СЕЛЕКТ + КНОПКА_СТАРТ + КНОПКА_А + КНОПКА_Б)
	BEQ bra_05_A153
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_A15F
_loc_05_A153:
bra_05_A153:
	LDX #$00
	JSR _loc_05_9194
	JSR _b07_EB8C
	JSR _loc_05_8014
	RTS
_loc_05_A15F:
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	LDA #$04
	STA подтип_экрана
	RTS
_loc_05_A16A:
	JSR _loc_05_BF65
	JSR _loc_05_BF2A
	LDA $0603
	AND #$E0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA table_05_A23B,Y
	STA буфер_атрибутов
	LDA table_05_A23B + 1,Y
	STA буфер_атрибутов + 1
	LDA #$02
	STA счетчик_буфера_атрибутов
	STA счетчик_буфера_графики
	LDA #$19
	STA байт_2006_lo_атрибуты
	LDA #$22
	STA байт_2006_hi_атрибуты
	LDA опция_направление_молния_смерч
	AND #$03
	ASL
	TAY
	LDA table_05_A24B,Y
	STA буфер_графики
	LDA table_05_A24B + 1,Y
	STA буфер_графики + 1
	LDA #$5A
	STA байт_2006_lo_графика
	LDA #$22
	STA байт_2006_hi_графика
	JSR _b07_EFAD
	LDA опция_дождь_ветер
	AND #$70
	LSR
	TAY
	LDX #$00
bra_05_A1C1:
	LDA table_05_A251,Y
	STA буфер_атрибутов,X
	LDA table_05_A251 + 4,Y
	STA буфер_графики,X
	INY
	INX
	CPX #$04
	BCC bra_05_A1C1
	LDA #$04
	STA счетчик_буфера_атрибутов
	STA счетчик_буфера_графики
	LDA #$78
	STA байт_2006_lo_атрибуты
	LDA #$98
	STA байт_2006_lo_графика
	LDA #$22
	STA байт_2006_hi_атрибуты
	STA байт_2006_hi_графика
	STA $2D
	LDA #$D8
	STA $2C
	JSR _b07_EFAD
	LDA опция_направление_молния_смерч
	AND #$0C
	BEQ bra_05_A20F
	LDY #$00
	JSR _loc_05_A21C
	CLC
	LDA $2C
	ADC #$40
	STA $2C
	LDA $2D
	ADC #$00
	STA $2D
bra_05_A20F:
	LDA опция_направление_молния_смерч
	AND #$30
	BEQ bra_05_A21B
	LDY #$04
	JSR _loc_05_A21C
bra_05_A21B:
	RTS
_loc_05_A21C:
	LDX #$00
bra_05_A21E:
	LDA table_05_A279,Y
	STA буфер_атрибутов,X
	INY
	INX
	CPX #$04
	BCC bra_05_A21E
	STX счетчик_буфера_атрибутов
	LDA $2C
	STA байт_2006_lo_атрибуты
	LDA $2D
	STA байт_2006_hi_атрибуты
	JSR _b07_EFAD
	RTS

table_05_A23B:
.byte $02,$80
.byte $81,$80
.byte $82,$80
.byte $85,$80
.byte $86,$80
.byte $87,$80
.byte $88,$80
.byte $89,$80

table_05_A24B:
.byte $FF,$20
.byte $E4,$E5
.byte $FF,$1C

table_05_A251:
.byte $FF,$FF,$FF,$FF, 		$FF,$FF,$B6,$AD
.byte $FF,$FF,$FF,$FF, 		$FF,$C7,$CD,$A3
.byte $FF,$FF,$FF,$FF, 		$FF,$BD,$B3,$A4
.byte $FF,$FF,$FF,$FF, 		$FF,$B3,$C7,$A3
.byte $FF,$FF,$DB,$FF, 		$B5,$D0,$BD,$A4

table_05_A279:
.byte $A7,$C1,$B6,$C9,$B1,$B3,$C0,$A8

_loc_05_A281:
	LDA подтип_экрана
	BMI bra_05_A28B
	JSR _loc_05_80DF
	JSR _loc_05_A295
bra_05_A28B:
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_A291:		; байты после JSR
.word table_05_A291_A2C5
.word table_05_A291_A2D0

_loc_05_A295:
	LDA #$00
	STA номер_команды
	JSR _loc_05_BD38
	JSR _b07_запись_банков_спрайтов
	LDA $05D1
	STA лицо_игрока
	LDA #$FF
	STA номер_опции
	JSR _loc_05_A2F7
	JSR _loc_05_A31F
	CLC
	LDA $05D1
	ADC #$01
	STA $0606
	LDA #$80
	STA $0604
	LDA #МУЗЫКА_МЕНЮ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	RTS

table_05_A291_A2C5:
	LDA флаг_яркости
	BPL bra_05_A2CD
	INC счетчик_опций
bra_05_A2CD:
	JMP _loc_05_A2E8

table_05_A291_A2D0:
	BIT флаг_яркости
	BPL bra_05_A2E8
	BVC bra_05_A2DD
	JSR _loc_05_A318
	RTS
bra_05_A2DD:
	JSR _b07_C317
	LDA $0605
	BMI bra_05_A2E8
	JSR _b07_поставить_флаг_уменьшения_яркости
_loc_05_A2E8:
bra_05_A2E8:
	LDX #$00
	JSR _loc_05_9194
	JSR _b07_EB8C
	JSR _loc_05_8014
	JSR _b07_D073
	RTS

_loc_05_A2F7:
	LDA #$00
	STA $61,X
	STA номер_анимации,X
	LDA #$3C
	STA координата_X_lo,X
	LDA #$60
	STA координата_Y_lo,X
	LDA #$09
	STA номер_движения,X
	RTS

_loc_05_A318:
	LDA $5B
	STA подтип_экрана
	RTS
_loc_05_A31F:
	JSR _b07_ECA9
	JSR _b07_выключить_NMI
	JSR _b07_выключить_рендеринг
	LDA $05D1
	ASL
	ASL
	ASL
	SEC
	SBC $05D1
	STA $2B
	TAY
	LDA table_05_A43C,Y
	JSR _loc_05_8A11
	LDA $31
	ORA #$80
	STA буфер_атрибутов
	LDA $30
	ORA #$80
	STA буфер_атрибутов + 1
	LDA table_05_A43C + 1,Y
	JSR _loc_05_8A11
	LDA $31
	ORA #$80
	STA буфер_графики
	LDA $30
	ORA #$80
	STA буфер_графики + 1
	LDA table_05_A43C + 2,Y
	JSR _loc_05_8A11
	LDA $31
	ORA #$80
	STA буфер_палитры
	LDA $30
	ORA #$80
	STA буфер_палитры + 1
	LDA #$02
	STA счетчик_буфера_атрибутов
	STA счетчик_буфера_графики
	STA счетчик_буфера_палитры
	LDA #$F9
	STA байт_2006_lo_атрибуты
	LDA #$20
	STA байт_2006_hi_атрибуты
	LDA #$39
	STA байт_2006_lo_графика
	LDA #$79
	STA байт_2006_lo_палитра
	LDA #$21
	STA байт_2006_hi_графика
	STA байт_2006_hi_палитра
	JSR _b07_EFAD
	LDY $2B
	LDA table_05_A43C + 3,Y
	STA буфер_палитры
	LDA #$01
	STA счетчик_буфера_палитры
	LDA #$B9
	STA байт_2006_lo_палитра
	LDA #$21
	STA байт_2006_hi_палитра
	LDA $05D1
	JSR _loc_05_B1FF
	LDA #$05
	STA $1F
	LDA #$C4
	STA $34
	LDA #$21
	STA $35
	JSR _loc_05_A40D
	LDA #$D2
	STA $34
	LDA #$21
	STA $35
	LDA #$02
	STA $2A
bra_05_A3D3:
	LDY $2B
	LDA table_05_A43C + 4,Y
	BMI bra_05_A406
	ASL
	ADC table_05_A43C + 4,Y
	ASL
	ASL
	ADC #< table_05_A490
	STA $30
	LDA #$00
	ADC #> table_05_A490
	STA $31
	LDA #$0C
	STA $1F
	JSR _loc_05_A40D
	CLC
	LDA $34
	ADC #$40
	STA $34
	LDA $35
	ADC #$00
	STA $35
	INC $2B
	DEC $2A
	BPL bra_05_A3D3
bra_05_A406:
	JSR _b07_включить_рендеринг
	JSR _b07_включить_NMI
	RTS
_loc_05_A40D:
	LDA #$FF
	STA $1C
	LDY #$DA
	STY $1D
	INY
	STY $1E
	JSR _loc_05_AD91
	LDA $1F
	STA счетчик_буфера_атрибутов
	STA счетчик_буфера_графики
	CLC
	LDA $34
	STA байт_2006_lo_атрибуты
	ADC #$20
	STA байт_2006_lo_графика
	LDA $35
	STA байт_2006_hi_атрибуты
	ADC #$00
	STA байт_2006_hi_графика
	JSR _b07_EFAD
	RTS

table_05_A43C:		; характеристики игроков японии на экране игроков при прохождении
.byte $32,$15,$19,$8B,$0F,$01,$FF
.byte $32,$18,$14,$8A,$0E,$05,$FF
.byte $37,$1B,$0F,$8B,$10,$02,$FF
.byte $3C,$18,$14,$8D,$08,$01,$FF
.byte $2D,$18,$14,$8B,$09,$04,$FF
.byte $3C,$15,$14,$8C,$07,$00,$03
.byte $2D,$0F,$14,$8D,$0A,$06,$FF
.byte $32,$0F,$0F,$8B,$0B,$00,$FF
.byte $32,$1B,$0F,$8C,$0C,$01,$FF
.byte $2D,$15,$0F,$8D,$0D,$01,$FF
.byte $41,$15,$14,$8B,$11,$00,$FF
.byte $41,$18,$19,$8D,$12,$03,$06

table_05_A490:
.byte $BC,$D0,$AC,$B3,$35,$C9,$3D,$CA,$FF,$FF,$FF,$FF
.byte $3B,$A9,$CB,$B3,$A2,$B1,$D0,$A9,$FF,$FF,$FF,$FF
.byte $B5,$CA,$B9,$D9,$35,$A8,$D0,$A9,$FF,$FF,$FF,$FF
.byte $B5,$CA,$B9,$D9,$35,$6B,$CF,$B2,$FF,$FF,$FF,$FF
.byte $35,$C9,$CA,$A2,$B1,$D0,$A9,$FF,$FF,$FF,$FF,$FF
.byte $B3,$3B,$C3,$27,$A5,$AD,$FF,$FF,$FF,$FF,$FF,$FF
.byte $B5,$C9,$6D,$CA,$A2,$A9,$AF,$CA,$FF,$FF,$FF,$FF
.byte $C3,$27,$35,$C8,$A3,$3D,$AD,$D2,$D9,$B5,$FF,$FF
.byte $BC,$C3,$C4,$29,$C8,$AD,$D2,$D9,$B5,$FF,$FF,$FF
.byte $35,$A7,$CF,$BF,$A4,$AD,$D2,$D9,$B5,$FF,$FF,$FF
.byte $A4,$C8,$C3,$AD,$C5,$AD,$D2,$D9,$B5,$FF,$FF,$FF
.byte $A8,$D0,$B2,$C9,$AD,$D2,$D9,$B5,$FF,$FF,$FF,$FF
.byte $27,$C9,$3E,$CF,$AD,$D2,$D9,$B5,$FF,$FF,$FF,$FF
.byte $B5,$AC,$27,$B3,$CE,$AD,$D2,$D9,$B5,$FF,$FF,$FF
.byte $B7,$CF,$2D,$D1,$AD,$D2,$D9,$B5,$FF,$FF,$FF,$FF
.byte $B6,$D0,$B3,$AD,$D2,$D9,$B5,$FF,$FF,$FF,$FF,$FF
.byte $A4,$D5,$C9,$D9,$AD,$D2,$D9,$B5,$FF,$FF,$FF,$FF
.byte $3B,$B6,$B6,$CD,$B7,$AD,$D2,$D9,$B5,$FF,$FF,$FF
.byte $A6,$C3,$27,$35,$C8,$A3,$3D,$AD,$D2,$D9,$B5,$FF

_loc_05_A576:
	LDA подтип_экрана
	BMI bra_05_A580
	JSR _loc_05_80DF
	JSR _loc_05_A58D
bra_05_A580:
	JSR _loc_05_A670
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_A589:		; байты после JSR
.word table_05_A589_A5D0
.word table_05_A589_A5DE

_loc_05_A58D:
	LDA #$FF
	STA номер_опции
	LDA #$07
	STA $61
	STA номер_движения
	LDA #$05
	STA $63
	LDA #$00
	STA лицо_игрока
	LDA #$01
	STA номер_палитры_спрайтов
	STA номер_палитры_спрайтов + 1
	LDX #$34
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 1
	INX
	STX банк_спрайтов + 2
	INX
	STX банк_спрайтов + 3
	JSR _b07_запись_банков_спрайтов
	LDA #$28
	STA координата_X_lo
	LDA #$B8
	STA координата_Y_lo
	LDA #МУЗЫКА_ВЫКЛЮЧИТЬ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	RTS

table_05_A589_A5D0:
	LDA флаг_яркости
	BPL bra_05_A5D8
	INC счетчик_опций
bra_05_A5D8:
	JSR _b07_D073
	JMP _loc_05_A657

table_05_A589_A5DE:
	LDA номер_опции
	CMP #$08
	BNE bra_05_A5EB
	JSR _loc_05_A6E1
	JMP _loc_05_A657
bra_05_A5EB:
	LDA одноразовые_кнопки
	AND #КНОПКА_СЕЛЕКТ
	BEQ bra_05_A608
	LDA номер_опции
	CMP #$05
	BNE bra_05_A608
	LDA удержанные_кнопки
	AND #КНОПКА_ВЛЕВО
	BEQ bra_05_A608
	LDA #$08
	STA номер_опции
	LDA #$00
	STA номер_опции + 1
bra_05_A608:
	LDA номер_опции
	BPL bra_05_A61B
	LDA #$07
	STA номер_опции
	JSR _loc_05_A6B1_выбрать_музыку_из_опций
	LDA номер_музыки
	JSR _b07_C2E4_записать_и_воспроизвести_звук
bra_05_A61B:
	LDX #$02
	JSR _loc_05_817E
	JSR _b07_EC8F

table_05_A623:		; байты после JSR
.word table_05_A623_A657
.word table_05_A623_A635
.word table_05_A623_A657
.word table_05_A623_A635
.word table_05_A623_A643
.word table_05_A623_A64B
.word table_05_A623_A64B
.word table_05_A623_A657
.word table_05_A623_A657

table_05_A623_A635:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_A6B1_выбрать_музыку_из_опций
	JSR _loc_05_A6D6
	RTS

table_05_A623_A643:
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JMP _loc_05_A657

table_05_A623_A64B:
	JSR _loc_05_81DD
	JSR _loc_05_A6B1_выбрать_музыку_из_опций
	LDA номер_музыки
	JSR _b07_C2E4_записать_и_воспроизвести_звук

_loc_05_A657:
table_05_A623_A657:
	LDX #$02
	JSR _loc_05_822A
	LDA #$00
	JSR _loc_05_828D
	JSR _b07_EB8C
	LDX #$00
	JSR _loc_05_9194
	JSR _b07_EB8C
	JSR _loc_05_8014
	RTS

_loc_05_A670:
	JSR _loc_05_8205

table_05_A673:		; байты после JSR
.word table_05_A673_A69F
.word table_05_A673_A67B
.word table_05_A673_A69F
.word table_05_A673_A67B

table_05_A673_A67B:
.byte $07,$01,$00,$00,$00,$02,$01,$01,$01,$03,$02,$02,$02,$04,$03,$03,$03,$05,$04,$04,$04,$06,$05,$05,$05,$07,$06,$06,$06,$00,$07,$07,$08,$08,$08,$08

table_05_A673_A69F:
.byte $09,$06,$09,$09,$09,$0C,$09,$0F,$09,$12,$09,$15,$09,$18,$09,$1B,$04,$07

_loc_05_A6B1_выбрать_музыку_из_опций:
	LDA номер_опции
	AND #$07
	TAY
	LDA table_05_A6C9_опциональная_музыка,Y
	BPL @запись_музыки
	LDA опция_материка
	AND #$03
	TAY
	LDA table_05_A6D1_музыка_материка,Y
@запись_музыки:
	STA номер_музыки
	RTS

table_05_A6C9_опциональная_музыка:
.byte МУЗЫКА_ПОЛЕ_04
.byte МУЗЫКА_ПОЛЕ_06
.byte МУЗЫКА_ПОЛЕ_03
.byte МУЗЫКА_ПОЛЕ_05
.byte МУЗЫКА_ПЕНАЛЬТИ
.byte МУЗЫКА_ЗАСТАВКА
.byte МУЗЫКА_ПОЛЕ_07
.byte $FF		; если байт минус, то последний пункт воспроизводит музыку материка

table_05_A6D1_музыка_материка:		; читается из 3х мест
.byte МУЗЫКА_ПОЛЕ_07
.byte МУЗЫКА_ПОЛЕ_03
.byte МУЗЫКА_ПЕНАЛЬТИ
.byte МУЗЫКА_ПОЛЕ_05
.byte МУЗЫКА_ПОЛЕ_06

_loc_05_A6D6:
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	LDA #$04
	STA подтип_экрана
	RTS
_loc_05_A6E1:
	LDA одноразовые_кнопки
	LSR
	BCS bra_05_A73B
	LSR
	BCS bra_05_A748
	LSR
	BCS bra_05_A751
	LSR
	BCS bra_05_A75E
	LDA одноразовые_кнопки
	BMI bra_05_A767
	ASL
	BMI bra_05_A770
	ASL
	BMI bra_05_A6FC
	ASL
	BPL bra_05_A715
bra_05_A6FC:
	LDA #$02
	STA буфер_графики
	STA буфер_графики + 1
	LDA #$FF
	STA номер_опции
	JMP _loc_05_A72B
_loc_05_A70C:
bra_05_A70C:
	CMP #$50
	BCC bra_05_A712
	LDA #$50
bra_05_A712:
	STA номер_опции + 1
bra_05_A715:
	LDA номер_опции + 1
	AND #$0F
	ORA #$80
	STA буфер_графики + 1
	LDA номер_опции + 1
	LSR
	LSR
	LSR
	LSR
	ORA #$80
	STA буфер_графики
_loc_05_A72B:
	LDA #$02
	STA счетчик_буфера_графики
	LDA #$E5
	STA байт_2006_lo_графика
	LDA #$20
	STA байт_2006_hi_графика
	RTS
bra_05_A73B:
	SEC
	LDA номер_опции + 1
	SBC #$10
	BCS bra_05_A70C
	LDA #$00
	JMP _loc_05_A70C
bra_05_A748:
	CLC
	LDA номер_опции + 1
	ADC #$10
	JMP _loc_05_A70C
bra_05_A751:
	SEC
	LDA номер_опции + 1
	SBC #$01
	BCS bra_05_A70C
	LDA #$00
	JMP _loc_05_A70C
bra_05_A75E:
	CLC
	LDA номер_опции + 1
	ADC #$01
	JMP _loc_05_A70C
bra_05_A767:
	LDA номер_опции + 1
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	RTS
bra_05_A770:
	LDA #МУЗЫКА_ВЫКЛЮЧИТЬ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	RTS
_loc_05_A778:
	LDA подтип_экрана
	BMI bra_05_A785
	JSR _loc_05_80DF
	JSR _loc_05_A7A4
	JSR _loc_05_AC87
bra_05_A785:
	JSR _loc_05_ABEE
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_A78E:		; байты после JSR
.word table_05_A78E_A84E
.word table_05_A78E_A861
.word table_05_A78E_A8ED
.word table_05_A78E_A99B
.word table_05_A78E_A9CF
.word table_05_A78E_AA5B
.word table_05_A78E_AA93
.word table_05_A78E_AB42
.word table_05_A78E_AB1B
.word table_05_A78E_AB90
.word table_05_A78E_ABCA

_loc_05_A7A4:
	LDA $0558
	LSR
	LSR
	STA $1C
	SEC
	LDA #$04
	SBC $1C
	BCS bra_05_A7B4
	LDA #$00
bra_05_A7B4:
	STA $05E1
	LDA #$05
	STA $61
	LDA #$01
	STA номер_палитры_спрайтов
	STA номер_палитры_спрайтов + 1
	STA номер_палитры_спрайтов + 2
	STA номер_палитры_спрайтов + 3
	LDA номер_игрока
	STA лицо_игрока + 1
	LDX #$26
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 1
	LDX #$11
	STX банк_спрайтов + 3
	JSR _b07_запись_банков_спрайтов
	LDX #$00
bra_05_A7E3:
	TXA
	ASL
	TAY
	LDA table_05_A84A,Y
	STA координата_X_lo + 1,X
	LDA table_05_A84A + 1,Y
	STA координата_Y_lo + 1,X
	LDA #$05
	STA $62,X
	INX
	CPX #$02
	BCC bra_05_A7E3
	LDA $05D1
	PHA
	JSR _b07_ECA9
	JSR _b07_выключить_NMI
	JSR _b07_выключить_рендеринг
	LDY #$00
bra_05_A80B:
	STY $05D1
	JSR _loc_05_B0A8
	JSR _b07_EFAD
	LDY $05D1
	INY
	CPY #$0C
	BCC bra_05_A80B
	LDA номер_игрока
	STA номер_опции
	JSR _loc_05_AD19
	SEC
	LDA байт_2006_lo_атрибуты
	SBC #$0C
	STA байт_2006_lo_атрибуты
	SEC
	LDA байт_2006_lo_графика
	SBC #$0C
	STA байт_2006_lo_графика
	JSR _b07_EFAD
	JSR _b07_включить_рендеринг
	JSR _b07_включить_NMI
	PLA
	STA $05D1
	LDA #$FF
	STA номер_опции
	RTS

table_05_A84A:
.byte $34,$A7
.byte $84,$A7

table_05_A78E_A84E:
	LDA флаг_яркости
	BPL bra_05_A85B
	INC счетчик_опций
	LDA #МУЗЫКА_МЕНЮ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
bra_05_A85B:
	JSR _b07_D073
	JMP _loc_05_A8C5

table_05_A78E_A861:
	LDX #$00
	LDA номер_опции
	BPL bra_05_A86B
	JSR _loc_05_AC87
bra_05_A86B:
	JSR _loc_05_817E
	JSR _loc_05_81D3
	JSR _b07_EC8F

table_05_A874:		; байты после JSR
.word table_05_A874_A8C5
.word table_05_A874_A880
.word table_05_A874_A8C5
.word table_05_A874_A88B
.word table_05_A874_A8B0
.word table_05_A874_A8BD

table_05_A874_A880:
table_05_A903_A880:
table_05_A9B1_A880:
table_05_A9EC_A880:
table_05_AA71_A880:
table_05_AAA9_A880:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
bra_05_A885:
	JSR _loc_05_ACA7
	JMP _loc_05_A8C5

table_05_A874_A88B:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA номер_опции
	CMP #$04
	BEQ bra_05_A885
	LDA #$00
	JSR _loc_05_82B0
	JSR _loc_05_ACBD
	CLC
	LDA номер_опции
	ADC #$02
	STA счетчик_опций
	LDA #$FF
	STA номер_опции
	JMP _loc_05_A8C5

table_05_A874_A8B0:
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$04
	STA номер_опции
	JMP _loc_05_A8C5

table_05_A874_A8BD:
table_05_A9EC_A8BD:
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_81DD

_loc_05_A8C5:
table_05_A874_A8C5:
table_05_A9EC_A8C5:
	LDA #$16
	STA номер_анимации + 1
	LDA #$7F
	STA номер_анимации + 2
	LDX #$00
	JSR _loc_05_822A
	LDA #$00
	JSR _loc_05_828D
_loc_05_A8D9:
	LDA счетчик_опций
	CMP #$06
	BNE bra_05_A8E1
	INX
bra_05_A8E1:
	JSR _b07_EB8C
	INX
	CPX #$03
	BCC bra_05_A8E1
	JSR _loc_05_8014
	RTS

table_05_A78E_A8ED:
	LDX #$00
	LDA номер_опции
	BPL bra_05_A8FA
	JSR _loc_05_AE29
	JSR _loc_05_AD19
bra_05_A8FA:
	JSR _loc_05_817E
	JSR _loc_05_81D3
	JSR _b07_EC8F

table_05_A903:		; байты после JSR
.word table_05_A903_A97C
.word table_05_A903_A880
.word table_05_A903_A97C
.word table_05_A903_A90F
.word table_05_A903_A964
.word table_05_A903_A96F

table_05_A903_A90F:
	LDY $05D1
	JSR _loc_05_B077
	JSR _loc_05_B0A8
	LDA номер_игрока
	JSR _loc_05_B233
	LDA счетчик_кадров
	AND #$03
	TAY
	LDA table_05_A93C,Y
	STA $0606
	LDA #$07
	STA счетчик_опций
_loc_05_A92F:
	LDA #$FF
	STA номер_опции
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JMP _loc_05_A97C

table_05_A93C:
.byte $0D,$0D,$0E,$0F

_loc_05_A940:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_AE30
_loc_05_A948:
	LDY счетчик_опций
	LDA table_05_A959,Y
	STA номер_опции
	LDA #$01
	STA счетчик_опций
	JMP _loc_05_A8C5

table_05_A959:
.byte $FF,$FF,$C0,$C1,$C2,$C3,$C1,$C0,$C1,$C2,$C2

table_05_A903_A964:
table_05_A9B1_A964:
table_05_A9EC_A964:
table_05_AA71_A964:
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_AE30
	JMP _loc_05_A948

table_05_A903_A96F:
table_05_A9B1_A96F:
table_05_AA71_A96F:
	LDX #$00
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_81DD
	JSR _loc_05_AD19

_loc_05_A97C:
table_05_A903_A97C:
table_05_A9B1_A97C:
table_05_AA71_A97C:
table_05_AAA9_A97C:
	JSR _loc_05_AE22
	LDA #$16
	STA номер_анимации + 1
	LDA #$96
	STA номер_анимации + 2
	LDA #$04
	STA $05CE
	LDX #$00
	JSR _loc_05_822A
	LDA #$01
	JSR _loc_05_828D
	JMP _loc_05_A8D9

table_05_A78E_A99B:
	LDX #$00
	LDA номер_опции
	BPL bra_05_A9A8
	JSR _loc_05_AE29
	JSR _loc_05_AD19
bra_05_A9A8:
	JSR _loc_05_817E
	JSR _loc_05_81D3
	JSR _b07_EC8F

table_05_A9B1:		; байты после JSR
.word table_05_A9B1_A97C
.word table_05_A9B1_A880
.word table_05_A9B1_A97C
.word table_05_A9B1_A9BD
.word table_05_A9B1_A964
.word table_05_A9B1_A96F

table_05_A9B1_A9BD:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$06
	STA счетчик_опций
	LDA #$FF
	STA номер_опции
	JMP _loc_05_A97C

table_05_A78E_A9CF:
	LDX #$00
	BIT номер_опции
	BPL bra_05_A9DE
	LDA #$00
	STA $05D2
	STA номер_опции
bra_05_A9DE:
	BIT номер_опции
	BVS bra_05_A9F8
	JSR _loc_05_817E
	JSR _loc_05_81D3
	JSR _b07_EC8F

table_05_A9EC:		; байты после JSR
.word table_05_A9EC_A8C5
.word table_05_A9EC_A880
.word table_05_A9EC_A8C5
.word table_05_A9EC_AA38
.word table_05_A9EC_A964
.word table_05_A9EC_A8BD

bra_05_A9F8:
	LDA $05D2
	BNE bra_05_AA11
	LDA номер_опции
	AND #$0F
	TAY
	LDA table_05_AA33,Y
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$18
	STA $05D2
	INC номер_опции
bra_05_AA11:
	DEC $05D2
	LDA номер_опции
	CMP #$45
	BCC bra_05_AA30
	LDA номер_игрока
	JSR _loc_05_B233
	LDA #$27
	STA $0606
	LDA #$09
	STA счетчик_опций
	LDA #$FF
	STA номер_опции
bra_05_AA30:
	JMP _loc_05_A8C5

table_05_AA33:
.byte ЗВУК_ТЫ_ПОДНИМАЕШЬ_ТРУБКУ
.byte ЗВУК_ТЕЛЕФОН_ЦИФРА_1
.byte ЗВУК_ТЕЛЕФОН_ЦИФРА_4
.byte ЗВУК_ТЕЛЕФОН_ЦИФРА_2
.byte ЗВУК_ТЕЛЕФОН_ЦИФРА_3

table_05_A9EC_AA38:
	LDA номер_опции
	STA $05D0
	LDA #$00
	JSR _loc_05_82B0
	LDA #$40
	STA номер_опции
	CLC
	LDA $05D0
	ADC #$08
	LDY #$00
bra_05_AA50:
	JSR _loc_05_B009
	INY
	CPY #$0C
	BCC bra_05_AA50
	JMP _loc_05_A8C5

table_05_A78E_AA5B:
	LDX #$00
	LDA номер_опции
	BPL bra_05_AA68
	JSR _loc_05_AE29
	JSR _loc_05_AD19
bra_05_AA68:
	JSR _loc_05_817E
	JSR _loc_05_81D3
	JSR _b07_EC8F

table_05_AA71:		; байты после JSR
.word table_05_AA71_A97C
.word table_05_AA71_A880
.word table_05_AA71_A97C
.word table_05_AA71_AA7D
.word table_05_AA71_A964
.word table_05_AA71_A96F

table_05_AA71_AA7D:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	LDA #$0A
	STA подтип_экрана
	LDA #$0D
	STA $5B
	RTS

table_05_A78E_AA93:
	LDX #$00
	LDA номер_опции
	BPL bra_05_AAA3
	LDA $05E1
	STA номер_опции
	JSR _loc_05_AD53
bra_05_AAA3:
	JSR _loc_05_817E
	JSR _b07_EC8F

table_05_AAA9:		; байты после JSR
.word table_05_AAA9_A97C
.word table_05_AAA9_A880
.word table_05_AAA9_A97C
.word table_05_AAA9_AABB
.word table_05_AAA9_AADC
.word table_05_AAA9_AB09
.word table_05_AAA9_AAEE
.word table_05_AAA9_AB09
.word table_05_AAA9_AAEE

table_05_AAA9_AABB:
	LDA #$01
	STA $20
	LDA номер_опции
	CMP #$04
	BCC bra_05_AAD1
	SBC #$04
	LDY $05D1
	JSR _loc_05_B009
	JSR _loc_05_B0A8
bra_05_AAD1:
	JSR _loc_05_AF5F
	LDA #$08
	STA счетчик_опций
	JMP _loc_05_A92F

table_05_AAA9_AADC:
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$03
	STA счетчик_опций
	LDA #$FF
	STA номер_опции
	JMP _loc_05_A97C

table_05_AAA9_AAEE:
	CLC
	LDA номер_опции
	ADC #$01
	CMP #$0C
	BCC bra_05_AAFB
	LDA $05E1
_loc_05_AAFB:
bra_05_AAFB:
	STA номер_опции
	JSR _loc_05_AD53
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JMP _loc_05_A97C

table_05_AAA9_AB09:
	SEC
	LDA номер_опции
	SBC #$01
	BMI bra_05_AB16
	CMP $05E1
	BCS bra_05_AAFB
bra_05_AB16:
	LDA #$0B
	JMP _loc_05_AAFB

table_05_A78E_AB1B:
	LDA номер_опции
	BMI bra_05_AB28
bra_05_AB20:
	LDA $0605
	BMI bra_05_AB32
	JMP _loc_05_A940
_loc_05_AB28:
bra_05_AB28:
	LDA #$00
	STA номер_опции
	LDA #$80
	STA $0604
_loc_05_AB32:
bra_05_AB32:
	JSR _b07_C317
	LDA счетчик_опций
	CMP #$09
	BCC bra_05_AB3F
	JMP _loc_05_A8C5
bra_05_AB3F:
	JMP _loc_05_A97C

table_05_A78E_AB42:
	LDA номер_опции
	BMI bra_05_AB28
	LDA номер_опции
	BNE bra_05_AB20
	LDA $0605
	BMI bra_05_AB32
	LDA $05D1
	JSR _loc_05_B233
	LDY $05D1
	LDA $05D5,Y
	AND #$0F
	LSR
	TAY
	LDA table_05_AB88,Y
	BPL bra_05_AB6E
	LDA #$10
	CLC
	ADC $05D1
	BNE bra_05_AB7A
bra_05_AB6E:
	STA $0606
	LDA счетчик_кадров
	AND #$01
	CLC
	ADC $0606
bra_05_AB7A:
	STA $0606
	LDA #$80
	STA $0604
	INC номер_опции
	JMP _loc_05_AB32

table_05_AB88:
.byte $22,$22,$20,$1E,$1E,$1C,$FF,$FF

table_05_A78E_AB90:
	LDA номер_опции
	BMI bra_05_AB28
	LDA $0605
	BPL bra_05_ABB5
	AND #$20
	BEQ bra_05_AB32
	LDA счетчик_кадров
	AND #$7F
	BNE bra_05_AB32
	LDA номер_опции
	EOR #$01
	STA номер_опции
	LDA #ЗВУК_ГУДКИ_В_ТРУБКЕ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JMP _loc_05_AB32
bra_05_ABB5:
	LDA #ЗВУК_КЛИЕНТ_ПОДНИМАЕТ_ТРУБКУ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_AFBD
	LDA #$0A
	STA счетчик_опций
	LDA #$FF
	STA номер_опции
	JMP _loc_05_AB32

table_05_A78E_ABCA:
	LDA номер_опции
	BMI bra_05_ABEB
	LDA $0605
	BPL bra_05_ABD7
	JMP _loc_05_AB32
bra_05_ABD7:
	LDA $05D0
	CMP #$02
	BNE bra_05_ABE5
	LDA $0606
	CMP #$32
	BCC bra_05_ABE8
bra_05_ABE5:
	JMP _loc_05_A940
bra_05_ABE8:
	INC $0606
bra_05_ABEB:
	JMP _loc_05_AB28
_loc_05_ABEE:
	JSR _loc_05_8205

table_05_ABF1:		; байты после JSR
.word table_05_ABF1_AC5D
.word table_05_ABF1_AC09
.word table_05_ABF1_AC5D
.word table_05_ABF1_AC09
.word table_05_ABF1_AC67
.word table_05_ABF1_AC1D
.word table_05_ABF1_AC67
.word table_05_ABF1_AC1D
.word table_05_ABF1_AC7F
.word table_05_ABF1_AC4D
.word table_05_ABF1_AC67
.word table_05_ABF1_AC1D

table_05_ABF1_AC09:
.byte $04,$01,$00,$00,$00,$02,$01,$01,$01,$03,$02,$02,$02,$04,$03,$03,$03,$00,$04,$04

table_05_ABF1_AC1D:
.byte $06,$06,$05,$01,$07,$07,$00,$02,$08,$08,$01,$03,$09,$09,$02,$04,$0A,$0A,$03,$05,$0B,$0B,$04,$00,$00,$00,$0B,$07,$01,$01,$06,$08,$02,$02,$07,$09,$03,$03,$08,$0A,$04,$04,$09,$0B,$05,$05,$0A,$06

table_05_ABF1_AC4D:
.byte $02,$02,$01,$01,$03,$03,$00,$00,$00,$00,$03,$03,$01,$01,$02,$02

table_05_ABF1_AC5D:
.byte $09,$12,$09,$13,$09,$14,$09,$15,$09,$16

table_05_ABF1_AC67:
.byte $05,$06,$09,$06,$0D,$06,$11,$06,$15,$06,$19,$06,$05,$0B,$09,$0B,$0D,$0B,$11,$0B,$15,$0B,$19,$0B

table_05_ABF1_AC7F:
.byte $10,$14,$15,$14,$10,$16,$15,$16

; в этом районе подозрительно много зеленых байтов
_loc_05_AC87:
	LDA #$00
	STA $05CE
	LDA номер_опции
	AND #$20
	BNE bra_05_ACA1
	LDA номер_опции
	AND #$3F
	STA номер_опции
	JSR _loc_05_82EF
	RTS
bra_05_ACA1:
	LDA #$04
	STA номер_опции
	RTS

_loc_05_ACA7:
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	LDA #$04
	STA подтип_экрана
	RTS

table_05_ACB3:		; видимо нигде не используется
.byte $02,$0D,$02,$0D,$02,$0D,$02,$0A,$02,$04

_loc_05_ACBD:
	LDA номер_опции
_loc_05_ACC0:
	ASL
	ASL
	ASL
	STA $26
	LDA #$22
	STA $32
	LDA #$2E
	STA $33
	LDX #$00
_loc_05_ACCF:
	LDY $26
	CLC
	LDA #< table_05_AE35
	ADC table_05_AE37,Y
	STA $34
	LDA #> table_05_AE35
	ADC #$00
	STA $35
	LDY #$00
bra_05_ACE3:
	LDA ($34),Y
	STA буфер_графики,Y
	INY
	CPY #$10
	BCC bra_05_ACE3
	LDA #$10
	STA счетчик_буфера_графики
	LDA $33
	STA байт_2006_lo_графика
	LDA $32
	STA байт_2006_hi_графика
bra_05_ACFC:
	LDA байт_2006_hi_графика
	BPL bra_05_ACFC
	INX
	CPX #$07
	BCS bra_05_AD18
	CLC
	LDA $33
	ADC #$20
	STA $33
	LDA $32
	ADC #$00
	STA $32
	INC $26
	JMP _loc_05_ACCF
bra_05_AD18:
	RTS

_loc_05_AD19:
	LDA номер_опции
	LDA номер_опции
	STA $05D1
	JSR _loc_05_B1FF
	LDA #$59
	STA $1C
	LDA #$5A
	STA $1D
	LDA #$5B
	STA $1E
	LDA #$05
	STA $1F
	JSR _loc_05_AD91
	LDA $1F
	STA счетчик_буфера_атрибутов
	STA счетчик_буфера_графики
	LDA #$AF
	STA байт_2006_lo_атрибуты
	LDA #$CF
	STA байт_2006_lo_графика
	LDA #$22
	STA байт_2006_hi_атрибуты
	STA байт_2006_hi_графика
	RTS
_loc_05_AD53:
	LDA номер_опции
	JSR _loc_05_B222
	LDA #$02
	STA $1C
	LDA #$DA
	STA $1D
	LDA #$DB
	STA $1E
	LDA #$08
	STA $1F
	JSR _loc_05_AD91
	SEC
	LDA буфер_графики
	SBC $05E1
	STA буфер_графики
	LDA $1F
	STA счетчик_буфера_атрибутов
	STA счетчик_буфера_графики
	LDA #$75
	STA байт_2006_lo_атрибуты
	LDA #$95
	STA байт_2006_lo_графика
	LDA #$22
	STA байт_2006_hi_атрибуты
	STA байт_2006_hi_графика
	RTS
_loc_05_AD91:
	LDY #$00
bra_05_AD93:
	LDA ($30),Y
	BMI bra_05_ADB2
	CMP #$10
	BCC bra_05_ADB2
	CMP #$50
	BCS bra_05_ADA8
	ORA #$80
	STA буфер_графики,Y
	LDA $1D
	BNE bra_05_ADB7
bra_05_ADA8:
	CLC
	ADC #$50
	STA буфер_графики,Y
	LDA $1E
	BNE bra_05_ADB7
bra_05_ADB2:
	STA буфер_графики,Y
	LDA $1C
bra_05_ADB7:
	STA буфер_атрибутов,Y
	INY
	CPY $1F
	BCC bra_05_AD93
	RTS

table_05_ADC0:		; отображение имени при выборе второй опции на экране с игроками
						; во время прохождения
.byte $90,$AE,$6E,$E2,$AD,$D2,$D9,$2E
.byte $91,$AE,$6E,$E2,$AC,$6F,$D9,$B1
.byte $92,$AE,$6E,$E2,$35,$C9,$CF,$A9
.byte $93,$2B,$C2,$E2,$B6,$27,$29,$B3
.byte $94,$A6,$B7,$D2,$A4,$B1,$A6,$CA
.byte $95,$C0,$CA,$BC,$E2,$3C,$34,$A6
.byte $96,$A2,$A3,$35,$CA,$E2,$3F,$CF
.byte $97,$B4,$D5,$34,$D5,$E2,$3E,$A2
.byte $98,$A2,$B7,$C3,$E2,$3C,$34,$A6
.byte $99,$A4,$C3,$3F,$AD,$FF,$FF,$FF
.byte $9A,$AD,$D1,$AA,$BA,$BC,$C4,$BA
.byte $9B,$C1,$AC,$AB,$BA,$02,$A2,$A3

_loc_05_AE22:
	LDA $05D1
	STA лицо_игрока + 2
	RTS
_loc_05_AE29:
	LDA $05D1
	STA номер_опции
	RTS
_loc_05_AE30:
	LDA #$04
	JMP _loc_05_ACC0

table_05_AE37:		; добавляется к table_05_AE35
.byte $00,$10,$10,$10,$20,$10,$30,$00,$00,$40,$10,$10,$20,$50,$30,$00,$60,$70,$80,$90,$A0,$B0,$C0,$00,$00,$10,$10,$10,$20,$10,$30,$00,$D0,$E0,$E0,$E0,$E0,$E0,$F0,$00

table_05_AE35:		; что-то связано с отрисовкой экрана на экране игроков
						; когда отменяешь опцию или когда ее действие заканчивается
.byte $67,$05,$1D,$CB,$B7,$05,$68,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $5D,$02,$02,$02,$02,$02,$5E,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $75,$59,$59,$59,$59,$59,$6F,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $6A,$05,$05,$05,$05,$05,$69,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $5D,$02,$02,$02,$02,$02,$5E,$05,$05,$B6,$B7,$CE,$DE,$05,$05,$05
.byte $5D,$02,$02,$02,$02,$02,$5E,$05,$05,$05,$05,$05,$05,$05,$05,$05
.byte $78,$02,$02,$02,$02,$02,$02,$DA,$02,$02,$02,$02,$02,$02,$02,$02
.byte $79,$02,$05,$05,$05,$05,$02,$B1,$CB,$B7,$02,$05,$05,$05,$05,$05
.byte $79,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$DA,$02,$DB,$02
.byte $79,$02,$02,$C1,$AC,$AB,$02,$02,$B4,$A9,$BA,$AE,$AD,$D1,$BB,$CF
.byte $79,$02,$02,$02,$02,$02,$02,$02,$02,$DA,$02,$02,$DA,$02,$02,$02
.byte $79,$02,$02,$B1,$A7,$AD,$02,$02,$A2,$BD,$B6,$A3,$B1,$A3,$C5,$CA
.byte $7A,$02,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05
.byte $78,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $79,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $7A,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02

_loc_05_AF5F:
	LDA $05D1
	JSR _loc_05_B233
	LDA номер_опции
	JSR _loc_05_B24C
	LDA $20
	AND #$03
	CLC
	ADC #$24
	STA $0606
	LDA номер_опции
	CMP #$05
	BCS bra_05_AF8C
	JSR _b07_EC8F

table_05_AF7F:		; байты после JSR
.word table_05_AF7F_AF8D
.word table_05_AF7F_AFA1
.word table_05_AF7F_AFB1
.word table_05_AF7F_AF97
.word table_05_AF7F_AFB7

bra_05_AF89:
	STA $05D5,Y
bra_05_AF8C:
	RTS

table_05_AF7F_AF8D:
	LDY $05D1
	LDA $05D5,Y
	ORA #$80
	BNE bra_05_AF89

table_05_AF7F_AF97:
	LDY $05D1
	LDA $05D5,Y
	ORA #$40
	BNE bra_05_AF89

table_05_AF7F_AFA1:
	LDA #$10
	STA $1C
bra_05_AFA5:
	LDY $05D1
	LDA $05D5,Y
	AND #$CF
	ORA $1C
	BNE bra_05_AF89

table_05_AF7F_AFB1:
	LDA #$20
	STA $1C
	BNE bra_05_AFA5

table_05_AF7F_AFB7:
	LDA #$30
	STA $1C
	BNE bra_05_AFA5
_loc_05_AFBD:
	LDA $05D0
	JSR _b07_EC8F

table_05_AFC3:		; байты после JSR
.word table_05_AFC3_AFCF
.word table_05_AFC3_AFD9
.word table_05_AFC3_AFF7
.word table_05_AFC3_AFFF

bra_05_AFCB:
	STA $0606
	RTS

table_05_AFC3_AFCF:
	LDA счетчик_кадров
	AND #$03
	CLC
	ADC #$28
	BNE bra_05_AFCB

table_05_AFC3_AFD9:
	SEC
	LDA #$10
	SBC $0558
	BCS bra_05_AFE3
	LDA #$00
bra_05_AFE3:
	JSR _loc_05_B26A
	SEC
	LDA #$46
	SBC $0555
	BCS bra_05_AFF0
	LDA #$00
bra_05_AFF0:
	JSR _loc_05_B265
	LDA #$33
	BNE bra_05_AFCB

table_05_AFC3_AFF7:
	CLC
	LDA #$2C
	ADC $05E1
	BNE bra_05_AFCB

table_05_AFC3_AFFF:
	LDA счетчик_кадров
	AND #$01
	CLC
	ADC #$34
	BNE bra_05_AFCB
_loc_05_B009:
	STA $1C
	STY $1D
	TYA
	ASL
	ADC $1D
	TAY
	LDA table_05_B084,Y
	STA $1E
	LDA table_05_B084 + 1,Y
	STA $1F
	LDA table_05_B084 + 2,Y
	STA $20
	SEC
	LDA #$0B
	SBC $1C
	TAY
_loc_05_B027:
	DEY
	BMI bra_05_B039
	LSR $1E
	ROR $1F
	ROR $20
	LSR $1E
	ROR $1F
	ROR $20
	JMP _loc_05_B027
bra_05_B039:
	LDA $20
	AND #$03
	BEQ bra_05_B072
	CMP #$03
	BNE bra_05_B048
_loc_05_B043:
	JSR _b07_вращение_рандома
	AND #$07
bra_05_B048:
	TAY
	CLC
	LDA table_05_B07C,Y
	BEQ bra_05_B072
	STA $1E
	LDY $1D
	LDA $05D5,Y
	AND #$0F
	ADC $1E
	BMI bra_05_B064
	CMP #$10
	BCC bra_05_B066
	LDA #$0F
	BNE bra_05_B066
bra_05_B064:
	LDA #$00
bra_05_B066:
	STA $1E
	LDA $05D5,Y
	AND #$F0
	ORA $1E
	STA $05D5,Y
bra_05_B072:
	LDY $1D
	LDA $1C
	RTS
_loc_05_B077:
	STY $1D
	JMP _loc_05_B043

table_05_B07C:
.byte $01,$02,$FE,$FF,$03,$FD,$04,$FC

table_05_B084:
.byte $40,$14,$00
.byte $48,$10,$02
.byte $48,$40,$08
.byte $40,$01,$42
.byte $61,$00,$16
.byte $40,$10,$00
.byte $44,$24,$00
.byte $52,$00,$01
.byte $61,$48,$02
.byte $40,$06,$80
.byte $44,$80,$00
.byte $51,$28,$00

_loc_05_B0A8:
	LDA $05D1
	ASL
	ASL
	ASL
	ADC #< table_05_B155
	STA $32
	LDA #$00
	ADC #> table_05_B155
	STA $33
	LDY $05D1
	LDA $05D5,Y
	LSR
	AND #$06
	TAY
	LDA ($32),Y
	STA буфер_графики
	INY
	LDA ($32),Y
	STA буфер_атрибутов
	LDY $05D1
	LDA $05D5,Y
	AND #$0E
	STA $1C
	ASL
	ADC $1C
	TAY
	LDA table_05_B1B7,Y
	STA буфер_графики + 1
	LDA table_05_B1B7 + 1,Y
	STA буфер_атрибутов + 1
	LDA table_05_B1B7 + 2,Y
	STA буфер_палитры
	LDA table_05_B1B7 + 3,Y
	STA буфер_палитры + 1
	LDA table_05_B1B7 + 4,Y
	STA буфер_палитры + 2
	LDA table_05_B1B7 + 5,Y
	STA буфер_графики + 2
	LDA #$1F
	STA буфер_атрибутов + 2
	LDA #$03
	STA счетчик_буфера_атрибутов
	STA счетчик_буфера_графики
	STA счетчик_буфера_палитры
	LDA #$04
	STA $0690
	STA $0691
	STA $0692
	LDA $05D1
	ASL
	TAY
	LDA table_05_B1E7,Y
	STA байт_2006_lo_палитра
	LDA table_05_B1E7 + 1,Y
	STA байт_2006_hi_палитра
	CLC
	LDA table_05_B1E7,Y
	ADC #$01
	STA байт_2006_lo_графика
	LDA table_05_B1E7 + 1,Y
	ADC #$00
	STA байт_2006_hi_графика
	CLC
	LDA table_05_B1E7,Y
	ADC #$02
	STA байт_2006_lo_атрибуты
	LDA table_05_B1E7 + 1,Y
	ADC #$00
	STA байт_2006_hi_атрибуты
bra_05_B14F:
	LDA байт_2006_hi_атрибуты
	BMI bra_05_B14F
	RTS

table_05_B155:		; сввязано с выдачей предметов игрокам
						; вероятно влияет на реакцию получения предмета
.byte $50,$11,$10,$11,$10,$11,$30,$31
.byte $51,$13,$12,$13,$12,$13,$32,$33
.byte $52,$15,$14,$15,$14,$15,$34,$35
.byte $53,$17,$16,$17,$16,$17,$36,$37
.byte $54,$19,$18,$19,$18,$19,$38,$39
.byte $55,$1B,$1A,$1B,$1A,$1B,$3A,$3B
.byte $60,$21,$20,$21,$20,$21,$40,$41
.byte $61,$23,$22,$23,$22,$23,$42,$43
.byte $62,$25,$24,$25,$24,$25,$44,$45
.byte $63,$27,$26,$27,$26,$27,$46,$47
.byte $64,$29,$28,$29,$28,$29,$48,$49
.byte $65,$2B,$2A,$2B,$2A,$2B,$4A,$4B

table_05_B1B7:
.byte $70,$3C,$02,$6E,$7E,$7F
.byte $70,$3C,$02,$6E,$7E,$7F
.byte $71,$3E,$02,$02,$02,$1E
.byte $72,$3E,$02,$02,$02,$1E
.byte $72,$3E,$02,$02,$02,$1E
.byte $73,$3D,$02,$02,$02,$1E
.byte $74,$3F,$56,$66,$76,$77
.byte $74,$3F,$56,$66,$76,$77

table_05_B1E7:		; читается из 3х мест
.byte $E4,$20
.byte $E8,$20
.byte $EC,$20
.byte $F0,$20
.byte $F4,$20
.byte $F8,$20
.byte $84,$21
.byte $88,$21
.byte $8C,$21
.byte $90,$21
.byte $94,$21
.byte $98,$21

_loc_05_B1FF:
	STA $1C
	ASL
	ASL
	ADC $1C
	STA $1C
	LDA table_07_C080_byte_8000_8001
	STA $32
	LDA table_07_C080_byte_8000_8001 + 1
	STA $33
	LDY #$00
	CLC
	LDA $1C
	ADC ($32),Y
	STA $30
	INY
	LDA #$00
	ADC ($32),Y
	STA $31
	RTS

_loc_05_B222:
	ASL
	ASL
	ASL
	CLC
	ADC #< table_05_ADC0
	STA $30
	LDA #$00
	ADC #> table_05_ADC0
	STA $31
	RTS

_loc_05_B233:
	JSR _loc_05_B1FF
	LDY #$00
bra_05_B238:
	LDA ($30),Y
	STA $0611,Y
	CMP #$FF
	BEQ bra_05_B246
	INY
	CPY #$05
	BCC bra_05_B238
bra_05_B246:
	LDA #$F8
	STA $0611,Y
	RTS
_loc_05_B24C:
	JSR _loc_05_B222
	LDY #$01
bra_05_B251:
	LDA ($30),Y
	STA $0616,Y
	CMP #$FF
	BEQ bra_05_B25F
	INY
	CPY #$08
	BCC bra_05_B251
bra_05_B25F:
	LDA #$F8
	STA $0616,Y
	RTS
_loc_05_B265:
	LDY #$02
	JMP _loc_05_B26C
_loc_05_B26A:
	LDY #$00
_loc_05_B26C:
	STA $1C
	LDA table_05_B2AE,Y
	STA $34
	LDA table_05_B2AE + 1,Y
	STA $35
	LDA $1C
	JSR _loc_05_8A11
	LDA $30
	ORA #$80
	STA $1E
	LDA $31
	STA $1D
	LDA $32
	STA $1C
	LDA #$00
	STA $21
	LDY #$00
bra_05_B291:
	LDA $001C,Y
	BNE bra_05_B29E
	BIT $21
	BMI bra_05_B2A0
	LDA #$00
	BEQ bra_05_B2A2
bra_05_B29E:
	DEC $21
bra_05_B2A0:
	ORA #$80
bra_05_B2A2:
	STA ($34),Y
	INY
	CPY #$03
	BCC bra_05_B291
	LDA #$F8
	STA ($34),Y
	RTS

table_05_B2AE:
.byte $11,$06
.byte $17,$06

_loc_05_B2B2:
	LDA подтип_экрана
	BMI bra_05_B2E3
	LDA $054A
	BMI bra_05_B2C0
	LDY #$00
	JMP _loc_05_B3D3
bra_05_B2C0:
	JSR _loc_05_B3DE
	LDA $0555
	CMP #$46
	BCC bra_05_B2D8
	LDA $0558
	CMP #$24
	BCC bra_05_B2D4
	JMP _loc_05_B3BD
bra_05_B2D4:
	CMP #$10
	BCS bra_05_B2DD
bra_05_B2D8:
	LDY #$01
	JMP _loc_05_B3D3
bra_05_B2DD:
	JSR _loc_05_80DF
	JSR _loc_05_B2F0
bra_05_B2E3:
	JSR _loc_05_B3A3
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_B2EC:		; байты после JSR
.word table_05_B2EC_B32F
.word table_05_B2EC_B345

_loc_05_B2F0:
	LDA #$FF
	STA номер_опции
	LDY #$04
	STY $6D
	INY
	STY $61
	LDA #$00
	STA номер_команды
	LDA #$07
	STA номер_палитры_спрайтов
	STA номер_анимации_мяча
	LDX #$26
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 1
	LDA #$2F
	STA банк_спрайтов + 3
	JSR _b07_запись_банков_спрайтов
	LDA #$C8
	STA координата_X_lo_мяча
	LDA #$A0
	STA координата_Y_lo_мяча
	JSR _loc_05_8947
	LDA #МУЗЫКА_ПРОХОЖДЕНИЕ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	RTS

table_05_B2EC_B32F:
	LDA флаг_яркости
	BPL bra_05_B337
	INC счетчик_опций
bra_05_B337:
	JSR _b07_D073
	LDX #$0C
	JSR _b07_EB8C
	JSR _loc_05_8014
	RTS

table_05_B2EC_B345:
	LDX #$00
	LDA номер_опции
	BPL bra_05_B353
	LDA #$00
	STA номер_опции
	LDX #$00
bra_05_B353:
	JSR _loc_05_817E
	JSR _loc_05_81D3
	JSR _b07_EC8F

table_05_B35C:		; байты после JSR
.word table_05_B35C_B38D
.word table_05_B35C_B368
.word table_05_B35C_B38D
.word table_05_B35C_B368
.word table_05_B35C_B373
.word table_05_B35C_B380

table_05_B35C_B368:
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _loc_05_B3B2
	JMP _loc_05_B38D

table_05_B35C_B373:
	LDA #ЗВУК_ОТРИЦАТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA #$01
	STA номер_опции
	JMP _loc_05_B38D

table_05_B35C_B380:
	LDA #ЗВУК_КУРСОР
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	LDA номер_опции
	EOR #$01
	STA номер_опции

_loc_05_B38D:
table_05_B35C_B38D:
	LDX #$00
	JSR _loc_05_822A
	LDA #$00
	JSR _loc_05_828D
	JSR _b07_EB8C
	LDX #$0C
	JSR _b07_EB8C
	JSR _loc_05_8014
	RTS
_loc_05_B3A3:
	JSR _loc_05_8205

table_05_B3A6:		; байты после JSR
.word table_05_B3A6_B3AE
.word table_05_B3A6_B3AE
.word table_05_B3A6_B3AE
.word table_05_B3A6_B3AE

table_05_B3A6_B3AE:
.byte $08,$0F,$0D,$0F

_loc_05_B3B2:
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	LDY номер_опции
	BNE bra_05_B3D3
_loc_05_B3BD:
	LDA #$00
	STA $054A
	TAY
	LDA #$03
	STA $5B
	LDA опция_режим_сложность
	AND #(СЛОЖНОСТЬ_СРЕДНЕ + СЛОЖНОСТЬ_СЛОЖНО)
	BNE bra_05_B3D3
	LDA #СЛОЖНОСТЬ_СРЕДНЕ
	ORA опция_режим_сложность
	STA опция_режим_сложность
_loc_05_B3D3:
bra_05_B3D3:
	LDA table_05_B3DC_экран,Y
	STA подтип_экрана
	JSR _loc_05_BB47
	RTS

table_05_B3DC_экран:
.byte $0F,$02

_loc_05_B3DE:
	LDA флаг_владения_мячом_команды
	ORA флаг_владения_мячом_команды + 1
	AND #$01
	BEQ bra_05_B464
	LDA номер_команды + 1
	AND #$0F
	LSR
	LSR
	STA $1C
	CLC
	LDA номер_команды + 1
	AND #$0F
	SBC $1C
	TAY
	CLC
	LDA $053E,Y
	ADC #$01
	STA $053E,Y
	INC $0556
	LDA счет_команды
	CMP счет_команды + 1
	BEQ bra_05_B464
	BCS bra_05_B41E
	CLC
	LDA $0557
	ADC #$01
	BCS bra_05_B464
	STA $0557
	RTS
bra_05_B41E:
	LDA $053E,Y
	AND #$03
	TAX
	LDA table_05_B465,X
	ORA $053E,Y
	STA $053E,Y
	INC $0558
	LDA номер_команды + 1
	AND #$0F
	TAY
	LDA table_05_B46C,Y
	STA $1C
	LDA опция_режим_сложность
	AND #$03
	STA $1E
	TAY
	LDA table_05_B469,Y
	STA $1D
_loc_05_B447:
	DEY
	BMI bra_05_B451
	LSR $1C
	LSR $1C
	JMP _loc_05_B447
bra_05_B451:
	LDA $1C
	AND $1D
	CLC
	ADC #$02
	ADC $1E
	ADC $0555
	BCC bra_05_B461
	LDA #$FF
bra_05_B461:
	STA $0555
bra_05_B464:
	RTS

table_05_B465:
.byte $00,$80,$40,$20

table_05_B469:
.byte $03,$03,$07

table_05_B46C:
.byte $00,$00,$00,$00,$00,$00,$15,$29,$00,$3A,$39,$4E,$00,$4E,$29,$15

_loc_05_B47C:
	LDA подтип_экрана
	BMI bra_05_B48E
	JSR _loc_05_80DF
	JSR _loc_05_B4D6
	JSR _loc_05_B5E6
	LDA #МУЗЫКА_МЕНЮ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
bra_05_B48E:
	LDA счетчик_опций
	JSR _b07_EC8F

table_05_B494:		; байты после JSR
.word table_05_B494_B498
.word table_05_B494_B4AE

table_05_B494_B498:
	LDA флаг_яркости
	BPL bra_05_B4A0
	INC счетчик_опций
bra_05_B4A0:
	JSR _b07_D073
	LDX #$0C
	JSR _b07_EB8C
	JSR _loc_05_8014
	RTS

table_05_B494_B4AE:
	LDX #$0C
	JSR _b07_EB8C
	JSR _loc_05_8014
	LDA одноразовые_кнопки
	AND #(КНОПКА_СЕЛЕКТ + КНОПКА_СТАРТ + КНОПКА_А + КНОПКА_Б)
	BEQ bra_05_B4D5
	LDA #ЗВУК_ПОЛОЖИТЕЛЬНЫЙ
	JSR _b07_C2E4_записать_и_воспроизвести_звук
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	LDA $5B
	STA подтип_экрана
	LDA #$04
	STA опция_материка
	LDA #МУЗЫКА_ПОЛЕ_06
	STA номер_музыки
bra_05_B4D5:
	RTS

_loc_05_B4D6:
	LDA #$2F
	STA банк_спрайтов + 3
	JSR _b07_запись_банков_спрайтов
	LDA #$04
	STA $6D
	LDA #$07
	STA номер_анимации_мяча
	STA номер_палитры_спрайтов
	LDA #$C8
	STA координата_X_lo_мяча
	LDA #$A0
	STA координата_Y_lo_мяча
	LDA $5B
	CMP #$04
	BEQ bra_05_B509
	LDA $054A
	JSR _b07_EC8F

table_05_B501:		; байты после JSR
.word table_05_B501_B50A
.word table_05_B501_B535
.word table_05_B501_B554
.word table_05_B501_B574

bra_05_B509:
	RTS

table_05_B501_B50A:
	LDX #$00
	LDY #$00
	LDA $0555
	CMP #$5A
	BCC bra_05_B51D
	LDY #$06
	CMP #$78
	BCC bra_05_B51D
	LDY #$0C
bra_05_B51D:
	LDA table_05_B5D4,Y
	STA $054B,X
	INX
	INY
	CPX #$06
	BCC bra_05_B51D
	LDX #$04
	LDY #$05
	JSR _loc_05_B588
	BEQ bra_05_B509
	INC $054A

table_05_B501_B535:
	LDX #$04
	LDY #$05
	JSR _loc_05_B5A6
	STA $0551
	LDX #$01
	LDY #$02
	JSR _loc_05_B588
	BEQ bra_05_B509
	LDX #$03
	LDY #$06
	JSR _loc_05_B588
	BEQ bra_05_B509
	INC $054A

table_05_B501_B554:
	LDX #$01
	LDY #$02
	JSR _loc_05_B5A6
	STA $0553
	LDX #$03
	LDY #$06
	JSR _loc_05_B5A6
	STA $0552
	LDX #$07
	LDY #$08
	JSR _loc_05_B588
	BEQ bra_05_B509
	INC $054A

table_05_B501_B574:
	LDX #$08
	LDY #$07
	JSR _loc_05_B5A6
	STA $0554
	LDX #$00
	LDY #$09
	JSR _loc_05_B588
	RTS
_loc_05_B588:
	LDA $054B,X
	BNE bra_05_B593
	LDA $054B,Y
	JMP _loc_05_B59B
bra_05_B593:
	LDA $054B,Y
	BNE bra_05_B5A5
	LDA $054B,X
_loc_05_B59B:
	ORA #$80
	STA номер_команды + 1
	LDA #$00
	STA номер_команды
bra_05_B5A5:
	RTS

_loc_05_B5A6:
	LDA $054B,X
	BNE bra_05_B5B2
	ORA #$80
	STA $054B,X
	BNE bra_05_B5BC
bra_05_B5B2:
	LDA $054B,Y
	BNE bra_05_B5C0
	ORA #$80
	STA $054B,Y
bra_05_B5BC:
	LDA #$00
	BEQ bra_05_B5D3
bra_05_B5C0:
	LDA счетчик_кадров
	AND #$01
	BEQ bra_05_B5C9
	TYA
	TAX
bra_05_B5C9:
	LDA $054B,X
	ORA #$80
	STA $054B,X
	AND #$7F
bra_05_B5D3:
	RTS

table_05_B5D4:
.byte $0B,$09,$0D,$0E,$07,$00,$0B,$09,$0D,$00,$0E,$07,$0B,$09,$00,$0D,$0E,$07

_loc_05_B5E6:
	JSR _b07_ECA9
	JSR _b07_выключить_NMI
	JSR _b07_выключить_рендеринг
	LDX #$00
	LDA #$25
	STA $32
	LDA #$21
	STA $33
	LDA #$FF
	STA $1C
	STA $23
	LDA #$DA
	STA $1D
	LDA #$DB
	STA $1E
	LDA #$08
	STA $1F
bra_05_B60B:
	STX $20
	LDA $054B,X
	ASL
	ASL
	ASL
	ADC table_05_B744
	STA $30
	LDA #$00
	ADC table_05_B744 + 1
	STA $31
	LDA $1F
	STA счетчик_буфера_атрибутов
	STA счетчик_буфера_графики
	JSR _loc_05_AD91
	CLC
	LDA $32
	STA байт_2006_lo_атрибуты
	ADC #$20
	STA байт_2006_lo_графика
	STA $32
	LDA $33
	STA байт_2006_hi_атрибуты
	ADC #$00
	STA байт_2006_hi_графика
	STA $33
	CLC
	LDA $32
	ADC #$40
	STA $32
	LDA $33
	ADC #$00
	STA $33
	JSR _b07_EFAD
	LDX $20
	LDA $054B,X
	AND #$0F
	STA $22
	LDY #$01
bra_05_B65E:
	LDA номер_команды,Y
	AND #$0F
	CMP $22
	BEQ bra_05_B66C
	DEY
	BPL bra_05_B65E
	BMI bra_05_B670
bra_05_B66C:
	TXA
	JSR _loc_05_B6EF
bra_05_B670:
	LDX $20
	INX
	CPX #$06
	BCC bra_05_B60B
	LDX #$00
_loc_05_B679:
	STX $20
	CPX $054A
	BCS bra_05_B6AE
	LDX #$00
bra_05_B682:
	STX $21
	LDA $054B,X
	BPL bra_05_B695
	TXA
	JSR _loc_05_B6B5
	LDA #$04
	STA $0691
	JSR _b07_EFAD
bra_05_B695:
	LDX $21
	INX
	CPX #$0A
	BCC bra_05_B682
	CLC
	LDA $054A
	ADC #$08
	JSR _loc_05_B6B5
	JSR _b07_EFAD
	LDX $20
	INX
	JMP _loc_05_B679
bra_05_B6AE:
	JSR _b07_включить_рендеринг
	JSR _b07_включить_NMI
	RTS
_loc_05_B6B5:
	STA $1C
	ASL
	ADC $1C
	ASL
	TAY
	LDA table_05_B7C6,Y
	STA $30
	LDA table_05_B7C6 + 1,Y
	STA $31
	LDA table_05_B7C6 + 2,Y
	STA $32
	LDA table_05_B7C6 + 3,Y
	STA $33
	LDA table_05_B7C6 + 4,Y
	STA $34
	LDA table_05_B7C6 + 5,Y
	STA $35
	LDY #$0A
bra_05_B6DC:
	LDA ($30),Y
	STA байт_2006_hi_атрибуты,Y
	LDA ($32),Y
	STA байт_2006_hi_графика,Y
	LDA ($34),Y
	STA байт_2006_hi_палитра,Y
	DEY
	BPL bra_05_B6DC
	RTS
_loc_05_B6EF:
	STA $22
	ASL
	ADC $22
	ASL
	TAY
	LDA table_05_B881,Y
	STA байт_2006_hi_атрибуты
	LDA table_05_B881 + 1,Y
	STA байт_2006_lo_атрибуты
	LDA table_05_B881 + 2,Y
	STA буфер_атрибутов
	STA буфер_атрибутов + 1
	LDA table_05_B881 + 3,Y
	STA байт_2006_hi_графика
	LDA table_05_B881 + 4,Y
	STA байт_2006_lo_графика
	LDA table_05_B881 + 5,Y
	STA буфер_графики
	STA буфер_графики + 1
	LDA #$02
	STA счетчик_буфера_атрибутов
	STA счетчик_буфера_графики
	LDA $23
	BMI bra_05_B73C
	INC $23
	LDA $23
	CMP $22
	BNE bra_05_B73C
	LDA #$AA
	STA буфер_атрибутов
	STA буфер_атрибутов + 1
bra_05_B73C:
	LDA $22
	STA $23
	JSR _b07_EFAD
	RTS

table_05_B744:
.word table_05_B744_B746

table_05_B744_B746:
.byte $B9,$D0,$AA,$B3,$8F,$8C,$FF,$FF
.byte $A7,$CF,$AB,$A9,$FF,$FF,$FF,$FF
.byte $C4,$CF,$2B,$CA,$FF,$FF,$FF,$FF
.byte $B1,$A3,$FF,$FF,$FF,$FF,$FF,$FF
.byte $B9,$D0,$AA,$B3,$FF,$FF,$FF,$FF
.byte $28,$B7,$A2,$FF,$FF,$FF,$FF,$FF
.byte $AF,$B9,$27,$CA,$FF,$FF,$FF,$FF
.byte $A7,$C3,$CA,$D9,$CF,$FF,$FF,$FF
.byte $B9,$D0,$AA,$B3,$FF,$FF,$FF,$FF
.byte $35,$A3,$B3,$FF,$FF,$FF,$FF,$FF
.byte $A3,$CF,$29,$C8,$CF,$35,$FF,$FF
.byte $A3,$B1,$C9,$A2,$FF,$FF,$FF,$FF
.byte $B9,$D0,$AA,$B3,$FF,$FF,$FF,$FF
.byte $3D,$C8,$2D,$CA,$FF,$FF,$FF,$FF
.byte $A2,$CA,$2F,$CF,$B2,$CF,$FF,$FF
.byte $C3,$A8,$AD,$AB,$FF,$FF,$FF,$FF

table_05_B7C6:
.word table_05_B7C6_B80E, table_05_B7C6_B80E, table_05_B7C6_B80E
.word table_05_B7C6_B80F, table_05_B7C6_B815, table_05_B7C6_B81A
.word table_05_B7C6_B81F, table_05_B7C6_B825, table_05_B7C6_B81A
.word table_05_B7C6_B82B, table_05_B7C6_B832, table_05_B7C6_B838
.word table_05_B7C6_B83D, table_05_B7C6_B841, table_05_B7C6_B846
.word table_05_B7C6_B84B, table_05_B7C6_B84F, table_05_B7C6_B846
.word table_05_B7C6_B80E, table_05_B7C6_B855, table_05_B7C6_B838
.word table_05_B7C6_B80E, table_05_B7C6_B85B, table_05_B7C6_B863
.word table_05_B7C6_B80E, table_05_B7C6_B868, table_05_B7C6_B863
.word table_05_B7C6_B86F, table_05_B7C6_B80E, table_05_B7C6_B80E
.word table_05_B7C6_B80E, table_05_B7C6_B80E, table_05_B7C6_B80E
.word table_05_B7C6_B876, table_05_B7C6_B80E, table_05_B7C6_B80E

table_05_B7C6_B80E:
.byte $FF

table_05_B7C6_B80F:
.byte $21,$AD,$03,$3B,$3B,$3B

table_05_B7C6_B815:
.byte $21,$B0,$02,$70,$71

table_05_B7C6_B81A:
.byte $21,$D1,$02,$08,$75

table_05_B7C6_B81F:
.byte $22,$0D,$03,$3B,$3B,$3B

table_05_B7C6_B825:
.byte $21,$D0,$03,$68,$72,$73

table_05_B7C6_B82B:
.byte $22,$6D,$04,$3B,$3B,$3B,$69

table_05_B7C6_B832:
.byte $22,$70,$03,$70,$72,$79

table_05_B7C6_B838:
.byte $22,$B1,$02,$3B,$ED

table_05_B7C6_B83D:
.byte $22,$CD,$01,$3B

table_05_B7C6_B841:
.byte $22,$CE,$02,$70,$71

table_05_B7C6_B846:
.byte $22,$EF,$02,$08,$78

table_05_B7C6_B84B:
.byte $23,$2D,$01,$3B

table_05_B7C6_B84F:
.byte $22,$EE,$03,$68,$72,$73

table_05_B7C6_B855:
.byte $22,$B0,$03,$77,$72,$76

table_05_B7C6_B85B:
.byte $22,$32,$05,$68,$72,$72,$72,$73

table_05_B7C6_B863:
.byte $22,$33,$02,$08,$78

table_05_B7C6_B868:
.byte $21,$D2,$04,$75,$72,$72,$71

table_05_B7C6_B86F:
.byte $22,$6D,$04,$3B,$3B,$3B,$69

table_05_B7C6_B876:
.byte $21,$4D,$08,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$69

table_05_B881:
.byte $23,$D1,$AA,$FF,$FF,$FF
.byte $23,$D9,$FA,$FF,$FF,$FF
.byte $23,$D9,$AF,$23,$E1,$FA
.byte $23,$E1,$AF,$FF,$FF,$FF
.byte $23,$E9,$AA,$FF,$FF,$FF
.byte $23,$F1,$AA,$FF,$FF,$FF

_loc_05_B8A5:
	LDX #$09
	LDA #$00
bra_05_B8A9:
	STA $2C,X
	DEX
	BPL bra_05_B8A9
	LDX #$00
bra_05_B8B0:
	LDY #$00
	LDA $053E,X
	AND #$E0
bra_05_B8B7:
	BPL bra_05_B8BA
	INY
bra_05_B8BA:
	ASL
	BNE bra_05_B8B7
	STY $1C
	TXA
	LSR
	TAY
	BCC bra_05_B8C8
	ASL $1C
	ASL $1C
bra_05_B8C8:
	LDA $002C,Y
	ORA $1C
	STA $002C,Y
	INX
	CPX #$0C
	BCC bra_05_B8B0
	LDA $0555
	AND #$F0
	LSR
	LSR
	LSR
	LSR
	STA $32
	LDA $0555
	AND #$0F
	STA $33
	JSR _loc_05_B98D
	LDA $1C
	LSR
	LSR
	AND #$0F
	STA $35
	LDA $1C
	AND #$03
	STA $34
	JSR _b07_вращение_рандома
	AND #$0C
	STA $1C
	ORA $34
	STA $34
	ASL $1C
	LDX #$07
bra_05_B907:
	JSR _loc_05_B9A1
	DEX
	BPL bra_05_B907
	LDX #$09
	JSR _loc_05_B9A1
	RTS
_loc_05_B913:
	LDY #$09
bra_05_B915:
	LDA $046E,Y
	STA $2C,Y
	DEY
	BPL bra_05_B915
	LDA #$00
	STA $0555
	STA $0556
	STA $0558
	STA $0557
	LDA $34
	AND #$0C
	ASL
	STA $1C
	LDX #$07
bra_05_B935:
	JSR _loc_05_B9AF
	DEX
	BPL bra_05_B935
	LDX #$09
	JSR _loc_05_B9AF
	JSR _loc_05_B98D
	LDA $35
	AND #$0F
	ASL
	ASL
	STA $1D
	LDA $34
	AND #$03
	ORA $1D
	CMP $1C
	BEQ bra_05_B958
	CLC
	BNE bra_05_B988
bra_05_B958:
	LDA $32
	ASL
	ASL
	ASL
	ASL
	ORA $33
	STA $0555
	LDX #$00
	STX $0558
bra_05_B968:
	TXA
	LSR
	TAY
	LDA $002C,Y
	BCC bra_05_B972
	LSR
	LSR
bra_05_B972:
	AND #$03
	TAY
	ORA table_05_B989,Y
	STA $053E,X
	CLC
	TYA
	ADC $0558
	STA $0558
	INX
	CPX #$0C
	BCC bra_05_B968
bra_05_B988:
	RTS

table_05_B989:
.byte $00,$80,$C0,$E0

_loc_05_B98D:
	LDY #$00
	STY $1C
bra_05_B991:
	CLC
	LDA $002C,Y
	ADC $1C
	AND #$3F
	STA $1C
	INY
	CPY #$08
	BCC bra_05_B991
	RTS
_loc_05_B9A1:
	JSR _loc_05_B9BD
	CLC
	LDA $2C,X
	ADC table_05_B9C4,Y
	AND #$0F
	STA $2C,X
	RTS
_loc_05_B9AF:
	JSR _loc_05_B9BD
	SEC
	LDA $2C,X
	SBC table_05_B9C4,Y
	AND #$0F
	STA $2C,X
	RTS
_loc_05_B9BD:
	TXA
	AND #$07
	ORA $1C
	TAY
	RTS


_loc_05_B9C4:
table_05_B9C4:		; баг, какая-то кривая таблица видимо, если читает байты кода
					; тут подозрительно много зеленых байтов
	LDA номер_команды + 1
	AND #$0F
	LSR
	LSR
	TAY
	LDA table_05_BA8E,Y
	STA опция_материка
	JSR _b07_вращение_рандома
	AND #$03
	STA $1C
	LDA $054A
	BMI bra_05_B9E2
	LDA #$0B
	BNE bra_05_B9E5
bra_05_B9E2:
	LDA номер_команды + 1
bra_05_B9E5:
	AND #$0F
	TAY
	ASL
	ASL
	STA $1D
	LDA $1C
	ORA table_05_BA92,Y
	AND #$0F
	TAY
	LDA table_05_BAA2,Y
	AND #$03
	STA опция_поверхность_влажность
	LDA #$00
	STA опция_дождь_ветер
	STA опция_направление_молния_смерч
	LDX #$00
bra_05_BA06:
	JSR _loc_05_BA60
	LDA table_05_BB29,Y
	AND table_05_BAB2,X
	ORA опция_дождь_ветер
	STA опция_дождь_ветер
	INX
	CPX #$02
	BCC bra_05_BA06
bra_05_BA1A:
	JSR _loc_05_BA60
	LDA table_05_BB29 + 1,Y
	AND table_05_BAB2,X
	ORA опция_направление_молния_смерч
	STA опция_направление_молния_смерч
	INX
	CPX #$05
	BCC bra_05_BA1A
	LDA опция_поверхность_влажность
	CMP #$02
	BNE bra_05_BA40
	LDA опция_дождь_ветер
	AND #$F0
	STA опция_дождь_ветер
	RTS
bra_05_BA40:
	LDA опция_дождь_ветер
	AND #$0F
	ASL
	ASL
	STA $1C
	JSR _b07_вращение_рандома
	AND #$03
	ORA $1C
	TAY
	LDA table_05_BB33,Y
	AND #$70
	ORA опция_поверхность_влажность
	STA опция_поверхность_влажность
	RTS

_loc_05_BA60:
; код, который выполняется на демке и в режиме на прохождение
; смысл кода в том, чтобы в итоге получить нужный Y для дальнейших таблиц
; X должен остаться как на входе, изменять нельзя

; видимо баг оригинала. тут читался байт 4C из C005
; который затем проверялся на +, дальше AND 07, получалось всегда 04
; затем TAY, затем чтение ($2C),Y
; ОДНАКО несмотря на это байты все равно читались, судя по логгеру
; и я пока без понятия когда именно это было

; предположительно они хотели сделать вызов рандома в этом месте, я так и переделаю
; только удалю проверку на минусовый байт рандома, и сам код чуть перепишу, чтоб не использовал адрес 1C
	LDY #$00
	TXA
	CMP #$04
	BEQ @пропустить		; при пропуске будет Y = 00
	AND #$03
	ORA $1D
	TAY
	LDA table_05_BAB7_поинтер_на_таблицу_BAF7,Y
	ASL
	TAY
@пропустить:
	LDA table_05_BAF7,Y
	STA $2C
	LDA table_05_BAF7 + 1,Y
	STA $2D
	JSR _b07_вращение_рандома
	AND #$07
	TAY
	LDA ($2C),Y
	ASL
	TAY
	RTS

table_05_BA8E:
.byte $00,$01,$03,$02

table_05_BA92:
.byte $00,$04,$04,$08,$00,$0C,$04,$04,$00,$00,$00,$00,$00,$04,$00,$08

table_05_BAA2:
.byte $00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$01,$00,$02,$02,$02,$01

table_05_BAB2:		; читается из 2х мест
.byte $0F,$F0,$0C,$30,$03

table_05_BAB7_поинтер_на_таблицу_BAF7:
.byte $00,$01,$00,$00,$00,$00,$00,$04,$00,$03,$04,$00,$02,$00,$01,$04,$00,$00,$00,$00,$04,$02,$04,$02,$01,$00,$04,$04,$00,$00,$04,$04,$00,$00,$00,$00,$01,$02,$04,$01,$02,$01,$01,$04,$00,$00,$04,$04,$00,$00,$00,$00,$00,$04,$04,$04,$00,$01,$00,$04,$00,$02,$00,$02

table_05_BAF7:
.word table_05_BAF7_BB01
.word table_05_BAF7_BB09
.word table_05_BAF7_BB11
.word table_05_BAF7_BB19
.word table_05_BAF7_BB21

table_05_BAF7_BB01:
.byte $00,$00,$00,$00,$01,$01,$02,$02

table_05_BAF7_BB09:
.byte $00,$00,$01,$01,$01,$02,$02,$03

table_05_BAF7_BB11:
.byte $01,$01,$01,$01,$02,$02,$02,$03

table_05_BAF7_BB19:
.byte $01,$01,$02,$02,$03,$03,$04,$04

table_05_BAF7_BB21:
.byte $00,$00,$00,$00,$00,$00,$00,$00

table_05_BB29:		; читается из 2х мест
.byte $00,$01
.byte $11,$14
.byte $22,$2A
.byte $33,$3C
.byte $44,$3E

table_05_BB33:
.byte $00,$00,$00,$00,$00,$00,$10,$20,$10,$10,$20,$30,$20,$20,$30,$40,$10,$10,$20,$20


_loc_05_BB47:
	LDA #$00
	STA набор_луж
	STA счет_команды
	STA счет_команды + 1
	STA номер_тайма
	STA флаг_владения_мячом_команды
	STA флаг_владения_мячом_команды + 1
	LDA опция_режим_сложность
	AND #$F0
	BEQ bra_05_BB63
	BPL bra_05_BB66
bra_05_BB63:
	JSR _loc_05_B9C4
bra_05_BB66:
	LDA опция_дождь_ветер
	AND #$0F
	ASL
	TAY
	JSR _b07_вращение_рандома
	BPL bra_05_BB73
	INY
bra_05_BB73:
	LDA table_05_BB7A,Y
	STA $0603
	RTS

table_05_BB7A:
.byte $00,$20,$30,$40,$40,$60,$80,$A0,$C0,$FF

_loc_05_BB84:
; код срабатывает когда черный экран перед загрузкой поля
; а также после выбора погоды, это наверное для пк из меню
	LDA номер_тайма
	BEQ bra_05_BBBB
	LDA опция_поверхность_влажность
	AND #$03
	CMP #$02
	BEQ bra_05_BBBB
	STA набор_луж
	LDA опция_дождь_ветер
	AND #$07
	ASL
	TAY
	LDA счетчик_кадров
	AND #$01
	BEQ bra_05_BBA4
	INY
bra_05_BBA4:
	LDA опция_поверхность_влажность
	AND #$F0
	CLC
	ADC table_05_BD0C,Y
	CMP #$51
	BCC bra_05_BBB3
	LDA #$50
bra_05_BBB3:
	AND #$70
	ORA набор_луж
	STA опция_поверхность_влажность
bra_05_BBBB:
	LDA #$00
	STA набор_луж
	LDA опция_поверхность_влажность
	AND #$03
	CMP #$02
	BNE bra_05_BBCC
	STA опция_поверхность_влажность
bra_05_BBCC:
	LDA опция_поверхность_влажность
	AND #$F0
	BEQ bra_05_BBDD
	CMP #$50
	BEQ bra_05_BBDD
	JSR _b07_вращение_рандома
	STA набор_луж
bra_05_BBDD:
; проверка влажности + поля и выбор влажности
	LDA опция_поверхность_влажность
	AND #$03
	ASL
	TAY
	LDA table_05_BCC8,Y
	STA $2C
	LDA table_05_BCC8 + 1,Y
	STA $2D
	LDA опция_поверхность_влажность
	AND #$F0
	LSR
	LSR
	TAY
	LDA ($2C),Y
	STA банк_для_поля
	INY
	LDA ($2C),Y
	STA номер_prg_банка
	INY
	LDA ($2C),Y
	STA цвет_поля
	INY
	LDA ($2C),Y
	STA покрытие_поля_лужами
	LDA #$00
	STA время_тайма_терции
	STA время_тайма_секунды_единицы
	STA время_тайма_секунды_десятки
	LDA #$02
	STA время_тайма_минуты
	LDA опция_режим_сложность
	AND #$F0
	BEQ bra_05_BC31
	AND #$D0
	BNE bra_05_BC31
	LDA #$00
	STA $06FC
	STA $1C
	JMP _loc_05_BC3A
bra_05_BC31:
	LDA #$FF
	STA $06FC
	LDA #$80
	STA $1C
_loc_05_BC3A:
	LDX #$0B
bra_05_BC3C:
	LDA позиция_управление,X
	ORA $1C
	STA позиция_управление,X
	DEX
	BPL bra_05_BC3C
	LDY #$00
	LDA опция_режим_сложность
	AND #$F0
	BEQ bra_05_BC6F
	BMI bra_05_BC53		; проверка на РЕЖИМ_ПРОХОЖДЕНИЕ
	LDY #$02
bra_05_BC53:
	LDA table_05_BD02,Y
	STA $2C
	LDA table_05_BD02 + 1,Y
	STA $2D
	LDY #$00
@цикл:
	LDA ($2C),Y
	TAX
	LDA позиция_управление,X
	AND #$7F
	STA позиция_управление,X
	INY
	CPY количество_игроков
	BCC @цикл
bra_05_BC6F:
	LDA позиция_управление + $0A
	AND #$80
	STA управление_кипером
	LDA позиция_управление + $0B
	AND #$80
	STA управление_кипером + 1
	LDX #$01
bra_05_BC81:
	LDA номер_команды,X
	BPL bra_05_BC96
	AND #$0F
	ASL
	TAY
	LDA table_05_BD18,Y
	STA $05D3,X
	LDA table_05_BD18 + 1,Y
	STA расстановка_команды,X
bra_05_BC96:
	DEX
	BPL bra_05_BC81
	LDA #$44
	STA $0668
	STA $066C
	STA $0670
	LDA #$43
	STA $0669
	STA $066D
	STA $0671
	LDA #$42
	STA $066A
	STA $066E
	LDA #$41
	STA $066B
	STA $066F
	LDA #$11
	STA $0672
	STA $0673
	RTS

table_05_BCC8:
.word table_05_BCC8_BCCE
.word table_05_BCC8_BCE6
.word table_05_BCC8_BCFE

table_05_BCC8_BCCE:
.byte $40,$01,$00,$00,$40,$01,$00,$01,$40,$02,$00,$00,$46,$02,$01,$00,$46,$01,$01,$01,$46,$01,$01,$00

table_05_BCC8_BCE6:
.byte $4C,$01,$02,$00,$4C,$01,$02,$01,$4C,$02,$02,$00,$52,$02,$03,$00,$52,$01,$03,$01,$52,$01,$03,$00

table_05_BCC8_BCFE:
.byte $58,$01,$04,$00

table_05_BD02:
.word table_05_BD02_BD06
.word table_05_BD02_BD08

table_05_BD02_BD06:
.byte $00,$0A

table_05_BD02_BD08:
.byte $00,$01,$0A,$0B

table_05_BD0C:
.byte $00,$00,$00,$10,$10,$10,$20,$30,$30,$30,$30,$30

table_05_BD18:
.byte $55,$00
.byte $56,$00
.byte $55,$00
.byte $52,$01
.byte $55,$00
.byte $55,$00
.byte $80,$02
.byte $91,$00
.byte $55,$00
.byte $80,$01
.byte $80,$02
.byte $90,$01
.byte $55,$00
.byte $80,$01
.byte $41,$00
.byte $82,$02

_loc_05_BD38:
	LDX #$00
	STX $1C
	INX
	STX $1D
	LDA номер_команды + 1
	AND #$03
	BNE bra_05_BD4B
	STX $1C
	DEX
	STX $1D
bra_05_BD4B:
	LDX $1D
	LDA номер_команды,X
	AND #$0F
	ASL
	TAY
	LDA table_05_BDF6 + 1,Y
	STA банк_спрайтов + 1
	LDX $1C
	LDA номер_команды,X
	AND #$0F
	ASL
	TAY
	LDA table_05_BDF6,Y
	STA банк_спрайтов + 2
	LDA $1C
	ASL
	TAY
	LDA номер_команды
	AND #$03
	BNE bra_05_BD76
	LDY #$04
bra_05_BD76:
	LDA table_05_BE16,Y
	STA $2C
	LDA table_05_BE16 + 1,Y
	STA $2D
	LDA $1D
	ASL
	TAY
	LDA номер_команды + 1
	AND #$03
	BNE bra_05_BD8D
	LDY #$04
bra_05_BD8D:
	LDA table_05_BE16,Y
	STA $2E
	LDA table_05_BE16 + 1,Y
	STA $2F
	LDX #$00
bra_05_BD99:
	LDY номер_игрока,X
	LDA ($2C),Y
	STA лицо_игрока,X
	INX
	LDY номер_игрока,X
	LDA ($2E),Y
	STA лицо_игрока,X
	INX
	CPX #$0C
	BCC bra_05_BD99
	RTS

_loc_05_BDB0:
	LDA #$01
	STA номер_палитры_спрайтов
	LDA номер_команды
	AND #$0F
	ASL
	TAY
	LDA table_05_BDD6,Y
	STA номер_палитры_спрайтов + 1
	LDA номер_команды + 1
	AND #$0F
	ASL
	TAY
	LDA table_05_BDD6,Y
	STA номер_палитры_спрайтов + 2
	LDA table_05_BDD6 + 1,Y
	STA номер_палитры_спрайтов + 3
	RTS

table_05_BDD6:		; читается из 4х мест
.byte $04,$08
.byte $04,$09
.byte $04,$0A
.byte $04,$0B
.byte $05,$0C
.byte $05,$0C
.byte $05,$0D
.byte $05,$0E
.byte $06,$0F
.byte $06,$0F
.byte $06,$10
.byte $06,$11
.byte $07,$12
.byte $07,$12
.byte $07,$13
.byte $1C,$14

table_05_BDF6:		; читается из 3х мест, первое место в каких-то ебенях
.byte $20,$14
.byte $20,$14
.byte $20,$15
.byte $20,$16
.byte $20,$17
.byte $20,$17
.byte $20,$18
.byte $21,$19
.byte $20,$1A
.byte $22,$1A
.byte $20,$1B
.byte $23,$1C
.byte $20,$1D
.byte $24,$1D
.byte $25,$1E
.byte $20,$1F

table_05_BE16:		; читается из 2х мест, связано с рожами игроков/самими игроками
					; предварительно читается номер игрока и номер рожи
.word table_05_BE16_BE1C
.word table_05_BE16_BE22
.word table_05_BE16_BE28

table_05_BE16_BE1C:
.byte $0C,$0D,$0E,$0F,$10,$11

table_05_BE16_BE22:
.byte $12,$13,$14,$15,$16,$17

table_05_BE16_BE28:
.byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B

_loc_05_BE34:
	LDY #$00
	LDX #$74
	STY $8000
	STX $8001
	INY
	STY $8000
	INX
	STX $8001
	LDX #$00
bra_05_BE48:
	LDY #$00
	LDA $2002
	LDA $2D
	STA $2006
	LDA $2C
	STA $2006
	LDA $2007
bra_05_BE5A:
	LDA $2007
	STA буфер_атрибутов,Y
	INY
	CPY $30
	BCC bra_05_BE5A
	LDY #$00
	LDA $2002
	LDA $2F
	STA $2006
	LDA $2E
	STA $2006
bra_05_BE74:
	LDA буфер_атрибутов,Y
	STA $2007
	INY
	CPY $30
	BCC bra_05_BE74
	LDA $2C
	CLC
	ADC $30
	STA $2C
	LDA $2D
	ADC #$00
	STA $2D
	LDA $2E
	CLC
	ADC #$20
	STA $2E
	LDA $2F
	ADC #$00
	STA $2F
	INX
	CPX $31
	BCC bra_05_BE48
	RTS
_loc_05_BE9F:
	LDX #$01
	STX $2B
bra_05_BEA3:
	LDX $2B
	LDA номер_команды,X
	AND #$0F
	ASL
	TAY
	LDA table_05_BEDA,Y
	STA $2C
	LDA table_05_BEDA + 1,Y
	STA $2D
	TXA
	ASL
	TAY
	LDA table_05_BED6,Y
	STA $2E
	LDA table_05_BED6 + 1,Y
	STA $2F
	LDA #$07
	STA $30
	LDA #$09
	STA $31
	JSR _loc_05_BE34
	DEC $2B
	BPL bra_05_BEA3
	JSR _b07_запись_банков_спрайтов
	RTS

table_05_BED6:
.byte $E5,$20
.byte $F4,$20

table_05_BEDA:
.byte $00,$00
.byte $3F,$00
.byte $7E,$00
.byte $BD,$00
.byte $00,$00
.byte $FC,$00
.byte $3B,$01
.byte $7A,$01
.byte $00,$00
.byte $B9,$01
.byte $F8,$01
.byte $37,$02
.byte $00,$00
.byte $76,$02
.byte $B5,$02
.byte $F4,$02

_loc_05_BEFA:
	LDA опция_материка
	ASL
	TAY
	LDA table_05_BF20,Y
	STA $2C
	LDA table_05_BF20 + 1,Y
	STA $2D
	LDA #$44
	STA $2E
	LDA #$20
	STA $2F
	LDA #$18
	STA $30
	LDA #$02
	STA $31
	JSR _loc_05_BE34
	JSR _b07_запись_банков_спрайтов
	RTS

table_05_BF20:
.byte $33,$03
.byte $63,$03
.byte $93,$03
.byte $C3,$03
.byte $F3,$03

_loc_05_BF2A:
	LDA $0603
	AND #$E0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA table_05_BF55,Y
	STA $2C
	LDA table_05_BF55 + 1,Y
	STA $2D
	LDA #$27
	STA $2E
	LDA #$21
	STA $2F
	LDA #$12
	STA $30
	LDA #$03
	STA $31
	JSR _loc_05_BE34
	JSR _b07_запись_банков_спрайтов
	RTS

table_05_BF55:
.byte $23,$04
.byte $59,$04
.byte $8F,$04
.byte $C5,$04
.byte $FB,$04
.byte $31,$05
.byte $67,$05
.byte $67,$05

_loc_05_BF65:
	LDA опция_режим_сложность
	BMI bra_05_BF70		; проверка на РЕЖИМ_ПРОХОЖДЕНИЕ
	LDA опция_материка	; bzk 021 удален лишний CLC перед прыжком
	JMP _loc_05_BF7F
bra_05_BF70:
	LDY #$08
	LDA $054A
	BPL bra_05_BF81
	LDA номер_команды + 1
	AND #$0F
	CLC
	ADC #$04
_loc_05_BF7F:
	ASL
	TAY
bra_05_BF81:
	LDA table_05_BFA2,Y
	STA $2C
	LDA table_05_BFA2 + 1,Y
	STA $2D
	LDA #$AA
	STA $2E
	LDA #$20
	STA $2F
	LDA #$0E
	STA $30
	LDA #$02
	STA $31
	JSR _loc_05_BE34
	JSR _b07_запись_банков_спрайтов
	RTS

table_05_BFA2:
.byte $9D,$05
.byte $B9,$05
.byte $D5,$05
.byte $F1,$05
.byte $0D,$06
.byte $29,$06
.byte $45,$06
.byte $61,$06
.byte $0D,$06
.byte $7D,$06
.byte $99,$06
.byte $B5,$06
.byte $0D,$06
.byte $D1,$06
.byte $ED,$06
.byte $09,$07
.byte $0D,$06
.byte $25,$07
.byte $41,$07
.byte $5D,$07

; BFCA fill FF

.segment "BANK_05_ID"
.byte $05 