.segment "BANK_02"
.include "ram_copy.inc"
.include "val_copy.inc"

.import _b07_C2E4_запись_номера_звука
.import _b07_вращение_рандома
.import _b07_запись_банков_спрайтов
.import _b07_поставить_флаг_уменьшения_яркости
.import _b07_D036
.import _b07_D062
.import _b07_C344
.import _b07_EC8F
.import _b07_CEBD
.import _b07_поставить_флаг_увеличения_яркости
.import _b07_D073
.import _b07_EF54
.import _b07_EB8C
.import _b07_E828
.import _b07_яркость_палитры_и_запись_в_буфер
.import _b07_C317
.import _b07_обнуление_ZP_с_X_до_F8

.export _loc_02_8000
_loc_02_8000:
	JMP _loc_02_AA6B
.export _loc_02_8003
_loc_02_8003:
	JMP _loc_02_B08B
.export _loc_02_8006
_loc_02_8006:
	JMP _loc_02_B429
.export _loc_02_8009
_loc_02_8009:
	JMP _loc_02_B53D
.export _loc_02_800C
_loc_02_800C:
	JMP _loc_02_B6CE
.export _loc_02_800F
_loc_02_800F:
	JMP _loc_02_BB5D

.incbin "bank_02.dat"		; таблицу не трогать и не перемещать
							; схожая таблица в начале банка 01, ссылки из банка 07 те же

_loc_02_AA11:
	LDA #$1F
	JMP _b07_C344
_loc_02_AA16:
	LDA #$0F
	JMP _b07_C344
_loc_02_AA1B:
	LDA #$14
	JMP _b07_C344
_loc_02_AA20:
	LDA #$17
	JMP _b07_C344
_loc_02_AA25:
	LDA #$2B
	JMP _b07_C344
_loc_02_AA2A:
	LDA #$2C
	JMP _b07_C344
_loc_02_AA2F:
	LDA #$1C
	JMP _b07_C344
_loc_02_AA34:
	LDA #$06
	JMP _b07_C344
_loc_02_AA39:
	LDA #$07
	JMP _b07_C344
_loc_02_AA3E:
	LDA #$08
	JMP _b07_C344
_loc_02_AA43:
	LDA #$09
	JMP _b07_C344
_loc_02_AA48:
	LDA #$0A
	JMP _b07_C344
_loc_02_AA4D:
	LDA #$0B
	JMP _b07_C344
_loc_02_AA52:
	LDA #$26
	JMP _b07_C344
_loc_02_AA57:
	LDA #$27
	JMP _b07_C344
_loc_02_AA5C:
	LDA #$28
	JMP _b07_C344
_loc_02_AA61:
	LDA #$30
	JMP _b07_C344
_loc_02_AA66:
	LDA #$31
	JMP _b07_C344
_loc_02_AA6B:
	LDA тип_экрана
	JSR _b07_EC8F

table_02_AA70:		; байты после JSR
.word table_02_AA70_AA88
.word table_02_AA70_AAD9
.word table_02_AA70_AB78
.word table_02_AA70_ABDE
.word table_02_AA70_ABFE
.word table_02_AA70_AC43
.word table_02_AA70_ACA9
.word table_02_AA70_ACBD
.word table_02_AA70_AC43
.word table_02_AA70_ACA9
.word table_02_AA70_ACBD
.word table_02_AA70_ABCE

table_02_AA70_AA88:
	LDA #$80
	STA разновидность_NMI
	JSR _loc_02_AE49
	JSR _loc_02_AE3D_задержка
	JSR _loc_02_AE3D_задержка

table_02_BB62_AA95:
	LDA #$00
	JSR _b07_E828
	JSR _b07_EF54
	LDA #$08
	STA $6D
	INC таймер_кадра_анимации_мяча
	DEC номер_кадра_анимации_мяча
	JSR _loc_02_AE01
	LDA #$90
	STA координата_X_lo_мяча
	LDA #$56
	STA координата_Y_lo_мяча
	LDA #$1D
	STA номер_палитры_спрайтов
	LDA #$1F
	STA номер_палитры_спрайтов + 1
	LDA #$21
	STA номер_палитры_спрайтов + 2
	LDX #$70
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 1
	JSR _b07_запись_банков_спрайтов
	JSR _b07_поставить_флаг_увеличения_яркости
	LDA #$04
	STA скорость_яркости
	INC тип_экрана
	RTS

table_02_AA70_AAD9:
table_02_BB62_AAD9:
	JSR _loc_02_AE01
	BIT флаг_яркости
	BMI bra_02_AAE4
	JSR _b07_D073
bra_02_AAE4:
	LDA номер_кадра_анимации_мяча
	CMP #$02
	BCC bra_02_AB3F
	LDA номер_кадра_анимации + 2
	CMP #$08
	BCS bra_02_AB01
	INC номер_кадра_анимации + 2
	TAY
	LDA table_02_AB40,Y
	STA номер_палитры_фона
	JSR _b07_яркость_палитры_и_запись_в_буфер
	LDA #$3F
	STA байт_2006_hi_палитра
bra_02_AB01:
	LDA номер_кадра_анимации + 1
	INC номер_кадра_анимации + 1
	CMP #$17
	BCS bra_02_AB28
	AND #$FE
	ASL
	TAY
	LDX #$00
bra_02_AB0F:
	LDA table_02_AB48,Y
	STA буфер_атрибутов,X
	INY
	INX
	CPX #$04
	BCC bra_02_AB0F
	STX счетчик_буфера_атрибутов
	LDA #$DB
	STA байт_2006_lo_атрибуты
	LDA #$23
	STA байт_2006_hi_атрибуты
bra_02_AB28:
	LDA номер_кадра_анимации_мяча
	CMP #$07
	BNE bra_02_AB3F
	LDA #$3C
	STA номер_палитры_фона
	INC номер_палитры_спрайтов
	INC номер_палитры_спрайтов + 1
	INC номер_палитры_спрайтов + 2
	JSR _b07_D036
bra_02_AB3F:
	RTS

table_02_AB40:
.byte $45,$46,$47,$48,$47,$46,$45,$44

table_02_AB48:
.byte $02,$00,$00,$00
.byte $0B,$00,$00,$00
.byte $0F,$02,$00,$00
.byte $0E,$0B,$00,$00
.byte $08,$0F,$02,$00
.byte $00,$0E,$0B,$00
.byte $00,$08,$0F,$02
.byte $00,$00,$0E,$0B
.byte $00,$00,$08,$0F
.byte $00,$00,$00,$0E
.byte $00,$00,$00,$08
.byte $00,$00,$00,$00

table_02_AA70_AB78:
	JSR _loc_02_AE3D_задержка
	JSR _loc_02_AE49
	LDA #$0E
	JSR _b07_E828
	LDA #$59
	STA банк_спрайтов
	JSR _b07_запись_банков_спрайтов
	LDA #$09
	STA $6D
	INC таймер_кадра_анимации_мяча
	DEC номер_кадра_анимации
	LDA #$C0
	STA координата_X_lo_мяча
	LDA #$CE
	STA координата_Y_lo_мяча
	LDX #$27
	STX номер_палитры_спрайтов
	INX
	STX номер_палитры_спрайтов + 1
	INX
	STX номер_палитры_спрайтов + 2
	INX
	STX номер_палитры_спрайтов + 3
	JSR _loc_02_B033
	LDA #$01
	JSR _b07_C2E4_запись_номера_звука
	JSR _b07_поставить_флаг_увеличения_яркости
	LDA #$04
	STA скорость_яркости
	LDA #$90
	STA таймер_демо_lo
	LDA #$06
	STA таймер_демо_hi
	LDA #$0B
	STA тип_экрана
	RTS

table_02_AA70_ABCE:
	JSR _loc_02_B033
	JSR _b07_D073
	BIT флаг_яркости
	BPL bra_02_ABDD
	LDA #$03
	STA тип_экрана
bra_02_ABDD:
	RTS

table_02_AA70_ABDE:
	JSR _loc_02_B033
	JSR _loc_02_AE7C
	BMI bra_02_ABF6
	BVC bra_02_ABFD
	JSR _b07_поставить_флаг_уменьшения_яркости
	LDA #$04
	STA скорость_яркости
	JSR _b07_D062
	INC тип_экрана
	RTS
bra_02_ABF6:
	JSR _loc_02_AE65
	LDA #$08
	STA тип_экрана
bra_02_ABFD:
	RTS

table_02_AA70_ABFE:
	LDA #$01
	STA опция_режим_сложность
	LDA #$00
	STA $58
	STA тип_экрана
	STA таймер_демо_lo
	LDA #$03
	STA таймер_демо_hi
	LDA #$80
	STA флаг_демо
	STA номер_команды
	JSR _b07_вращение_рандома
	AND #$0F
	ORA #$81
	STA номер_команды + 1
	LDY #$00
	LDX #$00
bra_02_AC27:
	TYA
	STA номер_игрока,X
	STA номер_игрока + 1,X
	INY
	INX
	INX
	CPX #$0C
	BCC bra_02_AC27
	JSR _loc_02_AA25
	JSR _loc_02_AA2A
	JSR _loc_02_AA11
	LDA #$C0
	STA разновидность_NMI
	RTS

table_02_AA70_AC43:
	JSR _loc_02_AE3D_задержка
	JSR _loc_02_AE49
	LDA #$00
	STA счетчик_кадров
	LDA #$02
	STA таймер_демо_hi
	LDY #$40
	LDA тип_экрана
	CMP #$05
	BEQ bra_02_AC5D
	LDY #$80
bra_02_AC5D:
	STY флаг_демо
	LDA #$01
	JSR _b07_E828
	LDX #$08
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 3
	LDX #$1F
	STX банк_спрайтов + 1
	INX
	STX банк_спрайтов + 2
	JSR _b07_запись_банков_спрайтов
	LDA #$01
	STA номер_палитры_спрайтов
	STA номер_палитры_спрайтов + 1
	LDA #$03
	STA скорость_игры
	DEC номер_управляемого + 1
	DEC номер_управляемого + 2
	DEC номер_управляемого + 3
	DEC $067A
	LDX #$00
	JSR _loc_02_ADA5
	LDX #$0C
	JSR _loc_02_ADA5
	JSR _b07_EF54
	JSR _loc_02_AA1B
	JSR _b07_поставить_флаг_увеличения_яркости
	INC тип_экрана
	RTS

table_02_AA70_ACA9:
	JSR _loc_02_AD91_оставить_только_кнопки_старт_и_селект
	JSR _loc_02_AA2F
	JSR _loc_02_AA1B
	JSR _b07_D073
	BIT флаг_яркости
	BPL bra_02_ACBC
	INC тип_экрана
bra_02_ACBC:
	RTS

table_02_AA70_ACBD:
	JSR _loc_02_AE9B
	JSR _loc_02_ACF8
	JSR _loc_02_AA20
	JSR _loc_02_AA2F
	JSR _loc_02_AA1B
	JSR _loc_02_AE7C
	BMI bra_02_ACD7
	BVC bra_02_ACF7
	LDA #$04
	BNE bra_02_ACE7
bra_02_ACD7:
	LDA #$00
	STA флаг_демо
	LDA #$33
	JSR _b07_C2E4_запись_номера_звука
	LDA #$02
	STA $58
	LDA #$00
bra_02_ACE7:
	STA тип_экрана
	JSR _b07_поставить_флаг_уменьшения_яркости
	LDA #$04
	STA скорость_яркости
	JSR _b07_D062
	JSR _loc_02_AE3D_задержка
bra_02_ACF7:
	RTS
_loc_02_ACF8:
	LDA тип_экрана
	CMP #$08
	BCS bra_02_AD07
	LDA одноразовые_кнопки
	AND #(КНОПКА_СЕЛЕКТ + КНОПКА_СТАРТ)
	STA одноразовые_кнопки
	JMP _loc_02_AEF7
bra_02_AD07:
	LDA #$80
	STA таймер_демо_lo
	LDA номер_кадра_анимации + 1
	JSR _b07_EC8F

table_02_AD11:		; байты после JSR
.word table_02_AD11_AD17
.word table_02_AD11_AD28
.word table_02_AD11_AD3B_физика_отскока_мяча_от_стены_на_экране_с_кунио

table_02_AD11_AD17:
	JSR _loc_02_AD91_оставить_только_кнопки_старт_и_селект
	LDA координата_X_hi
	BNE bra_02_AD3A
	LDA координата_X_lo
	CMP #$20
	BCC bra_02_AD3A
	BCS bra_02_AD38

table_02_AD11_AD28:
	LDA одноразовые_кнопки
	BNE bra_02_AD38
	LDA координата_X_lo
	CMP #$70
	BCC bra_02_AD3A
	LDA #$01
	STA номер_движения
bra_02_AD38:
	INC номер_кадра_анимации + 1
bra_02_AD3A:
	RTS

table_02_AD11_AD3B_физика_отскока_мяча_от_стены_на_экране_с_кунио:
	LDY #$E0
	LDA координата_X_lo
	CMP #$E0
	BCS bra_02_AD4A
	LDY #$20
	CMP #$20
	BCS bra_02_AD5B
bra_02_AD4A:
	STY координата_X_lo
	LDA номер_движения
	AND #$7F
	CMP #$21
	BNE bra_02_AD5B
	LDA #$01
	STA номер_движения
bra_02_AD5B:
	LDA состояние_мяча
	AND #$40
	BNE bra_02_AD90
	LDX #$00		; 60fps_мяч, отскок от стены
	LDY #$AB
	LDA координата_X_hi_мяча
	BNE bra_02_AD72
	LDA координата_X_lo_мяча
	CMP #$08
	BCS bra_02_AD90
	BCC bra_02_AD76
bra_02_AD72:
	BMI bra_02_AD76
	LDX #$FF		; 60fps_мяч, чуть ниже тоже изменения
	LDY #$55
bra_02_AD76:
	STY скорость_X_lo_мяча
	STX скорость_X_hi_мяча
	LDA #$06
	STA номер_движения_мяча
	LDA #$AB
	STA скорость_Z_lo_мяча		; в оригинале скорость Z lo не была указана
	LDA #$00
	STA скорость_Z_hi_мяча
	LDA #$0D
	STA гравитация_lo_мяча
	LDA #$00
	STA гравитация_hi_мяча
bra_02_AD90:
	RTS

_loc_02_AD91_оставить_только_кнопки_старт_и_селект:
	LDA одноразовые_кнопки
	AND #(КНОПКА_СТАРТ | КНОПКА_СЕЛЕКТ)
	STA одноразовые_кнопки
	STA удержанные_кнопки
	RTS

_loc_02_AD9A:
	STA $1C
	LDA одноразовые_кнопки
	ORA $1C
	STA одноразовые_кнопки
	STA удержанные_кнопки
	RTS

_loc_02_ADA5:
	LDA #$FF
	STA смена_угла_движения,X
	STA номер_действия,X
	STA координата_X_hi,X
	STA номер_действия_мяча
	STA флаг_прозрачного_мяча
	LDA #$00
	STA состояние_игрока,X
	STA игрок_с_мячом
	STA направление_движения,X
	STA $61,X
	LDA #$A4
	STA координата_Y_lo,X
	LDA #$C0
	STA координата_X_lo,X
	CPX #$00
	BNE bra_02_ADEA
	LDY #$00
	LDA тип_экрана
	CMP #$08
	BCS bra_02_ADE2
	JSR _b07_вращение_рандома
	AND #$03
	STA сценка_кунио
	TAY
bra_02_ADE2:
	LDA table_02_ADFD_номер_движения,Y
	STA номер_движения,X
	BNE bra_02_ADFC
bra_02_ADEA:
	INC $61,X
	LDA #$01
	STA номер_движения,X
	INC координата_X_hi,X
	LDA #$80
	STA координата_X_lo,X
bra_02_ADFC:
	RTS

table_02_ADFD_номер_движения:
.byte $21,$21,$21,$2A

_loc_02_AE01:
	LDX #$0C
	DEC таймер_кадра_анимации_мяча
	BNE bra_02_AE22
	INC номер_кадра_анимации_мяча
	LDA номер_кадра_анимации_мяча
	CMP #$09
	BCC bra_02_AE15
	JSR _loc_02_AE65
	JMP _loc_02_AE22
bra_02_AE15:
	ASL
	TAY
	LDA table_02_AE29,Y
	STA номер_анимации_мяча
	INY
	LDA table_02_AE29,Y
	STA таймер_кадра_анимации_мяча
_loc_02_AE22:
bra_02_AE22:
	JSR _b07_EB8C
	JSR _loc_02_AA1B
	RTS

table_02_AE29:
.byte $80,$0C
.byte $81,$06
.byte $82,$06
.byte $83,$06
.byte $84,$06
.byte $86,$06
.byte $85,$01
.byte $85,$01
.byte $86,$60
.byte $86,$FF

_loc_02_AE3D_задержка:
	LDX #$08
bra_02_AE3F:
	LDA дополнительная_задержка
bra_02_AE41:
	CMP дополнительная_задержка
	BEQ bra_02_AE41
	DEX
	BNE bra_02_AE3F
	RTS

_loc_02_AE49:
	LDX #$61
	JSR _b07_обнуление_ZP_с_X_до_F8
	STA режим_игры_на_поле
	LDY #$06
	STY $2D
	STA $2C
	LDY #$8E
	LDX #$04
bra_02_AE5A:
	STA ($2C),Y
	DEY
	BNE bra_02_AE5A
	DEC $2D
	DEX
	BNE bra_02_AE5A
	RTS
_loc_02_AE65:
	LDA $58
	CMP #$03
	BEQ bra_02_AE79
	JSR _b07_поставить_флаг_уменьшения_яркости
	LDA #$04
	STA скорость_яркости
	JSR _b07_D062
	JSR _loc_02_AE3D_задержка
bra_02_AE79:
	INC тип_экрана
	RTS
_loc_02_AE7C:
	LDA #$00
	STA $1C
	LDA одноразовые_кнопки
	AND #(КНОПКА_СЕЛЕКТ + КНОПКА_СТАРТ)
	BNE bra_02_AE94
	DEC таймер_демо_lo
	BNE bra_02_AE98
	DEC таймер_демо_hi
	BNE bra_02_AE98
	LDA #$40
	BNE bra_02_AE96
bra_02_AE94:
	LDA #$80
bra_02_AE96:
	STA $1C
bra_02_AE98:
	BIT $1C
	RTS
_loc_02_AE9B:
	LDA #$DA
	STA $1C
	LDA счетчик_кадров
	AND #$04
	BEQ bra_02_AEAA
	LDA #$00
	STA $1C
bra_02_AEAA:
	LDX #$00
	LDY #$00
bra_02_AEAE:
	LDA счетчик_кадров
	AND #$04
	BEQ bra_02_AEB9
	LDA #$00
	BEQ bra_02_AEBC
bra_02_AEB9:
	LDA table_02_AEE5,Y
bra_02_AEBC:
	STA буфер_атрибутов,X
	INY
	INX
	CPX #$12
	BCC bra_02_AEAE
	LDA $1C
	STA буфер_графики
	STX счетчик_буфера_атрибутов
	LDA #$01
	STA счетчик_буфера_графики
	LDA #$C6
	STA байт_2006_lo_атрибуты
	LDA #$AD
	STA байт_2006_lo_графика
	LDA #$22
	STA байт_2006_hi_графика
	STA байт_2006_hi_атрибуты
	RTS

table_02_AEE5:
.byte $E3,$00,$AE,$B1,$D9,$B5,$00,$BF,$B1,$CF,$CE,$00,$A6,$AD,$B4,$B9,$00,$E3

_loc_02_AEF7:
	LDA сценка_кунио
	JSR _b07_EC8F

table_02_AEFC:		; байты после JSR
.word table_02_AEFC_AF04
.word table_02_AEFC_AF04
.word table_02_AEFC_AF96
.word table_02_AEFC_AFF4

table_02_AEFC_AF04:
	LDA номер_кадра_анимации + 1
	JSR _b07_EC8F

table_02_AF09:		; байты после JSR
.word table_02_AF09_AF17
.word table_02_AF09_AF2B
.word table_02_AF09_AF32
.word table_02_AF09_AF6A
.word table_02_AF09_AF7B
.word table_02_AF09_AF8A
.word table_02_AF09_AF2A

table_02_AF09_AF17:
	LDA координата_X_hi
	BNE bra_02_AF2A
	LDA координата_X_lo
	CMP #$82
	BCC bra_02_AF2A
	LDA #$01
	STA номер_движения
_loc_02_AF28:
bra_02_AF28:
	INC номер_кадра_анимации + 1

bra_02_AF2A:
table_02_AF09_AF2A:
	RTS

table_02_AF09_AF2B:
	LDA #$0E
	STA номер_движения
	BNE bra_02_AF28

table_02_AF09_AF32:
	JSR _b07_вращение_рандома
	LDA координата_Z_lo_мяча
	CMP #$40
	BCC bra_02_AF2A
	LDA номер_кадра_анимации + 3
	CMP #$08
	BCC bra_02_AF44
	INC номер_кадра_анимации + 1
bra_02_AF44:
	JSR _b07_вращение_рандома
	AND #$03
	ASL
	TAY
	LDA номер_кадра_анимации + 3
	BNE bra_02_AF51
	INY
	INY
bra_02_AF51:
	LDA table_02_AF60,Y
	STA номер_кадра_анимации + 2
	LDA table_02_AF60 + 1,Y
	STA направление_движения
	INC номер_кадра_анимации + 3
	BNE bra_02_AF28

table_02_AF60:
.byte $40,$00
.byte $18,$80
.byte $18,$00
.byte $18,$00
.byte $18,$00

table_02_AF09_AF6A:
	LDA координата_Z_lo_мяча
	CMP номер_кадра_анимации + 2
	BCS bra_02_AF7A
	LDA #$80
	JSR _loc_02_AD9A
	LDA #$02
	STA номер_кадра_анимации + 1
bra_02_AF7A:
	RTS

table_02_AF09_AF7B:
	LDA координата_Z_lo_мяча
	CMP номер_кадра_анимации + 2
	BCS bra_02_AF7A
	LDA #$40
	JSR _loc_02_AD9A
	JMP _loc_02_AF28

table_02_AF09_AF8A:
	LDA координата_X_hi_мяча
	BEQ bra_02_AF2A
	LDA #$21
	STA номер_движения
	BNE bra_02_AF28

table_02_AEFC_AF96:
	LDA номер_кадра_анимации + 1
	JSR _b07_EC8F

table_02_AF9B:		; байты после JSR
.word table_02_AF9B_AFA5
.word table_02_AF9B_AFB9
.word table_02_AF9B_AFC7
.word table_02_AF9B_AFE2
.word table_02_AF9B_AFB8

table_02_AF9B_AFA5:
	LDA координата_X_hi
	BNE bra_02_AFB8
	LDA координата_X_lo
	CMP #$50
	BCC bra_02_AFB8
	LDA #$C0
	JSR _loc_02_AD9A
bra_02_AFB6:
	INC номер_кадра_анимации + 1

bra_02_AFB8:
table_02_AF9B_AFB8:
	RTS

table_02_AF9B_AFB9:
	LDA номер_движения
	CMP #$81
	BNE bra_02_AFB8
	LDA #$21
	STA номер_движения
	BNE bra_02_AFB6

table_02_AF9B_AFC7:
	LDA номер_кадра_анимации + 3
	CMP #$02
	BCS bra_02_AFDD
	LDA координата_X_lo
	CMP #$E0
	BCC bra_02_AFB8
	LDA #$80
	STA направление_движения
	INC номер_кадра_анимации + 3
	BNE bra_02_AFB6
bra_02_AFDD:
	LDA #$04
	STA номер_кадра_анимации + 1
	RTS

table_02_AF9B_AFE2:
	LDA координата_X_lo
	CMP #$20
	BCS bra_02_AFB8
	LDA #$00
	STA направление_движения
	LDA #$02
	STA номер_кадра_анимации + 1
	BNE bra_02_AFB8

table_02_AEFC_AFF4:
	LDA номер_кадра_анимации + 1
	JSR _b07_EC8F

table_02_AFF9:		; байты после JSR
.word table_02_AFF9_AFFF
.word table_02_AFF9_B017
.word table_02_AFF9_B02E

table_02_AFF9_AFFF:
	LDA #$01
	STA $04
	LDA координата_X_lo_мяча
	CMP #$F0
	BCC bra_02_B016
	LDA #$02
	STA скорость_Z_hi_мяча
	LDA #$FE
	STA скорость_X_hi_мяча
bra_02_B014:
	INC номер_кадра_анимации + 1
bra_02_B016:
	RTS

table_02_AFF9_B017:
	LDA #$01
	STA $04
	LDA координата_X_hi
	BEQ bra_02_B016
	LDA координата_X_lo
	CMP #$60
	BCC bra_02_B016
	LDA #$80
	STA направление_движения
	BNE bra_02_B014

table_02_AFF9_B02E:
	LDA #$02
	STA $04
	RTS
_loc_02_B033:
	LDX #$0C
	DEC таймер_кадра_анимации,X
	BNE bra_02_B068
	BIT номер_кадра_анимации
	BMI bra_02_B049
	DEC номер_кадра_анимации
	BNE bra_02_B059
	DEC номер_кадра_анимации
	LDY #$02
	LDA #$80
	BNE bra_02_B05F
bra_02_B049:
	INC номер_кадра_анимации,X
	LDA номер_кадра_анимации,X
	ASL
	TAY
	LDA table_02_B06F,Y
	BPL bra_02_B05F
	LDA table_02_B06F + 1,Y
	STA номер_кадра_анимации
bra_02_B059:
	LDY #$00
	LDA номер_анимации,X
	EOR #$01
bra_02_B05F:
	ORA #$80
	STA номер_анимации,X
	LDA table_02_B06F + 1,Y
	STA таймер_кадра_анимации,X
bra_02_B068:
	JSR _b07_EB8C
	JSR _loc_02_AA1B
	RTS

table_02_B06F:
.byte $00,$06
.byte $00,$30
.byte $03,$18
.byte $00,$30
.byte $FF,$03
.byte $FF,$10
.byte $FF,$20
.byte $FF,$20
.byte $FF,$20
.byte $00,$10
.byte $FF,$04
.byte $FF,$08
.byte $00,$20
.byte $02,$FF

_loc_02_B08B:
	LDA номер_движения,X
	ASL
	TAY
	LDA table_02_B09D,Y
	STA $2C
	LDA table_02_B09D + 1,Y
	STA $2D
	JMP ($002C)

table_02_B09D:
.word table_02_B09D_B0BB
.word table_02_B09D_B0BC
.word table_02_B09D_B0D9
.word table_02_B09D_B174
.word table_02_B09D_B0E9
.word table_02_B09D_B0E9
.word table_02_B09D_B0FC
.word table_02_B09D_B11C
.word table_02_B09D_B18A
.word table_02_B09D_B1CE
.word table_02_B09D_B1E6
.word table_02_B09D_B1FB
.word table_02_B09D_B0BC
.word table_02_B09D_B0E9
.word table_02_B09D_B1FB

table_02_B09D_B0BB:
	RTS

table_02_B09D_B0BC:
	LDA номер_движения,X
	BMI bra_02_B0C7
	JSR _loc_02_B282
	JSR _loc_02_AA39
bra_02_B0C7:
	LDA #$04
_loc_02_B0C9:
	JSR _loc_02_B29A
	JSR _loc_02_AA34
	JSR _loc_02_B33F
	JSR _loc_02_AA43
	JSR _loc_02_B2BC
	RTS

table_02_B09D_B0D9:
	LDA номер_движения,X
	BMI bra_02_B0E4
	JSR _loc_02_B282
	JSR _loc_02_AA39
bra_02_B0E4:
	LDA #$03
	JMP _loc_02_B0C9

table_02_B09D_B0E9:
	LDA номер_движения,X
	BMI bra_02_B0F7
	JSR _loc_02_B282
	JSR _loc_02_AA39
	JSR _loc_02_AA48
bra_02_B0F7:
	LDA #$03
	JMP _loc_02_B0C9

table_02_B09D_B0FC:
	LDA номер_движения,X
	BMI bra_02_B104
	JSR _loc_02_B282
bra_02_B104:
	JSR _loc_02_AA48
	JSR _loc_02_AA4D
	LDA #$03
	JSR _loc_02_B293
_loc_02_B10F:
	JSR _loc_02_AA34
	JSR _loc_02_B33F
	JSR _loc_02_AA43
	JSR _loc_02_B2BC
_loc_02_B11B:
	RTS

table_02_B09D_B11C:
	LDA номер_движения,X
	BMI bra_02_B127
	JSR _loc_02_B282
	JSR _loc_02_AA48
bra_02_B127:
	LDA смена_угла_движения,X
	CMP #$FF
	BNE bra_02_B139
	LDA направление_движения,X
	ORA #$40
	STA угол_движения,X
	JMP _loc_02_B14C
bra_02_B139:
	LDA направление_движения,X
	ASL
	LDA смена_угла_движения,X
	ROR
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA table_02_B164,Y
	STA угол_движения,X
_loc_02_B14C:
	EOR направление_движения,X
	BPL bra_02_B159
	LDA #$03
	STA номер_движения,X
	JMP _loc_02_B11B
bra_02_B159:
	LDA #$04
	JSR _loc_02_B293
	JSR _loc_02_AA48
	JMP _loc_02_B10F

table_02_B164:
.byte $20,$20,$40,$60,$60,$A0,$C0,$E0,$E0,$20,$40,$60,$A0,$A0,$C0,$E0

table_02_B09D_B174:
	LDA номер_движения,X
	BMI bra_02_B17F
	JSR _loc_02_B282
	JSR _loc_02_AA39
bra_02_B17F:
	LDA #$02
	JSR _loc_02_B29A
	JSR _loc_02_B2A8
	JMP _loc_02_B10F

table_02_B09D_B18A:
	LDA номер_движения,X
	BMI bra_02_B1A4
	JSR _loc_02_B282
	LDA направление_движения,X
	ORA #$40
	STA угол_движения,X
_loc_02_B19A:
	LDA #$2B
	JSR _b07_C2E4_запись_номера_звука
	LDA #$0A
	JSR _loc_02_B2A1
_loc_02_B1A4:
bra_02_B1A4:
	JSR _loc_02_AA34
	JSR _loc_02_B33F
	JSR _loc_02_AA43
	JSR _loc_02_B2BC
	LDA координата_Z_hi,X
	BMI bra_02_B1BA
	ORA координата_Z_lo,X
	BNE bra_02_B1CD
bra_02_B1BA:
	LDA #$00
	STA $0373,X
	STA координата_Z_lo,X
	STA координата_Z_hi,X
	LDA #$2C
	JSR _b07_C2E4_запись_номера_звука
	JSR _loc_02_B24A
bra_02_B1CD:
	RTS

table_02_B09D_B1CE:
	LDA номер_движения,X
	BMI bra_02_B1A4
	JSR _loc_02_B282
	LDA направление_движения,X
	ORA #$40
	STA угол_движения,X
_loc_02_B1DE:
	LDA #$03
	JSR _loc_02_B293
	JMP _loc_02_B19A

table_02_B09D_B1E6:
	LDA номер_движения,X
	BMI bra_02_B1A4
	JSR _loc_02_B282
	LDA направление_движения,X
	ORA #$40
	EOR #$80
	STA угол_движения,X
	JMP _loc_02_B1DE

table_02_B09D_B1FB:
	LDA номер_движения,X
	BMI bra_02_B247
	JSR _loc_02_B282
	LDA смена_угла_движения,X
	CMP #$FF
	BEQ bra_02_B20F
	EOR направление_движения,X
	BMI bra_02_B237
bra_02_B20F:
	CLC
	LDA скорость_Z_lo,X
	EOR #$FF
	ADC #$01
	STA скорость_Z_lo,X
	LDA скорость_Z_hi,X
	EOR #$FF
	ADC #$00
	STA скорость_Z_hi,X
	SEC
	LDA скорость_Z_lo,X
	SBC #$00
	STA скорость_Z_lo,X
	LDA скорость_Z_hi,X
	SBC #$04
	STA скорость_Z_hi,X
	BCS bra_02_B247
bra_02_B237:
	LDA #$00
	STA скорость_Z_hi,X
	STA скорость_Z_lo,X
	LDA #$02
	STA номер_движения,X
	JMP _loc_02_B10F
bra_02_B247:
	JMP _loc_02_B1A4

_loc_02_B24A:
table_02_B36F_B24A:
	LDA номер_движения,X
	AND #$7F
	TAY
	LDA table_02_B272,Y
	BPL bra_02_B263
	LDA состояние_игрока,X
	AND #$08
	BEQ bra_02_B261
	LDA #$21
	JMP _loc_02_B263
bra_02_B261:
	LDA #$20
_loc_02_B263:
bra_02_B263:
	STA номер_движения,X
	LDA #$00
	STA номер_кадра_анимации,X
	STA таймер_кадра_анимации,X
	STA подтип_анимации,X
	RTS

table_02_B272:
.byte $00,$01,$01,$01,$01,$01,$01,$01,$02,$0B,$0E,$0B,$FF,$01,$0E,$00

_loc_02_B282:
	ORA #$80
	STA номер_движения,X
	LDA #$00
	STA таймер_кадра_анимации,X
	STA номер_кадра_анимации,X
	STA подтип_анимации,X
	RTS

_loc_02_B293:
	STA $0493
	JSR _loc_02_AA52
	RTS

_loc_02_B29A:
	STA $0493
	JSR _loc_02_AA57
	RTS

_loc_02_B2A1:
	STA $0493
	JSR _loc_02_AA5C
	RTS

_loc_02_B2A8:
	LDA скорость_X_hi,X
	ORA скорость_X_lo,X
	ORA скорость_Y_hi,X
	ORA скорость_Y_lo,X
	BNE bra_02_B2BB
	JSR _loc_02_B24A
	PLA
	PLA
bra_02_B2BB:
	RTS

_loc_02_B2BC:
	LDY #$00
	LDA $58
	CMP #$03
	BNE bra_02_B2C6
	LDY #$04
bra_02_B2C6:
	STY $1C
	LDY #$00
	SEC
	LDA координата_Y_lo,X
	SBC table_02_B333
	LDA координата_Y_hi,X
	SBC table_02_B333 + 1
	BMI bra_02_B2EA
	INY
	INY
	SEC
	LDA координата_Y_lo,X
	SBC table_02_B335
	LDA координата_Y_hi,X
	SBC table_02_B335 + 1
	BMI bra_02_B2F6
bra_02_B2EA:
	LDA table_02_B333,Y
	STA координата_Y_lo,X
	LDA table_02_B333 + 1,Y
	STA координата_Y_hi,X
bra_02_B2F6:
	LDY $1C
	SEC
	LDA координата_X_lo,X
	SBC table_02_B337,Y
	LDA координата_X_hi,X
	SBC table_02_B337 + 1,Y
	BMI bra_02_B318
	INY
	INY
	SEC
	LDA координата_X_lo,X
	SBC table_02_B337,Y
	LDA координата_X_hi,X
	SBC table_02_B337 + 1,Y
	BMI bra_02_B332
bra_02_B318:
	LDA table_02_B337,Y
	STA координата_X_lo,X
	LDA table_02_B337 + 1,Y
	STA координата_X_hi,X
	LDA $58
	CMP #$03
	BNE bra_02_B332
	LDA координата_X_lo,X
	AND #$80
	STA направление_движения,X
bra_02_B332:
	RTS

table_02_B333:
.byte $C4,$00

table_02_B335:
.byte $F0,$00

table_02_B337:
.byte $40,$00,$C0,$02,$40,$01,$C0,$01

_loc_02_B33F:
	LDY #$00
	LDA $58
	CMP #$03
	BNE bra_02_B350
	LDA $061F
	CMP #$02
	BNE bra_02_B350
	LDY #$02
bra_02_B350:
	LDA table_02_B36B,Y
	STA $30
	LDA table_02_B36B + 1,Y
	STA $31
	LDA table_02_B36F
	STA $32
	LDA table_02_B36F + 1
	STA $33
	LDA номер_движения,X
	JSR _b07_CEBD
	RTS

table_02_B36B:
.word table_02_B36B_B371
.word table_02_B36B_B38F

table_02_B36F:
.word table_02_B36F_B24A

table_02_B36B_B371:
.word table_02_B36B_B371_B3AD
.word table_02_B36B_B371_B3AE
.word table_02_B36B_B371_B3B3
.word table_02_B36B_B371_B3B6
.word table_02_B36B_B371_B3C7
.word table_02_B36B_B371_B3D8
.word table_02_B36B_B371_B3BE
.word table_02_B36B_B371_B3B9
.word table_02_B36B_B371_B3EA
.word table_02_B36B_B371_B3EF
.word table_02_B36B_B371_B3F8
.word table_02_B36B_B371_B401
.word table_02_B36B_B371_B405
.word table_02_B36B_B371_B3E1
.word table_02_B36B_B371_B403

table_02_B36B_B38F:
.word table_02_B36B_B38F_B3AD
.word table_02_B36B_B38F_B40E
.word table_02_B36B_B38F_B413
.word table_02_B36B_B38F_B413
.word table_02_B36B_B38F_B416
.word table_02_B36B_B38F_B416
.word table_02_B36B_B38F_B41F
.word table_02_B36B_B38F_B41F
.word table_02_B36B_B38F_B424
.word table_02_B36B_B38F_B424
.word table_02_B36B_B38F_B424
.word table_02_B36B_B38F_B424
.word table_02_B36B_B38F_B416
.word table_02_B36B_B38F_B416
.word table_02_B36B_B38F_B424

table_02_B36B_B371_B3AD:
table_02_B36B_B38F_B3AD:
.byte $FF

table_02_B36B_B371_B3AE:
.byte $03,$03,$03,$04,$FE

table_02_B36B_B371_B3B3:
.byte $03,$03,$FF

table_02_B36B_B371_B3B6:
.byte $07,$0E,$FF

table_02_B36B_B371_B3B9:
.byte $03,$01,$03,$02,$FE

table_02_B36B_B371_B3BE:
.byte $06,$19,$03,$1A,$06,$1B,$03,$1A,$FE

table_02_B36B_B371_B3C7:
.byte $03,$82,$03,$80,$03,$02,$03,$00,$03,$82,$03,$80,$03,$02,$03,$00,$FF

table_02_B36B_B371_B3D8:
.byte $03,$08,$06,$09,$03,$88,$06,$89,$FF

table_02_B36B_B371_B3E1:
.byte $03,$11,$03,$12,$03,$11,$03,$12,$FF

table_02_B36B_B371_B3EA:
.byte $03,$19,$03,$19,$FE

table_02_B36B_B371_B3EF:
.byte $03,$0A,$03,$0B,$03,$0C,$03,$0D,$FE

table_02_B36B_B371_B3F8:
.byte $03,$0D,$03,$0C,$03,$0B,$03,$0A,$FE

table_02_B36B_B371_B401:	; вероятно дальше продолжение
.byte $00,$0E

table_02_B36B_B371_B403:	; вероятно дальше продолжение
.byte $00,$1C

table_02_B36B_B371_B405:
.byte $03,$82,$03,$80,$03,$02,$03,$00,$FE

table_02_B36B_B38F_B40E:
.byte $03,$1D,$03,$1F,$FE

table_02_B36B_B38F_B413:
.byte $04,$1D,$FF

table_02_B36B_B38F_B416:
.byte $04,$20,$04,$21,$04,$20,$04,$21,$FF

table_02_B36B_B38F_B41F:
.byte $03,$1E,$03,$1D,$FE

table_02_B36B_B38F_B424:
.byte $03,$24,$03,$25,$FE

_loc_02_B429:
	LDX #$2C
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 1
	INX
	STX банк_спрайтов + 2
	INX
	STX банк_спрайтов + 3
	LDX #$12
bra_02_B43C:
	LDA #$7F
	STA номер_анимации,X
	DEX
	BPL bra_02_B43C
	LDX #$00
	LDA флаг_владения_мячом_команды,X
	AND #$01
	BNE bra_02_B44E
	INX
bra_02_B44E:
	LDY #$00
	LDA номер_команды,X
	AND #$0F
	BEQ bra_02_B458
	INY
bra_02_B458:
	LDA table_02_B4FF,Y
	STA банк_спрайтов + 2
_loc_02_B45E:
	LDA #$FF
	STA смена_угла_движения,X
	STA номер_действия,X
	LDA table_02_B525,X
	STA $61,X
	LDA table_02_B529,X
	STA номер_движения,X
	LDA $58
	CMP #$03
	BEQ bra_02_B483
	LDA тип_экрана
	CMP #$04
	BEQ bra_02_B483
	LDA #$0C
	STA номер_движения,X
bra_02_B483:
	LDA #$00
	STA состояние_игрока,X
	STA скорость_X_hi,X
	STA скорость_X_lo,X
	STA скорость_Y_hi,X
	STA скорость_Y_lo,X
	STA скорость_Z_hi,X
	STA скорость_Z_lo,X
	STA гравитация_hi,X
	STA гравитация_lo,X
	STA $0301,X
	STA $033A,X
	STA $0373,X
	STA координата_Z_lo,X
	STA координата_Z_hi,X
	TXA
	AND #$01
	TAY
	LDA номер_команды,Y
	AND #$0F
	BNE bra_02_B4C0
	CLC
	LDA #$10
	ADC номер_игрока,X
bra_02_B4C0:
	TAY
	LDA table_02_B501,Y
	STA лицо_игрока,X
	TXA
	ROR
	ROR
	AND #$80
	EOR #$80
	STA направление_движения,X
	ORA #$40
	STA угол_движения,X
	TXA
	ASL
	ASL
	TAY
	LDA table_02_B52D,Y
	STA координата_X_lo,X
	LDA table_02_B52D + 1,Y
	STA координата_X_hi,X
	LDA table_02_B52D + 2,Y
	STA координата_Y_lo,X
	LDA table_02_B52D + 3,Y
	STA координата_Y_hi,X
	INX
	INX
	CPX #$04
	BCS bra_02_B4FB
	JMP _loc_02_B45E
bra_02_B4FB:
	JSR _b07_запись_банков_спрайтов
	RTS

table_02_B4FF:
.byte $2E,$31

table_02_B501:
.byte $00,$18,$19,$1A,$00,$1B,$1C,$1D,$00,$1E,$1F,$20,$00,$21,$22,$23

table_02_B511:
.byte $00,$1D,$21,$1A,$19,$1B,$1F,$22,$1E,$1C,$20,$18,$00,$01,$02,$03,$04,$04,$04,$08

table_02_B525:
.byte $04,$04,$04,$04

table_02_B529:
.byte $07,$07,$07,$07

table_02_B52D:
.byte $A8,$01,$D8,$00
.byte $50,$01,$D8,$00
.byte $88,$01,$D8,$00
.byte $70,$01,$D8,$00

_loc_02_B53D:
	LDX #$12
bra_02_B53F:
	LDA #$7F
	STA номер_анимации,X
	LDA #$00
	STA координата_Y_hi,X
	STA координата_Z_hi,X
	STA координата_Z_lo,X
	STA скорость_X_hi,X
	STA скорость_Y_lo,X
	STA скорость_Y_hi,X
	STA скорость_Z_lo,X
	STA скорость_Z_hi,X
	STA скорость_Z_lo,X
	STA номер_движения,X
	STA направление_движения,X
	LDA #$01
	STA координата_X_hi,X
	LDA #$07
	STA $61,X
	DEX
	BPL bra_02_B53F
	LDA #$00
	STA байт_для_2005_X
	STA байт_для_2005_Y
	STA $EF
	STA $F0
	STA $F2
	STA $F3
	LDA #$01
	STA $ED
	STA $F1
	LDX #$01
bra_02_B592:
	LDA флаг_владения_мячом_команды,X
	LSR
	BCS bra_02_B59D
	DEX
	BPL bra_02_B592
	LDX #$00
bra_02_B59D:
	TXA
	BNE bra_02_B5A9
	LDA номер_палитры_спрайтов + 1
	STA номер_палитры_спрайтов + 2
	STA номер_палитры_спрайтов + 3
bra_02_B5A9:
	STX $1F
	LDA номер_команды,X
	AND #$0F
	STA $1C
	LSR
	LSR
	STA $1D
	SEC
	LDA $1C
	SBC $1D
	STA $1E
	ASL
	ADC $1E
	ASL
	ASL
	SEC
	SBC $1E
	TAY
	LDA table_02_B63F,Y
	STA банк_спрайтов
	LDA table_02_B63F + 1,Y
	BMI bra_02_B5D4
	STA номер_палитры_спрайтов + 2
bra_02_B5D4:
	LDA table_02_B63F + 2,Y
	BMI bra_02_B5DC
	STA номер_палитры_спрайтов + 3
bra_02_B5DC:
	LDX #$01
bra_02_B5DE:
	LDA table_02_B63F + 3,Y
	STA лицо_игрока,X
	LDA table_02_B63F + 4,Y
	AND #$7F
	STA номер_движения,X
	LDA table_02_B63F + 4,Y
	AND #$80
	STA направление_движения,X
	LDA table_02_B63F + 5,Y
	STA координата_X_lo,X
	LDA table_02_B63F + 6,Y
	STA координата_Y_lo,X
	INX
	INX
	INY
	INY
	INY
	INY
	CPX #$04
	BCC bra_02_B5DE
	LDY банк_спрайтов
	INY
	STY банк_спрайтов + 1
	INY
	STY банк_спрайтов + 2
	INY
	STY банк_спрайтов + 3
	CPY #$37
	BNE bra_02_B622
	LDA #$2E
	STA банк_спрайтов + 2
bra_02_B622:
	LDA $1C
	BNE bra_02_B63E
	LDX $1F
	LDY номер_игрока,X
	LDA table_02_B511,Y
	STA лицо_игрока + 1
	TXA
	ORA #$0A
	TAX
	LDY номер_игрока,X
	LDA table_02_B511,Y
	STA лицо_игрока + 3
bra_02_B63E:
	RTS

table_02_B63F:
.byte $34,$FF,$FF,$00,$01,$68,$D8,$00,$81,$98,$D8
.byte $38,$FF,$FF,$00,$0D,$71,$D8,$00,$0A,$80,$D8
.byte $3C,$FF,$FF,$00,$1A,$80,$C8,$00,$1B,$80,$C8
.byte $38,$FF,$FF,$24,$1E,$20,$D8,$28,$21,$60,$D8
.byte $34,$FF,$FF,$00,$05,$80,$D8,$00,$00,$80,$D8
.byte $34,$FF,$FF,$25,$06,$70,$D8,$27,$86,$90,$D8
.byte $3C,$07,$FF,$00,$1C,$80,$C8,$00,$1D,$80,$C8
.byte $38,$FF,$FF,$26,$10,$68,$D8,$26,$11,$98,$D8
.byte $38,$FF,$FF,$00,$13,$68,$D8,$00,$14,$98,$D8
.byte $3C,$FF,$FF,$00,$18,$94,$D1,$00,$19,$80,$C8
.byte $3C,$07,$26,$00,$17,$60,$D8,$00,$97,$A0,$D8
.byte $38,$FF,$FF,$25,$12,$70,$D8,$27,$92,$90,$D8
.byte $3C,$07,$26,$00,$95,$70,$D8,$00,$96,$90,$D8

_loc_02_B6CE:
	LDX #$01
bra_02_B6D0:
	JSR _loc_02_B6DD
	JSR _b07_EB8C
	INX
	INX
	CPX #$04
	BCC bra_02_B6D0
	RTS
_loc_02_B6DD:
	LDA номер_движения,X
	ASL
	TAY
	LDA table_02_B6EF,Y
	STA $2C
	LDA table_02_B6EF + 1,Y
	STA $2D
	JMP ($002C)

table_02_B6EF:
.word table_02_B6EF_B745
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B82C
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B82C
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B7BD
.word table_02_B6EF_B7D3
.word table_02_B6EF_B7D3
.word table_02_B6EF_B758
.word table_02_B6EF_B7D3
.word table_02_B6EF_B758
.word table_02_B6EF_B79B
.word table_02_B6EF_B7F8
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B812
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B746
.word table_02_B6EF_B82C
.word table_02_B6EF_B7D3
.word table_02_B6EF_B774
.word table_02_B6EF_B746
.word table_02_B6EF_B774

table_02_B6EF_B745:
	RTS

table_02_B6EF_B746:
	LDA номер_движения,X
	BMI bra_02_B751
	JSR _loc_02_B282
	JSR _loc_02_AA3E
bra_02_B751:
	JSR _loc_02_B8E5
	JSR _loc_02_AA43
	RTS

table_02_B6EF_B758:
	LDA номер_движения,X
	BMI bra_02_B763
	JSR _loc_02_B282
	JSR _loc_02_AA3E
bra_02_B763:
	TXA
	EOR #$02
	TAY
	JSR _loc_02_B788
	CLC
	LDA номер_анимации,Y
	ADC #$02
	STA номер_анимации,X
	RTS

table_02_B6EF_B774:
	LDA номер_движения,X
	BMI bra_02_B77F
	JSR _loc_02_B282
	JSR _loc_02_AA3E
bra_02_B77F:
	LDY #$01
	JSR _loc_02_B788
	JSR _loc_02_B8E5
	RTS
_loc_02_B788:
	LDA координата_X_lo,Y
	STA координата_X_lo,X
	LDA координата_Y_lo,Y
	STA координата_Y_lo,X
	LDA координата_Z_lo,Y
	STA координата_Z_lo,X
	RTS

table_02_B6EF_B79B:
	LDA номер_движения,X
	BMI bra_02_B7AE
bra_02_B7A0:
	JSR _loc_02_B282
	JSR _loc_02_AA3E
	LDA направление_движения,X
	ORA #$40
	STA угол_движения,X
bra_02_B7AE:
	LDA #$03
	JSR _loc_02_B293
	JSR _loc_02_AA34
	JSR _loc_02_B8E5
	JSR _loc_02_AA43
	RTS

table_02_B6EF_B7BD:
	LDA номер_движения,X
	BMI bra_02_B7D8
	JSR _loc_02_B282
	JSR _loc_02_AA3E
	LDA направление_движения,X
	ORA #$80
	STA угол_движения,X
	JMP _loc_02_B7E1

table_02_B6EF_B7D3:
	LDA номер_движения,X
	BPL bra_02_B7A0
bra_02_B7D8:
	CLC
	LDA угол_движения,X
	ADC #$08
	STA угол_движения,X
_loc_02_B7E1:
	LDA #$03
	JSR _loc_02_B293
	JSR _loc_02_AA34
	JSR _loc_02_B8E5
	LDA угол_движения,X
	AND #$80
	ORA номер_анимации,X
	STA номер_анимации,X
	RTS

table_02_B6EF_B7F8:
	LDA номер_движения,X
	BMI bra_02_B83E
	JSR _loc_02_B282
	LDA направление_движения,X
	ORA #$40
	STA угол_движения,X
	LDA #$04
	JSR _loc_02_B293
	LDA #$00
	JMP _loc_02_B83B

table_02_B6EF_B812:
	LDA номер_движения,X
	BMI bra_02_B83E
	JSR _loc_02_B282
	LDA направление_движения,X
	ORA #$40
	STA угол_движения,X
	LDA #$07
	JSR _loc_02_B293
	LDA #$0A
	JMP _loc_02_B83B

table_02_B6EF_B82C:
	LDA номер_движения,X
	BMI bra_02_B83E
	JSR _loc_02_B282
	LDA #$2B
	JSR _b07_C2E4_запись_номера_звука
	LDA #$00
_loc_02_B83B:
	JSR _loc_02_B2A1
bra_02_B83E:
	JSR _loc_02_AA34
	JSR _loc_02_B8E5
	JSR _loc_02_AA43
	LDA координата_Z_hi,X
	BMI bra_02_B851
	ORA координата_Z_lo,X
	BNE bra_02_B86A
bra_02_B851:
	LDA #$00
	STA $0373,X
	STA координата_Z_lo,X
	STA координата_Z_hi,X
	JSR _loc_02_B86B
	LDA $58
	CMP #$03
	BEQ bra_02_B86A
	LDA #$2C
	JSR _b07_C2E4_запись_номера_звука
bra_02_B86A:
	RTS

_loc_02_B86B:
table_B902_B86B:
	LDA номер_движения,X
	AND #$7F
	TAY
	LDA table_02_B8B2,Y
	BPL bra_02_B8A3
	ASL
	BMI bra_02_B89E
	LDA table_02_B8B2,Y
	AND #$3F
	ASL
	TAY
	STX $1C
	LDA $58
	CMP #$03
	BNE bra_02_B88C
	LDX #$01
	BNE bra_02_B890
bra_02_B88C:
	TXA
	EOR #$02
	TAX
bra_02_B890:
	LDA table_02_B8DD + 1,Y
	JSR _loc_02_B8A3
	LDX $1C
	LDA table_02_B8DD,Y
	JMP _loc_02_B8A3
bra_02_B89E:
	LDA номер_движения,X
	AND #$7F
_loc_02_B8A3:
bra_02_B8A3:
	STA номер_движения,X
	LDA #$00
	STA номер_кадра_анимации,X
	STA таймер_кадра_анимации,X
	STA подтип_анимации,X
	RTS

table_02_B8B2:
.byte $00,$02,$03,$04,$01,$FF,$07,$08,$09,$09,$FF,$FF,$FF,$80,$81,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$82,$20,$24,$FF,$23,$FF,$FF,$FF,$83,$FF,$FF,$FF,$FF

table_02_B8DD:
.byte $0E,$0B,$0F,$0C,$1F,$22,$26,$25

_loc_02_B8E5:
	LDA table_B900
	STA $30
	LDA table_B900 + 1
	STA $31
	LDA table_B902
	STA $32
	LDA table_B902 + 1
	STA $33
	LDA номер_движения,X
	JSR _b07_CEBD
	RTS

table_B900:
.word table_B900_B904

table_B902:		; ???
.word table_B902_B86B

table_B900_B904:	; 43
.word table_B900_B904_B95A
.word table_B900_B904_B95B
.word table_B900_B904_B968
.word table_B900_B904_B96B
.word table_B900_B904_B968
.word table_B900_B904_B96D
.word table_B900_B904_B972
.word table_B900_B904_B968
.word table_B900_B904_B96B
.word table_B900_B904_B983
.word table_B900_B904_B98B
.word table_B900_B904_B990
.word table_B900_B904_B99A
.word table_B900_B904_B9A2
.word table_B900_B904_B9A5
.word table_B900_B904_B9AA
.word table_B900_B904_B9BA
.word table_B900_B904_B98B
.word table_B900_B904_B9CF
.word table_B900_B904_B9D8
.word table_B900_B904_B9DD
.word table_B900_B904_B9E2
.word table_B900_B904_B9E7
.word table_B900_B904_B9EC
.word table_B900_B904_B9F5
.word table_B900_B904_B9FA
.word table_B900_B904_B9FF
.word table_B900_B904_B9FF
.word table_B900_B904_BA20
.word table_B900_B904_BA20
.word table_B900_B904_BA25
.word table_B900_B904_BA36
.word table_B900_B904_BA38
.word table_B900_B904_BA48
.word table_B900_B904_BA4D
.word table_B900_B904_BA48
.word table_B900_B904_BA3B
.word table_B900_B904_BA58
.word table_B900_B904_BA4F
.word table_B900_B904_BA5C
.word table_B900_B904_BA51
.word table_B900_B904_BA61
.word table_B900_B904_BA53

table_B900_B904_B95A:
.byte $FF

table_B900_B904_B95B:
.byte $04,$08,$04,$09,$04,$08,$04,$09,$04,$08,$04,$09,$FF

table_B900_B904_B968:
.byte $08,$02,$FF

table_B900_B904_B96B:		; вероятно дальше продолжение
.byte $00,$03

table_B900_B904_B96D:
.byte $04,$06,$04,$0B,$FE

table_B900_B904_B972:
.byte $02,$00,$02,$01,$02,$00,$02,$01,$02,$00,$02,$01,$02,$00,$02,$01,$FF

table_B900_B904_B983:		; вероятно дальше продолжение
.byte $08,$02,$04,$04,$04,$05,$FC,$01

table_B900_B904_B98B:
.byte $04,$92,$04,$93,$FE

table_B900_B904_B990:		; вероятно дальше продолжение
.byte $10,$94,$08,$95,$04,$91,$04,$90,$FC,$02

table_B900_B904_B99A:		; вероятно дальше продолжение
.byte $10,$96,$08,$99,$10,$97,$00,$99

table_B900_B904_B9A2:
.byte $40,$9A,$FF

table_B900_B904_B9A5:
.byte $0F,$9A,$40,$9B,$FF

table_B900_B904_B9AA:		; вероятно дальше продолжение
.byte $18,$9B,$10,$9E,$02,$9C,$02,$9D,$02,$9C,$02,$9D,$08,$9C,$FC,$02

table_B900_B904_B9BA:
.byte $08,$0C,$10,$0D,$06,$0E,$04,$0F,$04,$10,$04,$11,$04,$10,$04,$11,$04,$10,$04,$11,$FE

table_B900_B904_B9CF:
.byte $02,$1F,$02,$20,$02,$9F,$02,$A0,$FE

table_B900_B904_B9D8:
.byte $04,$27,$04,$28,$FE

table_B900_B904_B9DD:
.byte $04,$A5,$04,$A6,$FE

table_B900_B904_B9E2:
.byte $04,$2B,$04,$2C,$FE

table_B900_B904_B9E7:
.byte $04,$29,$04,$2A,$FE

table_B900_B904_B9EC:
.byte $04,$34,$04,$36,$04,$B6,$04,$B4,$FE

table_B900_B904_B9F5:
.byte $02,$3F,$02,$40,$FE

table_B900_B904_B9FA:
.byte $02,$2E,$02,$2F,$FE

table_B900_B904_B9FF:
.byte $02,$37,$02,$38,$02,$37,$02,$38,$02,$3B,$02,$3C,$02,$3B,$02,$3C,$02,$3B,$02,$3C,$02,$3B,$02,$3C,$02,$37,$02,$38,$02,$37,$02,$38,$FE

table_B900_B904_BA20:
.byte $02,$30,$02,$31,$FE

table_B900_B904_BA25:
.byte $02,$41,$02,$42,$02,$41,$02,$42,$02,$41,$02,$42,$02,$41,$02,$42,$FF

table_B900_B904_BA36:		; вероятно дальше продолжение
.byte $00,$21

table_B900_B904_BA38:
.byte $08,$44,$FF

table_B900_B904_BA3B:
.byte $04,$22,$08,$23,$04,$22,$04,$A2,$08,$A3,$04,$A2,$FE

table_B900_B904_BA48:
.byte $04,$41,$04,$43,$FE

table_B900_B904_BA4D:		; вероятно дальше продолжение
.byte $00,$24

table_B900_B904_BA4F:		; вероятно дальше продолжение
.byte $00,$07

table_B900_B904_BA51:		; вероятно дальше продолжение
.byte $00,$0F

table_B900_B904_BA53:
.byte $04,$90,$04,$A6,$FE

table_B900_B904_BA58:		; вероятно дальше продолжение
.byte $03,$12,$00,$11

table_B900_B904_BA5C:
.byte $02,$02,$02,$01,$FE

table_B900_B904_BA61:
.byte $04,$22,$04,$23,$FE

_loc_02_BA66:
	LDA #$07
	STA номер_палитры_спрайтов
	LDA #$04
	STA номер_палитры_спрайтов + 1
	STA номер_палитры_спрайтов + 2
	STA номер_палитры_спрайтов + 3
	STA $61
	STA $62
	STA $6D
	LDX #$2C
	STX банк_спрайтов
	INX
	STX банк_спрайтов + 1
	INX
	STX банк_спрайтов + 2
	INX
	STX банк_спрайтов + 3
	JSR _b07_запись_банков_спрайтов
	LDX #$00
	STX номер_управляемого
	DEX
	STX номер_управляемого + 1
	STX номер_управляемого + 2
	STX номер_управляемого + 3
	LDX номер_игрока
	LDA table_02_B511,X
	STA лицо_игрока
	LDX номер_игрока + 10
	LDA table_02_B511,X
	STA лицо_игрока + 1
	LDA #$80
	STA направление_движения
	STA направление_движения + 1
	LDA #$00
	STA направление_движения_мяча
	LDA #$02
	STA $1C
bra_02_BAC5:
	LDY $1C
	LDX table_02_BB1E,Y
	LDA #$00
	STA скорость_X_hi,X
	STA скорость_X_lo,X
	STA скорость_Y_hi,X
	STA скорость_Y_lo,X
	STA скорость_Z_hi,X
	STA скорость_Z_lo,X
	STA координата_Y_hi,X
	STA координата_Z_lo,X
	STA координата_Z_hi,X
	STA гравитация_hi,X
	STA гравитация_lo,X
	STA состояние_игрока,X
	LDA #$FF
	STA номер_действия,X
	LDA $061F
	ASL
	ADC $061F
	ADC $1C
	TAY
	LDA table_02_BB21,Y
	STA номер_движения,X
	TYA
	ASL
	TAY
	LDA table_02_BB2A,Y
	STA координата_X_lo,X
	LDA table_02_BB2A + 1,Y
	STA координата_Y_lo,X
	LDA #$01
	STA координата_X_hi,X
	DEC $1C
	BPL bra_02_BAC5
	RTS

table_02_BB1E:
.byte $00,$01,$0C

table_02_BB21:
.byte $07,$25,$26,$07,$27,$28,$07,$29,$2A

table_02_BB2A:
.byte $B0,$D4
.byte $81,$CE
.byte $80,$D1
.byte $B0,$D4
.byte $90,$CC
.byte $80,$D0
.byte $A0,$D4
.byte $98,$CC
.byte $88,$D0

_loc_02_BB3C:
	LDX #$00
	JSR _loc_02_AA16
	JSR _loc_02_AA61
	JSR _loc_02_B08B
	JSR _loc_02_AA66
	JSR _b07_EB8C
	INX
	JSR _loc_02_B6DD
	JSR _b07_EB8C
	LDX #$0C
	JSR _loc_02_B6DD
	JSR _b07_EB8C
	RTS
_loc_02_BB5D:
	LDA тип_экрана
	JSR _b07_EC8F

table_02_BB62:		; байты после JSR
.word table_02_BB62_BB78
.word table_02_BB62_BBB1
.word table_02_BB62_BBCE
.word table_02_BB62_BD00
.word table_02_BB62_BDC0
.word table_02_BB62_BE42
.word table_02_BB62_BE59
.word table_02_BB62_BE76
.word table_02_BB62_AA95
.word table_02_BB62_AAD9
.word table_02_BB62_BE95

table_02_BB62_BB78:
	JSR _b07_EF54
	LDA #$F0
	STA ограничитель_Y_спрайтов
	LDA #$80
	STA разновидность_NMI
	LDA #$03
	STA скорость_игры
	LDA #$00
	STA байт_для_2005_X
	STA байт_для_2005_Y
	STA $EF
	STA $F0
	STA $F2
	STA $F3
	LDA #$01
	STA $ED
	STA $F1
	JSR _loc_02_BA66
	JSR _loc_02_BB3C
	JSR _loc_02_AA1B
	JSR _b07_поставить_флаг_увеличения_яркости
	LDA #$0B
	JSR _b07_C2E4_запись_номера_звука
_loc_02_BBAE:
	INC тип_экрана
bra_02_BBB0:
	RTS

table_02_BB62_BBB1:
	JSR _b07_D073
	JSR _loc_02_BB3C
	JSR _loc_02_AA1B
	LDA $07E5
	AND #$02
	BNE bra_02_BBB0
	LDA #$44
	JSR _b07_C2E4_запись_номера_звука
	LDA #$10
	JSR _loc_02_BEBF
	JMP _loc_02_BBAE

table_02_BB62_BBCE:
	JSR _loc_02_BEC8
	JSR _loc_02_AE7C
	BVC bra_02_BBB0
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	JSR _loc_02_AE3D_задержка
	LDA #$1C
	JSR _b07_E828
	LDA $061F
	ASL
	ASL
	ASL
	ASL
	TAY
	LDX #$00
bra_02_BBEE:
	LDA table_02_BCD0,Y
	STA буфер_атрибутов,X
	INY
	INX
	CPX #$10
	BCC bra_02_BBEE
	STX счетчик_буфера_атрибутов
	LDA #$A9
	STA байт_2006_lo_атрибуты
	LDA #$20
	STA байт_2006_hi_атрибуты
	LDA $061F
	BEQ bra_02_BC27
	LDA #$DA
	STA буфер_графики
	LDA #$01
	STA счетчик_буфера_графики
	LDA $061F
	ASL
	ADC $061F
	ADC #$88
	STA байт_2006_lo_графика
	LDA #$20
	STA байт_2006_hi_графика
bra_02_BC27:
	LDX #$00
	LDA координата_Y_lo,X
	SEC
	SBC #$38
	STA координата_Y_lo,X
	INX
	LDA координата_Y_lo,X
	SEC
	SBC #$38
	STA координата_Y_lo,X
	LDX #$0C
	LDA координата_Y_lo,X
	SEC
	SBC #$38
	STA координата_Y_lo,X
	LDA #$00
	STA координата_X_hi
	STA координата_X_hi + 1
	STA координата_X_hi_мяча
	STA $F1
	STA $ED
	LDA #$1D
	STA номер_палитры_спрайтов
	LDA #$2B
	STA номер_палитры_спрайтов + 1
	STA номер_палитры_спрайтов + 2
	STA номер_палитры_спрайтов + 3
	LDA номер_анимации
	STA номер_анимации + 8
	LDA координата_X_lo
	STA координата_X_lo + 8
	LDA координата_Y_lo
	STA координата_Y_lo + 8
	LDA координата_Z_lo
	STA координата_Z_lo + 8
	LDA состояние_игрока
	STA состояние_игрока + 8
	LDA номер_анимации + 1
	STA номер_анимации + 9
	LDA координата_X_lo + 1
	STA координата_X_lo + 9
	LDA координата_Y_lo + 1
	STA координата_Y_lo + 9
	LDA координата_Z_lo + 1
	STA координата_Z_lo + 9
	LDA номер_анимации_мяча
	STA номер_анимации + 10
	LDA координата_X_lo_мяча
	STA координата_X_lo + 10
	LDA координата_Y_lo_мяча
	STA координата_Y_lo + 10
	LDA координата_Z_lo_мяча
	STA координата_Z_lo + 10
	LDA #$FF
	STA $058C
	LDA #$2C
	JSR _loc_02_BEBF
	INC таймер_демо_hi
	JSR _loc_02_BED4
	JSR _b07_поставить_флаг_увеличения_яркости
	LDA #$0E
	JSR _b07_C2E4_запись_номера_звука
	LDA #$80
	STA флаг_демо
bra_02_BCCD:
	INC тип_экрана
bra_02_BCCF:
	RTS

table_02_BCD0:
.byte $02,$02,$E3,$02,$C6,$A4,$AD,$D3,$A4,$02,$E3,$02,$02,$02,$02,$02,$E3,$02,$AD,$D2,$CF,$02,$C6,$A4,$AD,$D3,$A4,$02,$E3,$02,$02,$02,$02,$02,$02,$E3,$02,$BC,$02,$C9,$02,$E3,$02,$02,$02,$02,$02,$02

table_02_BB62_BD00:
	JSR _loc_02_BED4
	JSR _b07_D073
	JSR _loc_02_AE7C
	BVC bra_02_BCCF
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	JSR _loc_02_AE3D_задержка
	INC $058C
	LDA $058C
	CMP #$07
	BCS bra_02_BCCD
	ADC #$1D
	JSR _b07_E828
	LDA $058C
	ASL
	TAY
	LDA table_02_BEEC,Y
	STA $2C
	LDA table_02_BEEC + 1,Y
	STA $2D
	LDY #$00
	LDA ($2C),Y
	JSR _loc_02_BEBF
	LDA таймер_демо_lo
	CMP #$40
	BCS bra_02_BD43
	INC таймер_демо_hi
bra_02_BD43:
	LDA #$08
	STA банк_спрайтов
	INY
	LDA ($2C),Y
	STA банк_спрайтов + 1
	LDA #$20
	STA банк_спрайтов + 2
	INY
	LDA ($2C),Y
	STA банк_спрайтов + 3
	JSR _b07_запись_банков_спрайтов
	INY
	LDA ($2C),Y
	STA номер_палитры_спрайтов + 2
	INY
	LDA ($2C),Y
	STA номер_палитры_спрайтов + 3
	LDX #$00
bra_02_BD6A:
	LDA #$FF
	STA координата_Z_hi,X
	LDA #$00
	STA состояние_игрока,X
	STA $61,X
	STA координата_X_hi,X
	STA координата_Y_hi,X
	INY
	LDA ($2C),Y
	CMP #$FF
	BEQ bra_02_BDA9
	STA номер_анимации,X
	LDA #$00
	STA координата_Z_hi,X
	INY
	LDA ($2C),Y
	STA координата_X_lo,X
	INY
	LDA ($2C),Y
	STA координата_Y_lo,X
	INY
	LDA ($2C),Y
	STA координата_Z_lo,X
	BEQ bra_02_BDA3
	LDA #$80
	STA состояние_игрока,X
bra_02_BDA3:
	INY
	LDA ($2C),Y
	STA лицо_игрока,X
bra_02_BDA9:
	INX
	CPX #$04
	BCC bra_02_BD6A
	CPX #$0D
	BEQ bra_02_BDB6
	LDX #$0C
	BNE bra_02_BD6A
bra_02_BDB6:
	INC $6D
	JSR _loc_02_BED4
	JSR _b07_поставить_флаг_увеличения_яркости
	RTS

table_02_BB62_BDC0:
	JSR _loc_02_BA66
	LDA номер_анимации + 8
	STA номер_анимации
	LDA координата_X_lo + 8
	STA координата_X_lo
	LDA координата_Y_lo + 8
	STA координата_Y_lo
	LDA координата_Z_lo + 8
	STA координата_Z_lo
	LDA $048E
	STA состояние_игрока
	LDA номер_анимации + 9
	STA номер_анимации + 1
	LDA координата_X_lo + 9
	STA координата_X_lo + 1
	LDA координата_Y_lo + 9
	STA координата_Y_lo + 1
	LDA координата_Z_lo + 9
	STA координата_Z_lo + 1
	LDA номер_анимации + 10
	STA номер_анимации_мяча
	LDA координата_X_lo + 10
	STA координата_X_lo_мяча
	LDA координата_Y_lo + 10
	STA координата_Y_lo_мяча
	LDA координата_Z_lo + 10
	STA координата_Z_lo_мяча
	LDA #$00
	STA координата_X_hi
	STA координата_X_hi + 1
	STA координата_X_hi_мяча
	STA координата_Z_hi_мяча
	LDA #$1D
	STA номер_палитры_спрайтов
	LDA #$2B
	STA номер_палитры_спрайтов + 1
	STA номер_палитры_спрайтов + 2
	STA номер_палитры_спрайтов + 3
	JSR _loc_02_BEC8
	LDA #$24
	JSR _b07_E828
	LDA #$00
	JSR _loc_02_BEBF
	INC таймер_демо_hi
	INC таймер_демо_hi
	JSR _b07_поставить_флаг_увеличения_яркости
bra_02_BE3F:
	INC тип_экрана
bra_02_BE41:
	RTS

table_02_BB62_BE42:
	JSR _loc_02_BEC8
	JSR _b07_D073
	JSR _loc_02_AE7C
	BVC bra_02_BE41
	LDA #$01
	JSR _loc_02_BEBF
	LDA #$00
	STA $058C
	BEQ bra_02_BE3F

table_02_BB62_BE59:
	JSR _loc_02_BEC8
	JSR _loc_02_BE9B
	BCC bra_02_BE41
	LDA $061F
	CLC
	ADC #$36
	STA $0606
	LDA #$80
	STA $0604
	LDA #$02
	STA скорость_игры
	BNE bra_02_BE3F

table_02_BB62_BE76:
	JSR _b07_C317
	JSR _loc_02_BEC8
	LDA $0605
	BMI bra_02_BE94
	JSR _b07_поставить_флаг_уменьшения_яркости
	JSR _b07_D062
	JSR _loc_02_AE3D_задержка
	LDA #$00
	STA скорость_игры
	STA координата_Z_lo_мяча
	INC тип_экрана
bra_02_BE94:
	RTS

table_02_BB62_BE95:
	LDX #$0C
	JSR _b07_EB8C
	RTS
_loc_02_BE9B:
	JSR _loc_02_AE7C
	CLC
	BVC bra_02_BEBE
	INC $058C
	LDA $058C
	CMP #$04
	BCS bra_02_BEBE
	LDA #$40
	JSR _loc_02_BEBF
	LDA #$4C
	JSR _b07_C2E4_запись_номера_звука
	CLC
	BCC bra_02_BEBE
	LDA #$4E
	JSR _b07_C2E4_запись_номера_звука
	SEC
bra_02_BEBE:
	RTS
_loc_02_BEBF:
	STA таймер_демо_lo
	LDA #$01
	STA таймер_демо_hi
	RTS
_loc_02_BEC8:
	LDA #$FF
	LDX #$02
bra_02_BECC:
	STA координата_Z_hi,X
	INX
	CPX #$0C
	BCC bra_02_BECC
_loc_02_BED4:
	LDA #$FF
	STA флаг_прозрачного_мяча
	LDX #$00
bra_02_BEDB:
	LDA координата_Z_hi,X
	BNE bra_02_BEE3
	JSR _b07_EB8C
bra_02_BEE3:
	INX
	CPX #$0D
	BCC bra_02_BEDB
	JSR _loc_02_AA1B
	RTS

table_02_BEEC:
.word table_02_BEEC_BEFA
.word table_02_BEEC_BF0F
.word table_02_BEEC_BF28
.word table_02_BEEC_BF41
.word table_02_BEEC_BF5A
.word table_02_BEEC_BF77
.word table_02_BEEC_BF90

table_02_BEEC_BEFA:
.byte $C8,$14,$09,$2C,$2C,$9B,$50,$80,$18,$00,$A9,$90,$90,$18,$00,$FF,$FF,$00,$78,$88,$38

table_02_BEEC_BF0F:
.byte $C6,$19,$09,$2E,$2F,$15,$60,$9C,$00,$00,$B7,$A8,$80,$00,$14,$FF,$80,$A8,$60,$00,$12,$00,$7C,$78,$20

table_02_BEEC_BF28:
.byte $F8,$16,$09,$34,$2D,$0F,$60,$98,$08,$00,$98,$58,$68,$08,$12,$FF,$81,$A8,$78,$00,$14,$00,$80,$80,$10

table_02_BEEC_BF41:
.byte $C8,$1D,$0C,$30,$31,$12,$54,$94,$08,$00,$8B,$B0,$74,$10,$12,$FF,$81,$98,$98,$00,$15,$A0,$80,$80,$20

table_02_BEEC_BF5A:
.byte $2C,$1F,$0A,$2E,$35,$88,$A8,$98,$00,$00,$A4,$A4,$70,$08,$12,$89,$68,$90,$00,$03,$0B,$50,$88,$10,$14,$07,$8C,$80,$10

table_02_BEEC_BF77:
.byte $C8,$1A,$09,$32,$33,$22,$58,$90,$00,$00,$8E,$B0,$74,$00,$16,$0F,$80,$74,$10,$00,$FF,$00,$94,$84,$00

table_02_BEEC_BF90:
.byte $C8,$1C,$11,$32,$33,$C2,$8C,$6C,$00,$00,$43,$58,$8C,$00,$12,$C1,$A8,$94,$00,$01

; BFA4 fill FF

.segment "BANK_02_ID"
.byte $02 