.segment "BANK_03"
.include "ram_copy.inc"
.include "val_copy.inc"

.import table_07_C080_byte_8000_8001
.import _b07_C2E4
.import _b07_вращение_рандома
.import _b07_F469
.import _b07_F4C1
.import _b07_F564
.import _b07_F59B
.import _b07_F67D
.import _b07_F691
.import _b07_F9DE
.import _b07_FA6D

.export _loc_03_8000
_loc_03_8000:
	JMP _loc_03_8015
.export _loc_03_8003
_loc_03_8003:
	JMP _loc_03_B999
.export _loc_03_8006
_loc_03_8006:
	JMP _loc_03_A995
.export _loc_03_8009
_loc_03_8009:
	JMP _loc_03_BAF9
.export _loc_03_800C
_loc_03_800C:
	JMP _loc_03_BCF1
.export _loc_03_800F
_loc_03_800F:
	JMP _loc_03_BED4
.export _loc_03_8012
_loc_03_8012:
	JMP _loc_03_BF23

_loc_03_8015:
	JSR _loc_03_B0AE
	JSR _loc_03_9BD2
	LDX #$0B
bra_03_801D:
	LDA $0668,X
	ORA #$F0
	STA $0668,X
	LDA #$00
	STA интеллект_бота,X
	DEX
	BPL bra_03_801D
	LDA состояние_мяча
	BPL bra_03_804F
	LDA $0524
	STA $1C
	LDY #$0C
	JSR _loc_03_98D0
	LDA координата_X_lo_мяча
	PHA
	LDA координата_X_hi_мяча
	PHA
	LDA координата_Y_lo_мяча
	PHA
	LDA координата_Y_hi_мяча
	PHA
	JSR _loc_03_8194
bra_03_804F:
	LDA #$0C
	STA $22
	LDA #$00
	STA $23
	LDA #$06
	STA $27
	LDA #$0B
	STA $28
	LDA #$01
	STA $29
	JSR _b07_F9DE
	LDA состояние_мяча
	BPL bra_03_807B
	PLA
	STA координата_Y_hi_мяча
	PLA
	STA координата_Y_lo_мяча
	PLA
	STA координата_X_hi_мяча
	PLA
	STA координата_X_lo_мяча
bra_03_807B:
	LDA состояние_мяча
	AND #$40
	BEQ bra_03_8094
	LDA игрок_с_мячом
	AND #$01
	BNE bra_03_8094
	LDA #$00
	STA дистанция_ближайшего
	LDA игрок_с_мячом
	JMP _loc_03_80B4
bra_03_8094:
	LDX #$00
_loc_03_8096:
	LDA $2C,X
	CMP #$FF
	BEQ bra_03_80A5
	AND #$01
	BEQ bra_03_80AD
	INX
	INX
	JMP _loc_03_8096
bra_03_80A5:
	STA дистанция_ближайшего
	LDA #$00
	JMP _loc_03_80B4
bra_03_80AD:
	LDA $2D,X
	STA дистанция_ближайшего
	LDA $2C,X
_loc_03_80B4:
	STA номер_ближайшего
	LDA состояние_мяча
	AND #$40
	BEQ bra_03_80D0
	LDA игрок_с_мячом
	AND #$01
	BEQ bra_03_80D0
	LDA #$00
	STA дистанция_ближайшего + 1
	LDA игрок_с_мячом
	JMP _loc_03_80F0
bra_03_80D0:
	LDX #$00
_loc_03_80D2:
	LDA $2C,X
	CMP #$FF
	BEQ bra_03_80E1
	AND #$01
	BNE bra_03_80E9
	INX
	INX
	JMP _loc_03_80D2
bra_03_80E1:
	STA дистанция_ближайшего + 1
	LDA #$01
	JMP _loc_03_80F0
bra_03_80E9:
	LDA $2D,X
	STA дистанция_ближайшего + 1
	LDA $2C,X
_loc_03_80F0:
	STA номер_ближайшего + 1
	LDX #$00
	LDA #$10
	STA $1C
	LDA #$01
	STA $1D
bra_03_80FD:
	LDA $2D,X
	CMP #$FF
	BEQ bra_03_812A
	LDA $2C,X
	TAY
	LDA $0668,Y
	AND #$0F
	CMP $1D
	BCC bra_03_8116
	CPY игрок_с_мячом
	BEQ bra_03_8116
	LDA $1D
bra_03_8116:
	ORA $1C
	STA $0668,Y
	LDA $1C
	CLC
	ADC #$10
	STA $1C
	INC $1D
	INX
	INX
	CPX #$0C
	BCC bra_03_80FD
bra_03_812A:
	LDA $0672
	AND #$0F
	CMP #$02
	BCC bra_03_8138
	LDA #$22
	STA $0672
bra_03_8138:
	LDA $0673
	AND #$0F
	CMP #$02
	BCC bra_03_8146
	LDA #$22
	STA $0673
bra_03_8146:
	LDA тип_экрана
	CMP #$01
	BNE bra_03_8161
	LDA режим_игры_на_поле
	AND #$20
	BEQ bra_03_816A
	LDA флаг_владения_мячом_команды
	AND #$01
	TAY
	LDA #$06
	STA интеллект_бота,Y
	JMP _loc_03_816A
bra_03_8161:
	JSR _loc_03_81A9
	JSR _loc_03_A017
	JSR _loc_03_A7A1
_loc_03_816A:
bra_03_816A:
	LDX #$00
bra_03_816C:
	DEC $0668,X
	LDA $0668,X
	AND #$0F
	BEQ bra_03_8179
	JMP _loc_03_8189
bra_03_8179:
	JSR _loc_03_8339
	LDA $0668,X
	LSR
	LSR
	LSR
	LSR
	ORA $0668,X
	STA $0668,X
_loc_03_8189:
	INX
	CPX #$0C
	BNE bra_03_816C
	RTS

_loc_03_8194:
	LDA $32
	STA координата_X_lo_мяча
	LDA $33
	STA координата_X_hi_мяча
	LDA $34
	STA координата_Y_lo_мяча
	LDA $35
	STA координата_Y_hi_мяча
	RTS

_loc_03_81A9:
	LDA тип_экрана
	CMP #$03
	BEQ bra_03_81B7
	CMP #$06
	BNE bra_03_81B8
	JMP _loc_03_8298
bra_03_81B7:
	RTS
bra_03_81B8:
	LDA игрок_с_мячом
	PHA
	LDX #$00
bra_03_81BE:
	JSR _loc_03_81DD
	INX
	CPX #$02
	BCC bra_03_81BE
	PLA
	STA игрок_с_мячом
	LDA опция_режим_сложность
	AND #$20
	BEQ bra_03_81DC
	LDA счетчик_смен
	AND #$7F
	TAY
	LDA #$2B
	STA интеллект_бота,Y
bra_03_81DC:
	RTS
_loc_03_81DD:
	LDA состояние_мяча
	AND #$40
	BNE bra_03_8206
	LDA номер_движения_мяча
	AND #$7F
	CMP #$04
	BEQ bra_03_81FB
	CMP #$0A
	BEQ bra_03_81FB
	CMP #$15
	BEQ bra_03_81FB
bra_03_81F5:
	JSR _loc_03_A59B
	JMP _loc_03_821E
bra_03_81FB:
	TXA
	EOR игрок_с_мячом
	AND #$01
	BNE bra_03_81F5
	JMP _loc_03_820E
bra_03_8206:
	TXA
	EOR игрок_с_мячом
	AND #$01
	BNE bra_03_8214
_loc_03_820E:
	JSR _loc_03_A106
	JMP _loc_03_821E
bra_03_8214:
	LDA состояние_мяча
	AND #$40
	BEQ bra_03_821E
	JSR _loc_03_A39C
_loc_03_821E:
bra_03_821E:
	RTS
_loc_03_821F:
	TXA
	PHA
	LDX #$00
bra_03_8223:
	LDA $2C,X
	TAY
	LDA номер_движения,Y
	AND #$7F
	CMP #$04
	BEQ bra_03_8242
	CMP #$05
	BEQ bra_03_8242
	CMP #$2D
	BEQ bra_03_8242
	CMP #$2E
	BEQ bra_03_8242
	CMP #$3C
	BEQ bra_03_8242
	JMP _loc_03_824B
bra_03_8242:
	INX
	INX
	CPX #$0C
	BCC bra_03_8223
	JMP _loc_03_825E
_loc_03_824B:
	LDA номер_движения_мяча
	AND #$7F
	CMP #$05
	BNE bra_03_8259
	LDA #$05
	JMP _loc_03_825B
bra_03_8259:
	LDA #$06
_loc_03_825B:
	STA интеллект_бота,Y
_loc_03_825E:
	PLA
	TAX
	RTS
_loc_03_8261:
bra_03_8261:
	STA интеллект_бота,Y
	INY
	INY
	CPY #$0B
	BCC bra_03_8261
	RTS
_loc_03_826B:
bra_03_826B:
	LDA позиция_управление,Y
	AND #$30
	BEQ bra_03_827D
	CMP #$10
	BEQ bra_03_8282
	CMP #$20
	BEQ bra_03_8287
	JMP _loc_03_828C
bra_03_827D:
	LDA $1C
	JMP _loc_03_828E
bra_03_8282:
	LDA $1D
	JMP _loc_03_828E
bra_03_8287:
	LDA $1E
	JMP _loc_03_828E
_loc_03_828C:
	LDA $1F
_loc_03_828E:
	STA интеллект_бота,Y
	INY
	INY
	CPY #$0B
	BCC bra_03_826B
	RTS
_loc_03_8298:
	LDA #$FF
	STA приказ_боту
	STA приказ_боту + 1
	LDA $068B
	AND #$01
	TAY
	LDA #$0A
bra_03_82A8:
	STA интеллект_бота,Y
	INY
	INY
	CPY #$0C
	BCC bra_03_82A8
	LDA $068B
	AND #$01
	EOR #$01
	TAY
bra_03_82B9:
	CPY #$0A
	BCC bra_03_82C2
	LDA #$0A
	JMP _loc_03_82C4
bra_03_82C2:
	LDA #$29
_loc_03_82C4:
	STA интеллект_бота,Y
	INY
	INY
	CPY #$0C
	BCC bra_03_82B9
	LDX игрок_с_мячом
	LDA режим_игры_на_поле
	AND #$04
	BNE bra_03_8319
	LDA координата_подающего_Y_hi
	BEQ bra_03_82E5
	LDA координата_подающего_Y_lo
	CMP #$58
	BNE bra_03_82EF
	JMP _loc_03_8304
bra_03_82E5:
	LDA координата_подающего_Y_lo
	CMP #$30
	BNE bra_03_82EF
	JMP _loc_03_8304
bra_03_82EF:
	LDA $068A
	TAY
	LDA table_03_8334,Y
	STA интеллект_бота,X
	LDA $0668,X
	AND #$F0
	ORA #$01
	STA $0668,X
	RTS
_loc_03_8304:
	LDA $068A
	TAY
	LDA table_03_8331,Y
	STA интеллект_бота,X
	LDA $0668,X
	AND #$F0
	ORA #$01
	STA $0668,X
	RTS
bra_03_8319:
	LDA $068A
	TAY
	LDA table_03_832E,Y
	STA интеллект_бота,X
	LDA $0668,X
	AND #$F0
	ORA #$01
	STA $0668,X
	RTS

table_03_832E:
.byte $15,$16,$17

table_03_8331:
.byte $18,$19,$1A

table_03_8334:
.byte $1B,$1C,$1D,$1E,$1F

_loc_03_8339:
	LDA номер_действия,X
	BPL bra_03_8346
	LDA позиция_управление,X
	BPL bra_03_8346
	JMP _loc_03_8347
bra_03_8346:
	RTS

_loc_03_8347:
	LDA интеллект_бота,X
	ASL
	TAY
	LDA таблица_логики_интеллекта,Y
	STA $2C
	LDA таблица_логики_интеллекта + 1,Y
	STA $2D
	JMP ($002C)

таблица_логики_интеллекта:
.word _логика_интеллекта_00
.word _логика_интеллекта_01
.word _логика_интеллекта_02
.word _логика_интеллекта_03		; = 06, удалить все связанное с 03 и заменить на 06, или наоборот
.word _логика_интеллекта_04
.word _логика_интеллекта_05
.word _логика_интеллекта_06
.word _логика_интеллекта_07_21
.word _логика_интеллекта_08
.word _логика_интеллекта_09
.word _логика_интеллекта_0A
.word _логика_интеллекта_0B
.word _логика_интеллекта_0C
.word _логика_интеллекта_0D
.word _логика_интеллекта_0E
.word _логика_интеллекта_0F
.word _логика_интеллекта_10
.word _логика_интеллекта_11_12_13
.word _логика_интеллекта_11_12_13
.word _логика_интеллекта_11_12_13
.word _логика_интеллекта_14
.word _логика_интеллекта_15_18_1C
.word _логика_интеллекта_16_19_1E
.word _логика_интеллекта_17
.word _логика_интеллекта_15_18_1C
.word _логика_интеллекта_16_19_1E
.word _логика_интеллекта_1A_1F
.word _логика_интеллекта_1B
.word _логика_интеллекта_15_18_1C
.word _логика_интеллекта_1D
.word _логика_интеллекта_16_19_1E
.word _логика_интеллекта_1A_1F
.word _логика_интеллекта_20_22
.word _логика_интеллекта_07_21
.word _логика_интеллекта_20_22
.word _логика_интеллекта_23
.word _логика_интеллекта_24
.word _логика_интеллекта_25
.word _логика_интеллекта_26
.word _логика_интеллекта_27
.word _логика_интеллекта_28
.word _логика_интеллекта_29
.word _логика_интеллекта_2A
.word _логика_интеллекта_2B

; 83B1
_логика_интеллекта_00:
	LDA номер_движения,X
	AND #$7F
	CMP #$21
	BNE bra_03_83BF
	LDA #$0F
	JMP _loc_03_83C1
bra_03_83BF:
	LDA #$01
_loc_03_83C1:
	STA номер_действия,X
	LDA #$FF
	STA смена_угла_движения,X
	RTS

_логика_интеллекта_05:
	JSR _loc_03_840D
	CPX #$0A
	BCC bra_03_83E1
	LDA $22
	BNE bra_03_83DE
	LDA $21
	CMP #$90
	BCC bra_03_83DE
	JMP _loc_03_83E1
bra_03_83DE:
	JMP _логика_интеллекта_0D
_loc_03_83E1:
bra_03_83E1:
	LDA $21
	STA $0638,X
	LDA $22
	STA $0644,X
	CPX #$0A
	BNE bra_03_83FC
	LDA #$A0
	STA $0620,X
	LDA #$00
	STA $062C,X
	JMP _loc_03_8406
bra_03_83FC:
	LDA #$60
	STA $0620,X
	LDA #$03
	STA $062C,X
_loc_03_8406:
	JSR _loc_03_AE37
	JSR _loc_03_985F
	RTS
_loc_03_840D:
	CPX #$0A
	BNE bra_03_843C
	LDA координата_X_lo_мяча
	SEC
	SBC координата_X_lo,X
	STA $1D
	LDA координата_X_hi_мяча
	SBC координата_X_hi,X
	STA $1E
	LDA скорость_X_hi_мяча
	EOR #$FF
	STA $2D
	LDA скорость_X_lo_мяча
	EOR #$FF
	CLC
	ADC #$01
	STA $2C
	LDA $2D
	ADC #$00
	STA $2D
	JMP _loc_03_8457
bra_03_843C:
	LDA координата_X_lo,X
	SEC
	SBC координата_X_lo_мяча
	STA $1D
	LDA координата_X_hi,X
	SBC координата_X_hi_мяча
	STA $1E
	LDA скорость_X_hi_мяча
	STA $2D
	LDA скорость_X_lo_мяча
	STA $2C
_loc_03_8457:
	LDA #$00
	STA $1C
	JSR _b07_F4C1
	LDA $1C
	STA $1F
	LDA скорость_Y_hi_мяча
	BMI bra_03_8478
	LDA скорость_Y_hi_мяча
	STA $1D
	LDA скорость_Y_lo_мяча
	STA $1C
	LDA #$00
	STA $1E
	JMP _loc_03_848F
bra_03_8478:
	LDA скорость_Y_hi_мяча
	EOR #$FF
	STA $1D
	LDA скорость_Y_lo_мяча
	EOR #$FF
	CLC
	ADC #$01
	STA $1C
	LDA $1D
	ADC #$00
	STA $1D
_loc_03_848F:
	JSR _b07_F59B
	LDA скорость_Y_hi_мяча
	BMI bra_03_84A9
	LDA координата_Y_lo_мяча
	CLC
	ADC $21
	STA $21
	LDA координата_Y_hi_мяча
	ADC $22
	STA $22
	JMP _loc_03_84B8
bra_03_84A9:
	LDA координата_Y_lo_мяча
	SEC
	SBC $21
	STA $21
	LDA координата_Y_hi_мяча
	SBC $22
	STA $22
_loc_03_84B8:
	RTS

; 84B9
_логика_интеллекта_07_21:
	LDA интеллект_бота,X
	CMP #$21
	BNE bra_03_84C6
	LDY table_03_84CD - 6,X
	JMP _loc_03_84C9
bra_03_84C6:
	LDY игрок_с_мячом
_loc_03_84C9:
	JSR _loc_03_99B5
	RTS

table_03_84CD:		; ??? судя по логгеру читалось нормально
					; видимо смещение рассчитано правильно заранее, вероятно для защитников
					; читается из 2х мест
.byte $03,$05,$02,$04

; 84D1:
_логика_интеллекта_08:		; бежать к сопернику и делать локоть
	LDA опция_режим_сложность
	AND #$03
	BNE bra_03_84EE
	LDA опция_режим_сложность
	AND #$80
	BEQ bra_03_84EE
	TXA
	AND #$01
	BEQ bra_03_84EE
	JSR _b07_вращение_рандома
	CMP #$30
	BCC bra_03_84EE
	JMP _логика_интеллекта_07_21
bra_03_84EE:
	LDY игрок_с_мячом
	JSR _b07_FA6D
	STA $1C
	JSR _получение_номера_поведения_игрока_в_Y
	LDA $1C
	CMP table_03_8525,Y
	BCC bra_03_8503
	JMP _логика_интеллекта_07_21
bra_03_8503:
	LDA защита_поведение,X
	AND #$C0
	CMP #$C0
	BEQ bra_03_8511
	LDA состояние_игрока,Y	; баг. в этом месте надо делать LDY игрока с мячом, потому что выше Y перезапишется поведем
	BPL bra_03_851F
bra_03_8511:
	LDA состояние_игрока,X
	BPL bra_03_851C
	LDA #$42
	STA номер_действия,X
	RTS
bra_03_851C:
	JMP _loc_03_9B57
bra_03_851F:
	LDA #$23
	STA номер_действия,X
	RTS

table_03_8525:
.byte $18,$18,$1C,$20

; 8529:
_логика_интеллекта_09:		; бежать к сопернику и делать подкат
	LDA опция_режим_сложность
	AND #$03
	BNE bra_03_8546
	LDA опция_режим_сложность
	AND #$80
	BEQ bra_03_8546
	TXA
	AND #$01
	BEQ bra_03_8546
	JSR _b07_вращение_рандома
	CMP #$30
	BCC bra_03_8546
	JMP _логика_интеллекта_07_21
bra_03_8546:
	LDA номер_скилла,X
	AND #$40
	BEQ bra_03_8550
	JMP _loc_03_85AC
_loc_03_8550:
bra_03_8550:
	LDA номер_скилла,X
	AND #$02
	BEQ bra_03_855A
	JMP _loc_03_85CD
_loc_03_855A:
bra_03_855A:
	LDY игрок_с_мячом
	JSR _b07_FA6D
	STA $1C
	JSR _получение_номера_поведения_игрока_в_Y
	LDA $1C
	CMP table_03_85A8,Y
	BCC bra_03_856F
	JMP _логика_интеллекта_07_21
bra_03_856F:
	LDA защита_поведение,X
	AND #$C0
	CMP #$C0
	BEQ bra_03_8594
	LDA позиция_управление,X
	AND #$0F
	CMP #$0C
	BCS bra_03_8594
	LDA номер_скилла,X
	AND #$02
	BNE bra_03_859F
	LDA номер_скилла,X
	AND #$08
	BNE bra_03_8594
	LDA состояние_игрока,X
	BPL bra_03_85A2
bra_03_8594:
	LDA состояние_игрока,X
	BPL bra_03_859F
	LDA #$3B
	STA номер_действия,X
	RTS
bra_03_859F:
	JMP _loc_03_9B57
bra_03_85A2:
	LDA #$22
	STA номер_действия,X
	RTS

table_03_85A8:
.byte $10,$10,$15,$1C

_loc_03_85AC:
	LDA игрок_с_мячом
	STA $1F
	JSR _loc_03_AE1A
	LDA $2A
	CMP #$30
	BCS bra_03_85CA
	LDA $2B
	CMP #$20
	BCS bra_03_85CA
	LDA $29
	BMI bra_03_85CA
	LDA #$19
	STA номер_действия,X
	RTS
bra_03_85CA:
	JMP _loc_03_8550
_loc_03_85CD:
	LDA игрок_с_мячом
	STA $1F
	JSR _loc_03_AE1A
	LDA $2A
	CMP #$30
	BCS bra_03_85F4
	LDA $2B
	CMP #$20
	BCS bra_03_85F4
	LDA $29
	BMI bra_03_85F4
	LDA #$00
	STA $1E
	STA $1F
	JSR _loc_03_B175
	LDA #$30
	STA номер_действия,X
	RTS
bra_03_85F4:
	JMP _loc_03_855A

; 85F7
_логика_интеллекта_06:
	STX $22
	TXA
	EOR #$01
	AND #$01
	STA $23
	LDA #$06
	STA $27
	LDA #$0A
	STA $28
	LDA #$02
	STA $29
	JSR _b07_F9DE
	LDA $2D
	CMP #$40
	BCS bra_03_8630
	LDA скорость_X_lo_мяча
	ORA скорость_Y_lo_мяча
	BEQ bra_03_862D
	LDA позиция_управление,X
	AND #$0F
	CMP #$0E
	BCS bra_03_862D
	JSR _получение_номера_поведения_игрока_в_Y
	CMP #$02
	BCC bra_03_8630
bra_03_862D:
	JMP _логика_интеллекта_24
bra_03_8630:
	LDY #$0C
	JSR _loc_03_99B5
	RTS

; 8636 есть несколько прыжков
_логика_интеллекта_0A:
	TXA
	AND #$01
	TAY
	LDA расстановка_команды,Y
	AND #$03
	ASL
	TAY
	LDA table_03_86E6,Y
	STA $2C
	LDA table_03_86E6 + 1,Y
	STA $2D
	TXA
	LSR
	TAY
	LDA ($2C),Y
	STA $0620,X
	TYA
	CLC
	ADC #$06
	TAY
	LDA ($2C),Y
	STA $062C,X
	TYA
	CLC
	ADC #$06
	TAY
	LDA ($2C),Y
	STA $0638,X
	TYA
	CLC
	ADC #$06
	TAY
	LDA ($2C),Y
	STA $0644,X
	TXA
	EOR игрок_с_мячом
	AND #$01
	BNE bra_03_86AA
	LDA состояние_мяча
	AND #$40
	BEQ bra_03_86AA
	LDY игрок_с_мячом
	TXA
	AND #$01
	BNE bra_03_8692
	LDA координата_X_hi,Y
	CMP #$02
	BCC bra_03_86AA
	JMP _loc_03_8699
bra_03_8692:
	LDA координата_X_hi,Y
	CMP #$02
	BCS bra_03_86AA
_loc_03_8699:
	LDA $0620,X
	CLC
	ADC #$C0
	STA $0620,X
	LDA $062C,X
	ADC #$00
	STA $062C,X
bra_03_86AA:
	TXA
	AND #$01
	BEQ _логика_интеллекта_01
	LDA $0620,X
	EOR #$FF
	CLC
	ADC #$01
	STA $0620,X
	LDA $062C,X
	EOR #$FF
	ADC #$04
	STA $062C,X
_логика_интеллекта_01:
	JSR _loc_03_AE37
	JSR _loc_03_985F
	LDA смена_угла_движения,X
	CMP #$FF
	BNE bra_03_86E5
	JSR _b07_вращение_рандома
	CMP #$20
	BCS bra_03_86E5
	JSR _b07_вращение_рандома
	AND #$E0
	STA смена_угла_движения,X
	LDA #$20
	STA номер_действия,X
bra_03_86E5:
	RTS

table_03_86E6:		; что-то связанное с расстановкой команды
.word table_03_86E6_86EC
.word table_03_86E6_8704
.word table_03_86E6_871C

table_03_86E6_86EC:		; по 24 байта
.byte $00,$D0,$D0,$20,$20,$A0,$02,$02,$02,$01,$01,$00,$C0,$80,$00,$80,$00,$C0,$00,$00,$01,$00,$01,$00

table_03_86E6_8704:
.byte $00,$D0,$D0,$00,$00,$A0,$02,$02,$02,$02,$01,$00,$00,$80,$00,$80,$C0,$C0,$01,$00,$01,$00,$00,$00

table_03_86E6_871C:
.byte $00,$A0,$00,$20,$20,$A0,$02,$02,$02,$01,$01,$00,$00,$C0,$80,$80,$00,$C0,$01,$00,$00,$00,$01,$00

_логика_интеллекта_04:
	LDA #$09
	STA номер_действия,X
	LDA #$FF
	STA смена_угла_движения,X
	RTS

_логика_интеллекта_02:
	LDA состояние_игрока,X
	BPL bra_03_8749
	LDA #$39
	JMP _loc_03_874B
bra_03_8749:
	LDA #$0A
_loc_03_874B:
	STA номер_действия,X
	TXA
	AND #$01
	TAY
	LDA флаг_кипера_в_штрафной - $0A,Y
	CMP #$FF
	BNE bra_03_875C
	TYA
	ORA #$10
bra_03_875C:
	STA направление_паса,Y
	RTS

_логика_интеллекта_03:
	JMP _логика_интеллекта_06

_логика_интеллекта_0B:
	TXA
	AND #$01
	TAY
	LDA расстановка_команды,Y
	STA $1C
	AND #$03
	ASL
	TAY
	LDA table_03_B1F8,Y
	STA $2C
	LDA table_03_B1F8 + 1,Y
	STA $2D
	LDA $1C
	LSR
	LSR
	ASL
	TAY
	LDA ($2C),Y
	STA $2E
	INY
	LDA ($2C),Y
	STA $2F
	TXA
	LSR
	ASL
	ASL
	TAY
	LDA ($2E),Y
	STA $1C
	INY
	LDA ($2E),Y
	STA $1D
	INY
	LDA ($2E),Y
	STA $1E
	INY
	LDA ($2E),Y
	STA $1F
	TXA
	LSR
	BCC bra_03_87B6
	LDA $1D
	EOR #$FF
	CLC
	ADC #$01
	STA $1D
	LDA $1C
	EOR #$FF
	ADC #$04
	STA $1C
bra_03_87B6:
	LDA $1C
	STA $062C,X
	LDA $1D
	STA $0620,X
	LDA $1E
	STA $0644,X
	LDA $1F
	STA $0638,X
	JSR _loc_03_AE37
	JSR _loc_03_985F
	RTS

_логика_интеллекта_0C:
	TXA
	AND #$01
	TAY
	LDA расстановка_команды,Y
	AND #$03
	ASL
	TAY
	LDA table_03_9841,Y
	STA $2C
	LDA table_03_9841 + 1,Y
	STA $2D
	TXA
	ASL
	ASL
	TAY
	LDA ($2C),Y
	STA $1C
	INY
	LDA ($2C),Y
	STA $1D
	INY
	LDA ($2C),Y
	STA $1E
	INY
	LDA ($2C),Y
	STA $1F
	LDY игрок_с_мячом
	LDA координата_X_lo,Y
	CLC
	ADC $1D
	STA $0620,X
	LDA координата_X_hi,Y
	ADC $1C
	STA $062C,X
	LDA координата_Y_lo,Y
	CLC
	ADC $1F
	STA $0638,X
	LDA координата_Y_hi,Y
	ADC $1E
	STA $0644,X
	BMI bra_03_883A
	BNE bra_03_8830
	LDA $0638,X
	CMP #$30
	BCC bra_03_883A
	JMP _loc_03_8851
bra_03_8830:
	LDA $0638,X
	CMP #$60
	BCS bra_03_8847
	JMP _loc_03_8851
bra_03_883A:
	LDA #$00
	STA $0644,X
	LDA #$30
	STA $0638,X
	JMP _loc_03_8851
bra_03_8847:
	LDA #$01
	STA $0644,X
	LDA #$60
	STA $0638,X
_loc_03_8851:
	JSR _loc_03_AE37
	JSR _loc_03_985F
	RTS

; 8858 есть несколько прыжков
_логика_интеллекта_0D:		; кипер бежит на ворота если вне штрафной и соперник владеет мячом
								; если стоит на штрафной, то держать позицию и крыть углы
							; X видимо будет либо 0A либо 0B для киперов
	LDA координата_X_lo,X
	PHA
	LDA координата_X_hi,X
	PHA
	LDA координата_Y_lo,X
	PHA
	LDA координата_Y_hi,X
	PHA
	LDA table_03_89D5 - $0A,X
	STA координата_X_lo,X
	LDA table_03_89D7 - $0A,X
	STA координата_X_hi,X
	LDA table_03_89D9 - $0A,X
	STA координата_Y_lo,X
	LDA table_03_89DB - $0A,X
	STA координата_Y_hi,X
	LDY #$0C
	JSR _b07_F67D
	STA $1C
	PLA
	STA координата_Y_hi,X
	PLA
	STA координата_Y_lo,X
	PLA
	STA координата_X_hi,X
	PLA
	STA координата_X_lo,X
	CPX #$0A
	BEQ bra_03_88A4
	LDA $1C
	EOR #$FF
	CLC
	ADC #$01
	STA $1C
bra_03_88A4:
	LDA $1C
	BPL bra_03_88AA
	LDA #$7F
bra_03_88AA:
	LSR
	LSR
	LSR
	LSR
	STA $1C
	TXA
	AND #$01
	ASL
	TAY
	LDA table_03_8901,Y
	STA $2C
	LDA table_03_8901 + 1,Y
	STA $2D
	JSR _получение_номера_поведения_игрока_в_Y
	ASL
	TAY
	LDA ($2C),Y
	STA $2E
	INY
	LDA ($2C),Y
	STA $2F
	LDA $1C
	ASL
	ASL
	TAY
	LDA ($2E),Y
	STA $062C,X
	INY
	LDA ($2E),Y
	STA $0620,X
	INY
	LDA ($2E),Y
	STA $0644,X
	INY
	LDA ($2E),Y
	STA $0638,X
	JSR _loc_03_AE37
	JSR _loc_03_985F
	LDA координата_Z_hi,X
	BPL bra_03_8900
	LDA координата_Z_lo,X
	CMP #$FB
	BCS bra_03_8900
	LDA #$30
	STA номер_действия,X
bra_03_8900:
	RTS

table_03_8901:		; вероятно для каждой из двух команд
.word table_03_8901_8905
.word table_03_8901_890D

table_03_8901_8905:
.word table_03_8901_8905_8915
.word table_03_8901_8905_8935
.word table_03_8901_8905_8935
.word table_03_8901_8905_8955

table_03_8901_890D:
.word table_03_8901_890D_8975
.word table_03_8901_890D_8995
.word table_03_8901_890D_8995
.word table_03_8901_890D_89B5

table_03_8901_8905_8915:		; по 32 байта
.byte $00,$99,$00,$A1,$00,$99,$00,$AD,$00,$96,$00,$B8,$00,$95,$00,$C2,$00,$94,$00,$CA,$00,$93,$00,$D3,$00,$91,$00,$DA,$00,$91,$00,$E6

table_03_8901_8905_8935:
.byte $00,$99,$00,$A5,$00,$99,$00,$AF,$00,$A9,$00,$B7,$00,$A9,$00,$BE,$00,$A4,$00,$CA,$00,$A0,$00,$D3,$00,$91,$00,$DE,$00,$91,$00,$E5

table_03_8901_8905_8955:
.byte $00,$99,$00,$92,$00,$99,$00,$A3,$00,$BB,$00,$B1,$00,$B9,$00,$BF,$00,$B5,$00,$CC,$00,$AC,$00,$DE,$00,$91,$00,$EF,$00,$91,$00,$FE

table_03_8901_890D_8975:
.byte $03,$67,$00,$A2,$03,$67,$00,$B1,$03,$69,$00,$B6,$03,$6A,$00,$BF,$03,$6B,$00,$C6,$03,$6C,$00,$CD,$03,$6F,$00,$D6,$03,$6F,$00,$E2

table_03_8901_890D_8995:
.byte $03,$67,$00,$A3,$03,$67,$00,$AD,$03,$59,$00,$B4,$03,$52,$00,$BE,$03,$55,$00,$C8,$03,$5E,$00,$D3,$03,$6F,$00,$DD,$03,$6F,$00,$E3

table_03_8901_890D_89B5:
.byte $03,$67,$00,$93,$03,$57,$00,$A0,$03,$52,$00,$B4,$03,$47,$00,$BE,$03,$4D,$00,$CB,$03,$57,$00,$D9,$03,$6F,$00,$E7,$03,$7F,$00,$F3

table_03_89D5:		; эти 4 таблицы читаются из 2х мест
					; во втором месте при X = 0A и 0B для киперов
.byte $88,$78

table_03_89D7:
.byte $00,$03

table_03_89D9:
.byte $C0,$C0

table_03_89DB:
.byte $00,$00

_логика_интеллекта_0E:		; кипер отбивает или ловит мяч понизу
	JSR _получение_номера_поведения_игрока_в_Y
	LDA table_03_8AC4,Y
	CMP адрес_рандома
	BCS bra_03_89EB
	JMP _логика_интеллекта_05
bra_03_89EB:
	LDA координата_Z_hi_мяча
	BMI bra_03_8A04
	LDA координата_Z_lo_мяча
	SEC
	SBC координата_Z_lo,X
	CMP #$20
	BCC bra_03_8A04
	LDA скорость_Z_hi_мяча
	BPL bra_03_8A46
	CMP #$FC
	BCS bra_03_8A46
bra_03_8A04:
	JSR _loc_03_8A9C
	LDA $22
	BNE bra_03_8A14
	LDA $21
	CMP #$90
	BCC bra_03_8A14
	JMP _loc_03_8A17
bra_03_8A14:
	JMP _логика_интеллекта_0D
_loc_03_8A17:
	LDA $1D
	BEQ bra_03_8A1E
	JMP _логика_интеллекта_05
bra_03_8A1E:
	LDA $1C
	CMP #$06
	BCS bra_03_8A27
	JMP _логика_интеллекта_05
bra_03_8A27:
	LDA $1E
	BPL bra_03_8A30
	LDA #$80
	JMP _loc_03_8A32
bra_03_8A30:
	LDA #$00
_loc_03_8A32:
	STA смена_угла_движения,X
	LDA $1C
	CMP #$14
	BCS bra_03_8A40
	LDA #$29
	JMP _loc_03_8A42
bra_03_8A40:
	LDA #$28
_loc_03_8A42:
	STA номер_действия,X
	RTS
bra_03_8A46:
	JSR _loc_03_8A9C
	LDA $22
	BNE bra_03_8A56
	LDA $21
	CMP #$90
	BCC bra_03_8A56
	JMP _loc_03_8A59
bra_03_8A56:
	JMP _логика_интеллекта_0D
_loc_03_8A59:
	LDA $1D
	BEQ bra_03_8A60
	JMP _логика_интеллекта_05
bra_03_8A60:
	LDA $1C
	CMP #$0C
	BCS bra_03_8A7D
	LDA #$FF
	STA смена_угла_движения,X
	LDA защита_поведение,X
	CMP #$80
	BCS bra_03_8A77
	LDA #$52
	JMP _loc_03_8A79
bra_03_8A77:
	LDA #$54
_loc_03_8A79:
	STA номер_действия,X
	RTS
bra_03_8A7D:
	LDA $1E
	BPL bra_03_8A86
	LDA #$80
	JMP _loc_03_8A88
bra_03_8A86:
	LDA #$00
_loc_03_8A88:
	STA смена_угла_движения,X
	LDA $1C
	CMP #$14
	BCS bra_03_8A96
	LDA #$3F
	JMP _loc_03_8A98
bra_03_8A96:
	LDA #$3E
_loc_03_8A98:
	STA номер_действия,X
	RTS
_loc_03_8A9C:
	JSR _loc_03_840D
	LDA координата_Y_lo,X
	SEC
	SBC $21
	STA $1C
	LDA координата_Y_hi,X
	SBC $22
	STA $1D
	STA $1E
	BPL bra_03_8AC3
	LDA $1C
	EOR #$FF
	CLC
	ADC #$01
	STA $1C
	LDA $1D
	EOR #$FF
	ADC #$00
	STA $1D
bra_03_8AC3:
	RTS

table_03_8AC4:
.byte $80,$C0,$C0,$FF

_логика_интеллекта_0F:
	LDA опция_режим_сложность
	AND #$03
	BNE bra_03_8AE5
	JSR _b07_вращение_рандома
	CMP #$04
	BCS bra_03_8AE5
	LDA #$0A
	STA номер_действия,X
	TXA
	AND #$01
	TAY
	LDA #$10
	STA направление_паса,Y
	RTS
bra_03_8AE5:
	TXA
	AND #$01
	TAY
	LDA расстановка_команды,Y
	AND #$03
	ASL
	ASL
	ASL
	ASL
	STA $2C
	TXA
	AND #$0E
	ORA $2C
	STA $2C
	LDA сила_игрока,X
	AND #$01
	ORA $2C
	ASL
	TAY
	LDA table_03_B76E,Y
	STA $2C
	LDA table_03_B76E + 1,Y
	STA $2D
	LDA позиция_управление,X
	AND #$0F
	STA $2E
	LDA сила_игрока,X
	AND #$07
	SEC
	SBC #$03
	CLC
	ADC $2E
	BMI bra_03_8B2B
	CMP #$10
	BCC bra_03_8B2D
	LDA #$0F
	JMP _loc_03_8B2D
bra_03_8B2B:
	LDA #$00
_loc_03_8B2D:
bra_03_8B2D:
	LSR
	AND #$FE
	STA $2E
	LDA защита_поведение,X
	AND #$C0
	LSR
	LSR
	LSR
	ORA $2E
	TAY
	LDA ($2C),Y
	STA $2E
	INY
	LDA ($2C),Y
	STA $2F
	LDY #$00
_loc_03_8B48:
	LDA ($2E),Y
	BPL bra_03_8B67
	LDA table_03_B926
	STA $2E
	LDA table_03_B926 + 1
	STA $2F
	LDA сила_игрока,X
	AND #$1F
	CMP #$1C
	BCC bra_03_8B61
	LDA #$1B
bra_03_8B61:
	ASL
	ASL
	TAY
	JMP _loc_03_8B48
bra_03_8B67:
	STA $062C,X
	INY
	LDA ($2E),Y
	STA $0620,X
	INY
	LDA ($2E),Y
	STA $0644,X
	INY
	LDA ($2E),Y
	STA $0638,X
	TXA
	AND #$01
	BEQ bra_03_8B96
	LDA $0620,X
	EOR #$FF
	CLC
	ADC #$01
	STA $0620,X
	LDA $062C,X
	EOR #$FF
	ADC #$04
	STA $062C,X
bra_03_8B96:
	JSR _loc_03_AE37
	LDA #$10
	STA $1E
	STA $1F
	JSR _loc_03_B175
	LDA позиция_управление,X
	AND #$40
	BEQ bra_03_8BAC
	JMP _логика_интеллекта_14
bra_03_8BAC:
	JSR _loc_03_99F4
	LDA смена_угла_движения,X
	LSR
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA table_03_9AAE,Y
	STA $1C
	JSR _loc_03_8F70
	BNE bra_03_8BC8
	JSR _loc_03_9AE4
	JMP _loc_03_8D04
bra_03_8BC8:
	JSR _loc_03_9ABA
	JMP _loc_03_8DA2
_loc_03_8BCE:
	LDA $2A
	BMI bra_03_8BDC
	LDA #$00
	LSR $1C
	ROR
	ORA $1C
	JMP _loc_03_8BE3
bra_03_8BDC:
	LDA #$00
	ASL $1C
	ROL
	ORA $1C
_loc_03_8BE3:
	STA $1C
	JSR _loc_03_8F70
	BNE bra_03_8BED
	JMP _loc_03_8D04
bra_03_8BED:
	LDA $2A
	BMI bra_03_8BFE
	LDA #$00
	ASL $1C
	ROL
	ASL $1C
	ROL
	ORA $1C
	JMP _loc_03_8C08
bra_03_8BFE:
	LDA #$00
	LSR $1C
	ROR
	LSR $1C
	ROR
	ORA $1C
_loc_03_8C08:
	STA $1C
	JSR _loc_03_8F70
	BNE bra_03_8C12
	JMP _loc_03_8D04
bra_03_8C12:
	LDA $2A
	BMI bra_03_8C26
	LDA #$00
	LSR $1C
	ROR
	LSR $1C
	ROR
	LSR $1C
	ROR
	ORA $1C
	JMP _loc_03_8C33
bra_03_8C26:
	LDA #$00
	ASL $1C
	ROL
	ASL $1C
	ROL
	ASL $1C
	ROL
	ORA $1C
_loc_03_8C33:
	STA $1C
	JSR _loc_03_8F70
	BNE bra_03_8C3D
	JMP _loc_03_8D04
bra_03_8C3D:
	LDA $2A
	BMI bra_03_8C54
	LDA #$00
	ASL $1C
	ROL
	ASL $1C
	ROL
	ASL $1C
	ROL
	ASL $1C
	ROL
	ORA $1C
	JMP _loc_03_8C64
bra_03_8C54:
	LDA #$00
	LSR $1C
	ROR
	LSR $1C
	ROR
	LSR $1C
	ROR
	LSR $1C
	ROR
	ORA $1C
_loc_03_8C64:
	STA $1C
	JSR _loc_03_8F70
	BNE bra_03_8C6E
	JMP _loc_03_8D04
bra_03_8C6E:
	LDA $2A
	BMI bra_03_8C88
	LDA #$00
	LSR $1C
	ROR
	LSR $1C
	ROR
	LSR $1C
	ROR
	LSR $1C
	ROR
	LSR $1C
	ROR
	ORA $1C
	JMP _loc_03_8C9B
bra_03_8C88:
	LDA #$00
	ASL $1C
	ROL
	ASL $1C
	ROL
	ASL $1C
	ROL
	ASL $1C
	ROL
	ASL $1C
	ROL
	ORA $1C
_loc_03_8C9B:
	STA $1C
	JSR _loc_03_8F70
	BNE bra_03_8CA5
	JMP _loc_03_8D04
bra_03_8CA5:
	LDA $2A
	BMI bra_03_8CC2
	LDA #$00
	ASL $1C
	ROL
	ASL $1C
	ROL
	ASL $1C
	ROL
	ASL $1C
	ROL
	ASL $1C
	ROL
	ASL $1C
	ROL
	ORA $1C
	JMP _loc_03_8CD8
bra_03_8CC2:
	LDA #$00
	LSR $1C
	ROR
	LSR $1C
	ROR
	LSR $1C
	ROR
	LSR $1C
	ROR
	LSR $1C
	ROR
	LSR $1C
	ROR
	ORA $1C
_loc_03_8CD8:
	STA $1C
	JSR _loc_03_8F70
	BNE bra_03_8CE2
	JMP _loc_03_8D04
bra_03_8CE2:
	LDA $2A
	BMI bra_03_8CF0
	LDA #$00
	ASL $1C
	ROL
	ORA $1C
	JMP _loc_03_8CF7
bra_03_8CF0:
	LDA #$00
	LSR $1C
	ROR
	ORA $1C
_loc_03_8CF7:
	STA $1C
	JSR _loc_03_8F70
	BNE bra_03_8D01
	JMP _loc_03_8D04
_loc_03_8D01:
bra_03_8D01:
	JMP _loc_03_8D01
_loc_03_8D04:
	LDA $1C
	STA $2B
	TXA
	AND #$01
	EOR #$01
	TAY
	LDA дистанция_ближайшего,Y
	CMP #$18
	BCS bra_03_8D2C
	LDA номер_ближайшего,Y
	TAY
	JSR _loc_03_AEBF
	BCC bra_03_8D2C
	TXA
	AND #$01
	TAY
	LDA $05D3,Y
	AND #$03
	BNE bra_03_8D2C
	JMP _логика_интеллекта_11_12_13
bra_03_8D2C:
	LDA $2B
	STA $1C
	JSR _b07_вращение_рандома
	AND #$07
	STA $1D
	LDA $0668,X
	AND #$F0
	ORA $1D
	ORA #$01
	STA $0668,X
	LDA #$00
	STA $1D
_loc_03_8D47:
	LDA $1C
	AND #$01
	BNE bra_03_8D59
	LSR $1C
	LDA $1D
	CLC
	ADC #$20
	STA $1D
	JMP _loc_03_8D47
bra_03_8D59:
	LDA $1D
	STA смена_угла_движения,X
_loc_03_8D5E:
	AND #$60
	BNE bra_03_8D89
	LDA номер_движения,X
	AND #$7F
	CMP #$21
	BNE bra_03_8D70
	LDA #$0F
	JMP _loc_03_8D85
bra_03_8D70:
	LDA состояние_игрока,X
	AND #$20
	BEQ bra_03_8D83
	LDA координата_Z_lo,X
	CMP #$F0
	BCS bra_03_8D83
	LDA #$30
	JMP _loc_03_8D85
bra_03_8D83:
	LDA #$20
_loc_03_8D85:
	STA номер_действия,X
	RTS
bra_03_8D89:
	LDA состояние_игрока,X
	AND #$20
	BEQ bra_03_8D9C
	LDA координата_Z_lo,X
	CMP #$F0
	BCS bra_03_8D9C
	LDA #$30
	JMP _loc_03_8D9E
bra_03_8D9C:
	LDA #$21
_loc_03_8D9E:
	STA номер_действия,X
	RTS
_loc_03_8DA2:
	LDA опция_режим_сложность
	AND #$03
	BNE bra_03_8DAC
	JMP _loc_03_8BCE
bra_03_8DAC:
	LDA номер_скилла,X
	AND #$04
	BEQ bra_03_8DBE
	LDA скорость_X_hi,X
	ORA скорость_Y_hi,X
	BEQ bra_03_8DBE
	JMP _loc_03_8F12
bra_03_8DBE:
	LDA номер_скилла,X
	AND #$80
	BEQ bra_03_8DCF
	LDA угол_движения,X
	AND #$60
	BEQ bra_03_8DCF
	JMP _loc_03_8EDF
bra_03_8DCF:
	TXA
	AND #$01
	TAY
	LDA $05D3,Y
	AND #$03
	BNE bra_03_8DDD
	JMP _loc_03_8EB8
bra_03_8DDD:
	TXA
	AND #$01
	TAY
	LDA номер_команды,Y
	AND #$0F
	ASL
	TAY
	LDA table_03_8DF5,Y
	STA $1D
	LDA table_03_8DF5 + 1,Y
	STA $1E
	JMP _loc_03_9812

table_03_8DF5:
.word table_03_8DF5_8E15
.word table_03_8DF5_8E35
.word table_03_8DF5_8E55
.word table_03_8DF5_8E35
.word table_03_8DF5_8E15
.word table_03_8DF5_8E35
.word table_03_8DF5_8E75
.word table_03_8DF5_8E35
.word table_03_8DF5_8E15
.word table_03_8DF5_8E35
.word table_03_8DF5_8E35
.word table_03_8DF5_8E95
.word table_03_8DF5_8E15
.word table_03_8DF5_8E35
.word table_03_8DF5_8E35
.word table_03_8DF5_8E35

table_03_8DF5_8E15:
.word table_03_8DF5_off_8F06
.word table_03_8DF5_off_8ED9
.word table_03_8DF5_off_8EDF
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8EB8
.word table_03_8DF5_off_8ED9
.word table_03_8DF5_off_8EDF
.word table_03_8DF5_off_8ED6
.word table_03_8DF5_off_8EDF
.word table_03_8DF5_off_8ED9
.word table_03_8DF5_off_8ED6
.word table_03_8DF5_off_8EB8
.word table_03_8DF5_off_8ED9
.word table_03_8DF5_off_8EDF
.word table_03_8DF5_off_8EC7

table_03_8DF5_8E35:
.word table_03_8DF5_off_8EB5
.word table_03_8DF5_off_8EB8
.word table_03_8DF5_off_8ED9
.word table_03_8DF5_off_8EB8
.word table_03_8DF5_off_8EB5
.word table_03_8DF5_off_8EB8
.word table_03_8DF5_off_8EB8
.word table_03_8DF5_off_8EB8
.word table_03_8DF5_off_8EB5
.word table_03_8DF5_off_8ED9
.word table_03_8DF5_off_8EDF
.word table_03_8DF5_off_8F12
.word table_03_8DF5_off_8EB5
.word table_03_8DF5_off_8ED9
.word table_03_8DF5_off_8EDF
.word table_03_8DF5_off_8EC7

table_03_8DF5_8E55:
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8ED9
.word table_03_8DF5_off_8F0C
.word table_03_8DF5_off_8F0C
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8F12
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8F12
.word table_03_8DF5_off_8F12

table_03_8DF5_8E75:
.word table_03_8DF5_off_8F0C
.word table_03_8DF5_off_8EB8
.word table_03_8DF5_off_8EB8
.word table_03_8DF5_off_8F0C
.word table_03_8DF5_off_8F2E
.word table_03_8DF5_off_8EB8
.word table_03_8DF5_off_8EB8
.word table_03_8DF5_off_8F0C
.word table_03_8DF5_off_8F0C
.word table_03_8DF5_off_8EB8
.word table_03_8DF5_off_8EB8
.word table_03_8DF5_off_8ED9
.word table_03_8DF5_off_8F2E
.word table_03_8DF5_off_8EB8
.word table_03_8DF5_off_8EB8
.word table_03_8DF5_off_8ED9

table_03_8DF5_8E95:
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8F3A
.word table_03_8DF5_off_8F3A
.word table_03_8DF5_off_8F12
.word table_03_8DF5_off_8ED9
.word table_03_8DF5_off_8F0C
.word table_03_8DF5_off_8F0C
.word table_03_8DF5_off_8EDF
.word table_03_8DF5_off_8F3A
.word table_03_8DF5_off_8F3A
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8F12
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8EC7
.word table_03_8DF5_off_8EC7

_loc_03_8EB5:
bra_03_8EB5:
table_03_8DF5_off_8EB5:
	JMP _loc_03_8BCE

_loc_03_8EB8:
table_03_8DF5_off_8EB8:
	TXA
	AND #$01
	LDA $05D3,Y
	AND #$03
	CMP #$02
	BEQ bra_03_8EB5
	JMP _логика_интеллекта_11_12_13

table_03_8DF5_off_8EC7:
	TXA
	AND #$01
	LDA $05D3,Y
	AND #$0C
	CMP #$08
	BEQ bra_03_8EB5
	JMP _логика_интеллекта_23

table_03_8DF5_off_8ED6:
	JMP _loc_03_8D04

table_03_8DF5_off_8ED9:
	LDA #$10
	STA номер_действия,X
	RTS

_loc_03_8EDF:
table_03_8DF5_off_8EDF:
	LDY $2C
	LDA координата_Y_lo,Y
	SEC
	SBC координата_Y_lo,X
	LDA координата_Y_hi,Y
	SBC координата_Y_hi,X
	BPL bra_03_8EFB
	LDA #$00
	STA смена_угла_движения,X
	LDA #$24
	STA номер_действия,X
	RTS
bra_03_8EFB:
	LDA #$80
	STA смена_угла_движения,X
	LDA #$24
	STA номер_действия,X
	RTS

table_03_8DF5_off_8F06:
	LDA #$0F
	STA номер_действия,X
	RTS

table_03_8DF5_off_8F0C:
	LDA #$0D
	STA номер_действия,X
	RTS

_loc_03_8F12:
table_03_8DF5_off_8F12:
	LDA состояние_игрока,X
	AND #$10
	BEQ bra_03_8F1E
	LDA #$10
	JMP _loc_03_8F2A
bra_03_8F1E:
	LDA угол_движения,X
	CMP #$FF
	BNE bra_03_8F28
	JMP _loc_03_8EB5
bra_03_8F28:
	LDA #$30
_loc_03_8F2A:
	STA номер_действия,X
	RTS

table_03_8DF5_off_8F2E:
	LDA смена_угла_движения,X
	CLC
	ADC #$80
	STA смена_угла_движения,X
	JMP _loc_03_8D5E

table_03_8DF5_off_8F3A:
	TXA
	AND #$01
	LDA $05D3,Y
	AND #$03
	CMP #$02
	BNE bra_03_8F49
	JMP _loc_03_8EB5
bra_03_8F49:
	LDA координата_Z_hi,X
	BMI bra_03_8F58
	LDA координата_Z_lo,X
	BEQ bra_03_8F58
	CMP #$0A
	BCS bra_03_8F6A
	RTS
bra_03_8F58:
	LDA состояние_игрока,X
	AND #$10
	BEQ bra_03_8F64
	LDA #$10
	JMP _loc_03_8F66
bra_03_8F64:
	LDA #$30
_loc_03_8F66:
	STA номер_действия,X
	RTS
bra_03_8F6A:
	LDA #$39
	STA номер_действия,X
	RTS
_loc_03_8F70:
	LDA $1C
	AND $0689
	BNE bra_03_8F89
	LDA $1C
	AND $0688
	BNE bra_03_8F81
	JMP _loc_03_8F8C
bra_03_8F81:
	JSR _loc_03_8F8F
	BNE bra_03_8F89
	JMP _loc_03_8F8C
bra_03_8F89:
	LDA #$FF
	RTS
_loc_03_8F8C:
	LDA #$00
	RTS
_loc_03_8F8F:
	LDA позиция_управление,X
	AND #$0F
	BEQ bra_03_8FA8
	STA $1D
	LDA защита_поведение,X
	LSR
	LSR
	LSR
	LSR
	ADC $1D
	CMP #$10
	BCS bra_03_8FA8
	LDA #$FF
	RTS
bra_03_8FA8:
	LDA #$00
	RTS

_логика_интеллекта_10:
	TXA
	AND #$01
	TAY
	LDA флаг_кипера_в_штрафной - $0A,Y
	STA смена_угла_движения,X
	LDA #$20
	STA номер_действия,X
	RTS

; 8FBB есть несколько прыжков
_логика_интеллекта_11_12_13:
	LDA координата_Y_hi,X
	BNE bra_03_8FCA
	LDA координата_Y_lo,X
	CMP #$40
	BCC bra_03_8FD4
	JMP _loc_03_8FE4
bra_03_8FCA:
	LDA координата_Y_lo,X
	CMP #$50
	BCS bra_03_8FDC
	JMP _loc_03_8FE4
bra_03_8FD4:
	LDA #$80
	STA направление_паса,X
	JMP _loc_03_9038
bra_03_8FDC:
	LDA #$00
	STA направление_паса,X
	JMP _loc_03_9038
_loc_03_8FE4:
	TXA
	AND #$01
	TAY
	LDA #$80
	STA $21
	JSR _loc_03_B034
	LDY #$00
	LDA адрес_рандома
	BPL bra_03_8FF9
	INY
	INY
	INY
_loc_03_8FF9:
bra_03_8FF9:
	LDA $2C,Y
	BMI bra_03_9025
	STY $44
	TAY
	LDA номер_движения,Y
	LDY $44
	AND #$7F
	CMP #$04
	BEQ bra_03_901F
	CMP #$05
	BEQ bra_03_901F
	CMP #$2D
	BEQ bra_03_901F
	CMP #$2E
	BEQ bra_03_901F
	CMP #$3C
	BEQ bra_03_901F
	JMP _loc_03_9028
bra_03_901F:
	INY
	INY
	INY
	JMP _loc_03_8FF9
bra_03_9025:
	JMP _логика_интеллекта_00
_loc_03_9028:
	LDA $2C,Y
	STA $1C
	TXA
	AND #$01
	TAY
	LDA $1C
	ORA #$10
	STA направление_паса,Y
_loc_03_9038:
	LDA #$0A
	STA номер_действия,X
	RTS

; 903E 2 прыжка
_логика_интеллекта_14:
	TXA
	AND #$01
	ASL
	ASL
	TAY
	LDA table_03_90AF,Y
	STA $2E
	INY
	LDA table_03_90AF,Y
	STA $2F
	INY
	LDA table_03_90AF,Y
	STA $30
	INY
	LDA table_03_90AF,Y
	STA $31
	JSR _b07_F691
	STA $1C
	TXA
	AND #$01
	BEQ bra_03_906E
	LDA $1C
	EOR #$FF
	CLC
	ADC #$01
	STA $1C
bra_03_906E:
	LDA $1C
	CMP #$20
	BCC bra_03_907A
	CMP #$60
	BCS bra_03_907A
	BCC bra_03_907D
bra_03_907A:
	JMP _логика_интеллекта_11_12_13
bra_03_907D:
	TXA
	AND #$01
	BNE bra_03_908C
	LDA координата_X_hi,X
	CMP #$03
	BEQ bra_03_9094
	JMP _логика_интеллекта_11_12_13
bra_03_908C:
	LDA координата_X_lo,X
	BEQ bra_03_9094
	JMP _логика_интеллекта_11_12_13
bra_03_9094:
	TXA
	AND #$01
	TAY
	LDA $05D3,Y
	AND #$0C
	CMP #$08
	BNE bra_03_90A4
	JMP _логика_интеллекта_11_12_13
bra_03_90A4:
	LDA #$09
	STA номер_действия,X
	LDA #$FF
	STA смена_угла_движения,X
	RTS

table_03_90AF:		; читается из 4х мест
.byte $70,$03,$C0,$00
.byte $A0,$00,$C0,$00

_логика_интеллекта_15_18_1C:
	LDA #$0C
	STA $1F
	JSR _loc_03_AE1A
	JSR _loc_03_985F
	LDA состояние_мяча
	AND #$40
	BEQ @пропустить
	INC $068A
@пропустить:
	RTS

_логика_интеллекта_16_19_1E:
	LDA координата_подающего_X_lo
	STA $32
	LDA координата_подающего_X_hi
	STA $33
	LDA координата_подающего_Y_lo
	STA $34
	LDA координата_подающего_Y_hi
	STA $35
	JSR _loc_03_AE4B
	JSR _loc_03_985F
	LDA смена_угла_движения,X
	CMP #$FF
	BNE bra_03_90F0
	INC $068A
bra_03_90F0:
	RTS

_логика_интеллекта_17:
	LDA #$16
	STA номер_действия,X
	RTS

_логика_интеллекта_1A_1F:
	LDA #$1A
	STA номер_действия,X
	TXA
	AND #$01
	TAY
	ORA #$10
	STA направление_паса,Y
	RTS

_логика_интеллекта_1B:		; кипер идет к мячу горизонтально вверх/вниз во время goal kick
	LDA координата_X_lo,X
	STA $0620,X
	LDA координата_X_hi,X
	STA $062C,X
	LDA координата_Y_lo_мяча
	STA $0638,X
	LDA координата_Y_hi_мяча
	STA $0644,X
	JSR _loc_03_AE37
	JSR _loc_03_985F
	LDA смена_угла_движения,X
	CMP #$FF
	BNE bra_03_912E
	INC $068A
bra_03_912E:
	RTS

_логика_интеллекта_1D:
	LDA координата_Y_lo,X
	STA $0638,X
	LDA координата_Y_hi,X
	STA $0644,X
	LDA координата_подающего_X_lo
	STA $0620,X
	LDA координата_подающего_X_hi
	STA $062C,X
	JSR _loc_03_AE37
	JSR _loc_03_985F
	LDA смена_угла_движения,X
	CMP #$FF
	BNE bra_03_9157
	INC $068A
bra_03_9157:
	RTS

_логика_интеллекта_20_22:
	LDA интеллект_бота,X
	CMP #$22
	BNE bra_03_9165
	LDA table_03_84CD - 6,X
	JMP _loc_03_9167
bra_03_9165:
	LDA #$0C
_loc_03_9167:
	STA $1C
	TXA
	PHA
	AND #$01
	TAY
	LDA table_03_89D5,Y
	STA $2E
	LDA table_03_89D7,Y
	STA $2F
	LDA table_03_89D9,Y
	STA $30
	LDA table_03_89DB,Y
	STA $31
	LDX $1C
	JSR _b07_F691
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA координата_X_lo,X
	CLC
	ADC table_03_91CB,Y
	STA $2E
	LDA координата_X_hi,X
	ADC table_03_91DB,Y
	STA $2F
	LDA координата_Y_lo,X
	CLC
	ADC table_03_91EB,Y
	STA $30
	LDA координата_Y_hi,X
	ADC table_03_91FB,Y
	STA $31
	PLA
	TAX
	LDA $2E
	STA $0620,X
	LDA $2F
	STA $062C,X
	LDA $30
	STA $0638,X
	LDA $31
	STA $0644,X
	JSR _loc_03_AE37
	JSR _loc_03_985F
	RTS

table_03_91CB:
.byte $00,$15,$1E,$27,$30,$27,$1E,$15,$00,$EB,$E2,$D9,$D0,$D9,$E2,$EB

table_03_91DB:
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF

table_03_91EB:
.byte $E0,$E8,$F0,$F8,$00,$08,$10,$18,$20,$18,$10,$08,$00,$F8,$F0,$E8

table_03_91FB:
.byte $FF,$FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF

; 920B 2 прыжка
_логика_интеллекта_23:
	TXA
	AND #$01
	ASL
	ASL
	TAY
	LDA table_03_90AF,Y
	STA $2E
	INY
	LDA table_03_90AF,Y
	STA $2F
	INY
	LDA table_03_90AF,Y
	STA $30
	INY
	LDA table_03_90AF,Y
	STA $31
	JSR _b07_F691
	STA $1C
	TXA
	AND #$01
	BEQ bra_03_923B
	LDA $1C
	EOR #$FF
	CLC
	ADC #$01
	STA $1C
bra_03_923B:
	LDA $1C
	CMP #$20
	BCC bra_03_9248
	CMP #$60
	BCS bra_03_9248
	JMP _loc_03_924B
bra_03_9248:
	JMP _логика_интеллекта_11_12_13
_loc_03_924B:
	LDA защита_поведение,X
	AND #$C0
	LSR
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA table_03_9263,Y
	STA $2C
	LDA table_03_9263 + 1,Y
	STA $2D
	JMP ($002C)

table_03_9263:
.word table_03_9263_926B
.word table_03_9263_926B
.word table_03_9263_92AD
.word table_03_9263_92AD

table_03_9263_926B:
	LDA номер_скилла,X
	AND #$04
	BEQ bra_03_927E
	LDA номер_движения,X
	AND #$7F
	CMP #$21
	BNE bra_03_927E
	JMP _loc_03_92AD
bra_03_927E:
	LDA состояние_игрока,X
	BPL bra_03_928F
	LDA координата_Z_lo,X
	CMP #$12
	BCC bra_03_92AC
	LDA #$37
	JMP _loc_03_929A
bra_03_928F:
	LDA позиция_управление,X
	AND #$0F
	CMP #$0E
	BCS bra_03_92AD
	LDA #$09
_loc_03_929A:
	STA номер_действия,X
	LDA #$FF
	STA смена_угла_движения,X
	JSR _b07_вращение_рандома
	CMP #$40
	BCS bra_03_92AC
	JMP _логика_интеллекта_11_12_13
bra_03_92AC:
	RTS
_loc_03_92AD:
bra_03_92AD:
table_03_9263_92AD:
	LDA состояние_игрока,X
	BPL bra_03_92DA
	LDA адрес_рандома + 1
	BMI bra_03_92C0
	CMP #$40
	BCC bra_03_92C5
	LDA #$38
	JMP _loc_03_92C7
bra_03_92C0:
	LDA #$37
	JMP _loc_03_92C7
bra_03_92C5:
	LDA #$46
_loc_03_92C7:
	STA номер_действия,X
	LDA #$FF
	STA смена_угла_движения,X
	JSR _b07_вращение_рандома
	CMP #$40
	BCS bra_03_92D9
	JMP _логика_интеллекта_11_12_13
bra_03_92D9:
	RTS
bra_03_92DA:
	LDA состояние_игрока,X
	AND #$10
	BEQ bra_03_92E6
	LDA #$10
	JMP _loc_03_92E8
bra_03_92E6:
	LDA #$30
_loc_03_92E8:
	STA номер_действия,X
	RTS

; 92EC 2 прыжка
_логика_интеллекта_24:		; кипер бежит к мячу, но не стремится его отбивать, просто хочет поднять
	LDY #$0C
	LDA координата_Z_hi,Y
	BMI bra_03_92FD
	ORA координата_Z_lo,Y
	CMP #$18
	BCC bra_03_92FD
	JMP _loc_03_930F
bra_03_92FD:
	JSR _b07_FA6D
	LSR
	LSR
	LSR
	STA $1C
	JSR _loc_03_98D0
	JSR _loc_03_AE4B
	JSR _loc_03_985F
	RTS
_loc_03_930F:
	JSR _получение_номера_поведения_игрока_в_Y
	STA $1C
	LDA table_03_936E,Y
	CMP $0524
	BCS bra_03_9337
bra_03_931C:
	LDA $0524
	SEC
	SBC $1C
	BPL bra_03_9326
	LDA #$00
bra_03_9326:
	STA $1C
	LDY #$0C
	JSR _loc_03_98D0
	JSR _loc_03_9B75
	JSR _loc_03_AE4B
	JSR _loc_03_985F
	RTS
bra_03_9337:
	JSR _b07_вращение_рандома
	BPL bra_03_931C
	LDY #$0C
	JSR _b07_FA6D
	CMP #$30
	BCS bra_03_931C
	LDA #$0C
	STA $1F
	JSR _loc_03_AE1A
	JSR _loc_03_B175
	LDA table_03_9372,Y
	STA $1F
	STA $1E
	JSR _loc_03_B175
	LDA смена_угла_движения,X
	CMP #$FF
	BEQ bra_03_9368
	CMP угол_движения,X
	BEQ bra_03_9368
	JMP _loc_03_9B57
bra_03_9368:
	LDA #$30
	STA номер_действия,X
	RTS

table_03_936E:
.byte $09,$09,$0A,$0B

table_03_9372:	; читается из 2х мест
.byte $10,$0C,$08,$08

; 9376 2 прыжка
_логика_интеллекта_25:
	LDY #$0C
	LDA координата_Z_hi,Y
	BMI bra_03_9387
	LDA координата_Z_lo,Y
	CMP #$18
	BCC bra_03_9387
	JMP _loc_03_93F4
bra_03_9387:
	JSR _b07_FA6D
	LSR
	LSR
	LSR
	STA $1C
	JSR _loc_03_98D0
	JSR _loc_03_AE4B
	LDA $2B
	CMP #$08
	BCS bra_03_93F0
	TXA
	AND #$01
	BNE bra_03_93BD
	LDA $1C
	BMI bra_03_93F0
	CMP #$20
	BCC bra_03_93F0
	CMP #$38
	BCS bra_03_93F0
	LDA номер_анимации,X
	BMI bra_03_93F0
	LDA координата_Y_lo,X
	CMP #$90
	BCC bra_03_93F0
	LDA #$40
	JMP _loc_03_93D7
bra_03_93BD:
	LDA $1C
	BPL bra_03_93F0
	CMP #$E0
	BCS bra_03_93F0
	CMP #$C8
	BCC bra_03_93F0
	LDA номер_анимации,X
	BPL bra_03_93F0
	LDA координата_Y_lo,X
	CMP #$90
	BCC bra_03_93F0
	LDA #$C0
_loc_03_93D7:
	STA смена_угла_движения,X
	LDA #$31
	STA номер_действия,X
	TXA
	AND #$01
	TAY
	LDA приказ_боту,Y
	CMP #$02
	BNE bra_03_93EF
	LDA #$FF
	STA приказ_боту,Y
bra_03_93EF:
	RTS
bra_03_93F0:
	JSR _loc_03_985F
	RTS
_loc_03_93F4:
	JSR _получение_номера_поведения_игрока_в_Y
	STA $1C
	LDA table_03_948F,Y
	CMP $0524
	BCS bra_03_941C
bra_03_9401:
	LDA $0524
	SEC
	SBC $1C
	BPL bra_03_940B
	LDA #$00
bra_03_940B:
	STA $1C
	LDY #$0C
	JSR _loc_03_98D0
	JSR _loc_03_9B75
	JSR _loc_03_AE4B
	JSR _loc_03_985F
	RTS
bra_03_941C:
	LDY #$0C
	JSR _b07_FA6D
	CMP #$40
	BCS bra_03_9401
	LDA состояние_игрока,X
	BPL bra_03_9466
	LDY #$0C
	JSR _loc_03_AEBF
	BCC bra_03_9401
	LDA адрес_рандома
	BPL bra_03_9401
	JSR _b07_вращение_рандома
	CMP #$A0
	BCS bra_03_9446
	CMP #$50
	BCS bra_03_944B
	LDA #$32
	JMP _loc_03_944D
bra_03_9446:
	LDA #$33
	JMP _loc_03_944D
bra_03_944B:
	LDA #$34
_loc_03_944D:
	STA номер_действия,X
	LDA #$FF
	STA смена_угла_движения,X
	TXA
	AND #$01
	TAY
	LDA приказ_боту,Y
	CMP #$02
	BNE bra_03_9465
	LDA #$FF
	STA приказ_боту,Y
bra_03_9465:
	RTS
bra_03_9466:
	LDA #$0C
	STA $1F
	JSR _loc_03_AE1A
	JSR _loc_03_B175
	LDA table_03_9372,Y
	STA $1F
	STA $1E
	JSR _loc_03_B175
	LDA смена_угла_движения,X
	CMP #$FF
	BEQ bra_03_9489
	CMP угол_движения,X
	BEQ bra_03_9489
	JMP _loc_03_9B57
bra_03_9489:
	LDA #$30
	STA номер_действия,X
	RTS

table_03_948F:
.byte $0D,$0D,$0E,$0F

_логика_интеллекта_26:
	TXA
	AND #$01
	TAY
	LDA table_03_94A3,Y
	STA смена_угла_движения,X
	LDA #$21
	STA номер_действия,X
	RTS

table_03_94A3:
.byte $C0,$40

_логика_интеллекта_27:		; кипер бежит на центр зоны с мячом чтобы затем отдать пас капитану
	TXA
	SEC
	SBC #$0A
	ASL
	ASL
	TAY
	LDA table_03_952B,Y
	STA $0620,X
	LDA table_03_952B + 1,Y
	STA $062C,X
	LDA table_03_952B + 2,Y
	STA $0638,X
	LDA table_03_952B + 3,Y
	STA $0644,X
	JSR _loc_03_AE37
	LDA #$04
	STA $1E
	STA $1F
	JSR _loc_03_B175
	LDA смена_угла_движения,X
	CMP #$FF
	BNE bra_03_9518
	TXA
	AND #$01
	TAY
	LDA номер_движения,Y
	AND #$7F
	CMP #$04
	BEQ bra_03_9512
	CMP #$05
	BEQ bra_03_9512
	CMP #$02
	BEQ bra_03_9512
	CMP #$2D
	BEQ bra_03_9512
	CMP #$2E
	BEQ bra_03_9512
	CMP #$3C
	BEQ bra_03_9512
	CMP #$3D
	BEQ bra_03_9512
	CMP #$59
	BEQ bra_03_9512
	CMP #$5A
	BEQ bra_03_9512
	LDA #$0A
	STA номер_действия,X
	TXA
	AND #$01
	ORA #$10
	STA номер_ближайшего,X
	RTS
bra_03_9512:
	LDA #$01
	STA номер_действия,X
	RTS
bra_03_9518:
	LDA состояние_игрока,X
	AND #$08
	BNE bra_03_9525
	LDA #$20
	STA номер_действия,X
	RTS
bra_03_9525:
	LDA #$0F
	STA номер_действия,X
	RTS

table_03_952B:
.byte $C2,$00,$C0,$00
.byte $47,$03,$C0,$00

_логика_интеллекта_28:
	TXA
	EOR #$01
	AND #$01
	TAY
	LDA номер_ближайшего,Y
	TAY
	STY $44
	LDA состояние_игрока,Y
	BMI bra_03_9547
	JMP _loc_03_95FE
bra_03_9547:
	JSR _b07_FA6D
	LSR
	LSR
	LSR
	LSR
	LSR
	STA $1C
	JSR _loc_03_98D0
	STY $1F
	JSR _loc_03_AE4B
	LDA $2B
	CMP #$08
	BCS bra_03_9588
	LDA $2A
	CMP #$38
	BCS bra_03_9588
	CMP #$28
	BCC bra_03_9588
	LDA флаг_кипера_в_штрафной - $0A,X
	BMI bra_03_9588
	LDA #$00
	STA $1E
	STA $1F
	JSR _loc_03_B175
	LDA смена_угла_движения,X
	AND #$80
	CLC
	ADC #$40
	STA смена_угла_движения,X
	LDA #$41
	STA номер_действия,X
	RTS
bra_03_9588:
	LDA $2B
	CMP #$08
	BCS bra_03_95B3
	LDA $2A
	CMP #$28
	BCS bra_03_95B3
	LDA флаг_кипера_в_штрафной - $0A,X
	BMI bra_03_95B3
	LDA #$00
	STA $1E
	STA $1F
	JSR _loc_03_B175
	LDA смена_угла_движения,X
	AND #$80
	CLC
	ADC #$40
	STA смена_угла_движения,X
	LDA #$54
	STA номер_действия,X
	RTS
bra_03_95B3:
	LDA $2B
	CMP #$50
	BCS bra_03_95DE
	LDA $2A
	CMP #$18
	BCS bra_03_95DE
	LDA флаг_кипера_в_штрафной - $0A,X
	BMI bra_03_95DE
	LDA #$00
	STA $1E
	STA $1F
	JSR _loc_03_B175
	LDA смена_угла_движения,X
	CLC
	ADC #$40
	AND #$80
	STA смена_угла_движения,X
	LDA #$3E
	STA номер_действия,X
	RTS
bra_03_95DE:
	LDY игрок_с_мячом
	LDA $34
	STA $0638,X
	LDA $35
	STA $0644,X
	LDA координата_X_lo,X
	STA $0620,X
	LDA координата_X_hi,X
	STA $062C,X
	JSR _loc_03_AE37
	JSR _loc_03_985F
	RTS
_loc_03_95FE:
	JMP _логика_интеллекта_09
	LDA $2B
	CMP #$30
	BCS bra_03_962C
	LDA $2A
	CMP #$12
	BCS bra_03_962C
	LDA флаг_кипера_в_штрафной - $0A,X
	BMI bra_03_962C
	LDA #$00
	STA $1E
	STA $1F
	JSR _loc_03_B175
	LDA смена_угла_движения,X
	CLC
	ADC #$40
	AND #$80
	STA смена_угла_движения,X
	LDA #$28
	STA номер_действия,X
	RTS
bra_03_962C:
	JMP _логика_интеллекта_0D

_логика_интеллекта_29:
	LDA координата_Y_hi,X
	BNE bra_03_963E
	LDA координата_Y_lo,X
	CMP #$90
	BCC bra_03_964B
	JMP _loc_03_9658
bra_03_963E:
	LDA #$00
	STA $0644,X
	LDA #$FF
	STA $0638,X
	JMP _loc_03_9664
bra_03_964B:
	LDA #$00
	STA $0644,X
	LDA #$92
	STA $0638,X
	JMP _loc_03_9664
_loc_03_9658:
	LDA координата_Y_lo,X
	STA $0638,X
	LDA координата_Y_hi,X
	STA $0644,X
_loc_03_9664:
	LDA координата_X_hi,X
	BEQ bra_03_9670
	CMP #$03
	BEQ bra_03_967D
	JMP _loc_03_968A
bra_03_9670:
	LDA #$01
	STA $062C,X
	LDA #$00
	STA $0620,X
	JMP _loc_03_9696
bra_03_967D:
	LDA #$02
	STA $062C,X
	LDA #$FF
	STA $0620,X
	JMP _loc_03_9696
_loc_03_968A:
	LDA координата_X_lo,X
	STA $0620,X
	LDA координата_X_hi,X
	STA $062C,X
_loc_03_9696:
	JSR _loc_03_AE37
	JSR _loc_03_985F
	RTS

_логика_интеллекта_2A:
	LDA игрок_с_мячом
	TAY
	AND #$01
	BNE bra_03_96BB
	LDA координата_X_lo,Y
	EOR #$FF
	CLC
	ADC #$01
	STA $1C
	LDA координата_X_hi,Y
	EOR #$FF
	ADC #$04
	STA $1D
	JMP _loc_03_96C5
bra_03_96BB:
	LDA координата_X_lo,Y
	STA $1C
	LDA координата_X_hi,Y
	STA $1D
_loc_03_96C5:
	LDA $1D
	BEQ bra_03_96D3
	CMP #$02
	BCS bra_03_96E2
	LDA $1C
	CMP #$80
	BCS bra_03_96E2
bra_03_96D3:
	LDA координата_Y_hi,Y
	BNE bra_03_96E5
	LDA координата_Y_lo,Y
	CMP #$60
	BCC bra_03_96E2
	JMP _loc_03_96EC
bra_03_96E2:
	JMP _логика_интеллекта_0A
bra_03_96E5:
	LDA координата_Y_lo,Y
	CMP #$20
	BCS bra_03_96E2
_loc_03_96EC:
	JSR _b07_FA6D
	STA $1C
	JSR _получение_номера_поведения_игрока_в_Y
	LDA $1C
	CMP table_03_9729,Y
	BCS bra_03_96E2
	TXA
	AND #$01
	TAY
	LDA $05D3,Y
	AND #$30
	BEQ bra_03_9726
	CMP #$20
	BEQ bra_03_9723
	LDA счетчик_кадров
	AND #$30
	CMP #$30
	BEQ bra_03_9726
	JSR _получение_номера_поведения_игрока_в_Y
	CMP #$02
	BCS bra_03_9726
	LDA позиция_управление,X
	AND #$0F
	CMP #$0E
	BCS bra_03_9726
bra_03_9723:
	JMP _логика_интеллекта_07_21
bra_03_9726:
	JMP _логика_интеллекта_09

table_03_9729:
.byte $60,$60,$70,$80

_логика_интеллекта_2B:
	LDA состояние_мяча
	AND #$40
	BNE bra_03_9746
	LDA координата_Z_hi_мяча
	BMI bra_03_9743
	LDA координата_Z_lo_мяча
	CMP #$18
	BCC bra_03_9743
	JMP _логика_интеллекта_25
bra_03_9743:
	JMP _логика_интеллекта_06
bra_03_9746:
	LDA состояние_игрока,X
	BPL bra_03_976F
	JSR _b07_вращение_рандома
	CMP #$40
	BCS bra_03_976E
	AND #$03
	BEQ bra_03_975F
	CMP #$02
	BCS bra_03_9764
	LDA #$38
	JMP _loc_03_9766
bra_03_975F:
	LDA #$46
	JMP _loc_03_9766
bra_03_9764:
	LDA #$37
_loc_03_9766:
	STA номер_действия,X
	LDA #$FF
	STA смена_угла_движения,X
bra_03_976E:
	RTS
bra_03_976F:
	LDA $068E
	BNE bra_03_9779
	LDA #$01
	STA $068E
bra_03_9779:
	LDA $068F
	AND #$F0
	LSR
	LSR
	STA $1C
	LDA #$08
	CLC
	ADC $1C
	STA $0620,X
	LDA #$03
	ADC #$00
	STA $062C,X
	LDA $068F
	AND #$0F
	ASL
	ASL
	ASL
	STA $1C
	LDA #$84
	CLC
	ADC $1C
	STA $0638,X
	LDA #$00
	ADC #$00
	STA $0644,X
	JSR _loc_03_AE37
	LDA #$08
	STA $1E
	LDA #$05
	STA $1F
	JSR _loc_03_B175
	LDA смена_угла_движения,X
	CMP #$FF
	BNE bra_03_97C2
	JMP _loc_03_97DF
bra_03_97C2:
	AND #$70
	BEQ bra_03_97D0
	LDA #$21
	JMP _loc_03_97DB
bra_03_97CB:
	LDA #$0F
	JMP _loc_03_97DB
bra_03_97D0:
	LDA номер_движения,X
	AND #$7F
	CMP #$21
	BNE bra_03_97CB
	LDA #$20
_loc_03_97DB:
	STA номер_действия,X
	RTS
_loc_03_97DF:
	LDA $068E
	CMP #$01
	BNE bra_03_97EB
	LDA #$02
	STA $068E
bra_03_97EB:
	JSR _b07_вращение_рандома
	AND #$03
	BEQ bra_03_97FD
	CMP #$01
	BEQ bra_03_9802
	CMP #$02
	BEQ bra_03_9807
	JMP _loc_03_980C
bra_03_97FD:
	LDA #$30
	JMP _loc_03_980E
bra_03_9802:
	LDA #$10
	JMP _loc_03_980E
bra_03_9807:
	LDA #$0E
	JMP _loc_03_980E
_loc_03_980C:
	LDA #$09
_loc_03_980E:
	STA номер_действия,X
	RTS

_loc_03_9812:
	LDA защита_поведение,X
	AND #$C0
	LSR
	LSR
	LSR
	LSR
	STA $1F
	LDA адрес_рандома
	AND #$07
	SEC
	SBC #$04
	STA $20
	LDA позиция_управление,X
	CLC
	ADC $20
	AND #$0F
	LSR
	LSR
	ORA $1F
	ASL
	TAY
	LDA ($1D),Y
	STA $1F
	INY
	LDA ($1D),Y
	STA $20
	JMP ($001F)

table_03_9841:		; что-то связано с расстановкой
					; хрен знает зачем тут одинаковое
.word table_03_9841_9847
.word table_03_9841_9847
.word table_03_9841_9847

table_03_9841_9847:
.byte $FF,$D0,$00,$30
.byte $00,$36,$FF,$BB
.byte $00,$51,$FF,$BB
.byte $FF,$B8,$FF,$BC
.byte $00,$57,$00,$41
.byte $FF,$B4,$00,$3D

; первые 8 байтов здесь зеленые при X = 06 и 07, вероятно баг оригинала
_loc_03_985F:
	LDA $0668,X
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA table_03_9BC2,Y
	STA $1E
	STA $1F
	LDA номер_движения,X
	AND #$7F
	CMP #$21
	BEQ bra_03_9879
	LSR $1F
bra_03_9879:
	JSR _loc_03_B175
	LDA смена_угла_движения,X
	CMP #$FF
	BNE bra_03_9896
	LDA номер_движения,X
	AND #$7F
	CMP #$21
	BNE bra_03_9891
_loc_03_988C:
bra_03_988C:
	LDA #$0F
	JMP _loc_03_98CC
bra_03_9891:
	LDA #$01
	JMP _loc_03_98CC
bra_03_9896:
	LDA смена_угла_движения,X
	AND #$7F
	BEQ bra_03_98C1
	LDA $29
	BMI bra_03_98C1
	LDA номер_движения,X
	AND #$7F
	CMP #$21
	BEQ bra_03_98B8
	LDA $2A
	CMP #$20
	BCS bra_03_98B3
	JMP _loc_03_98C1
bra_03_98B3:
	LDA #$21
	JMP _loc_03_98CC
bra_03_98B8:
	LDA $2A
	CMP #$10
	BCS bra_03_98B3
	JMP _loc_03_988C
_loc_03_98C1:
bra_03_98C1:
	LDA номер_движения,X
	AND #$7F
	CMP #$21
	BEQ bra_03_988C
	LDA #$20
_loc_03_98CC:
	STA номер_действия,X
	RTS
_loc_03_98D0:
	LDA скорость_X_hi,Y
	ORA скорость_X_lo,Y
	BNE bra_03_98E5
	LDA координата_X_lo,Y
	STA $32
	LDA координата_X_hi,Y
	STA $33
	JMP _loc_03_993B
bra_03_98E5:
	LDA скорость_X_hi,Y
	BPL bra_03_9900
	LDA скорость_X_lo,Y
	EOR #$FF
	CLC
	ADC #$01
	STA $2C
	LDA скорость_X_hi,Y
	EOR #$FF
	ADC #$00
	STA $2D
	JMP _loc_03_990A
bra_03_9900:
	LDA скорость_X_lo,Y
	STA $2C
	LDA скорость_X_hi,Y
	STA $2D
_loc_03_990A:
	LDA #$00
	STA $2F
	LDA $1C
	STA $2E
	JSR _b07_F564
	LDA скорость_X_hi,Y
	BPL bra_03_992C
	LDA координата_X_lo,Y
	SEC
	SBC $31
	STA $32
	LDA координата_X_hi,Y
	SBC #$00
	STA $33
	JMP _loc_03_993B
bra_03_992C:
	LDA координата_X_lo,Y
	CLC
	ADC $31
	STA $32
	LDA координата_X_hi,Y
	ADC #$00
	STA $33
_loc_03_993B:
	LDA скорость_Y_hi,Y
	ORA скорость_Y_lo,Y
	BNE bra_03_9950
	LDA координата_Y_lo,Y
	STA $34
	LDA координата_Y_hi,Y
	STA $35
	JMP _loc_03_99B4
bra_03_9950:
	LDA скорость_Y_hi,Y
	BPL bra_03_996B
	LDA скорость_Y_lo,Y
	EOR #$FF
	CLC
	ADC #$01
	STA $2C
	LDA скорость_Y_hi,Y
	EOR #$FF
	ADC #$00
	STA $2D
	JMP _loc_03_9975
bra_03_996B:
	LDA скорость_Y_lo,Y
	STA $2C
	LDA скорость_Y_hi,Y
	STA $2D
_loc_03_9975:
	LDA #$00
	STA $2F
	LDA скорость_Z_hi,Y
	ORA скорость_Z_lo,Y
	BNE bra_03_9987
	LDA $1C
	LSR
	JMP _loc_03_9989
bra_03_9987:
	LDA $1C
_loc_03_9989:
	STA $2E
	JSR _b07_F564
	LDA скорость_Y_hi,Y
	BPL bra_03_99A5
	LDA координата_Y_lo,Y
	SEC
	SBC $31
	STA $34
	LDA координата_Y_hi,Y
	SBC #$00
	STA $35
	JMP _loc_03_99B4
bra_03_99A5:
	LDA координата_Y_lo,Y
	CLC
	ADC $31
	STA $34
	LDA координата_Y_hi,Y
	ADC #$00
	STA $35
_loc_03_99B4:
	RTS
_loc_03_99B5:
	LDA координата_Z_hi,Y
	BMI bra_03_99C4
	LDA координата_Z_lo,Y
	CMP #$18
	BCC bra_03_99C4
	JMP _loc_03_99E2
bra_03_99C4:
	LDA скорость_Z_hi,Y
	ORA скорость_Z_lo,Y
	BEQ bra_03_99CF
	JMP _loc_03_99E2
bra_03_99CF:
	JSR _b07_FA6D
	LSR
	LSR
	LSR
	LSR
	STA $1C
	JSR _loc_03_98D0
	JSR _loc_03_AE4B
	JSR _loc_03_985F
	RTS
_loc_03_99E2:
	LDA $0524
	STA $1C
	JSR _loc_03_98D0
	JSR _loc_03_9B75
	JSR _loc_03_AE4B
	JSR _loc_03_985F
	RTS
_loc_03_99F4:
	TXA
	EOR #$01
	AND #$01
	TAY
	LDA #$80
	STA $21
	JSR _loc_03_B034
	LDA защита_поведение,X
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	BEQ bra_03_9A13
	TAY
	LDA table_03_9AB6,Y
	JMP _loc_03_9A15
bra_03_9A13:
	LDA #$60
_loc_03_9A15:
	STA $1C
	STX $43
	LDX #$00
	STX $0688
bra_03_9A1E:
	LDA $2D,X
	CMP #$FF
	BEQ bra_03_9A47
	LDA $2E,X
	CMP $1C
	BCS bra_03_9A40
	LDA $2D,X
	CLC
	ADC #$10
	AND #$E0
	LSR
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA table_03_9AAE,Y
	ORA $0688
	STA $0688
bra_03_9A40:
	INX
	INX
	INX
	CPX #$12
	BCC bra_03_9A1E
bra_03_9A47:
	LDX $43
	LDA #$00
	STA $0689
	LDA координата_Y_hi,X
	BNE bra_03_9A5D
	LDA координата_Y_lo,X
	CMP #$40
	BCC bra_03_9A67
	JMP _loc_03_9A7A
bra_03_9A5D:
	LDA координата_Y_lo,X
	CMP #$40
	BCS bra_03_9A72
	JMP _loc_03_9A7A
bra_03_9A67:
	LDA $0689
	ORA #$83
	STA $0689
	JMP _loc_03_9A7A
bra_03_9A72:
	LDA $0689
	ORA #$38
	STA $0689
_loc_03_9A7A:
	LDA координата_X_hi,X
	BEQ bra_03_9A86
	CMP #$03
	BEQ bra_03_9A90
	JMP _loc_03_9AAD
bra_03_9A86:
	LDA координата_X_lo,X
	CMP #$C0
	BCC bra_03_9A9A
	JMP _loc_03_9AAD
bra_03_9A90:
	LDA координата_X_lo,X
	CMP #$40
	BCS bra_03_9AA5
	JMP _loc_03_9AAD
bra_03_9A9A:
	LDA $0689
	ORA #$E0
	STA $0689
	JMP _loc_03_9AAD
bra_03_9AA5:
	LDA $0689
	ORA #$0E
	STA $0689
_loc_03_9AAD:
	RTS

table_03_9AAE:		; читается из 2х мест
.byte $01,$02,$04,$08,$10,$20,$40,$80

table_03_9AB6:
.byte $00,$60,$50,$30

_loc_03_9ABA:
	LDY #$00
_loc_03_9ABC:
	LDA $002D,Y
	SEC
	SBC смена_угла_движения,X
	STA $1E
	BPL bra_03_9ACC
	EOR #$FF
	CLC
	ADC #$01
bra_03_9ACC:
	CMP #$21
	BCC bra_03_9AD6
	INY
	INY
	INY
	JMP _loc_03_9ABC
bra_03_9AD6:
	LDA $1E
	BPL bra_03_9ADF
	LDA #$FF
	JMP _loc_03_9AE1
bra_03_9ADF:
	LDA #$00
_loc_03_9AE1:
	STA $2A
	RTS
_loc_03_9AE4:
	LDA опция_режим_сложность
	AND #$03
	BNE bra_03_9AF3
	TXA
	AND #$01
	BEQ bra_03_9AF3
	JMP _loc_03_9AF9
bra_03_9AF3:
	LDA $1C
	AND #$44
	BNE bra_03_9AFA
_loc_03_9AF9:
bra_03_9AF9:
	RTS
bra_03_9AFA:
	LDA $2C
	BMI bra_03_9AF9
	LDA $2D
	CLC
	ADC #$20
	STA $29
	BPL bra_03_9B0A
	CLC
	ADC #$80
bra_03_9B0A:
	CMP #$41
	BCS bra_03_9AF9
	LDA $2E
	CMP #$30
	BCS bra_03_9AF9
	LDA $29
	BPL bra_03_9B24
	LDA $1C
	AND #$40
	BNE bra_03_9B21
	JMP _loc_03_9B30
bra_03_9B21:
	JMP _loc_03_9B3E
bra_03_9B24:
	LDA $1C
	AND #$40
	BNE bra_03_9B2D
	JMP _loc_03_9B3E
bra_03_9B2D:
	JMP _loc_03_9B30
_loc_03_9B30:
	LSR $1C
	LDA $1C
	AND $0689
	BEQ bra_03_9B3B
	ASL $1C
_loc_03_9B3B:
bra_03_9B3B:
	JMP _loc_03_9AF9
_loc_03_9B3E:
	ASL $1C
	LDA $1C
	AND $0689
	BEQ bra_03_9B3B
	LSR $1C
	JMP _loc_03_9B3B

; 9B4C
_получение_номера_поведения_игрока_в_Y:
	LDA защита_поведение,X
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	TAY
	RTS

_loc_03_9B57:
	LDA смена_угла_движения,X
	CMP угол_движения,X
	BNE bra_03_9B65
	LDA #$30
	STA номер_действия,X
	RTS
bra_03_9B65:
	AND #$70
	BEQ bra_03_9B6F
	LDA #$21
	STA номер_действия,X
	RTS
bra_03_9B6F:
	LDA #$20
	STA номер_действия,X
	RTS
_loc_03_9B75:
	LDA опция_режим_сложность
	AND #$03
	BNE bra_03_9BC1
	LDA опция_режим_сложность
	BPL bra_03_9BC1
	TXA
	AND #$01
	BEQ bra_03_9BC1
	LDA сила_игрока,X
	AND #$1F
	SEC
	SBC #$10
	STA $3C
	LDA #$00
	SBC #$00
	STA $3D
	LDA сила_игрока,X
	LSR
	LSR
	LSR
	SEC
	SBC #$10
	STA $3E
	LDA #$00
	SBC #$00
	STA $3F
	LDA $32
	CLC
	ADC $3C
	STA $32
	LDA $33
	ADC $3D
	STA $33
	LDA $34
	CLC
	ADC $3E
	STA $34
	LDA $35
	ADC $3F
	STA $35
bra_03_9BC1:
	RTS

table_03_9BC2:		; может быть что-то связано с номером команды
.byte $03,$04,$06,$08,$0A,$0C,$0E,$10,$12,$14,$16,$18,$1A,$1C,$1E,$20

_loc_03_9BD2:
	LDA тип_экрана
	CMP #$02
	BEQ bra_03_9BD9
	RTS
bra_03_9BD9:
	LDX #$00
bra_03_9BDB:
	JSR _loc_03_9BE4
	INX
	CPX #$02
	BCC bra_03_9BDB
	RTS
_loc_03_9BE4:
	TXA
	EOR счетчик_кадров
	AND #$01
	BEQ bra_03_9BF6
	LDA $0570,X
	AND #$60
	BNE bra_03_9BF6
	JMP _loc_03_9C53
bra_03_9BF6:
	LDA состояние_мяча
	AND #$40
	BEQ bra_03_9C1F
	TXA
	EOR игрок_с_мячом
	AND #$01
	BEQ bra_03_9C0B
	JSR _loc_03_9E03
	JMP _loc_03_9C22
bra_03_9C0B:
	LDY игрок_с_мячом
	CPY #$0A
	BCC bra_03_9C1A
	LDA флаг_кипера_в_штрафной - $0A,Y
	BMI bra_03_9C1A
	JMP _loc_03_9C43
bra_03_9C1A:
	STY $2C
	JMP _loc_03_9C22
bra_03_9C1F:
	JSR _loc_03_9D86
_loc_03_9C22:
	LDY $2C
	LDA позиция_управление,Y
	BPL bra_03_9C43
	LDA опция_режим_сложность
	AND #$F0
	BNE bra_03_9C36
	LDA $2C
	CMP #$02
	BCC bra_03_9C43
bra_03_9C36:
	LDA номер_команды,X
	BPL bra_03_9C3F
	CPY #$01
	BEQ bra_03_9C43
bra_03_9C3F:
	TYA
	JMP _loc_03_9C45
_loc_03_9C43:
bra_03_9C43:
	LDA #$0F
_loc_03_9C45:
	STA $1C
	LDA $067A,X
	ASL
	ASL
	ASL
	ASL
	ORA $1C
	STA $067A,X
_loc_03_9C53:
	LDA $067A,X
	AND #$0F
	CMP #$0F
	BEQ bra_03_9C6F
	LDA $0570,X
	BMI bra_03_9C6F
	LDA $0570,X
	AND #$40
	BNE bra_03_9C70
	LDA $0570,X
	AND #$20
	BNE bra_03_9C92
bra_03_9C6F:
	RTS
bra_03_9C70:
	JSR _loc_03_9E3D
	LDA состояние_мяча
	AND #$40
	BEQ bra_03_9C8A
	TXA
	EOR игрок_с_мячом
	AND #$01
	BEQ bra_03_9C8A
	LDA #$02
	STA $1C
	JSR _loc_03_9CB4
	RTS
bra_03_9C8A:
	LDA #$00
	STA $1C
	JSR _loc_03_9CB4
	RTS
bra_03_9C92:
	JSR _loc_03_9E3D
	LDA состояние_мяча
	AND #$40
	BEQ bra_03_9CAC
	TXA
	EOR игрок_с_мячом
	AND #$01
	BEQ bra_03_9CAC
	LDA #$03
	STA $1C
	JSR _loc_03_9CB4
	RTS
bra_03_9CAC:
	LDA #$01
	STA $1C
	JSR _loc_03_9CB4
	RTS
_loc_03_9CB4:
	LDA приказ_боту,X
	CMP $1C
	BNE bra_03_9CC8
	LDA $067A,X
	AND #$0F
	TAY
	LDA #$FE
	STA $2C
	JSR _loc_03_9F31
bra_03_9CC8:
	LDA $1C
	ASL
	TAY
	LDA table_03_9CD9,Y
	STA $2C
	LDA table_03_9CD9 + 1,Y
	STA $2D
	JMP ($002C)

table_03_9CD9:
.word table_03_9CD9_9CE1
.word table_03_9CD9_9D2C
.word table_03_9CD9_9D60
.word table_03_9CD9_9D73

table_03_9CD9_9CE1:
	JSR _loc_03_9E94
	JSR _loc_03_9E4A
	AND #$01
	BEQ bra_03_9CF4
	LDA #$34
	JSR _b07_C2E4
	JSR _loc_03_9F02
	RTS
bra_03_9CF4:
	LDA #$33
	JSR _b07_C2E4
	LDA $1C
	STA приказ_боту,X
	JSR _loc_03_9F09
	LDA флаг_кипера_в_штрафной - $0A,X
	CMP #$FF
	BEQ bra_03_9D0C
	STA направление_паса,X
	RTS
bra_03_9D0C:
	LDA $067A,X
	AND #$0F
	TAY
	LDA table_03_9D2A,X
	CMP координата_X_hi,Y
	BNE bra_03_9D21
	LDA #$FC
	STA $2C
	JSR _loc_03_9F31
bra_03_9D21:
	LDA номер_управляемого,X
	ORA #$10
	STA направление_паса,X
	RTS

table_03_9D2A:
.byte $03,$00

table_03_9CD9_9D2C:
	LDA $067A,X
	AND #$0F
	TAY
	LDA #$02
	STA $2C
	JSR _loc_03_9F31
	JSR _loc_03_9E94
	JSR _loc_03_9E4A
	AND #$02
	BEQ bra_03_9D4C
	LDA #$34
	JSR _b07_C2E4
	JSR _loc_03_9F02
	RTS
bra_03_9D4C:
	LDA #$33
	JSR _b07_C2E4
	LDA $1C
	STA приказ_боту,X
	JSR _loc_03_9F09
	LDA флаг_кипера_в_штрафной - $0A,X
	STA направление_паса,X
	RTS

table_03_9CD9_9D60:
	JSR _loc_03_9E94
	JSR _loc_03_9E4A
	AND #$04
	BEQ bra_03_9D4C
	LDA #$34
	JSR _b07_C2E4
	JSR _loc_03_9F02
	RTS

table_03_9CD9_9D73:
	JSR _loc_03_9E94
	JSR _loc_03_9E4A
	AND #$08
	BEQ bra_03_9D4C
	LDA #$34
	JSR _b07_C2E4
	JSR _loc_03_9F02
	RTS
_loc_03_9D86:
	LDA координата_X_lo_мяча
	PHA
	LDA координата_X_hi_мяча
	PHA
	LDA координата_Y_lo_мяча
	PHA
	LDA координата_Y_hi_мяча
	PHA
	LDA $0524
	BEQ bra_03_9DB9
	LDY #$0C
	LDA $0524
	STA $1C
	JSR _loc_03_98D0
	LDA $32
	STA координата_X_lo_мяча
	LDA $33
	STA координата_X_hi_мяча
	LDA $34
	STA координата_Y_lo_мяча
	LDA $35
	STA координата_Y_hi_мяча
bra_03_9DB9:
	TXA
	PHA
	LDA номер_управляемого,X
	TAX
	LDY #$0C
	JSR _b07_FA6D
	STA $2C
	PLA
	TAX
	LDA $2C
	CMP #$40
	BCS bra_03_9DD3
	STX $2C
	JMP _loc_03_9DF2
bra_03_9DD3:
	LDA #$0C
	STA $22
	STX $23
	LDA флаг_кипера_в_штрафной,X
	BPL bra_03_9DE3
	LDA #$06
	JMP _loc_03_9DE5
bra_03_9DE3:
	LDA #$05
_loc_03_9DE5:
	STA $27
	LDA #$09
	STA $28
	LDA #$02
	STA $29
	JSR _b07_F9DE
_loc_03_9DF2:
	PLA
	STA координата_Y_hi_мяча
	PLA
	STA координата_Y_lo_мяча
	PLA
	STA координата_X_hi_мяча
	PLA
	STA координата_X_lo_мяча
	RTS
_loc_03_9E03:
	TXA
	PHA
	LDA номер_управляемого,X
	TAX
	LDY игрок_с_мячом
	JSR _b07_FA6D
	STA $2C
	PLA
	TAX
	LDA $2C
	CMP #$40
	BCS bra_03_9E1C
	STX $2C
	RTS
bra_03_9E1C:
	LDA игрок_с_мячом
	STA $22
	STX $23
	LDA флаг_кипера_в_штрафной,X
	BPL bra_03_9E2D
	LDA #$06
	JMP _loc_03_9E2F
bra_03_9E2D:
	LDA #$05
_loc_03_9E2F:
	STA $27
	LDA #$09
	STA $28
	LDA #$02
	STA $29
	JSR _b07_F9DE
	RTS
_loc_03_9E3D:
	LDA удержанные_кнопки,X
	AND #$0F
	TAY
	LDA table_03_A007,Y
	STA флаг_кипера_в_штрафной - $0A,X
	RTS
_loc_03_9E4A:
	LDA опция_режим_сложность
	AND #$03
	BNE bra_03_9E56
	LDA #$00
	STA $1D
	RTS
bra_03_9E56:
	LDA $067A,X
	AND #$0F
	TAY
	LDA защита_поведение,Y
	AND #$C0
	LSR
	LSR
	LSR
	LSR
	STA $1D
	LDA позиция_управление,X
	AND #$0F
	STA $1E
	LDA сила_игрока,X
	AND #$07
	SEC
	SBC #$03
	CLC
	ADC $1E
	BMI bra_03_9E82
	CMP #$10
	BCS bra_03_9E87
	JMP _loc_03_9E89
bra_03_9E82:
	LDA #$00
	JMP _loc_03_9E89
bra_03_9E87:
	LDA #$0F
_loc_03_9E89:
	LSR
	LSR
	ORA $1D
	TAY
	LDA table_03_9FF3,Y
	STA $1D
	RTS
_loc_03_9E94:
	LDA $1C
	BNE bra_03_9EB3
	LDA флаг_кипера_в_штрафной - $0A,X
	CMP #$FF
	BNE bra_03_9EB3
	LDA номер_управляемого,X
	TAY
	LDA защита_поведение,Y
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA table_03_A003,Y
	JMP _loc_03_9EFC
bra_03_9EB3:
	LDA адрес_рандома
	AND #$03
	STA $1E
	LDA $1C
	ASL
	ASL
	ORA $1E
	STA $1E
	LDA номер_управляемого,X
	TAY
	LDA защита_поведение,Y
	AND #$C0
	LSR
	LSR
	ORA $1E
	STA $1E
	LDA $067A,X
	AND #$0F
	TAY
	CPX #$01
	BEQ bra_03_9EE5
	LDA координата_X_hi,Y
	CMP #$02
	BCC bra_03_9EEF
	JMP _loc_03_9EF4
bra_03_9EE5:
	LDA координата_X_hi,Y
	CMP #$02
	BCC bra_03_9EF4
	JMP _loc_03_9EEF
_loc_03_9EEF:
bra_03_9EEF:
	LDA #$40
	JMP _loc_03_9EF6
_loc_03_9EF4:
bra_03_9EF4:
	LDA #$00
_loc_03_9EF6:
	ORA $1E
	TAY
	LDA table_03_9F53,Y
_loc_03_9EFC:
	ORA #$80
	STA $0680,X
	RTS
_loc_03_9F02:
	LDA #$10
	STA $1E
	JMP _loc_03_9F0D
_loc_03_9F09:
	LDA #$00
	STA $1E
_loc_03_9F0D:
	LDA $067A,X
	AND #$0F
	TAY
	LDA защита_поведение,Y
	AND #$C0
	LSR
	LSR
	LSR
	LSR
	ORA $1E
	STA $1E
	LDA адрес_рандома + 1
	AND #$03
	ORA $1E
	TAY
	LDA table_03_9FD3,Y
	ORA #$80
	STA $0682,X
	RTS
_loc_03_9F31:
	LDA позиция_управление,Y
	AND #$0F
	CLC
	ADC $2C
	BMI bra_03_9F44
	CMP #$10
	BCC bra_03_9F46
	LDA #$0F
	JMP _loc_03_9F46
bra_03_9F44:
	LDA #$00
_loc_03_9F46:
bra_03_9F46:
	STA $2D
	LDA позиция_управление,Y
	AND #$F0
	ORA $2D
	STA позиция_управление,Y
	RTS

table_03_9F53:
.byte $06,$22,$08,$03,$15,$1C,$01,$06,$23,$33,$34,$06,$0E,$27,$33,$17,$07,$08,$16,$07,$00,$01,$03,$02,$12,$13,$17,$12,$0D,$11,$0E,$0D,$08,$0C,$2C,$07,$15,$02,$01,$07,$16,$17,$15,$12,$0D,$10,$0F,$15,$07,$08,$16,$0B,$00,$01,$03,$02,$12,$09,$11,$13,$0D,$10,$0F,$0E,$23,$21,$15,$06,$15,$17,$11,$03,$23,$33,$0E,$06,$0F,$2A,$31,$16,$07,$08,$16,$07,$04,$05,$07,$04,$12,$14,$17,$12,$11,$10,$0E,$11,$08,$0C,$2C,$07,$07,$05,$06,$15,$12,$16,$17,$12,$11,$0F,$2D,$15,$07,$08,$16,$0B,$04,$05,$17,$03,$02,$13,$08,$11,$10,$14,$0F,$0E

table_03_9FD3:
.byte $21,$3C,$25,$23,$18,$18,$18,$22,$18,$1A,$31,$1C,$19,$1B,$39,$27,$1F,$1D,$23,$26,$21,$23,$24,$3B,$1F,$20,$2C,$26,$1D,$1E,$3A,$24

table_03_9FF3:
.byte $0E,$01,$02,$04,$00,$00,$00,$00,$09,$04,$02,$01,$01,$01,$00,$01

table_03_A003:
.byte $0B,$07,$09,$0A

table_03_A007:
.byte $FF,$40,$C0,$FF,$80,$60,$A0,$FF,$00,$20,$E0,$FF,$FF,$FF,$FF,$FF

_loc_03_A017:
	LDX #$00
bra_03_A019:
	JSR _loc_03_A022
	INX
	CPX #$02
	BCC bra_03_A019
	RTS
_loc_03_A022:
	LDA состояние_мяча
	AND #$40
	BEQ bra_03_A03E
	LDA игрок_с_мячом
	CMP #$0A
	BCC bra_03_A03E
	TXA
	EOR #$01
	TAY
	LDA флаг_кипера_в_штрафной
	BMI bra_03_A03E
	LDA #$FF
	STA приказ_боту,X
bra_03_A03E:
	LDA приказ_боту,X
	CMP #$FF
	BNE bra_03_A046
	RTS
bra_03_A046:
	ASL
	TAY
	LDA table_03_A055,Y
	STA $2C
	LDA table_03_A055 + 1,Y
	STA $2D
	JMP ($002C)

table_03_A055:
.word table_03_A055_A05D
.word table_03_A055_A07E
.word table_03_A055_A0AF
.word table_03_A055_A0C3

table_03_A055_A05D:
	JSR _loc_03_A0EC
	BEQ bra_03_A072
	BMI bra_03_A0A9
	LDA $067A,X
	AND #$0F
	TAY
	LDA #$02
	STA интеллект_бота,Y
	JMP _loc_03_A07D
bra_03_A072:
	LDA $067A,X
	AND #$0F
	TAY
	LDA #$06
	STA интеллект_бота,Y
_loc_03_A07D:
	RTS

table_03_A055_A07E:
	JSR _loc_03_A0EC
	BEQ bra_03_A093
	BMI bra_03_A0A9
	LDA $067A,X
	AND #$0F
	TAY
	LDA #$23
	STA интеллект_бота,Y
	JMP _loc_03_A09E
bra_03_A093:
	LDA $067A,X
	AND #$0F
	TAY
	LDA #$25
	STA интеллект_бота,Y
_loc_03_A09E:
	LDA $0668,Y
	AND #$F0
	ORA #$01
	STA $0668,Y
	RTS
_loc_03_A0A9:
bra_03_A0A9:
	LDA #$FF
	STA приказ_боту,X
	RTS

table_03_A055_A0AF:
	JSR _loc_03_A0D7
	BMI bra_03_A0B7
	JMP _loc_03_A0A9
bra_03_A0B7:
	LDA $067A,X
	AND #$0F
	TAY
	LDA #$08
	STA интеллект_бота,Y
	RTS

table_03_A055_A0C3:
	JSR _loc_03_A0D7
	BMI bra_03_A0CB
	JMP _loc_03_A0A9
bra_03_A0CB:
	LDA $067A,X
	AND #$0F
	TAY
	LDA #$09
	STA интеллект_бота,Y
	RTS
_loc_03_A0D7:
	LDA состояние_мяча
	AND #$40
	BEQ bra_03_A0E9
	TXA
	EOR игрок_с_мячом
	AND #$01
	BEQ bra_03_A0E9
	LDA #$FF
	RTS
bra_03_A0E9:
	LDA #$00
	RTS
_loc_03_A0EC:
	LDA состояние_мяча
	AND #$40
	BNE bra_03_A0F6
	LDA #$00
	RTS
bra_03_A0F6:
	LDA $067A,X
	AND #$0F
	CMP игрок_с_мячом
	BNE bra_03_A103
	LDA #$01
	RTS
bra_03_A103:
	LDA #$FF
	RTS
_loc_03_A106:
	LDA игрок_с_мячом
	PHA
	LDY игрок_с_мячом
	LDA состояние_игрока,Y
	AND #$01
	BEQ bra_03_A11A
	LDA $04CA,Y
	STA игрок_с_мячом
bra_03_A11A:
	LDA игрок_с_мячом
	TAY
	AND #$01
	BEQ bra_03_A139
	LDA координата_X_lo,Y
	EOR #$FF
	CLC
	ADC #$01
	STA $2C
	LDA координата_X_hi,Y
	EOR #$FF
	CLC
	ADC #$04
	STA $2D
	JMP _loc_03_A169
bra_03_A139:
	LDA координата_X_lo,Y
	STA $2C
	STA $2E
	LDA координата_X_hi,Y
	STA $2D
	STA $2F
	LDA $0074,Y
	BPL bra_03_A15C
	LDA $2E
	SEC
	SBC #$20
	STA $2E
	LDA $2F
	SBC #$00
	STA $2F
	JMP _loc_03_A169
bra_03_A15C:
	LDA $2E
	CLC
	ADC #$20
	STA $2E
	LDA $2F
	ADC #$00
	STA $2F
_loc_03_A169:
	LDA $2F
	BEQ bra_03_A175
	CMP #$01
	BEQ bra_03_A183
	CMP #$02
	BCS bra_03_A19B
bra_03_A175:
	LDA игрок_с_мячом
	AND #$01
	TAY
	LDA #$0A
	JSR _loc_03_8261
	JMP _loc_03_A20A
bra_03_A183:
	LDA игрок_с_мячом
	AND #$01
	TAY
	LDA #$0C
	STA $1C
	STA $1D
	LDA #$0A
	STA $1E
	STA $1F
	JSR _loc_03_826B
	JMP _loc_03_A20A
bra_03_A19B:
	LDA $2D
	SEC
	SBC #$02
	BPL bra_03_A1A6
	LDA #$00
	STA $2C
bra_03_A1A6:
	STA $2D
	LDA #$42
	STA $2E
	LDA #$00
	STA $2F
	JSR _b07_F469
	LDA $2C
	STA $1D
	LDA координата_Y_lo,Y
	SEC
	SBC #$30
	STA $2C
	LDA координата_Y_hi,Y
	SBC #$00
	BPL bra_03_A1CA
	LDA #$00
	STA $2C
bra_03_A1CA:
	STA $2D
	LDA #$00
	STA $2F
	LDA #$22
	STA $2E
	JSR _b07_F469
	LDY $2C
	LDA table_03_A2F2,Y
	CLC
	ADC $1D
	ASL
	ASL
	STA $1D
	LDA игрок_с_мячом
	AND #$01
	TAY
	LDA $1D
	LDA расстановка_команды,Y
	AND #$03
	ORA $1D
	STA расстановка_команды,Y
	LDA #$0B
	STA $1C
	STA $1D
	LDA #$0A
	STA $1E
	STA $1F
	LDA игрок_с_мячом
	AND #$01
	TAY
	JSR _loc_03_826B
_loc_03_A20A:
	LDY игрок_с_мячом
	LDA #$0F
	STA интеллект_бота,Y
	LDA номер_команды,X
	AND #$0F
	CMP #$06
	BEQ bra_03_A22E
	CMP #$0E
	BEQ bra_03_A22E
	CMP #$09
	BEQ bra_03_A22E
	CMP #$0A
	BEQ bra_03_A22E
	CMP #$0B
	BEQ bra_03_A22E
	JMP _loc_03_A23D
bra_03_A22E:
	LDA расстановка_команды,X
	AND #$FC
	ORA #$01
	STA расстановка_команды,X
	TXA
	TAY
	JSR _loc_03_B12D
_loc_03_A23D:
	LDA $05D3,X
	AND #$0C
	CMP #$08
	BEQ bra_03_A297
	JSR _loc_03_A301
	BCC bra_03_A253
	LDY игрок_с_мячом
	LDA #$23
	STA интеллект_бота,Y
bra_03_A253:
	LDY игрок_с_мячом
	LDA table_03_A2FF,X
	CMP координата_X_hi,Y
	BNE bra_03_A297
	TXA
	PHA
	ASL
	ASL
	TAY
	LDA table_03_90AF,Y
	STA $2E
	LDA table_03_90AF + 1,Y
	STA $2F
	LDA table_03_90AF + 2,Y
	STA $30
	LDA table_03_90AF + 3,Y
	STA $31
	LDX игрок_с_мячом
	JSR _b07_F691
	STA $20
	LDA #$10
	STA $21
	TXA
	EOR #$01
	AND #$01
	TAY
	JSR _loc_03_B034
	LDA $2C
	BPL bra_03_A295
	LDA #$04
	STA интеллект_бота,X
bra_03_A295:
	PLA
	TAX
bra_03_A297:
	LDY игрок_с_мячом
	CPY #$0A
	BCS bra_03_A2A6
	LDA #$0A
	STA интеллект_бота + $0A,X
	JMP _loc_03_A2E1
bra_03_A2A6:
	LDA $05D3,X
	AND #$C0
	BEQ bra_03_A2D9
	CMP #$80
	BEQ bra_03_A2CE
	LDY игрок_с_мячом
	LDA защита_поведение,Y
	AND #$C0
	CMP #$80
	BCC bra_03_A2CE
	CMP #$C0
	BEQ bra_03_A2C9
	JSR _loc_03_A2E6
	BMI bra_03_A2D9
	JMP _loc_03_A2CE
bra_03_A2C9:
	JSR _loc_03_A2E6
	BPL bra_03_A2D9
_loc_03_A2CE:
bra_03_A2CE:
	LDY игрок_с_мячом
	LDA #$27
	STA интеллект_бота,Y
	JMP _loc_03_A2E1
bra_03_A2D9:
	LDY игрок_с_мячом
	LDA #$0F
	STA интеллект_бота,Y
_loc_03_A2E1:
	PLA
	STA игрок_с_мячом
	RTS
_loc_03_A2E6:
	TXA
	EOR #$01
	TAY
	LDA счет_команды,X
	SEC
	SBC счет_команды,Y
	RTS

table_03_A2F2:
.byte $00,$06,$0C,$12,$18,$1E,$24,$2A,$30

table_03_A2FB:
.byte $40,$40,$80,$A0

table_03_A2FF:		; видимо что-то для первой и второй команды
.byte $03,$00

_loc_03_A301:
	TXA
	PHA
	ASL
	ASL
	TAX
	LDA table_03_90AF,X
	STA $2E
	LDA table_03_90AF + 1,X
	STA $2F
	LDA table_03_90AF + 2,X
	STA $30
	LDA table_03_90AF + 3,X
	STA $31
	TYA
	TAX
	JSR _b07_F691
	STA $1C
	PLA
	TAX
	BEQ bra_03_A32E
	LDA $1C
	EOR #$FF
	CLC
	ADC #$01
	STA $1C
bra_03_A32E:
	LDA $1C
	CMP #$18
	BCC bra_03_A39A
	CMP #$68
	BCS bra_03_A39A
	LDY игрок_с_мячом
	TYA
	AND #$01
	BNE bra_03_A352
	LDA #$88
	SEC
	SBC координата_X_lo,Y
	STA $1C
	LDA #$03
	SBC координата_X_hi,Y
	BNE bra_03_A39A
	JMP _loc_03_A361
bra_03_A352:
	LDA координата_X_lo,Y
	SEC
	SBC #$78
	STA $1C
	LDA координата_X_hi,Y
	SBC #$00
	BNE bra_03_A39A
_loc_03_A361:
	LDA $1C
	EOR #$FF
	CLC
	ADC #$01
	STA $1C
	LDA состояние_игрока,Y
	BPL bra_03_A379
	LDA адрес_рандома
	ASL
	CLC
	LDA #$FF
	JMP _loc_03_A37C
bra_03_A379:
	LDA адрес_рандома
_loc_03_A37C:
	STA $1D
	LDA защита_поведение,Y
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA $1C
	CLC
	ADC table_03_A2FB,Y
	BCS bra_03_A398
	CLC
	ADC $1D
	BCS bra_03_A398
	JMP _loc_03_A39A
bra_03_A398:
	SEC
	RTS
_loc_03_A39A:
bra_03_A39A:
	CLC
	RTS
_loc_03_A39C:
	LDY игрок_с_мячом
	CPY #$0A
	BCC bra_03_A3AB
	LDA флаг_кипера_в_штрафной - $0A,Y
	BMI bra_03_A3AB
	JMP _loc_03_A589
bra_03_A3AB:
	LDA #$00
	STA $1C
	STA $1D
	LDA #$0D
	STA $1F
	LDA #$22
	STA $1E
	TXA
	TAY
	JSR _loc_03_826B
	TXA
	TAY
	PHA
	LDX игрок_с_мячом
	LDA #$80
	STA $21
	JSR _loc_03_B034
	LDA $2C
	BMI bra_03_A3DC
	CMP #$0A
	BCS bra_03_A3DC
	LDA $2E
	CMP #$40
	BCS bra_03_A3DC
	JSR _loc_03_A4A8
bra_03_A3DC:
	PLA
	TAX
	LDY игрок_с_мячом
	JSR _loc_03_A520
	LDA $1C
	CMP #$FF
	BEQ bra_03_A408
	TXA
	PHA
	LDA игрок_с_мячом
	TAX
	EOR #$01
	AND #$01
	TAY
	LDA $1C
	STA $20
	LDA #$50
	STA $21
	JSR _loc_03_B034
	PLA
	TAX
	LDA $2C
	CMP #$0A
	BCC bra_03_A41E
bra_03_A408:
	LDA игрок_с_мячом
	STA $22
	STX $23
	LDA #$05
	STA $27
	LDA #$09
	STA $28
	LDA #$02
	STA $29
	JSR _b07_F9DE
bra_03_A41E:
	JSR _loc_03_A4A8
	LDA игрок_с_мячом
	EOR #$01
	AND #$01
	TAY
bra_03_A429:
	LDA интеллект_бота,Y
	CMP #$00		; можно сразу проверять на Z
	BNE bra_03_A43C
	LDA позиция_управление,Y
	AND #$30
	BNE bra_03_A43C
	LDA #$0A
	STA интеллект_бота,Y
bra_03_A43C:
	INY
	INY
	CPY #$0A
	BCC bra_03_A429
	LDA расстановка_команды,X
	AND #$03
	CMP #$01
	BNE bra_03_A450
	LDA #$2A		; при расстановке 1-2-2
	STA интеллект_бота + $08,X
bra_03_A450:
	TXA
	PHA
	CLC
	ADC #$0A
	TAX
	EOR #$01
	AND #$01
	TAY
	LDA номер_ближайшего,Y
	TAY
	JSR _b07_FA6D
	STA $1C
	TXA
	TAY
	PLA
	TAX
	JSR _получение_номера_поведения_игрока_в_Y
	LDA table_03_A597,Y
	CMP $1C
	BCC bra_03_A477
	LDA #$28
	JMP _loc_03_A479
bra_03_A477:
	LDA #$0D
_loc_03_A479:
	STA интеллект_бота + $0A,X
	LDA номер_команды,X
	AND #$0F
	CMP #$06
	BEQ bra_03_A498
	CMP #$0E
	BEQ bra_03_A498
	CMP #$09
	BEQ bra_03_A498
	CMP #$0A
	BEQ bra_03_A498
	CMP #$0B
	BEQ bra_03_A498
	JMP _loc_03_A4A7
bra_03_A498:
	LDA расстановка_команды,X
	AND #$FC
	ORA #$02
	STA расстановка_команды,X
	TXA
	TAY
	JSR _loc_03_B12D
_loc_03_A4A7:
	RTS

_loc_03_A4A8:
	LDA $2C
	AND #$01
	TAY
	LDA $05D3,Y
	AND #$30
	BEQ bra_03_A4BB
	CMP #$10
	BEQ bra_03_A4D1
	JMP _loc_03_A4DE
bra_03_A4BB:
	LDY $2C
	JSR _b07_вращение_рандома
	CMP #$C0
	BCC bra_03_A4C9
	LDA #$08
	JMP _loc_03_A4CB	; заменить прыжок на BNE
bra_03_A4C9:
	LDA #$09
_loc_03_A4CB:
	STA интеллект_бота,Y
	JMP _loc_03_A51F
bra_03_A4D1:
	LDY $2C
	LDA защита_поведение,Y
	AND #$C0
	BEQ bra_03_A4BB
	CMP #$C0
	BEQ bra_03_A4BB
_loc_03_A4DE:
	LDA $05D3,X
	AND #$30
	CMP #$20
	BEQ bra_03_A4F5
	LDA счетчик_кадров
	AND #$60
	CMP #$60
	BNE bra_03_A4F5
bra_03_A4F0:
	LDA #$09
	JMP _loc_03_A51A
bra_03_A4F5:
	LDY игрок_с_мячом
	LDA координата_X_hi,Y
	STA $1C
	LDA игрок_с_мячом
	AND #$01
	TAY
	LDA table_03_A587,Y
	CMP $1C
	BEQ bra_03_A50F
	LDA #$20
	JMP _loc_03_A51A
bra_03_A50F:
	LDA $05D3
	AND #$30
	CMP #$10
	BEQ bra_03_A4F0
	LDA #$07
_loc_03_A51A:
	LDY $2C
	STA интеллект_бота,Y
_loc_03_A51F:
	RTS

_loc_03_A520:
	LDA скорость_X_hi,Y
	ORA скорость_X_lo,Y
	ORA скорость_Y_hi,Y
	ORA скорость_Y_lo,Y
	BNE bra_03_A533
	LDA #$FF
_loc_03_A530:
	STA $1C
	RTS
bra_03_A533:
	LDA скорость_X_hi,Y
	ORA скорость_X_lo,Y
	BEQ bra_03_A578
	LDA скорость_X_hi,Y
	BPL bra_03_A55C
	LDA скорость_Y_hi,Y
	ORA скорость_Y_lo,Y
	BEQ bra_03_A557
	LDA скорость_Y_hi,Y
	BPL bra_03_A552
	LDA #$E0
	JMP _loc_03_A530
bra_03_A552:
	LDA #$A0
	JMP _loc_03_A530
bra_03_A557:
	LDA #$C0
	JMP _loc_03_A530
bra_03_A55C:
	LDA скорость_Y_hi,Y
	ORA скорость_Y_lo,Y
	BEQ bra_03_A573
	LDA скорость_Y_hi,Y
	BPL bra_03_A56E
	LDA #$20
	JMP _loc_03_A530
bra_03_A56E:
	LDA #$60
	JMP _loc_03_A530
bra_03_A573:
	LDA #$40
	JMP _loc_03_A530
bra_03_A578:
	LDA скорость_Y_hi,Y
	BPL bra_03_A582
	LDA #$00
	JMP _loc_03_A530
bra_03_A582:
	LDA #$80
	JMP _loc_03_A530

table_03_A587:
.byte $03,$00

_loc_03_A589:
	TXA
	TAY
	LDA #$0A
bra_03_A58D:
	STA интеллект_бота,Y
	INY
	INY
	CPY #$0A
	BCC bra_03_A58D
	RTS

table_03_A597:
.byte $30,$28,$38,$40

_loc_03_A59B:
	TXA
	TAY
	LDA #$0A
bra_03_A59F:
	STA интеллект_бота,Y
	INY
	INY
	CPY #$0C
	BCC bra_03_A59F
	LDY #$0C
	LDA $0524
	STA $1C
	JSR _loc_03_98D0
	LDA координата_X_lo_мяча
	PHA
	LDA координата_X_hi_мяча
	PHA
	LDA координата_Y_lo_мяча
	PHA
	LDA координата_Y_hi_мяча
	PHA
	JSR _loc_03_8194
	LDA #$0C
	STA $22
	TXA
	STA $23
	LDA #$09
	STA $28
	LDA #$02
	STA $29
	LDA #$05
	STA $27
	JSR _b07_F9DE
	JSR _loc_03_821F
	STY $1C
	PLA
	STA координата_Y_hi_мяча
	PLA
	STA координата_Y_lo_мяча
	PLA
	STA координата_X_hi_мяча
	PLA
	STA координата_X_lo_мяча
	LDA игрок_с_мячом
	PHA
	LDA $1C
	STA игрок_с_мячом
	JSR _loc_03_A301
	BCC bra_03_A60F
	LDA $05D3,X
	AND #$0C
	CMP #$08
	BEQ bra_03_A60F
	LDA #$25
	LDY игрок_с_мячом
	STA интеллект_бота,Y
bra_03_A60F:
	PLA
	STA игрок_с_мячом
	TXA
	EOR #$01
	TAY
	LDA номер_ближайшего,Y
	STY $44
	TAY
	LDA состояние_игрока,Y
	BPL bra_03_A669
	LDA номер_движения,Y
	AND #$7F
	CMP #$32
	BEQ bra_03_A645
	CMP #$33
	BEQ bra_03_A645
	CMP #$34
	BEQ bra_03_A645
	LDY $44
	LDA дистанция_ближайшего,Y
	CMP #$20
	BCS bra_03_A669
	LDA $0524
	BEQ bra_03_A669
	CMP #$10
	BCS bra_03_A669
bra_03_A645:
	TXA
	EOR #$01
	TAY
	LDA номер_ближайшего,Y
	TAY
	LDA дистанция_ближайшего,Y
	CMP #$30
	BCS bra_03_A669
	LDA координата_Y_hi,Y
	BNE bra_03_A669
	LDA координата_Y_lo,Y
	CMP #$90
	BCC bra_03_A669
	CMP #$F0
	BCS bra_03_A669
	LDA #$28
	JMP _loc_03_A790
bra_03_A669:
	LDA номер_движения_мяча
	AND #$7F
	CMP #$05
	BEQ bra_03_A6E0
	LDA скорость_X_hi_мяча
	BPL bra_03_A67C
	EOR #$FF
	CLC
	ADC #$01
bra_03_A67C:
	CMP #$04
	BCS bra_03_A6E0
	LDA состояние_мяча
	BPL bra_03_A68B
	LDA $0524
	JMP _loc_03_A68D
bra_03_A68B:
	LDA #$00
_loc_03_A68D:
	STA $1C
	LDY #$0C
	JSR _loc_03_98D0
	LDA координата_X_lo_мяча
	PHA
	LDA координата_X_hi_мяча
	PHA
	LDA координата_Y_lo_мяча
	PHA
	LDA координата_Y_hi_мяча
	PHA
	JSR _loc_03_8194
	LDY #$0C
	JSR _loc_03_B0D7
	STA $1C
	CPX $1C
	BNE bra_03_A6CD
	LDA координата_Y_hi_мяча
	BEQ bra_03_A6C1
	LDA координата_Y_lo_мяча
	CMP #$20
	BCS bra_03_A6CD
	JMP _loc_03_A6C8
bra_03_A6C1:
	LDA координата_Y_lo_мяча
	CMP #$70
	BCC bra_03_A6CD
_loc_03_A6C8:
	LDA #$24
	STA интеллект_бота + $0A,X
bra_03_A6CD:
	PLA
	STA координата_Y_hi_мяча
	PLA
	STA координата_Y_lo_мяча
	PLA
	STA координата_X_hi_мяча
	PLA
	STA координата_X_lo_мяча
bra_03_A6DD:
	JMP _loc_03_A793
bra_03_A6E0:
	LDA скорость_X_hi_мяча
	BMI bra_03_A705
	CPX #$01
	BNE bra_03_A6DD
	LDA $031F
	SEC
	SBC координата_X_lo_мяча
	STA $1C
	LDA $0332
	SBC координата_X_hi_мяча
	BEQ bra_03_A725
	BPL bra_03_A6DD
	LDA $1C
	CMP #$E8
	BCC bra_03_A705
	JMP _loc_03_A78E
bra_03_A705:
	CPX #$00
	BNE bra_03_A6DD
	LDA координата_X_lo_мяча
	SEC
	SBC $031E
	STA $1C
	LDA координата_X_hi_мяча
	SBC $0331
	BEQ bra_03_A725
	BPL bra_03_A793
	LDA $1C
	CMP #$E8
	BCS bra_03_A725
	JMP _loc_03_A78E
bra_03_A725:
	LDA координата_Z_hi_мяча
	BMI bra_03_A746
	LDA координата_Z_lo_мяча
	CMP #$28
	BCC bra_03_A736
	LDA #$28
	JMP _loc_03_A739
bra_03_A736:
	LDA координата_Z_lo_мяча
_loc_03_A739:
	STA $1E
	LDA $1C
	SEC
	SBC $1E
	BCS bra_03_A744
	LDA #$00
bra_03_A744:
	STA $1C
bra_03_A746:
	LDA номер_команды,X
	BMI bra_03_A750
	LDY #$01
	JMP _loc_03_A756
bra_03_A750:
	LDA опция_режим_сложность
	AND #$03
	TAY
_loc_03_A756:
	JSR _b07_вращение_рандома
	AND table_03_A79E,Y
	CLC
	ADC $1C
	BCS bra_03_A772
	CMP #$10
	BCC bra_03_A768
	JMP _loc_03_A772
bra_03_A768:
	LDA флаг_кипера_в_штрафной,X
	BMI bra_03_A78E
	LDA #$0E
	JMP _loc_03_A790
_loc_03_A772:
bra_03_A772:
	LDA опция_режим_сложность
	AND #$03
	BNE bra_03_A789
	CPX #$01
	BNE bra_03_A789
	JSR _b07_вращение_рандома
	CMP #$A0
	BCS bra_03_A789
	LDA #$00
	JMP _loc_03_A790
bra_03_A789:
	LDA #$05
	JMP _loc_03_A790
_loc_03_A78E:
bra_03_A78E:
	LDA #$26
_loc_03_A790:
	STA интеллект_бота + $0A,X
_loc_03_A793:
bra_03_A793:
	LDA интеллект_бота + $0A,X
	BNE bra_03_A79D
	LDA #$0A
	STA интеллект_бота + $0A,X
bra_03_A79D:
	RTS

table_03_A79E:		; читается в зависимости от режима игры в меню
.byte $3F,$07,$00

_loc_03_A7A1:
	LDA тип_экрана
	CMP #$01
	BEQ bra_03_A7B5
	CMP #$03
	BEQ bra_03_A7B5
	LDA опция_режим_сложность
	AND #$20
	BNE bra_03_A7B5
	JMP _loc_03_A7B6
bra_03_A7B5:
	RTS
_loc_03_A7B6:
	LDX #$00
_loc_03_A7B8:
	STX $43
	TXA
	ASL
	TAY
	LDA table_03_AB7C,Y
	STA $2C
	LDA table_03_AB7C + 1,Y
	STA $2D
	LDA $067A,X
	LSR
	LSR
	LSR
	LSR
	STA $1C
	LDA $067A,X
	AND #$0F
	CMP $1C
	BEQ bra_03_A7F1
	CMP #$0F
	BNE bra_03_A7EB
	LDA #$FF
	STA приказ_боту,X
	JSR _loc_03_A82D
	JSR _loc_03_A981
	JMP _loc_03_A7F1
bra_03_A7EB:
	JSR _loc_03_A859
	JSR _loc_03_A981
_loc_03_A7F1:
bra_03_A7F1:
	LDA $0684,X
	BEQ bra_03_A7F9
	JMP _loc_03_A801
bra_03_A7F9:
	LDA #$C0
	STA $0680,X
	STA $0682,X
_loc_03_A801:
	LDA $0680,X
	BPL bra_03_A80C
	JSR _loc_03_A8F0
	JSR _loc_03_A981
bra_03_A80C:
	LDA $0682,X
	BPL bra_03_A817
	JSR _loc_03_A945
	JSR _loc_03_A981
bra_03_A817:
	DEC $0684,X
	LDA $0684,X
	BPL bra_03_A824
	LDA #$FF
	STA $0684,X
bra_03_A824:
	INX
	CPX #$02
	BCS bra_03_A82C
	JMP _loc_03_A7B8
bra_03_A82C:
	RTS
_loc_03_A82D:
	TXA
	BNE bra_03_A835
	LDY #$00
	JMP _loc_03_A837
bra_03_A835:
	LDY #$23
_loc_03_A837:
	LDX #$00
	LDA #$0F
bra_03_A83B:
	STA буфер_атрибутов + 6,Y
	INX
	INY
	CPX #$14
	BCC bra_03_A83B
	TYA
	SEC
	SBC #$14
	TAY
	LDX #$00
	LDA #$FA
bra_03_A84D:
	STA буфер_атрибутов + 6,Y
	INY
	INX
	CPX #$05
	BCC bra_03_A84D
	LDX $43
	RTS
_loc_03_A859:
	TXA
	ASL
	TAY
	LDA table_03_AB7C,Y
	STA $2C
	LDA table_03_AB7C + 1,Y
	STA $2D
	JSR _loc_03_AADC
	LDA $067A,X
	AND #$0F
	TAY
	LDA номер_игрока,Y
	STA $2B
	TAY
	LDA $2E
	CLC
	ADC table_03_AB4B,Y
	STA $2E
	LDA $2F
	ADC #$00
	STA $2F
	LDA $2B
	ASL
	STA $2B
	LDA $32
	CLC
	ADC $2B
	STA $32
	LDA $33
	ADC #$00
	STA $33
	JSR _loc_03_AB01
	LDX #$00
bra_03_A89A:
	LDA table_03_AB6F,X
	TAY
	LDA $1C,X
	STA ($2C),Y
	INX
	CPX #$0D
	BCC bra_03_A89A
	LDX $43
	LDA $067A,X
	AND #$0F
	TAY
	LDA позиция_управление,Y
	AND #$30
	LSR
	LSR
	LSR
	TAY
	LDA table_03_AB80,Y
	STA $1C
	LDA table_03_AB80 + 1,Y
	STA $1D
	LDX #$00
	LDY #$13
bra_03_A8C6:
	LDA $1C,X
	STA ($2C),Y
	INX
	INY
	CPX #$02
	BCC bra_03_A8C6
	LDX $43
	LDA #$4C
	LDY #$10
	STA ($2C),Y
	LDA #$0F
	LDY #$19
	STA ($2C),Y
	LDY #$15
	LDX #$00
bra_03_A8E2:
	LDA table_03_AB63,X
	STA ($2C),Y
	INX
	INY
	CPX #$03
	BCC bra_03_A8E2
	LDX $43
	RTS
_loc_03_A8F0:
	LDA $0680,X
	CMP #$C0
	BNE bra_03_A901
	LDA #$FF
	STA $0684,X
	LDA #$FF
	JMP _loc_03_A91D
bra_03_A901:
	LDA #$20
	STA $0684,X
	LDA флаг_кипера_в_штрафной - $0A,X
	CMP #$FF
	BNE bra_03_A912
	LDA #$08
	JMP _loc_03_A917
bra_03_A912:
	LSR
	LSR
	LSR
	LSR
	LSR
_loc_03_A917:
	TAY
	LDA table_03_AB66,Y
	LDY #$00
_loc_03_A91D:
	STA ($2C),Y
	LDA $0680,X
	AND #$7F
	CMP #$40
	BCC bra_03_A92A
	LDA #$40
bra_03_A92A:
	STA $0680,X
	ASL
	TAY
	LDA table_03_AB88,Y
	STA $2E
	LDA table_03_AB88 + 1,Y
	STA $2F
	LDY #$00
bra_03_A93B:
	LDA ($2E),Y
	INY
	STA ($2C),Y
	CPY #$05
	BCC bra_03_A93B
	RTS
_loc_03_A945:
	LDA #$20
	STA $0684,X
	LDA $0682,X
	AND #$7F
	CMP #$40
	BCC bra_03_A955
	LDA #$40
bra_03_A955:
	STA $0682,X
	ASL
	TAY
	LDA table_03_AB88,Y
	STA $2E
	LDA table_03_AB88 + 1,Y
	STA $2F
	LDY #$00
bra_03_A966:
	LDA ($2E),Y
	STA $001C,Y
	INY
	CPY #$05
	BCC bra_03_A966
	LDX #$00
	LDY #$1A
bra_03_A974:
	LDA $1C,X
	STA ($2C),Y
	INX
	INY
	CPX #$05
	BCC bra_03_A974
	LDX $43
	RTS
_loc_03_A981:
	TXA
	BNE bra_03_A98C
	LDA флаг_обновления_тайлов_экрана
	ORA #$20
	JMP _loc_03_A991
bra_03_A98C:
	LDA флаг_обновления_тайлов_экрана
	ORA #$10
_loc_03_A991:
	STA флаг_обновления_тайлов_экрана
	RTS
_loc_03_A995:
	LDA байт_для_2000
	AND #$FB
	STA байт_для_2000
	STA $2000
	LDX #$00
bra_03_A9A0:
	JSR _loc_03_A9A9
	INX
	CPX #$02
	BCC bra_03_A9A0
	RTS
_loc_03_A9A9:
	JSR _loc_03_AADC
	LDA опция_режим_сложность
	AND #$20
	BEQ bra_03_A9CA
	TXA
	EOR счетчик_смен
	AND #$01
	BEQ bra_03_A9C1
	LDA номер_игрока + 10,X
	JMP _loc_03_A9CD
bra_03_A9C1:
	LDA счетчик_смен
	AND #$7F
	LSR
	JMP _loc_03_A9CD
bra_03_A9CA:
	LDA номер_игрока,X
_loc_03_A9CD:
	STA $2B
	TAY
	LDA $2E
	CLC
	ADC table_03_AB4B,Y
	STA $2E
	LDA $2F
	ADC #$00
	STA $2F
	LDA $2B
	ASL
	STA $2B
	LDA $32
	CLC
	ADC $2B
	STA $32
	LDA $33
	ADC #$00
	STA $33
	JSR _loc_03_AB01
	LDA $2002
	LDA #$2A
	STA $2006
	LDA table_03_AB57,X
	STA $2006
	LDY #$00
bra_03_AA03:
	LDA $001C,Y
	STA $2007
	INY
	CPY #$05
	BCC bra_03_AA03
	LDA $2002
	LDA #$2A
	STA $2006
	LDA table_03_AB59,X
	STA $2006
bra_03_AA1C:
	LDA $001C,Y
	STA $2007
	INY
	CPY #$0A
	BCC bra_03_AA1C
	LDA $2002
	LDA #$2A
	STA $2006
	LDA table_03_AB5B,X
	STA $2006
	LDA опция_режим_сложность
	AND #$20
	BNE bra_03_AA46
	LDA номер_команды,X
	BPL bra_03_AA4B
	LDA #$4C
	JMP _loc_03_AA4F
bra_03_AA46:
	LDA #$FF
	JMP _loc_03_AA4F
bra_03_AA4B:
	TXA
	CLC
	ADC #$3E
_loc_03_AA4F:
	STA $2007
bra_03_AA52:
	LDA $001C,Y
	STA $2007
	INY
	CPY #$0C
	BCC bra_03_AA52
	LDA $2002
	LDA #$2A
	STA $2006
	LDA table_03_AB5D,X
	STA $2006
	LDA $001C,Y
	STA $2007
	LDA $2002
	LDA #$2A
	STA $2006
	LDA table_03_AB5F,X
	STA $2006
	LDA опция_режим_сложность
	AND #$20
	BEQ bra_03_AAA1
	TXA
	EOR счетчик_смен
	AND #$01
	BEQ bra_03_AA95
	TXA
	CLC
	ADC #$0A
	JMP _loc_03_AA9A
bra_03_AA95:
	LDA счетчик_смен
	AND #$7F
_loc_03_AA9A:
	TAY
	LDA позиция_управление,Y
	JMP _loc_03_AAA4
bra_03_AAA1:
	LDA позиция_управление,X
_loc_03_AAA4:
	AND #$30
	LSR
	LSR
	LSR
	TAY
	LDA table_03_AB80,Y
	STA $2007
	INY
	LDA table_03_AB80,Y
	STA $2007
	LDA опция_режим_сложность
	AND #$20
	BNE bra_03_AAC3
	LDA #$DC
	STA $2007
bra_03_AAC3:
	LDA $2002
	LDA #$2A
	STA $2006
	LDA table_03_AB61,X
	STA $2006
	LDA #$0C
	STA $2007
	LDA #$0D
	STA $2007
	RTS
_loc_03_AADC:
	LDA table_07_C080_byte_8000_8001
	STA $32
	LDA table_07_C080_byte_8000_8001 + 1
	STA $33
	LDA номер_команды,X
	AND #$0F
	ASL
	TAY
	LDA ($32),Y
	STA $2E
	INY
	LDA ($32),Y
	STA $2F
	LDA table_03_AD4F - 1,Y
	STA $32
	LDA table_03_AD4F,Y
	STA $33
	RTS
_loc_03_AB01:
	LDY #$04
	LDA #$FA
bra_03_AB05:
	STA $001C,Y
	DEY
	BPL bra_03_AB05
	LDY #$00
bra_03_AB0D:
	LDA ($2E),Y
	CMP #$50
	BCC bra_03_AB1C
	CMP #$80
	BCC bra_03_AB26
	STA $2B
	JMP _loc_03_AB30
bra_03_AB1C:
	CLC
	ADC #$80
	STA $2B
	LDA #$FB
	JMP _loc_03_AB2D
bra_03_AB26:
	CLC
	ADC #$50
	STA $2B
	LDA #$FC
_loc_03_AB2D:
	STA $001C,Y
_loc_03_AB30:
	LDA $2B
	STA $0021,Y
	INY
	CPY #$05
	BCC bra_03_AB0D
	LDY #$00
	LDA ($32),Y
	STA $26
	CLC
	ADC #$01
	STA $27
	INY
	LDA ($32),Y
	STA $28
	RTS

; AB4B

table_03_AB4B:		; читается из 2х мест
.byte $00,$05,$0A,$0F,$14,$19,$1E,$23,$28,$2D,$32,$37

table_03_AB57:		; байты для 2006
.byte $01,$14

table_03_AB59:		; байты для 2006
.byte $21,$34

table_03_AB5B:		; байты для 2006
.byte $41,$54

table_03_AB5D:		; байты для 2006
.byte $64,$77

table_03_AB5F:		; байты для 2006
.byte $44,$57

table_03_AB61:		; байты для 2006
.byte $62,$75

table_03_AB63:
.byte $0F,$0C,$0D

table_03_AB66:
.byte $5C,$5D,$5E,$5F,$6C,$6D,$6E,$6F,$0F

table_03_AB6F:
.byte $06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F,$11,$12,$18

table_03_AB7C:		; читается из 2х мест
.byte $96,$06
.byte $B9,$06

table_03_AB80:		; читается из 2х мест, но они как-то странно связаны
					; второе место читает байты для 2007
.byte $8F,$A1,$A0,$8F,$8D,$8F,$9E,$9F

table_03_AB88:		;65, читается из 2х мест
.word table_03_AB88_AC0A
.word table_03_AB88_AC0F
.word table_03_AB88_AC14
.word table_03_AB88_AC19
.word table_03_AB88_AC1E
.word table_03_AB88_AC23
.word table_03_AB88_AC28
.word table_03_AB88_AC2D
.word table_03_AB88_AC32
.word table_03_AB88_AC37
.word table_03_AB88_AC3C
.word table_03_AB88_AC41
.word table_03_AB88_AC46
.word table_03_AB88_AC4B
.word table_03_AB88_AC50
.word table_03_AB88_AC55
.word table_03_AB88_AC5A
.word table_03_AB88_AC5F
.word table_03_AB88_AC64
.word table_03_AB88_AC69
.word table_03_AB88_AC6E
.word table_03_AB88_AC73
.word table_03_AB88_AC78
.word table_03_AB88_AC7D
.word table_03_AB88_AC82
.word table_03_AB88_AC87
.word table_03_AB88_AC8C
.word table_03_AB88_AC91
.word table_03_AB88_AC96
.word table_03_AB88_AC9B
.word table_03_AB88_ACA0
.word table_03_AB88_ACA5
.word table_03_AB88_ACAA
.word table_03_AB88_ACAF
.word table_03_AB88_ACB4
.word table_03_AB88_ACB9
.word table_03_AB88_ACBE
.word table_03_AB88_ACC3
.word table_03_AB88_ACC8
.word table_03_AB88_ACCD
.word table_03_AB88_ACD2
.word table_03_AB88_ACD7
.word table_03_AB88_ACDC
.word table_03_AB88_ACE1
.word table_03_AB88_ACE6
.word table_03_AB88_ACEB
.word table_03_AB88_ACF0
.word table_03_AB88_ACF5
.word table_03_AB88_ACFA
.word table_03_AB88_ACFF
.word table_03_AB88_AD04
.word table_03_AB88_AD09
.word table_03_AB88_AD0E
.word table_03_AB88_AD13
.word table_03_AB88_AD18
.word table_03_AB88_AD1D
.word table_03_AB88_AD22
.word table_03_AB88_AD27
.word table_03_AB88_AD2C
.word table_03_AB88_AD31
.word table_03_AB88_AD36
.word table_03_AB88_AD3B
.word table_03_AB88_AD40
.word table_03_AB88_AD45
.word table_03_AB88_AD4A

table_03_AB88_AC0A:
.byte $AD,$D2,$D9,$B5,$FF

table_03_AB88_AC0F:
.byte $B2,$D1,$CF,$AE,$FF

table_03_AB88_AC14:
.byte $AB,$E1,$A6,$D9,$CA

table_03_AB88_AC19:
.byte $A3,$AA,$A3,$AA,$DF

table_03_AB88_AC1E:
.byte $B1,$E1,$D0,$AD,$D2

table_03_AB88_AC23:
.byte $A7,$CD,$AF,$FF,$FF

table_03_AB88_AC28:
.byte $BD,$E1,$B3,$AA,$CC

table_03_AB88_AC2D:
.byte $BB,$E0,$AE,$DF,$FF

table_03_AB88_AC32:
.byte $C0,$CD,$AF,$FF,$FF

table_03_AB88_AC37:
.byte $C7,$AB,$AF,$FF,$FF

table_03_AB88_AC3C:
.byte $A6,$CB,$A6,$CB,$DF

table_03_AB88_AC41:
.byte $AB,$D0,$B2,$FF,$FF

table_03_AB88_AC46:
.byte $C0,$A7,$AF,$CC,$FF

table_03_AB88_AC4B:
.byte $B1,$D0,$A9,$CA,$FF

table_03_AB88_AC50:
.byte $C0,$A2,$D9,$A9,$FF

table_03_AB88_AC55:
.byte $A4,$BB,$E1,$A5,$DF

table_03_AB88_AC5A:
.byte $BD,$E1,$CC,$D0,$A9

table_03_AB88_AC5F:
.byte $B2,$D7,$D0,$A9,$FF

table_03_AB88_AC64:
.byte $AE,$BE,$E1,$CB,$FF

table_03_AB88_AC69:
.byte $A7,$D0,$B5,$DF,$FF

table_03_AB88_AC6E:
.byte $A9,$C9,$A2,$D9,$FF

table_03_AB88_AC73:
.byte $AA,$CB,$DF,$FF,$FF

table_03_AB88_AC78:
.byte $C5,$CB,$DF,$FF,$FF

table_03_AB88_AC7D:
.byte $A3,$AA,$DF,$FF,$FF

table_03_AB88_AC82:
.byte $80,$9F,$DF,$FF,$FF

table_03_AB88_AC87:
.byte $80,$9F,$80,$9F,$DF

table_03_AB88_AC8C:
.byte $A6,$D0,$AE,$FF,$FF

table_03_AB88_AC91:
.byte $A7,$E1,$D0,$B4,$CF

table_03_AB88_AC96:
.byte $C7,$AD,$DF,$FF,$FF

table_03_AB88_AC9B:
.byte $A3,$C5,$B1,$E1,$DF

table_03_AB88_ACA0:
.byte $BE,$E1,$A5,$D9,$D0

table_03_AB88_ACA5:
.byte $A4,$CA,$AC,$A3,$FF

table_03_AB88_ACAA:
.byte $C2,$AD,$D0,$DF,$FF

table_03_AB88_ACAF:
.byte $E2,$E2,$E2,$E2,$E2

table_03_AB88_ACB4:
.byte $E2,$E2,$E2,$E3,$DF

table_03_AB88_ACB9:
.byte $E2,$E2,$E2,$CF,$DF

table_03_AB88_ACBE:
.byte $E2,$E2,$E2,$DF,$DE

table_03_AB88_ACC3:
.byte $E3,$E2,$E3,$E2,$E3

table_03_AB88_ACC8:
.byte $DE,$DE,$DE,$DE,$DF

table_03_AB88_ACCD:
.byte $A4,$BC,$D3,$FF,$FF

table_03_AB88_ACD2:
.byte $A4,$BB,$D4,$FF,$FF

table_03_AB88_ACD7:
.byte $A8,$E1,$A5,$D9,$D0

table_03_AB88_ACDC:
.byte $A9,$E1,$A5,$D9,$D0

table_03_AB88_ACE1:
.byte $A9,$E1,$AA,$E1,$D0

table_03_AB88_ACE6:
.byte $B1,$E1,$A2,$D9,$D0

table_03_AB88_ACEB:
.byte $B5,$E1,$C9,$D1,$D9

table_03_AB88_ACF0:
.byte $A7,$E1,$A6,$D9,$D0

table_03_AB88_ACF5:
.byte $B1,$A2,$D9,$D0,$FF

table_03_AB88_ACFA:
.byte $B5,$C9,$D1,$D9,$FF

table_03_AB88_ACFF:
.byte $A4,$C9,$D1,$D9,$FF

table_03_AB88_AD04:
.byte $BF,$A3,$D0,$FF,$FF

table_03_AB88_AD09:
.byte $BB,$A2,$D0,$FF,$FF

table_03_AB88_AD0E:
.byte $A5,$A3,$DF,$FF,$FF

table_03_AB88_AD13:
.byte $CF,$BB,$E1,$DF,$FF

table_03_AB88_AD18:
.byte $B8,$BB,$E1,$DF,$FF

table_03_AB88_AD1D:
.byte $CF,$AA,$E1,$DF,$FF

table_03_AB88_AD22:
.byte $D0,$AA,$E1,$CC,$FF

table_03_AB88_AD27:
.byte $A3,$A5,$D9,$AE,$FF

table_03_AB88_AD2C:
.byte $A6,$E2,$BA,$D9,$A4

table_03_AB88_AD31:
.byte $AB,$E1,$C3,$CF,$DF

table_03_AB88_AD36:
.byte $C5,$C2,$C5,$C2,$FF

table_03_AB88_AD3B:
.byte $A3,$B4,$D7,$FF,$FF

table_03_AB88_AD40:
.byte $A4,$D0,$DF,$FF,$FF

table_03_AB88_AD45:
.byte $A6,$D9,$D0,$DF,$DF

table_03_AB88_AD4A:
.byte $FF,$FF,$FF,$FF,$FF

table_03_AD4F:		; 16, 3 дубля, что-то связано с командами
					; по виду похоже на цифры в расстановке рядом с именами
.word table_03_AD4F_AD6F
.word table_03_AD4F_AD87
.word table_03_AD4F_AD9F
.word table_03_AD4F_AD93
.word table_03_AD4F_AD6F
.word table_03_AD4F_ADAB
.word table_03_AD4F_ADB7
.word table_03_AD4F_ADC3
.word table_03_AD4F_AD6F
.word table_03_AD4F_ADCF
.word table_03_AD4F_ADDB
.word table_03_AD4F_ADE7
.word table_03_AD4F_AD6F
.word table_03_AD4F_ADF3
.word table_03_AD4F_ADFF
.word table_03_AD4F_AE0B

table_03_AD4F_AD6F:		; возможно япония
.byte $00,$98,$18,$97,$08,$99,$16,$91,$0A,$92,$02,$90
.byte $12,$93,$14,$94,$06,$95,$10,$96,$1A,$9A,$04,$9B

table_03_AD4F_AD87:
.byte $20,$90,$22,$91,$24,$92,$26,$93,$28,$94,$2A,$95

table_03_AD4F_AD93:
.byte $30,$90,$32,$91,$34,$92,$36,$93,$38,$94,$3A,$95

table_03_AD4F_AD9F:
.byte $70,$90,$72,$91,$74,$92,$76,$93,$78,$94,$7A,$95

table_03_AD4F_ADAB:
.byte $40,$90,$42,$91,$44,$92,$46,$93,$48,$94,$4A,$95

table_03_AD4F_ADB7:
.byte $50,$90,$52,$91,$54,$92,$56,$93,$58,$94,$5A,$95

table_03_AD4F_ADC3:
.byte $20,$90,$22,$91,$24,$92,$26,$93,$28,$94,$2A,$95

table_03_AD4F_ADCF:
.byte $50,$90,$52,$91,$54,$92,$56,$93,$58,$94,$5A,$95

table_03_AD4F_ADDB:
.byte $70,$90,$72,$91,$74,$92,$76,$93,$78,$94,$7A,$95

table_03_AD4F_ADE7:
.byte $60,$90,$62,$91,$64,$92,$66,$93,$68,$94,$6A,$95

table_03_AD4F_ADF3:
.byte $30,$90,$32,$91,$34,$92,$36,$93,$38,$94,$3A,$95

table_03_AD4F_ADFF:
.byte $40,$90,$42,$91,$44,$92,$46,$93,$48,$94,$4A,$95

table_03_AD4F_AE0B:
.byte $60,$90,$62,$91,$64,$92,$66,$93,$68,$94,$6A,$95

_loc_03_AE17:
	JMP _loc_03_AE17
_loc_03_AE1A:
	TYA
	PHA
	LDY $1F
	LDA координата_X_lo,Y
	STA $32
	LDA координата_X_hi,Y
	STA $33
	LDA координата_Y_lo,Y
	STA $34
	LDA координата_Y_hi,Y
	STA $35
	PLA
	TAY
	JMP _loc_03_AE4B
_loc_03_AE37:
	LDA $0620,X
	STA $32
	LDA $062C,X
	STA $33
	LDA $0638,X
	STA $34
	LDA $0644,X
	STA $35
_loc_03_AE4B:
	LDA $32
	SEC
	SBC координата_X_lo,X
	STA $1E
	LDA $33
	SBC координата_X_hi,X
	STA $28
	BMI bra_03_AE6A
	BNE bra_03_AE65
	LDA $1E
	BMI bra_03_AE65
	JMP _loc_03_AE77
bra_03_AE65:
	LDA #$7F
	JMP _loc_03_AE77
bra_03_AE6A:
	CMP #$FF
	BCC bra_03_AE75
	LDA $1E
	BPL bra_03_AE75
	JMP _loc_03_AE77
bra_03_AE75:
	LDA #$80
_loc_03_AE77:
	STA $1C
	BPL bra_03_AE80
	EOR #$FF
	CLC
	ADC #$01
bra_03_AE80:
	STA $2A
	LDA $28
	EOR номер_анимации,X
	STA $29
	LDA $34
	SEC
	SBC координата_Y_lo,X
	STA $1E
	LDA $35
	SBC координата_Y_hi,X
	BMI bra_03_AEA6
	BNE bra_03_AEA1
	LDA $1E
	BMI bra_03_AEA1
	JMP _loc_03_AEB3
bra_03_AEA1:
	LDA #$7F
	JMP _loc_03_AEB3
bra_03_AEA6:
	CMP #$FF
	BCC bra_03_AEB1
	LDA $1E
	BPL bra_03_AEB1
	JMP _loc_03_AEB3
bra_03_AEB1:
	LDA #$80
_loc_03_AEB3:
	STA $1D
	BPL bra_03_AEBC
	EOR #$FF
	CLC
	ADC #$01
bra_03_AEBC:
	STA $2B
	RTS
_loc_03_AEBF:
	STX $1C
	CPY $1C
	BNE bra_03_AEC7
	SEC
	RTS
bra_03_AEC7:
	LDA координата_X_lo,Y
	SEC
	SBC координата_X_lo,X
	LDA координата_X_hi,Y
	SBC координата_X_hi,X
	STA $1C
	LDA координата_Y_lo,Y
	SEC
	SBC координата_Y_lo,X
	LDA координата_Y_hi,Y
	SBC координата_Y_hi,X
	STA $1D
	LDA скорость_X_hi,Y
	BEQ bra_03_AEEF
	EOR $1C
	JMP _loc_03_AEF1
bra_03_AEEF:
	LDA #$80
_loc_03_AEF1:
	STA $1C
	LDA скорость_Y_hi,Y
	BEQ bra_03_AEFD
	EOR $1D
	JMP _loc_03_AEFF
bra_03_AEFD:
	LDA #$80
_loc_03_AEFF:
	AND $1C
	STA $1D
	LDA скорость_X_hi,Y
	ORA скорость_X_lo,Y
	BEQ bra_03_AF18
	LDA скорость_X_hi,Y
	BPL bra_03_AF15
	EOR #$FF
	CLC
	ADC #$01
bra_03_AF15:
	CLC
	ADC #$01
bra_03_AF18:
	STA $1C
	LDA скорость_Y_hi,Y
	ORA скорость_Y_lo,Y
	BEQ bra_03_AF2F
	LDA скорость_Y_hi,Y
	BPL bra_03_AF2C
	EOR #$FF
	CLC
	ADC #$01
bra_03_AF2C:
	CLC
	ADC #$01
bra_03_AF2F:
	CLC
	ADC $1C
	STA $1C
	LDA $1D
	ASL
	RTS
_loc_03_AF38:
	TYA
	PHA
	LDA #$00
	STA $2A
	LDA координата_X_lo,Y
	SEC
	SBC координата_X_lo,X
	STA $1C
	LDA координата_X_hi,Y
	SBC координата_X_hi,X
	STA $1D
	BPL bra_03_AF66
	LDA #$FF
	STA $2A
	LDA $1C
	EOR #$FF
	CLC
	ADC #$01
	STA $1C
	LDA $1D
	EOR #$FF
	ADC #$00
	STA $1D
bra_03_AF66:
	LDA #$00
	STA $2B
	LDA координата_Y_lo,Y
	SEC
	SBC координата_Y_lo,X
	STA $1E
	LDA координата_Y_hi,Y
	SBC координата_Y_hi,X
	STA $1F
	BPL bra_03_AF92
	LDA #$FF
	STA $2B
	LDA $1E
	EOR #$FF
	CLC
	ADC #$01
	STA $1E
	LDA $1F
	EOR #$FF
	ADC #$00
	STA $1F
_loc_03_AF92:
bra_03_AF92:
	LDA $1D
	ORA $1F
	BNE bra_03_AFA0
	LDA $1C
	ORA $1E
	AND #$E0
	BEQ bra_03_AFAB
bra_03_AFA0:
	LSR $1D
	ROR $1C
	LSR $1F
	ROR $1E
	JMP _loc_03_AF92
bra_03_AFAB:
	LDA $1E
	STA $1D
_loc_03_AFAF:
	LDA $1C
	ORA $1D
	BEQ bra_03_AFC0
	AND #$10
	BNE bra_03_AFC0
	ASL $1C
	ASL $1D
	JMP _loc_03_AFAF
bra_03_AFC0:
	LDA $1C
	SEC
	SBC $1D
	BPL bra_03_AFCC
	EOR #$FF
	CLC
	ADC #$01
bra_03_AFCC:
	TAY
	LDA table_03_B014,Y
	STA $1F
	LDA $1C
	CMP $1D
	BEQ bra_03_AFE4
	BCS bra_03_AFEB
	LDA #$60
	CLC
	ADC $1F
	STA $1F
	JMP _loc_03_AFF2
bra_03_AFE4:
	LDA #$60
	STA $1F
	JMP _loc_03_AFF2
bra_03_AFEB:
	LDA #$60
	SEC
	SBC $1F
	STA $1F
_loc_03_AFF2:
	LDA $2B
	BPL bra_03_B002
	LDA $1F
	SEC
	SBC #$40
	EOR #$FF
	CLC
	ADC #$41
	STA $1F
bra_03_B002:
	LDA $2A
	BPL bra_03_B00F
	LDA $1F
	EOR #$FF
	CLC
	ADC #$01
	STA $1F
bra_03_B00F:
	PLA
	TAY
	LDA $1F
	RTS

table_03_B014:
.byte $00,$01,$02,$04,$05,$06,$08,$09,$0A,$0B,$0C,$0D,$0E,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1C,$1D,$1E,$1F,$1F,$20

_loc_03_B034:
	STX $43
	LDX #$00
	LDA #$FF
bra_03_B03A:
	STA $2C,X
	INX
	CPX #$12
	BCC bra_03_B03A
	LDX $43
bra_03_B043:
	LDA флаг_видимости,Y
	BNE bra_03_B04B
	JMP _loc_03_B0A7
bra_03_B04B:
	STX $3F
	TYA
	CMP $3F
	BEQ bra_03_B0A7
	JSR _loc_03_AF38
	SEC
	SBC $20
	BPL bra_03_B05F
	EOR #$FF
	CLC
	ADC #$01
bra_03_B05F:
	CMP $21
	BEQ bra_03_B068
	BCC bra_03_B068
	JMP _loc_03_B0A7
bra_03_B068:
	JSR _b07_FA6D
	STY $44
	LDY #$0F
bra_03_B06F:
	LDA $24
	CMP $002E,Y
	BEQ bra_03_B07B
	BCC bra_03_B07B
	JMP _loc_03_B0A5
bra_03_B07B:
	CPY #$0F
	BEQ bra_03_B091
	LDA $002C,Y
	STA $002F,Y
	LDA $002D,Y
	STA $0030,Y
	LDA $002E,Y
	STA $0031,Y
bra_03_B091:
	LDA $24
	STA $002E,Y
	LDA $1F
	STA $002D,Y
	LDA $44
	STA $002C,Y
	DEY
	DEY
	DEY
	BPL bra_03_B06F
_loc_03_B0A5:
	LDY $44
_loc_03_B0A7:
bra_03_B0A7:
	INY
	INY
	CPY #$0C
	BCC bra_03_B043
	RTS
_loc_03_B0AE:
	LDY #$0A
bra_03_B0B0:
	JSR _loc_03_B0D7
	BMI bra_03_B0C6
	STA $1C
	TYA
	AND #$01
	EOR $1C
	BEQ bra_03_B0C1
	JMP _loc_03_B0C6
bra_03_B0C1:
	LDA #$00
	JMP _loc_03_B0CE
_loc_03_B0C6:
bra_03_B0C6:
	LDA опция_режим_сложность
	AND #$20
	BNE bra_03_B0C1
	LDA #$80
_loc_03_B0CE:
	STA флаг_кипера_в_штрафной - $0A,Y
	INY
	CPY #$0C
	BCC bra_03_B0B0
	RTS
_loc_03_B0D7:
	LDA #$60
	SEC
	SBC координата_Y_lo,Y
	LDA #$00
	SBC координата_Y_hi,Y
	BPL bra_03_B12A
	LDA #$20
	SEC
	SBC координата_Y_lo,Y
	LDA #$01
	SBC координата_Y_hi,Y
	BMI bra_03_B12A
	LDA координата_Y_lo,Y
	SEC
	SBC #$60
	LSR
	LSR
	LSR
	STA $1C
	LDA #$08
	CLC
	ADC $1C
	STA $1D
	LDA $1D
	SEC
	SBC координата_X_lo,Y
	LDA #$03
	SBC координата_X_hi,Y
	BPL bra_03_B113
	LDA #$01
	RTS
bra_03_B113:
	LDA #$F8
	SEC
	SBC $1C
	STA $1D
	LDA $1D
	SEC
	SBC координата_X_lo,Y
	LDA #$00
	SBC координата_X_hi,Y
	BMI bra_03_B12A
	LDA #$00
	RTS
bra_03_B12A:
	LDA #$FF
	RTS
_loc_03_B12D:
	TXA
	PHA
	TYA
	AND #$01
	STA $1C
	LDA расстановка_команды,Y
	AND #$03
	ASL
	TAY
	LDA table_03_B15D,Y
	STA $2C
	LDA table_03_B15D + 1,Y
	STA $2D
	LDX $1C
	LDY #$00
bra_03_B149:
	LDA позиция_управление,X
	AND #$CF
	ORA ($2C),Y
	STA позиция_управление,X
	INX
	INX
	INY
	CPY #$06
	BCC bra_03_B149
	PLA
	TAX
	RTS

table_03_B15D:		; вероятно связано с расстановкой, 3 * 6 байтов
.word table_03_B15D_B163
.word table_03_B15D_B169
.word table_03_B15D_B16F

table_03_B15D_B163:
.byte $10,$00,$00,$20,$20,$30

table_03_B15D_B169:
.byte $10,$00,$00,$10,$20,$30

table_03_B15D_B16F:
.byte $10,$00,$10,$20,$20,$30

_loc_03_B175:
	TYA
	PHA
	LDA $2A
	BEQ bra_03_B182
	CMP $1E
	BCC bra_03_B182
	JMP _loc_03_B187
bra_03_B182:
	LDA #$00
	JMP _loc_03_B192
_loc_03_B187:
	LDA $1C
	BPL bra_03_B190
	LDA #$02
	JMP _loc_03_B192
bra_03_B190:
	LDA #$01
_loc_03_B192:
	STA $20
	LDA $2B
	BEQ bra_03_B19F
	CMP $1F
	BCC bra_03_B19F
	JMP _loc_03_B1A4
bra_03_B19F:
	LDA #$00
	JMP _loc_03_B1CB
_loc_03_B1A4:
	LDA $1D
	BPL bra_03_B1BB
	LDA $20
	BEQ bra_03_B1B6
	LDA $2A
	CMP $2B
	BCS bra_03_B1B6
	LDA #$00
	STA $20
bra_03_B1B6:
	LDA #$08
	JMP _loc_03_B1CB
bra_03_B1BB:
	LDA $20
	BEQ bra_03_B1C9
	LDA $2A
	CMP $2B
	BCS bra_03_B1C9
	LDA #$00
	STA $20
bra_03_B1C9:
	LDA #$04
_loc_03_B1CB:
	ORA $20
	STA $20
	TAY
	LDA table_03_B1ED,Y
	STA смена_угла_движения,X
	CMP #$FF
	BEQ bra_03_B1E2
	LDA позиция_управление,X
	AND #$BF
	JMP _loc_03_B1E7
bra_03_B1E2:
	LDA позиция_управление,X
	ORA #$40
_loc_03_B1E7:
	STA позиция_управление,X
	PLA
	TAY
	RTS

table_03_B1ED:
.byte $FF,$40,$C0,$FF,$80,$60,$A0,$FF,$00,$20,$E0

table_03_B1F8:		; что-то связанное с расстановкой, всего 3 расстановки
.word table_03_B1F8_B1FE
.word table_03_B1F8_B1FE
.word table_03_B1F8_B50A

table_03_B1F8_B1FE:		; 54, встрачаются 12 дублей
.word table_03_B1F8_B1FE_B26A
.word table_03_B1F8_B1FE_B27A
.word table_03_B1F8_B1FE_B28A
.word table_03_B1F8_B1FE_B29A
.word table_03_B1F8_B1FE_B2AA
.word table_03_B1F8_B1FE_B2BA
.word table_03_B1F8_B1FE_B26A
.word table_03_B1F8_B1FE_B27A
.word table_03_B1F8_B1FE_B28A
.word table_03_B1F8_B1FE_B29A
.word table_03_B1F8_B1FE_B2AA
.word table_03_B1F8_B1FE_B2BA
.word table_03_B1F8_B1FE_B2CA
.word table_03_B1F8_B1FE_B2DA
.word table_03_B1F8_B1FE_B2EA
.word table_03_B1F8_B1FE_B2FA
.word table_03_B1F8_B1FE_B30A
.word table_03_B1F8_B1FE_B31A
.word table_03_B1F8_B1FE_B32A
.word table_03_B1F8_B1FE_B33A
.word table_03_B1F8_B1FE_B34A
.word table_03_B1F8_B1FE_B35A
.word table_03_B1F8_B1FE_B36A
.word table_03_B1F8_B1FE_B37A
.word table_03_B1F8_B1FE_B38A
.word table_03_B1F8_B1FE_B39A
.word table_03_B1F8_B1FE_B3AA
.word table_03_B1F8_B1FE_B3BA
.word table_03_B1F8_B1FE_B3CA
.word table_03_B1F8_B1FE_B3DA
.word table_03_B1F8_B1FE_B3EA
.word table_03_B1F8_B1FE_B3FA
.word table_03_B1F8_B1FE_B40A
.word table_03_B1F8_B1FE_B41A
.word table_03_B1F8_B1FE_B42A
.word table_03_B1F8_B1FE_B43A
.word table_03_B1F8_B1FE_B44A
.word table_03_B1F8_B1FE_B45A
.word table_03_B1F8_B1FE_B46A
.word table_03_B1F8_B1FE_B47A
.word table_03_B1F8_B1FE_B48A
.word table_03_B1F8_B1FE_B49A
.word table_03_B1F8_B1FE_B4AA
.word table_03_B1F8_B1FE_B4BA
.word table_03_B1F8_B1FE_B4CA
.word table_03_B1F8_B1FE_B4DA
.word table_03_B1F8_B1FE_B4EA
.word table_03_B1F8_B1FE_B4FA
.word table_03_B1F8_B1FE_B4AA
.word table_03_B1F8_B1FE_B4BA
.word table_03_B1F8_B1FE_B4CA
.word table_03_B1F8_B1FE_B4DA
.word table_03_B1F8_B1FE_B4EA
.word table_03_B1F8_B1FE_B4FA

table_03_B1F8_B1FE_B26A:	; везде по 16 байтов
.byte $02,$22,$00,$78,$02,$C3,$00,$44,$02,$93,$00,$B7,$01,$EB,$00,$56

table_03_B1F8_B1FE_B27A:
.byte $02,$79,$00,$6C,$02,$F2,$00,$44,$02,$A7,$00,$B4,$02,$22,$00,$77

table_03_B1F8_B1FE_B28A:
.byte $02,$96,$00,$8C,$03,$3D,$00,$44,$02,$EB,$00,$C3,$02,$62,$00,$9E

table_03_B1F8_B1FE_B29A:
.byte $03,$00,$00,$63,$03,$55,$00,$44,$03,$09,$00,$C1,$02,$AD,$00,$7B

table_03_B1F8_B1FE_B2AA:
.byte $03,$00,$00,$63,$03,$55,$00,$A0,$03,$09,$00,$DC,$02,$D3,$00,$5B

table_03_B1F8_B1FE_B2BA:
.byte $03,$1D,$00,$8E,$03,$32,$00,$B0,$02,$E6,$00,$D3,$02,$E3,$00,$40

table_03_B1F8_B1FE_B2CA:
.byte $02,$0C,$00,$A6,$02,$B3,$00,$4E,$02,$91,$00,$BB,$01,$F6,$00,$61

table_03_B1F8_B1FE_B2DA:
.byte $02,$39,$00,$A6,$02,$F5,$00,$4E,$02,$B0,$00,$BB,$02,$32,$00,$5E

table_03_B1F8_B1FE_B2EA:
.byte $02,$80,$00,$99,$03,$4C,$00,$44,$02,$EE,$00,$BB,$02,$8C,$00,$52

table_03_B1F8_B1FE_B2FA:
.byte $02,$CA,$00,$99,$03,$56,$00,$53,$03,$25,$00,$C7,$02,$CE,$00,$3A

table_03_B1F8_B1FE_B30A:
.byte $02,$DD,$00,$A8,$03,$56,$00,$53,$03,$39,$00,$D0,$02,$DE,$00,$3A

table_03_B1F8_B1FE_B31A:
.byte $02,$D5,$00,$BC,$03,$28,$00,$B0,$03,$54,$00,$D9,$02,$D5,$00,$5A

table_03_B1F8_B1FE_B32A:
.byte $02,$24,$00,$CF,$02,$C9,$00,$5B,$02,$B1,$00,$DA,$01,$F7,$00,$74

table_03_B1F8_B1FE_B33A:
.byte $02,$42,$00,$CF,$02,$EF,$00,$58,$02,$CF,$00,$DA,$02,$2C,$00,$6B

table_03_B1F8_B1FE_B34A:
.byte $02,$63,$00,$CF,$03,$3A,$00,$51,$03,$0B,$00,$CB,$02,$7A,$00,$62

table_03_B1F8_B1FE_B35A:
.byte $02,$AC,$00,$DB,$03,$54,$00,$4E,$03,$1F,$00,$C8,$02,$D0,$00,$53

table_03_B1F8_B1FE_B36A:
.byte $02,$D0,$00,$B1,$03,$5C,$00,$5D,$03,$25,$00,$E6,$02,$F6,$00,$45

table_03_B1F8_B1FE_B37A:
.byte $02,$D8,$00,$96,$03,$5C,$00,$6C,$03,$3A,$00,$F1,$03,$0A,$00,$54

table_03_B1F8_B1FE_B38A:
.byte $01,$F2,$00,$E7,$02,$A2,$00,$7B,$02,$A7,$00,$FD,$01,$F5,$00,$97

table_03_B1F8_B1FE_B39A:
.byte $02,$39,$00,$E7,$02,$F3,$00,$7B,$02,$FC,$00,$FD,$02,$36,$00,$97

table_03_B1F8_B1FE_B3AA:
.byte $02,$6A,$00,$E7,$03,$35,$00,$6F,$03,$0D,$01,$0B,$02,$6D,$00,$8B

table_03_B1F8_B1FE_B3BA:
.byte $02,$AE,$00,$E7,$03,$53,$00,$5D,$03,$4C,$01,$11,$02,$AB,$00,$7F

table_03_B1F8_B1FE_B3CA:
.byte $02,$DC,$00,$E7,$03,$3B,$00,$90,$03,$46,$01,$05,$02,$DC,$00,$9A

table_03_B1F8_B1FE_B3DA:
.byte $02,$E5,$00,$FC,$03,$2F,$00,$9F,$03,$3C,$00,$EA,$02,$DC,$00,$80

table_03_B1F8_B1FE_B3EA:
.byte $01,$F7,$01,$20,$02,$9E,$00,$9A,$02,$C6,$01,$22,$01,$EE,$00,$BB

table_03_B1F8_B1FE_B3FA:
.byte $02,$3E,$01,$20,$02,$BB,$00,$91,$03,$03,$01,$22,$02,$30,$00,$C4

table_03_B1F8_B1FE_B40A:
.byte $02,$7E,$01,$26,$02,$FF,$00,$A0,$03,$4D,$01,$22,$02,$6F,$00,$D3

table_03_B1F8_B1FE_B41A:
.byte $02,$C5,$01,$2F,$03,$2B,$00,$B5,$03,$72,$01,$31,$02,$B4,$00,$D9

table_03_B1F8_B1FE_B42A:
.byte $02,$F2,$01,$35,$03,$4A,$00,$A6,$03,$6D,$01,$3A,$02,$CD,$00,$D1

table_03_B1F8_B1FE_B43A:
.byte $03,$12,$01,$20,$03,$3F,$00,$AD,$03,$6D,$01,$52,$02,$DC,$00,$BF

table_03_B1F8_B1FE_B44A:
.byte $01,$FF,$01,$4A,$02,$89,$00,$BB,$02,$C3,$01,$40,$01,$E4,$00,$F3

table_03_B1F8_B1FE_B45A:
.byte $02,$3B,$01,$4A,$02,$AD,$00,$BB,$03,$08,$01,$40,$02,$23,$00,$F3

table_03_B1F8_B1FE_B46A:
.byte $02,$88,$01,$4A,$03,$05,$00,$BB,$03,$58,$01,$40,$02,$7C,$00,$F3

table_03_B1F8_B1FE_B47A:
.byte $02,$CB,$01,$4A,$03,$2B,$00,$BB,$03,$6E,$01,$49,$02,$C9,$00,$E4

table_03_B1F8_B1FE_B48A:
.byte $02,$EC,$01,$3F,$03,$36,$00,$AC,$03,$6C,$01,$43,$02,$FF,$00,$CD

table_03_B1F8_B1FE_B49A:
.byte $02,$E3,$01,$36,$03,$3A,$00,$AF,$03,$6C,$01,$55,$03,$18,$00,$D9

table_03_B1F8_B1FE_B4AA:
.byte $01,$F5,$01,$59,$02,$6D,$00,$DF,$02,$CB,$01,$57,$02,$01,$00,$FC

table_03_B1F8_B1FE_B4BA:
.byte $02,$3E,$01,$59,$02,$A8,$00,$D9,$03,$11,$01,$57,$02,$3F,$00,$FC

table_03_B1F8_B1FE_B4CA:
.byte $02,$82,$01,$59,$02,$F4,$00,$D3,$03,$54,$01,$4F,$02,$8C,$00,$F1

table_03_B1F8_B1FE_B4DA:
.byte $02,$C0,$01,$59,$03,$24,$00,$CD,$03,$65,$01,$43,$02,$CD,$00,$EB

table_03_B1F8_B1FE_B4EA:
.byte $02,$DD,$01,$56,$03,$49,$00,$D5,$03,$65,$00,$00,$02,$E4,$00,$E5

table_03_B1F8_B1FE_B4FA:
.byte $02,$DD,$01,$2C,$03,$56,$00,$AE,$03,$3D,$00,$F4,$03,$04,$00,$D9

table_03_B1F8_B50A:		; 54, встрачаются 12 дублей
.word table_03_B1F8_B50A_B576
.word table_03_B1F8_B50A_B582
.word table_03_B1F8_B50A_B58E
.word table_03_B1F8_B50A_B59A
.word table_03_B1F8_B50A_B5A6
.word table_03_B1F8_B50A_B5B2
.word table_03_B1F8_B50A_B576
.word table_03_B1F8_B50A_B582
.word table_03_B1F8_B50A_B58E
.word table_03_B1F8_B50A_B59A
.word table_03_B1F8_B50A_B5A6
.word table_03_B1F8_B50A_B5B2
.word table_03_B1F8_B50A_B5BE
.word table_03_B1F8_B50A_B5CA
.word table_03_B1F8_B50A_B5D6
.word table_03_B1F8_B50A_B5E2
.word table_03_B1F8_B50A_B5EE
.word table_03_B1F8_B50A_B5FA
.word table_03_B1F8_B50A_B606
.word table_03_B1F8_B50A_B612
.word table_03_B1F8_B50A_B61E
.word table_03_B1F8_B50A_B62A
.word table_03_B1F8_B50A_B636
.word table_03_B1F8_B50A_B642
.word table_03_B1F8_B50A_B64E
.word table_03_B1F8_B50A_B65A
.word table_03_B1F8_B50A_B666
.word table_03_B1F8_B50A_B672
.word table_03_B1F8_B50A_B67E
.word table_03_B1F8_B50A_B68A
.word table_03_B1F8_B50A_B696
.word table_03_B1F8_B50A_B6A2
.word table_03_B1F8_B50A_B6AE
.word table_03_B1F8_B50A_B6BA
.word table_03_B1F8_B50A_B6C6
.word table_03_B1F8_B50A_B6D2
.word table_03_B1F8_B50A_B6DE
.word table_03_B1F8_B50A_B6EA
.word table_03_B1F8_B50A_B6F6
.word table_03_B1F8_B50A_B702
.word table_03_B1F8_B50A_B70E
.word table_03_B1F8_B50A_B71A
.word table_03_B1F8_B50A_B726
.word table_03_B1F8_B50A_B732
.word table_03_B1F8_B50A_B73E
.word table_03_B1F8_B50A_B74A
.word table_03_B1F8_B50A_B756
.word table_03_B1F8_B50A_B762
.word table_03_B1F8_B50A_B726
.word table_03_B1F8_B50A_B732
.word table_03_B1F8_B50A_B73E
.word table_03_B1F8_B50A_B74A
.word table_03_B1F8_B50A_B756
.word table_03_B1F8_B50A_B762

table_03_B1F8_B50A_B576:	; везде по 12 байтов
.byte $02,$35,$00,$8F,$02,$04,$00,$C0,$02,$00,$00,$5C

table_03_B1F8_B50A_B582:
.byte $02,$08,$00,$C2,$02,$4F,$00,$85,$01,$F8,$00,$76

table_03_B1F8_B50A_B58E:
.byte $02,$5E,$00,$C2,$02,$A3,$00,$86,$02,$2F,$00,$76

table_03_B1F8_B50A_B59A:
.byte $02,$B4,$00,$B6,$03,$0C,$00,$A5,$02,$AF,$00,$76

table_03_B1F8_B50A_B5A6:
.byte $02,$D9,$00,$B6,$03,$38,$00,$92,$02,$DE,$00,$80

table_03_B1F8_B50A_B5B2:
.byte $02,$DC,$00,$B6,$03,$40,$00,$C5,$03,$12,$00,$75

table_03_B1F8_B50A_B5BE:
.byte $01,$F0,$00,$CD,$02,$8E,$00,$AA,$01,$E9,$00,$65

table_03_B1F8_B50A_B5CA:
.byte $02,$2A,$00,$CD,$02,$C6,$00,$AA,$02,$28,$00,$62

table_03_B1F8_B50A_B5D6:
.byte $02,$74,$00,$CD,$03,$1E,$00,$AA,$02,$77,$00,$62

table_03_B1F8_B50A_B5E2:
.byte $02,$B5,$00,$CD,$03,$3B,$00,$D3,$02,$B1,$00,$59

table_03_B1F8_B50A_B5EE:
.byte $02,$DA,$00,$CD,$03,$41,$00,$E6,$02,$D8,$00,$59

table_03_B1F8_B50A_B5FA:
.byte $02,$F5,$00,$B6,$03,$60,$00,$FD,$02,$FA,$00,$45

table_03_B1F8_B50A_B606:
.byte $02,$01,$00,$E8,$02,$AC,$00,$C2,$02,$12,$00,$45

table_03_B1F8_B50A_B612:
.byte $02,$30,$00,$E8,$02,$ED,$00,$C2,$02,$53,$00,$45

table_03_B1F8_B50A_B61E:
.byte $02,$73,$00,$E8,$03,$2C,$00,$C2,$02,$8D,$00,$45

table_03_B1F8_B50A_B62A:
.byte $02,$C2,$00,$E8,$03,$3D,$00,$E7,$02,$EF,$00,$41

table_03_B1F8_B50A_B636:
.byte $02,$E0,$00,$E8,$03,$34,$00,$F7,$02,$F1,$00,$41

table_03_B1F8_B50A_B642:
.byte $02,$E0,$00,$E8,$03,$44,$01,$01,$02,$F1,$00,$41

table_03_B1F8_B50A_B64E:
.byte $01,$F2,$01,$00,$02,$56,$00,$F0,$01,$F1,$00,$7C

table_03_B1F8_B50A_B65A:
.byte $02,$30,$01,$00,$02,$95,$00,$95,$02,$2E,$00,$77

table_03_B1F8_B50A_B666:
.byte $02,$6C,$01,$00,$02,$F8,$00,$EA,$02,$6A,$00,$77

table_03_B1F8_B50A_B672:
.byte $02,$B6,$01,$00,$03,$2B,$00,$9B,$02,$B9,$00,$77

table_03_B1F8_B50A_B67E:
.byte $02,$EA,$01,$00,$03,$31,$00,$ED,$02,$DE,$00,$77

table_03_B1F8_B50A_B68A:
.byte $02,$E8,$01,$00,$03,$2B,$00,$9D,$02,$DE,$00,$77

table_03_B1F8_B50A_B696:
.byte $01,$E6,$01,$1A,$02,$6B,$00,$C3,$01,$EB,$00,$A4

table_03_B1F8_B50A_B6A2:
.byte $02,$2D,$01,$1A,$02,$B3,$00,$C3,$02,$2E,$00,$A4

table_03_B1F8_B50A_B6AE:
.byte $02,$78,$01,$1A,$03,$19,$00,$C3,$02,$7F,$00,$A4

table_03_B1F8_B50A_B6BA:
.byte $02,$CC,$01,$28,$03,$24,$00,$A0,$02,$C5,$00,$A4

table_03_B1F8_B50A_B6C6:
.byte $03,$04,$01,$31,$03,$4F,$00,$9D,$02,$DC,$00,$A4

table_03_B1F8_B50A_B6D2:
.byte $03,$1F,$01,$31,$03,$2B,$00,$A2,$02,$DC,$00,$A4

table_03_B1F8_B50A_B6DE:
.byte $01,$F1,$01,$3E,$02,$61,$00,$B7,$01,$F2,$00,$C8

table_03_B1F8_B50A_B6EA:
.byte $02,$40,$01,$3E,$02,$AD,$00,$B7,$02,$37,$00,$C8

table_03_B1F8_B50A_B6F6:
.byte $02,$75,$01,$3E,$02,$EE,$00,$AE,$02,$74,$00,$C8

table_03_B1F8_B50A_B702:
.byte $02,$BD,$01,$3E,$03,$29,$00,$A9,$02,$BE,$00,$C8

table_03_B1F8_B50A_B70E:
.byte $03,$0A,$01,$3E,$03,$51,$00,$9D,$02,$EA,$00,$BA

table_03_B1F8_B50A_B71A:
.byte $03,$1C,$01,$43,$03,$2B,$00,$A2,$02,$DC,$00,$D4

table_03_B1F8_B50A_B726:
.byte $01,$FB,$01,$53,$02,$87,$00,$E6,$02,$0D,$00,$F0

table_03_B1F8_B50A_B732:
.byte $02,$32,$01,$53,$02,$B2,$00,$DC,$02,$47,$00,$F0

table_03_B1F8_B50A_B73E:
.byte $02,$86,$01,$53,$02,$FA,$00,$D5,$02,$91,$00,$F0

table_03_B1F8_B50A_B74A:
.byte $02,$CD,$01,$53,$03,$3D,$00,$E3,$02,$D0,$00,$CD

table_03_B1F8_B50A_B756:
.byte $02,$D9,$01,$51,$03,$60,$00,$D0,$02,$D9,$00,$CD

table_03_B1F8_B50A_B762:
.byte $02,$E3,$01,$4F,$03,$3F,$00,$96,$02,$D9,$00,$CD

table_03_B76E:		; 44, 33 дубля, что-то сввязано с параметрами игрока
.word table_03_B76E_B846
.word table_03_B76E_B886
.word table_03_B76E_B7C6
.word table_03_B76E_B7C6
.word table_03_B76E_B7E6
.word table_03_B76E_B7E6
.word table_03_B76E_B8A6
.word table_03_B76E_B8A6
.word table_03_B76E_B8C6
.word table_03_B76E_B8C6
.word table_03_B76E_B806
.word table_03_B76E_B826
.word table_03_B76E_B7C6
.word table_03_B76E_B7C6
.word table_03_B76E_B7C6
.word table_03_B76E_B7C6
.word table_03_B76E_B846
.word table_03_B76E_B886
.word table_03_B76E_B7C6
.word table_03_B76E_B7C6
.word table_03_B76E_B7E6
.word table_03_B76E_B7E6
.word table_03_B76E_B866
.word table_03_B76E_B866
.word table_03_B76E_B8E6
.word table_03_B76E_B906
.word table_03_B76E_B806
.word table_03_B76E_B826
.word table_03_B76E_B7C6
.word table_03_B76E_B7C6
.word table_03_B76E_B7C6
.word table_03_B76E_B7C6
.word table_03_B76E_B846
.word table_03_B76E_B886
.word table_03_B76E_B806
.word table_03_B76E_B826
.word table_03_B76E_B866
.word table_03_B76E_B866
.word table_03_B76E_B8A6
.word table_03_B76E_B8A6
.word table_03_B76E_B8C6
.word table_03_B76E_B8C6
.word table_03_B76E_B806
.word table_03_B76E_B826

table_03_B76E_B7C6:		; 11 строк по 16 офсетов
.word table_03_B76E_off_B964
.word table_03_B76E_off_B998
.word table_03_B76E_off_B944
.word table_03_B76E_off_B998
.word table_03_B76E_off_B950
.word table_03_B76E_off_B930
.word table_03_B76E_off_B92C
.word table_03_B76E_off_B948
.word table_03_B76E_off_B964
.word table_03_B76E_off_B954
.word table_03_B76E_off_B944
.word table_03_B76E_off_B930
.word table_03_B76E_off_B970
.word table_03_B76E_off_B96C
.word table_03_B76E_off_B994
.word table_03_B76E_off_B964

table_03_B76E_B7E6:
.word table_03_B76E_off_B964
.word table_03_B76E_off_B998
.word table_03_B76E_off_B944
.word table_03_B76E_off_B998
.word table_03_B76E_off_B990
.word table_03_B76E_off_B970
.word table_03_B76E_off_B96C
.word table_03_B76E_off_B988
.word table_03_B76E_off_B964
.word table_03_B76E_off_B954
.word table_03_B76E_off_B944
.word table_03_B76E_off_B930
.word table_03_B76E_off_B948
.word table_03_B76E_off_B92C
.word table_03_B76E_off_B954
.word table_03_B76E_off_B964

table_03_B76E_B806:
.word table_03_B76E_off_B960
.word table_03_B76E_off_B954
.word table_03_B76E_off_B948
.word table_03_B76E_off_B998
.word table_03_B76E_off_B94C
.word table_03_B76E_off_B950
.word table_03_B76E_off_B944
.word table_03_B76E_off_B948
.word table_03_B76E_off_B938
.word table_03_B76E_off_B960
.word table_03_B76E_off_B954
.word table_03_B76E_off_B964
.word table_03_B76E_off_B95C
.word table_03_B76E_off_B964
.word table_03_B76E_off_B990
.word table_03_B76E_off_B960

table_03_B76E_B826:
.word table_03_B76E_off_B964
.word table_03_B76E_off_B994
.word table_03_B76E_off_B988
.word table_03_B76E_off_B998
.word table_03_B76E_off_B98C
.word table_03_B76E_off_B990
.word table_03_B76E_off_B984
.word table_03_B76E_off_B988
.word table_03_B76E_off_B978
.word table_03_B76E_off_B970
.word table_03_B76E_off_B994
.word table_03_B76E_off_B948
.word table_03_B76E_off_B964
.word table_03_B76E_off_B95C
.word table_03_B76E_off_B950
.word table_03_B76E_off_B988

table_03_B76E_B846:
.word table_03_B76E_off_B998
.word table_03_B76E_off_B954
.word table_03_B76E_off_B964
.word table_03_B76E_off_B998
.word table_03_B76E_off_B938
.word table_03_B76E_off_B92C
.word table_03_B76E_off_B950
.word table_03_B76E_off_B930
.word table_03_B76E_off_B95C
.word table_03_B76E_off_B960
.word table_03_B76E_off_B964
.word table_03_B76E_off_B944
.word table_03_B76E_off_B930
.word table_03_B76E_off_B92C
.word table_03_B76E_off_B948
.word table_03_B76E_off_B950

table_03_B76E_B866:
.word table_03_B76E_off_B998
.word table_03_B76E_off_B994
.word table_03_B76E_off_B964
.word table_03_B76E_off_B998
.word table_03_B76E_off_B978
.word table_03_B76E_off_B96C
.word table_03_B76E_off_B990
.word table_03_B76E_off_B970
.word table_03_B76E_off_B95C
.word table_03_B76E_off_B960
.word table_03_B76E_off_B944
.word table_03_B76E_off_B954
.word table_03_B76E_off_B970
.word table_03_B76E_off_B96C
.word table_03_B76E_off_B988
.word table_03_B76E_off_B990

table_03_B76E_B886:
.word table_03_B76E_off_B998
.word table_03_B76E_off_B964
.word table_03_B76E_off_B994
.word table_03_B76E_off_B998
.word table_03_B76E_off_B978
.word table_03_B76E_off_B96C
.word table_03_B76E_off_B990
.word table_03_B76E_off_B970
.word table_03_B76E_off_B960
.word table_03_B76E_off_B95C
.word table_03_B76E_off_B984
.word table_03_B76E_off_B994
.word table_03_B76E_off_B970
.word table_03_B76E_off_B96C
.word table_03_B76E_off_B988
.word table_03_B76E_off_B990

table_03_B76E_B8A6:
.word table_03_B76E_off_B95C
.word table_03_B76E_off_B998
.word table_03_B76E_off_B960
.word table_03_B76E_off_B998
.word table_03_B76E_off_B93C
.word table_03_B76E_off_B958
.word table_03_B76E_off_B934
.word table_03_B76E_off_B928
.word table_03_B76E_off_B934
.word table_03_B76E_off_B95C
.word table_03_B76E_off_B938
.word table_03_B76E_off_B960
.word table_03_B76E_off_B960
.word table_03_B76E_off_B938
.word table_03_B76E_off_B930
.word table_03_B76E_off_B944

table_03_B76E_B8C6:
.word table_03_B76E_off_B95C
.word table_03_B76E_off_B998
.word table_03_B76E_off_B960
.word table_03_B76E_off_B998
.word table_03_B76E_off_B97C
.word table_03_B76E_off_B958
.word table_03_B76E_off_B974
.word table_03_B76E_off_B968
.word table_03_B76E_off_B974
.word table_03_B76E_off_B95C
.word table_03_B76E_off_B978
.word table_03_B76E_off_B960
.word table_03_B76E_off_B960
.word table_03_B76E_off_B978
.word table_03_B76E_off_B970
.word table_03_B76E_off_B984

table_03_B76E_B8E6:
.word table_03_B76E_off_B964
.word table_03_B76E_off_B998
.word table_03_B76E_off_B998
.word table_03_B76E_off_B958
.word table_03_B76E_off_B958
.word table_03_B76E_off_B97C
.word table_03_B76E_off_B93C
.word table_03_B76E_off_B974
.word table_03_B76E_off_B934
.word table_03_B76E_off_B940
.word table_03_B76E_off_B95C
.word table_03_B76E_off_B938
.word table_03_B76E_off_B95C
.word table_03_B76E_off_B968
.word table_03_B76E_off_B96C
.word table_03_B76E_off_B960

table_03_B76E_B906:
.word table_03_B76E_off_B958
.word table_03_B76E_off_B998
.word table_03_B76E_off_B998
.word table_03_B76E_off_B964
.word table_03_B76E_off_B95C
.word table_03_B76E_off_B93C
.word table_03_B76E_off_B97C
.word table_03_B76E_off_B934
.word table_03_B76E_off_B974
.word table_03_B76E_off_B980
.word table_03_B76E_off_B960
.word table_03_B76E_off_B978
.word table_03_B76E_off_B94C
.word table_03_B76E_off_B928
.word table_03_B76E_off_B92C
.word table_03_B76E_off_B990

table_03_B926:		; 90, что-то связано с HP игрока
					; таблица читается если что-то не прокатило с чтением table_03_B76E
.word table_03_B76E_off_B928

table_03_B76E_off_B928:
.byte $02,$7F,$00,$4F

table_03_B76E_off_B92C:
.byte $03,$15,$00,$4F

table_03_B76E_off_B930:
.byte $03,$4A,$00,$4F

table_03_B76E_off_B934:
.byte $02,$4E,$00,$61

table_03_B76E_off_B938:
.byte $02,$CF,$00,$61

table_03_B76E_off_B93C:
.byte $02,$10,$00,$7D

table_03_B76E_off_B940:
.byte $02,$6D,$00,$7D

table_03_B76E_off_B944:
.byte $03,$28,$00,$7D

table_03_B76E_off_B948:
.byte $03,$32,$00,$7D

table_03_B76E_off_B94C:
.byte $02,$BE,$00,$A2

table_03_B76E_off_B950:
.byte $03,$08,$00,$A2

table_03_B76E_off_B954:
.byte $03,$2F,$00,$A2

table_03_B76E_off_B958:
.byte $02,$33,$00,$C3

table_03_B76E_off_B95C:
.byte $02,$92,$00,$C3

table_03_B76E_off_B960:
.byte $03,$08,$00,$C3

table_03_B76E_off_B964:
.byte $03,$29,$00,$C3

table_03_B76E_off_B968:
.byte $02,$90,$01,$3E

table_03_B76E_off_B96C:
.byte $03,$35,$01,$3E

table_03_B76E_off_B970:
.byte $03,$61,$01,$3E

table_03_B76E_off_B974:
.byte $02,$59,$01,$24

table_03_B76E_off_B978:
.byte $02,$DB,$01,$24

table_03_B76E_off_B97C:
.byte $02,$18,$01,$0A

table_03_B76E_off_B980:
.byte $02,$7C,$01,$0A

table_03_B76E_off_B984:
.byte $03,$30,$01,$0A

table_03_B76E_off_B988:
.byte $03,$44,$01,$0A

table_03_B76E_off_B98C:
.byte $02,$D6,$00,$E3

table_03_B76E_off_B990:
.byte $03,$10,$00,$E3

table_03_B76E_off_B994:
.byte $03,$35,$00,$E3

table_03_B76E_off_B998:
.byte $FF

_loc_03_B999:
	LDA опция_режим_сложность
	AND #$20
	BNE bra_03_B9A5
	LDA номер_движения,X
	BPL bra_03_B9A6
bra_03_B9A5:
	RTS
bra_03_B9A6:
	TXA
	AND #$01
	STA $1D
	TAY
	LDA номер_команды,Y
	BPL bra_03_B9B8
	CPX #$00
	BNE bra_03_B9D3
	JMP _loc_03_B9C1
bra_03_B9B8:
	LDA номер_управляемого,Y
	STA $1E
	CPX $1E
	BNE bra_03_B9D3
_loc_03_B9C1:
	JSR _loc_03_B9EE
	BEQ bra_03_B9D3
	LDY $1D
	STA $0680,Y
	LDA #$20
	STA $0684,Y
	JMP _loc_03_B9ED
bra_03_B9D3:
	LDA $067A,Y
	AND #$0F
	STA $1E
	CPX $1E
	BNE bra_03_B9ED
	JSR _loc_03_B9EE
	BEQ bra_03_B9ED
	LDY $1D
	STA $0682,Y
	LDA #$20
	STA $0684,Y
_loc_03_B9ED:
bra_03_B9ED:
	RTS
_loc_03_B9EE:
	LDA номер_движения,X
	BPL bra_03_B9F6
	LDA #$00
	RTS
bra_03_B9F6:
	CMP #$09
	BEQ bra_03_BA6B
	CMP #$07
	BEQ bra_03_BA6B
	CMP #$31
	BEQ bra_03_BA6B
	CMP #$32
	BEQ bra_03_BA6B
	CMP #$46
	BEQ bra_03_BA6B
	CMP #$33
	BEQ bra_03_BA6B
	CMP #$34
	BEQ bra_03_BA6B
	CMP #$37
	BEQ bra_03_BA6B
	CMP #$38
	BEQ bra_03_BA6B
	CMP #$49
	BEQ bra_03_BA6B
	CMP #$4B
	BEQ bra_03_BA6B
	CMP #$4D
	BEQ bra_03_BA6B
	CMP #$4F
	BEQ bra_03_BA6B
	CMP #$0A
	BEQ bra_03_BA70
	CMP #$08
	BEQ bra_03_BA70
	CMP #$35
	BEQ bra_03_BA70
	CMP #$39
	BEQ bra_03_BA70
	CMP #$36
	BEQ bra_03_BA70
	CMP #$3A
	CMP #$22
	BEQ bra_03_BA75
	CMP #$3B
	BEQ bra_03_BA75
	CMP #$23
	BEQ bra_03_BA7A
	CMP #$42
	BEQ bra_03_BA7A
	CMP #$2D
	BEQ bra_03_BA7F
	CMP #$2E
	BEQ bra_03_BA7F
	CMP #$3C
	BEQ bra_03_BA7F
	CMP #$3D
	BEQ bra_03_BA7F
	CMP #$59
	BEQ bra_03_BA7F
	CMP #$5A
	BEQ bra_03_BA7F
	LDA #$00
	RTS
bra_03_BA6B:
	LDA #$00
	JMP _loc_03_BA81
bra_03_BA70:
	LDA #$04
	JMP _loc_03_BA81
bra_03_BA75:
	LDA #$08
	JMP _loc_03_BA81
bra_03_BA7A:
	LDA #$0C
	JMP _loc_03_BA81
bra_03_BA7F:
	LDA #$10
_loc_03_BA81:
	STA $1C
	LDA номер_команды,Y
	AND #$0C
	LSR
	TAY
	LDA table_03_BAA1,Y
	STA $2C
	LDA table_03_BAA1 + 1,Y
	STA $2D
	LDA адрес_рандома
	AND #$03
	ORA $1C
	TAY
	LDA ($2C),Y
	ORA #$80
	RTS

table_03_BAA1:		; зависит от номера команды
.word table_03_BAA1_BAA9
.word table_03_BAA1_BABD
.word table_03_BAA1_BAD1
.word table_03_BAA1_BAE5

table_03_BAA1_BAA9:		; 20 байтов
.byte $2C,$2D,$02,$17,$33,$32,$07,$34,$2C,$30,$33,$3F,$33,$2F,$30,$34,$3D,$3E,$37,$3F

table_03_BAA1_BABD:
.byte $2E,$29,$31,$35,$27,$07,$0E,$36,$2E,$2A,$30,$35,$28,$13,$3E,$38,$3E,$3F,$2B,$29

table_03_BAA1_BAD1:
.byte $00,$02,$39,$18,$07,$3F,$33,$39,$10,$11,$33,$2C,$13,$14,$33,$2F,$3A,$3F,$3E,$2B

table_03_BAA1_BAE5:
.byte $00,$02,$2C,$39,$07,$2F,$30,$32,$10,$19,$31,$33,$13,$18,$33,$2F,$37,$2A,$3E,$3F

_loc_03_BAF9:
	LDA режим_игры_на_поле
	AND #$40
	BNE @RTS
	LDA номер_погодного_эффекта
	AND #$7F
	CMP #ПОГОДА_МОЛНИЯ
	BEQ @RTS
	JMP @дальше
@RTS:
	RTS
@дальше:		; в A сейчас номер погоды AND 7F
	AND #$7F
	BEQ bra_03_BB1E
	CMP #ПОГОДА_ВЕТЕР
	BEQ bra_03_BB1E
	CMP #ПОГОДА_ДОЖДЬ
	BEQ bra_03_BB51
bra_03_BB1B:
	JMP _loc_03_BB94
bra_03_BB1E:
	LDA опция_дождь_ветер
	AND #$0F
	BEQ bra_03_BB1B
	LDA опция_дождь_ветер
	AND #$04
	BNE bra_03_BB71
	LDA $0603
	BEQ bra_03_BB1B
	ASL
	BCC bra_03_BB36
	LDA #$FF
bra_03_BB36:
	STA $1C
	JSR _b07_вращение_рандома
	CMP $1C
	BCS bra_03_BB1B
	LDA #ПОГОДА_ДОЖДЬ + $80
	STA номер_погодного_эффекта
	LDA опция_дождь_ветер
	AND #$0F
	ASL
	ASL
	STA объем_дождя
	JMP _loc_03_BB94
bra_03_BB51:
	LDA опция_дождь_ветер
	AND #$03
	ASL
	ASL
	CLC
	ADC #$F3
	STA $1C
	JSR _b07_вращение_рандома
	CMP $1C
	BCC bra_03_BB94
	LDA #ПОГОДА_НЕТ
	STA номер_погодного_эффекта
	LDA #$0C
	STA объем_дождя
	JMP _loc_03_BB94
bra_03_BB71:
	JSR _b07_вращение_рандома
	CMP #$A0
	BCS bra_03_BB94
	LDA #ПОГОДА_ДОЖДЬ + $80
	STA номер_погодного_эффекта
	LDA #$0C
	STA объем_дождя
	JMP _loc_03_BB94
	JSR _b07_вращение_рандома
	BMI bra_03_BB94
	LDA #ПОГОДА_НЕТ
	STA номер_погодного_эффекта
	LDA #$0C
	STA объем_дождя
_loc_03_BB94:
bra_03_BB94:
	LDA опция_дождь_ветер
	CMP #$40
	BCS bra_03_BBCA
	AND #$30
	BEQ bra_03_BC05
	LSR
	LSR
	LSR
	STA $1C
	JSR _b07_вращение_рандома
	AND #$03
	SEC
	SBC #$02
	CLC
	ADC $1C
	STA сила_ветра
_loc_03_BBB2:
	LDA опция_направление_молния_смерч
	AND #$03
	BEQ bra_03_BBCD
	CMP #$02
	BEQ bra_03_BBC2
	LDA адрес_рандома
	BPL bra_03_BBCD
bra_03_BBC2:
	LDA #$40
	STA сторона_ветра_дождя
	JMP _loc_03_BBD2
bra_03_BBCA:
	JMP _loc_03_BC19
bra_03_BBCD:
	LDA #$C0
	STA сторона_ветра_дождя
_loc_03_BBD2:
	JSR _b07_вращение_рандома
	BMI bra_03_BBEC
	LDY сторона_ветра_дождя
	STY $1C
	AND #$60
	EOR сторона_ветра_дождя
	STA $1D
	AND #$60
	BNE bra_03_BBE9
	LDA $1C
bra_03_BBE9:
	STA сторона_ветра_дождя
bra_03_BBEC:
	LDA номер_погодного_эффекта
	AND #$7F
	CMP #ПОГОДА_ДОЖДЬ
	BEQ bra_03_BC05
	LDA сила_ветра
	BEQ bra_03_BC08
	CLC
	ADC #$05
	STA объем_дождя
	LDA #ПОГОДА_ВЕТЕР + $80
	STA номер_погодного_эффекта
bra_03_BC05:
	JMP _loc_03_BC40
bra_03_BC08:
	LDA номер_погодного_эффекта
	AND #$7F
	CMP #ПОГОДА_ВЕТЕР
	BNE bra_03_BC05
	LDA #ПОГОДА_НЕТ
	STA номер_погодного_эффекта
	JMP _loc_03_BC40
_loc_03_BC19:
	LDA сила_ветра
	BNE bra_03_BC33
	JSR _b07_вращение_рандома
	CMP #$C0
	BCS bra_03_BC40
bra_03_BC25:
	JSR _b07_вращение_рандома
	AND #$03
	CLC
	ADC #$06
	STA сила_ветра
	JMP _loc_03_BBB2
bra_03_BC33:
	JSR _b07_вращение_рандома
	BPL bra_03_BC25
	LDA #$00
	STA сила_ветра
	JMP _loc_03_BBB2
_loc_03_BC40:
bra_03_BC40:
	JSR _loc_03_BC84
	LDA номер_погодного_эффекта
	CMP #ПОГОДА_ВЕТЕР + $80
	BNE bra_03_BC4F
	LDA #$41
	JSR _b07_C2E4
bra_03_BC4F:
	LDA опция_направление_молния_смерч
	AND #$30
	BEQ bra_03_BC68
	LSR
	LSR
	LSR
	LSR
	TAY
	JSR _b07_вращение_рандома
	CMP table_03_BC80,Y
	BCC bra_03_BC68
	LDA #ПОГОДА_СМЕРЧ + $80
	STA номер_погодного_эффекта
bra_03_BC68:
	LDA опция_направление_молния_смерч
	AND #$0C
	BEQ bra_03_BC7F
	LSR
	LSR
	TAY
	JSR _b07_вращение_рандома
	CMP table_03_BC80,Y
	BCC bra_03_BC7F
	LDA #ПОГОДА_МОЛНИЯ + $80
	STA номер_погодного_эффекта
bra_03_BC7F:
	RTS

table_03_BC80:		; читается из 2х мест
.byte $FF,$E0,$A0,$60

_loc_03_BC84:
	LDA сила_ветра
	STA $1C
	EOR #$FF
	CLC
	ADC #$01
	STA $1D
	LDA сторона_ветра_дождя
	CMP #$20
	BEQ bra_03_BCB2
	CMP #$40
	BEQ bra_03_BCBF
	CMP #$60
	BEQ bra_03_BCCC
	CMP #$A0
	BEQ bra_03_BCD9
	CMP #$C0
	BEQ bra_03_BCE6
	LDA $1D
	STA $0140
	STA $0141
	JMP _loc_03_BCF0
bra_03_BCB2:
	LDA $1C
	STA $0140
	LDA $1D
	STA $0141
	JMP _loc_03_BCF0
bra_03_BCBF:
	LDA $1C
	STA $0140
	LDA #$00
	STA $0141
	JMP _loc_03_BCF0
bra_03_BCCC:
	LDA $1C
	STA $0140
	LDA $1C
	STA $0141
	JMP _loc_03_BCF0
bra_03_BCD9:
	LDA $1D
	STA $0140
	LDA $1D
	STA $0141
	JMP _loc_03_BCF0
bra_03_BCE6:
	LDA $1D
	STA $0140
	LDA #$00
	STA $0141
_loc_03_BCF0:
	RTS
_loc_03_BCF1:
	LDA объект_камеры
	AND #$0F
	TAY
	LDA объект_камеры
	BPL bra_03_BCFF
	JMP _loc_03_BDC2
bra_03_BCFF:
	LDA координата_X_lo,Y
	SEC
	SBC #$80
	STA $1C
	LDA координата_X_hi,Y
	SBC #$00
	STA $1D
	LDA объект_камеры
	AND #$40
	BNE bra_03_BD51
	LDA игрок_с_мячом
	AND #$01
	BEQ bra_03_BD2C
	LDA смещение_камеры
	CMP #$D0
	BEQ bra_03_BD39
	SEC
	SBC #$03		; 60fps
	STA смещение_камеры
	JMP _loc_03_BD39
bra_03_BD2C:
	LDA смещение_камеры
	CMP #$30
	BEQ bra_03_BD39
	CLC
	ADC #$03		; 60fps
	STA смещение_камеры
_loc_03_BD39:
bra_03_BD39:
	LDA смещение_камеры
	BPL bra_03_BD40
	DEC $1D
bra_03_BD40:
	LDA $1C
	CLC
	ADC смещение_камеры
	STA $1C
	LDA $1D
	ADC #$00
	STA $1D
	JMP _loc_03_BD56
bra_03_BD51:
	LDA #$00
	STA смещение_камеры
_loc_03_BD56:
	LDA байт_для_2005_X
	SEC
	SBC $1C
	STA $1C
	LDA $ED
	SBC $1D
	STA $1D
	BPL bra_03_BD8F
	LDA $1D
	CMP #$FF
	BCS bra_03_BD78
	LDA #$FF
	STA $1D
	LDA #$F8
	STA $1C
	JMP _loc_03_BDB1
bra_03_BD78:
	LDA #$FF
	STA $1D
	LDA $1C
	SEC
	ROR
	SEC
	ROR
	SEC
	ROR
	SEC		; 60fps
	ROR
	CMP #$FD
	BCS bra_03_BD8A
	LDA #$FD
bra_03_BD8A:
	STA $1C
	JMP _loc_03_BDB1
bra_03_BD8F:
	LDA $1D
	CMP #$01
	BCC bra_03_BDA0
	LDA #$00
	STA $1D
	LDA #$08
	STA $1C
	JMP _loc_03_BDB1
bra_03_BDA0:
	LDA #$00
	STA $1D
	LDA $1C
	LSR
	LSR
	LSR
	LSR		; 60fps
	CMP #$03
	BCC bra_03_BDAF
	LDA #$03
bra_03_BDAF:
	STA $1C
_loc_03_BDB1:
	LDA байт_для_2005_X
	SEC
	SBC $1C
	STA $F0
	LDA $ED
	SBC $1D
	STA $F1
_loc_03_BDC2:
	LDA координата_Y_lo,Y
	SEC
	SBC #$80
	STA $1C
	LDA координата_Y_hi,Y
	SBC #$00
	STA $1D
	LDA байт_для_2005_Y
	SEC
	SBC $1C
	STA $1C
	LDA $EF
	SBC $1D
	STA $1D
	BPL bra_03_BE0A
	LDA $1D
	CMP #$FF
	BCS bra_03_BDF3
	LDA #$FF
	STA $1D
	LDA #$F8
	STA $1C
	JMP _loc_03_BE2C
bra_03_BDF3:
	LDA #$FF
	STA $1D
	LDA $1C
	SEC
	ROR
	SEC
	ROR
	SEC
	ROR
	CMP #$F8
	BCS bra_03_BE05
	LDA #$F8
bra_03_BE05:
	STA $1C
	JMP _loc_03_BE2C
bra_03_BE0A:
	LDA $1D
	CMP #$01
	BCC bra_03_BE1B
	LDA #$00
	STA $1D
	LDA #$08
	STA $1C
	JMP _loc_03_BE2C
bra_03_BE1B:
	LDA #$00
	STA $1D
	LDA $1C
	LSR
	LSR
	LSR
	CMP #$08
	BCC bra_03_BE2A
	LDA #$08
bra_03_BE2A:
	STA $1C
_loc_03_BE2C:
	LDA байт_для_2005_Y
	SEC
	SBC $1C
	STA $F2
	LDA $EF
	SBC $1D
	STA $F3
	LDA тип_экрана
	CMP #$05
	BEQ bra_03_BE47
	CMP #$08
	BCC bra_03_BE7E
bra_03_BE47:
	LDA $F1
	CMP #$00
	BNE bra_03_BE62
	LDA $F0
	CMP #$30
	BCS bra_03_BE73
	LDA #$30
	STA $F0
	LDA #$00
	STA $F1
	JMP _loc_03_BE73
bra_03_BE62:
	LDA $F0
	CMP #$D0
	BCC bra_03_BE73
	LDA #$01
	STA $F1
	LDA #$D0
	STA $F0
_loc_03_BE73:
bra_03_BE73:
	LDA #$00
	STA $F2
	STA $F3
	JMP _loc_03_BED3
bra_03_BE7E:
	LDA $F1
	CMP #$01
	BCS bra_03_BE96
	LDA $F0
	CMP #$40
	BCS bra_03_BE96
	LDA #$40
	STA $F0
	LDA #$00
	STA $F1
bra_03_BE96:
	LDA $F1
	CMP #$02
	BCC bra_03_BEAE
	LDA $F0
	CMP #$C0
	BCC bra_03_BEAE
	LDA #$02
	STA $F1
	LDA #$C0
	STA $F0
bra_03_BEAE:
	LDA $F3
	BPL bra_03_BEBB
	LDA #$00
	STA $F2
	STA $F3
bra_03_BEBB:
	LDA $F3
	CMP #$01
	BCS bra_03_BEC9
	LDA $F2
	CMP #$AF
	BCC bra_03_BED3
bra_03_BEC9:
	LDA #$AF
	STA $F2
	LDA #$00
	STA $F3
_loc_03_BED3:
bra_03_BED3:
	RTS
_loc_03_BED4:
	LDA $58
	BNE bra_03_BF12
	BIT режим_игры_на_поле
	BVC bra_03_BEF2
	LDA режим_игры_на_поле
	AND #$0F
	BNE bra_03_BEE9
	LDA номер_тайма
	BEQ bra_03_BEF2
	BNE bra_03_BEED
bra_03_BEE9:
	AND #$02
	BEQ bra_03_BEF2
bra_03_BEED:
	LDA #$11
	JMP _loc_03_BF0F
bra_03_BEF2:
	LDY #$00
	LDA номер_погодного_эффекта
	AND #$7F
	CMP #ПОГОДА_МОЛНИЯ
	BEQ @молния_либо_совпадение_по_таблице
	LDA номер_анимации_мяча
	AND #$7F
@цикл:
	INY
	CMP table_03_BF13,Y
	BEQ @молния_либо_совпадение_по_таблице
	BCS @цикл
@молния_либо_совпадение_по_таблице:
	LDA table_03_BF1B_банк_спрайтов,Y
	BMI bra_03_BF12
_loc_03_BF0F:
	STA банк_спрайтов + 3
bra_03_BF12:
	RTS

table_03_BF13:
.byte $00,$06,$07,$19,$2C,$38,$45,$FF

table_03_BF1B_банк_спрайтов:
.byte $0A,$09,$0A,$0B,$0C,$0D,$0E,$FF

_loc_03_BF23:
	LDA счетчик_кадров
	LSR
	BCC bra_03_BF2A
bra_03_BF29:
	RTS
bra_03_BF2A:
	LDX $F4
	DEX
	LDY #$00
bra_03_BF2F:
	LDA приоритет_отрисовки_спрайта,X
	CMP #$0C
	BCS bra_03_BF36
	INY
bra_03_BF36:
	DEX
	BPL bra_03_BF2F
	CPY #$08
	BCC bra_03_BF59
	LDX $F4
	DEX
	LDY #$00
bra_03_BF42:
	LDA приоритет_отрисовки_спрайта,X
	STA $001C,Y
	INY
	DEX
	BPL bra_03_BF42
	LDX $F4
	DEX
	DEY
bra_03_BF4F:
	LDA $001C,Y
	STA приоритет_отрисовки_спрайта,X
	DEY
	DEX
	BPL bra_03_BF4F
	RTS
bra_03_BF59:
	LDA координата_Y_lo_мяча
	SEC
	SBC координата_Z_lo_мяча
	STA $1F
	LDA координата_Y_hi_мяча
	SBC координата_Z_hi_мяча
	STA $20
	LDX #$0C
	LDY #$00
bra_03_BF6E:
	LDA флаг_видимости,X
	LSR
	BCC bra_03_BF92
	LDA координата_Y_lo,X
	SEC
	SBC $1F
	STA $1C
	LDA координата_Y_hi,X
	SBC $20
	BNE bra_03_BF92
	LDA $1C
	CMP #$18
	BCS bra_03_BF92
	TXA
	STA $002C,Y
	INY
	CPY #$06
	BEQ bra_03_BF95
bra_03_BF92:
	DEX
	BPL bra_03_BF6E
bra_03_BF95:
	CPY #$04
	BCC bra_03_BF29
	STY $1C
	LDA #$00
	STA $1D
	LDX $F4
	DEX
bra_03_BFA2:
	LDY $1C
	DEY
	LDA приоритет_отрисовки_спрайта,X
bra_03_BFA8:
	CMP $002C,Y
	BNE bra_03_BFBF
	STY $44
	LDY $1D
	STA $0032,Y
	TXA
	STA $0038,Y
	INC $1D
	LDY $44
	LDA приоритет_отрисовки_спрайта,X
bra_03_BFBF:
	DEY
	BPL bra_03_BFA8
	DEX
	BPL bra_03_BFA2
	LDA #$00
	STA $1C
	LDX $1D
	DEX
bra_03_BFCC:
	LDY $1C
	LDA $0032,Y
	LDY $38,X
	STA приоритет_отрисовки_спрайта,Y
	INC $1C
	DEX
	BPL bra_03_BFCC
	RTS

; BFDC fill FF

.segment "BANK_03_ID"
.byte $03 