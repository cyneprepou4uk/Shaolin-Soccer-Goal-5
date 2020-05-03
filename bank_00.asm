.segment "BANK_00"
.include "ram_copy.inc"
.include "val_copy.inc"

.import _b07_C2E4
.import _b07_вращение_рандома
.import _b07_C344
.import _b07_EC8F

; !!! разрешено двигать код можно только начиная с _loc_00_BB13
; требуется поправить поинтеры внутри звуков после D0 и D1, это вроде как повторы с поинтерами, возможно есть и еще

; заметки от санчеза
; C4 - volume
; C9 - sleep
; CD - load
; CE - loop1
; CF - loop2
; D0 - jmp
; D1 - jsr
; D2 - rts
; D3 - stop

.export _loc_00_8000
_loc_00_8000:
	JMP _loc_00_8006
.export _loc_00_8003
_loc_00_8003:
	JMP _loc_00_8183

_loc_00_8006:
	STA $07E6
	TXA
	PHA
	TYA
	PHA
	LDA $07E5
	AND #$7F
	STA $07E5
	LDX $07E6
	BEQ bra_00_8046
	BPL bra_00_808B
	INX
	BEQ bra_00_8062
	INX
	BEQ bra_00_8054
	INX
	BEQ bra_00_804C
	INX
	BEQ bra_00_8038
	INX
	BEQ bra_00_802D
	BNE bra_00_8046
bra_00_802D:
	LDA $07E5
	AND #$DF
	STA $07E5
	JMP _loc_00_80A3
bra_00_8038:
	LDA $0701
	PHA
	JSR _loc_00_8166
	PLA
	STA $0701
	JMP _loc_00_809E
bra_00_8046:
	JSR _loc_00_8166
	JMP _loc_00_809E
bra_00_804C:
	LDA $07E5
	ORA #$40
	STA $07E5
bra_00_8054:
	LDA $0700
	STA $0701
	LDA #$00
	STA $4015
	JMP _loc_00_80A3
bra_00_8062:
	LDA $07E5
	AND #$BF
	STA $07E5
	LDA $0701
	BEQ bra_00_8078
	CMP $0700
	BEQ bra_00_8078
	TAX
	JMP _loc_00_808B
bra_00_8078:
	LDX #$07
bra_00_807A:
	STX $0704
	JSR _loc_00_8559
	LDX $0704
	DEX
	CPX #$03
	BNE bra_00_807A
	JMP _loc_00_809E
_loc_00_808B:
bra_00_808B:
	DEX
	TXA
	ASL
	TAX
	LDA table_00_89FD,X
	STA $00
	LDA table_00_89FD + 1,X
	STA $01
	LDA #$80
	JSR _loc_00_80B0
_loc_00_809E:
	LDA #$0F
	STA $4015
_loc_00_80A3:
	LDA $07E5
	ORA #$80
	STA $07E5
	PLA
	TAY
	PLA
	TAX
	RTS
_loc_00_80B0:
	STA $03
	LDY #$00
	LDA ($00),Y
	BMI bra_00_80E7
	STA $02
	INY
	LDA ($00),Y
	BPL bra_00_80D8
	INY
	LDA ($00),Y
	STA $0702
	LDA $07E6
	STA $0703
	LDA $07E5
	ORA #$20
	STA $07E5
bra_00_80D3:
	INY
	LDA ($00),Y
	BMI bra_00_80FF
bra_00_80D8:
	TAX
	LDA $02
	CMP $0703,X
	BCC bra_00_80E4
	INY
	INY
	BNE bra_00_80D3
bra_00_80E4:
	JMP _loc_00_8165
bra_00_80E7:
	LDA $07E6
	STA $0700
	LDA #$FF
	STA $0706
	STA $0705
	LDA $07E5
	ORA #$02
	AND #$BF
	STA $07E5
bra_00_80FF:
	LDY #$01
	LDA ($00),Y
	BPL bra_00_8107
	INY
	INY
bra_00_8107:
	LDA ($00),Y
	BMI bra_00_8165
	TAX
	CPX #$04
	BCC bra_00_811B
	CPX #$08
	BEQ bra_00_813F
	LDA $02
	STA $0703,X
	BNE bra_00_8135
bra_00_811B:
	CPX #$03
	BEQ bra_00_8144
	BCS bra_00_812B
	LDA #$1E
	STA $07B3,X
	LDA #$96
	STA $07BC,X
bra_00_812B:
	LDA #$FA
	STA $079E,X
	LDA #$00
	STA $07A2,X
bra_00_8135:
	LDA $03
	STA $0781,X
	LDA #$00
	STA $0742,X
bra_00_813F:
	LDA #$80
	STA $070C,X
bra_00_8144:
	LDA #$00
	STA $0754,X
	STA $075D,X
	LDA #$01
	STA $0730,X
	LDA #$01
	STA $0715,X
	INY
	LDA ($00),Y
	STA $071E,X
	INY
	LDA ($00),Y
	STA $0727,X
	INY
	BNE bra_00_8107
_loc_00_8165:
bra_00_8165:
	RTS
_loc_00_8166:
	LDA #$00
	STA $4015
	LDX #$E7
bra_00_816D:
	STA $06FF,X
	DEX
	BNE bra_00_816D
	LDA #$8D
	STA $07E1
	LDA #$40
	STA $07E3
	LDA #$60
	STA $07E4
	RTS
_loc_00_8183:
	BIT $07E5
	BPL bra_00_81EF
	LDA $07E5
	AND #$20
	BEQ bra_00_81A4
	LDA $07E5
	AND #$40
	BNE bra_00_81A4
	DEC $0702
	BNE bra_00_81A4
	LDA $0703
	STA $07E6
	JSR _loc_00_8006
bra_00_81A4:
	LDX #$08
bra_00_81A6:
	STX $0704
	JSR _loc_00_81F0
	JSR _loc_00_8614
	DEX
	CPX #$03
	BNE bra_00_81A6
	BIT $07E5
	BVS bra_00_81EF
	DEX
bra_00_81BA:
	STX $0704
	JSR _loc_00_88D9
	JSR _loc_00_8614
	JSR _loc_00_86A3
	LDX $0704
	DEX
	BPL bra_00_81BA
	LDA $0705
	CLC
	ADC $0706
	STA $0706
	BCC bra_00_81EF
	LDX #$03
	STX $0704
	JSR _loc_00_81F0
	DEX
bra_00_81E1:
	LDA $0715,X
	BEQ bra_00_81EC
	STX $0704
	JSR _loc_00_81FC
bra_00_81EC:
	DEX
	BPL bra_00_81E1
bra_00_81EF:
	RTS
_loc_00_81F0:
	LDA $0715,X
	BNE bra_00_81F6
	RTS
bra_00_81F6:
	DEC $0730,X
	BEQ bra_00_8217
	RTS
_loc_00_81FC:
	DEC $0796,X
	BNE bra_00_8209
	LDA $070C,X
	ORA #$80
	STA $070C,X
bra_00_8209:
	DEC $0730,X
	BEQ bra_00_820F
	RTS
bra_00_820F:
	LDA $0715,X
	AND #$FB
	STA $0715,X
bra_00_8217:
	LDA $071E,X
	STA $00
	LDA $0727,X
	STA $01
	LDY #$00
bra_00_8223:
	JSR _loc_00_8236
	BCC bra_00_8223
	JSR _loc_00_8956
	LDA $00
	STA $071E,X
	LDA $01
	STA $0727,X
	RTS
_loc_00_8236:
	LDA $0715,X
	AND #$02
	BEQ bra_00_8254
	TYA
	PHA
	JSR _loc_00_8254
	DEC $0778,X
	BEQ bra_00_824A
	PLA
	TAY
	RTS
bra_00_824A:
	LDA $0715,X
	AND #$FD
	STA $0715,X
	PLA
	RTS
_loc_00_8254:
bra_00_8254:
	LDA ($00),Y
	CMP #$40
	BCC bra_00_8267
	CMP #$C0
	BCC bra_00_8261
	JMP _loc_00_8359
bra_00_8261:
	CPX #$04
	BCS bra_00_8290
	BCC bra_00_829E
bra_00_8267:
	CPX #$04
	BCS bra_00_828A
	BCC bra_00_826D
bra_00_826D:
	STA $078A,X
_loc_00_8270:
	STA $02
	LDA $079E,X
	STA $03
	TYA
	PHA
	JSR _loc_00_8963
	PLA
	TAY
	LDA $02
	BNE bra_00_8284
	LDA #$01
bra_00_8284:
	STA $0792,X
	INY
	CLC
	RTS
bra_00_828A:
	STA $0730,X
	INY
	SEC
	RTS
_loc_00_8290:
bra_00_8290:
	STA $0739,X
	LDA $070C,X
	ORA #$20
	STA $070C,X
	INY
	CLC
	RTS
_loc_00_829E:
bra_00_829E:
	CPX #$03
	BEQ bra_00_8311
	PHA
	CLC
	ADC $07A2,X
	AND #$3F
	STA $0739,X
	LDA $0715,X
	AND #$08
	BEQ bra_00_82B7
	LDA #$FF
	BNE bra_00_82BA
bra_00_82B7:
	LDA $0792,X
bra_00_82BA:
	STA $0796,X
	LDA $078A,X
	STA $0730,X
	PLA
	BPL bra_00_82F8
	INY
	LDA ($00),Y
	STA $02
	LDA #$40
	BIT $02
	BEQ bra_00_82DF
	LDA $078A,X
	CMP $079A,X
	BCC bra_00_82DC
	LDA $079A,X
bra_00_82DC:
	STA $0796,X
bra_00_82DF:
	LDA #$80
	BIT $02
	BEQ bra_00_82EA
	LDA #$FF
	STA $0796,X
bra_00_82EA:
	LDA #$20
	BIT $02
	BEQ bra_00_82F8
	LDA $0715,X
	ORA #$04
	STA $0715,X
bra_00_82F8:
	CPX #$03
	BCS bra_00_8306
	LDA $0715,X
	AND #$80
	BNE bra_00_8306
	JSR _loc_00_8935
bra_00_8306:
	LDA $070C,X
	ORA #$30
	STA $070C,X
	INY
	SEC
	RTS
bra_00_8311:
	STA $02
	LDA $00
	PHA
	LDA $01
	PHA
	TYA
	PHA
	LDA $02
	PHA
	AND #$3F
	ASL
	TAY
	LDA $07BF
	STA $02
	LDA $07C0
	STA $03
	LDA ($02),Y
	STA $00
	INY
	LDA ($02),Y
	STA $01
	LDY #$00
	PLA
	BPL bra_00_833D
	LDY $078E,X
bra_00_833D:
	TYA
	SEC
	ADC $074B,X
	JSR _loc_00_80B0
	PLA
	TAY
	PLA
	STA $01
	PLA
	STA $00
	LDX $0704
	LDA $078A,X
	STA $0730,X
	INY
	SEC
	RTS
_loc_00_8359:
	AND #$3F
	TAX
	LDA table_00_836E,X
	STA $02
	LDA table_00_836E + 32,X
	STA $03
	LDX $0704
	INY
	CLC
	JMP ($0002)

table_00_836E:	; младший непрямого прыжка
.byte <table_00_836E_83AE
.byte <table_00_836E_83B3
.byte <table_00_836E_83BB
.byte <table_00_836E_83BF
.byte <table_00_836E_83E3
.byte <table_00_836E_83E7
.byte <table_00_836E_83FA
.byte <table_00_836E_8401
.byte <table_00_836E_840C
.byte <table_00_836E_8413
.byte <table_00_836E_841C
.byte <table_00_836E_8425
.byte <table_00_836E_8442
.byte <table_00_836E_8449
.byte <table_00_836E_84FB
.byte <table_00_836E_850E
.byte <table_00_836E_8521
.byte <table_00_836E_852F
.byte <table_00_836E_854C
.byte <table_00_836E_8559
.byte <table_00_836E_84E4
.byte <table_00_836E_84D6
.byte <table_00_836E_842E
.byte <table_00_836E_8438
.byte <table_00_836E_84CF
.byte <table_00_836E_84B5
.byte <table_00_836E_85C0
.byte <table_00_836E_85D0
.byte <table_00_836E_85EC
.byte <table_00_836E_85F6
.byte <table_00_836E_8600
.byte <table_00_836E_84A9

.byte >table_00_836E_83AE
.byte >table_00_836E_83B3
.byte >table_00_836E_83BB
.byte >table_00_836E_83BF
.byte >table_00_836E_83E3
.byte >table_00_836E_83E7
.byte >table_00_836E_83FA
.byte >table_00_836E_8401
.byte >table_00_836E_840C
.byte >table_00_836E_8413
.byte >table_00_836E_841C
.byte >table_00_836E_8425
.byte >table_00_836E_8442
.byte >table_00_836E_8449
.byte >table_00_836E_84FB
.byte >table_00_836E_850E
.byte >table_00_836E_8521
.byte >table_00_836E_852F
.byte >table_00_836E_854C
.byte >table_00_836E_8559
.byte >table_00_836E_84E4
.byte >table_00_836E_84D6
.byte >table_00_836E_842E
.byte >table_00_836E_8438
.byte >table_00_836E_84CF
.byte >table_00_836E_84B5
.byte >table_00_836E_85C0
.byte >table_00_836E_85D0
.byte >table_00_836E_85EC
.byte >table_00_836E_85F6
.byte >table_00_836E_8600
.byte >table_00_836E_84A9

table_00_836E_83AE:
	LDA ($00),Y
	JMP _loc_00_8290

table_00_836E_83B3:
	LDA ($00),Y
	ADC $0739,X
	JMP _loc_00_8290

table_00_836E_83BB:
	LDA ($00),Y
	BCC bra_00_83D5

table_00_836E_83BF:
	LDA ($00),Y
	BMI bra_00_83CD
	ADC $0742,X
	BCC bra_00_83D5
	INC $0739,X
	BCS bra_00_83D5
bra_00_83CD:
	ADC $0742,X
	BCS bra_00_83D5
	DEC $0739,X
bra_00_83D5:
	STA $0742,X
	LDA $070C,X
	ORA #$20
	STA $070C,X
	INY
	CLC
	RTS

table_00_836E_83E3:
	LDA ($00),Y
	BCC bra_00_83EC

table_00_836E_83E7:
	LDA ($00),Y
	ADC $074B,X
bra_00_83EC:
	STA $074B,X
	LDA $070C,X
	ORA #$08
	STA $070C,X
	INY
	CLC
	RTS

table_00_836E_83FA:
	LDA ($00),Y
	STA $078E,X
	INY
	RTS

table_00_836E_8401:
	LDA ($00),Y
	STA $079E,X
	LDA $078A,X
	JMP _loc_00_8270

table_00_836E_840C:
	LDA ($00),Y
	STA $079A,X
	INY
	RTS

table_00_836E_8413:
	LDA $078A,X
	STA $0730,X
	SEC
	BCS bra_00_8425

table_00_836E_841C:
	LDA $070C,X
	ORA #$10
	STA $070C,X
	RTS

bra_00_8425:
table_00_836E_8425:
	LDA $070C,X
	ORA #$80
	STA $070C,X
	RTS

table_00_836E_842E:
	LDA $0715,X
	ORA #$08
	STA $0715,X
	BCC bra_00_8425

table_00_836E_8438:
	LDA $0715,X
	AND #$F7
	STA $0715,X
	BCC bra_00_8425

table_00_836E_8442:
	LDA ($00),Y
	STA $0705
	INY
	RTS

table_00_836E_8449:
	CPX #$03
	BEQ bra_00_8458
	TXA
	AND #$03
	CMP #$02
	BNE bra_00_8466
	INY
	INY
	CLC
	RTS
bra_00_8458:
	LDA ($00),Y
	STA $07BF
	INY
	LDA ($00),Y
	STA $07C0
	INY
	CLC
	RTS
bra_00_8466:
	LDA ($00),Y
	STA $02
	INY
	LDA ($00),Y
	STA $03
	INY
	TYA
	PHA
	CPX #$04
	BCS bra_00_8486
	LDY #$00
	LDA ($02),Y
	STA $07A8,X
	INY
	LDA ($02),Y
	STA $07AA,X
	LDX $0704
bra_00_8486:
	LDY #$02
	LDA ($02),Y
	ORA #$30
	PHA
	INY
	LDA ($02),Y
	PHA
	TXA
	ASL
	ASL
	TAY
	PLA
	STA $07C2,Y
	PLA
	STA $07C1,Y
	LDA $070C,X
	ORA #$40
	STA $070C,X
	PLA
	TAY
	CLC
	RTS

table_00_836E_84A9:
	LDA ($00),Y
	JSR _loc_00_829E
	LDA ($00),Y
	JSR _loc_00_829E
	SEC
	RTS

table_00_836E_84B5:
	LDA ($00),Y
	STA $07E6
	LDA $00
	PHA
	LDA $01
	PHA
	LDA $07E6
	JSR _loc_00_8006
	PLA
	STA $01
	PLA
	STA $00
	INY
	CLC
	RTS

table_00_836E_84CF:
	LDA ($00),Y
	STA $07A2,X
	INY
	RTS

table_00_836E_84D6:
	LDA #$00
	STA $4015
	LDA $07E5
	ORA #$40
	STA $07E5
	RTS

table_00_836E_84E4:
	TXA
	ASL
	ASL
	TAX
	INX
	LDA ($00),Y
	STA $07C1,X
	LDX $0704
	LDA $070C,X
	ORA #$04
	STA $070C,X
	INY
	RTS

table_00_836E_84FB:
	LDA $0754,X
	BNE bra_00_8505
	LDA ($00),Y
	STA $0754,X
bra_00_8505:
	INY
	DEC $0754,X
	BNE bra_00_8521
	INY
	INY
	RTS

table_00_836E_850E:
	LDA $075D,X
	BNE bra_00_8518
	LDA ($00),Y
	STA $075D,X
bra_00_8518:
	INY
	DEC $075D,X
	BNE bra_00_8521
	INY
	INY
	RTS

bra_00_8521:
table_00_836E_8521:
	LDA ($00),Y
	PHA
	INY
	LDA ($00),Y
	STA $01
	PLA
	STA $00
	LDY #$00
	RTS

table_00_836E_852F:
	LDA ($00),Y
	PHA
	INY
	LDA ($00),Y
	PHA
	INY
	JSR _loc_00_8956
	LDA $00
	STA $0766,X
	LDA $01
	STA $076F,X
	PLA
	STA $01
	PLA
	STA $00
	CLC
	RTS

table_00_836E_854C:
	LDA $0766,X
	STA $00
	LDA $076F,X
	STA $01
	LDY #$00
	RTS

_loc_00_8559:
table_00_836E_8559:
	LDA #$80
	STA $070C,X
	LDA #$00
	STA $0715,X
	CPX #$04
	BCS bra_00_857F
	LDA $0715
	ORA $0716
	ORA $0717
	ORA $0718
	BNE bra_00_857D
	LDA $07E5
	AND #$FD
	STA $07E5
bra_00_857D:
	SEC
	RTS
bra_00_857F:
	BIT $07E5
	BVS bra_00_85B8
	CPX #$07
	BEQ bra_00_85B8
	TXA
	AND #$03
	TAX
	LDA $0715,X
	BEQ bra_00_85B8
	TXA
	ASL
	ASL
	TAY
	LDA $07C1,Y
	JSR _loc_00_88BB
	INY
	LDA $07C1,Y
	JSR _loc_00_88BB
	INY
	LDA $07C1,Y
	JSR _loc_00_88BB
	INY
	LDA $07C1,Y
	JSR _loc_00_88BB
	LDX $0704
	LDA #$00
	STA $070C,X
bra_00_85B8:
	LDX $0704
	STA $0703,X
	SEC
	RTS

table_00_836E_85C0:
	LDA ($00),Y
	STA $0778,X
	LDA $0715,X
	ORA #$02
	STA $0715,X
	INY
	CLC
	RTS

table_00_836E_85D0:
	LDA ($00),Y
	STA $07B6,X
	INY
	LDA ($00),Y
	STA $07B3,X
	INY
	LDA ($00),Y
	STA $07BC,X
	LDA $0715,X
	ORA #$10
	STA $0715,X
	INY
	CLC
	RTS

table_00_836E_85EC:
	LDA $0715,X
	ORA #$10
	STA $0715,X
	CLC
	RTS

table_00_836E_85F6:
	LDA $0715,X
	AND #$EF
	STA $0715,X
	CLC
	RTS

table_00_836E_8600:
	LDA ($00),Y
	STA $0741
	INY
	LDA ($00),Y
	STA $0753
	INY
	LDA ($00),Y
	STA $074A
	INY
	CLC
	RTS
_loc_00_8614:
	LDA $070C,X
	BEQ bra_00_865E
	CPX #$08
	BEQ bra_00_865F
	LDA $070C,X
	AND #$80
	BEQ bra_00_8627
	JSR _loc_00_8768
bra_00_8627:
	LDA $070C,X
	AND #$40
	BEQ bra_00_8631
	JSR _loc_00_87E1
bra_00_8631:
	LDA $070C,X
	AND #$20
	BEQ bra_00_863B
	JSR _loc_00_8832
bra_00_863B:
	LDA $070C,X
	AND #$08
	BEQ bra_00_8645
	JSR _loc_00_87F2
bra_00_8645:
	LDA $070C,X
	AND #$04
	BEQ bra_00_864F
	JSR _loc_00_875D
bra_00_864F:
	LDA $070C,X
	AND #$10
	BEQ bra_00_8659
	JSR _loc_00_87AA
bra_00_8659:
	LDA #$00
	STA $070C,X
bra_00_865E:
	RTS
bra_00_865F:
	LDA $0714
	AND #$80
	BEQ bra_00_8669
	JSR _loc_00_869D
bra_00_8669:
	LDA $0714
	AND #$10
	BEQ bra_00_8673
	JSR _loc_00_8679
bra_00_8673:
	LDA #$00
	STA $070C,X
	RTS
_loc_00_8679:
	LDA $0753
	STA $4013
	LDA $0741
	STA $4012
	LDA $074A
	AND #$4F
	STA $4010
	LDA #$0F
	STA $4015
	LDA #$00
	STA $4011
	LDA #$1F
	STA $4015
	RTS
_loc_00_869D:
	LDA #$0F
	STA $4015
	RTS
_loc_00_86A3:
	CPX #$02
	BCC bra_00_86A8
	RTS
bra_00_86A8:
	LDA $07AC,X
	BNE bra_00_86AE
	RTS
bra_00_86AE:
	TAY
	LDA $07A8,X
	STA $00
	LDA $07AA,X
	STA $01
	TYA
	BMI bra_00_86F4
	CMP #$02
	BEQ bra_00_86D6
	CMP #$01
	BEQ bra_00_86EA
	LDA ($00),Y
	CLC
	ADC $07A6,X
	STA $07A6,X
	DEC $07AE,X
	BNE bra_00_8738
	INY
	INY
	BNE bra_00_871A
bra_00_86D6:
	DEY
	LDA ($00),Y
	CMP $07A6,X
	BCS bra_00_86E1
	STA $07A6,X
bra_00_86E1:
	INY
	TYA
	ORA #$80
	STA $07AC,X
	BNE bra_00_8738
bra_00_86EA:
	DEY
	LDA ($00),Y
	STA $07A6,X
	LDY #$03
	BNE bra_00_871A
bra_00_86F4:
	AND #$7F
	TAY
	LDA ($00),Y
	BMI bra_00_8704
	ADC $07A6,X
	BCC bra_00_8715
	LDA #$FF
	BCS bra_00_870B
bra_00_8704:
	ADC $07A6,X
	BCS bra_00_8715
	LDA #$00
bra_00_870B:
	STA $07A6,X
	LDA #$00
	STA $07AC,X
	BEQ bra_00_8738
bra_00_8715:
	STA $07A6,X
	BCS bra_00_8738
bra_00_871A:
	TYA
	STA $07AC,X
	INY
	LDA ($00),Y
	STA $07AE,X
	BNE bra_00_8738
	DEY
	LDA ($00),Y
	BNE bra_00_8730
	STA $07AC,X
	BEQ bra_00_8738
bra_00_8730:
	LDA $07AC,X
	ORA #$80
	STA $07AC,X
bra_00_8738:
	LDA $0715,X
	AND #$04
	BEQ bra_00_8742
	LDA $078E,X
bra_00_8742:
	SEC
	ADC $074B,X
	STA $03
	LDA $07A6,X
	STA $02
	JSR _loc_00_8963
	LDA $02
	JMP _loc_00_8806
_loc_00_8755:
	CPX #$02
	BCS bra_00_875C
	STA $07AC,X
bra_00_875C:
	RTS
_loc_00_875D:
	TXA
	ASL
	ASL
	TAY
	INY
	LDA $07C1,Y
	JMP _loc_00_88BB
_loc_00_8768:
	LDA $0715,X
	AND #$7F
	STA $0715,X
	TXA
	AND #$03
	CMP #$02
	BEQ bra_00_87A1
	CPX #$04
	BCS bra_00_8780
	LDA #$02
	JMP _loc_00_8755
bra_00_8780:
	TXA
	ASL
	ASL
	TAY
	LDA $07C1,Y
	AND #$F0
	JMP _loc_00_88BB
	TXA
	ASL
	ASL
	TAY
	LDA #$81
	JMP _loc_00_88BB
bra_00_8795:
	JSR _loc_00_87CE
	TXA
	ASL
	ASL
	TAY
	LDA #$81
	JMP _loc_00_88BB
bra_00_87A1:
	TXA
	ASL
	ASL
	TAY
	LDA #$80
	JMP _loc_00_88BB
_loc_00_87AA:
	LDA $0715,X
	BPL bra_00_87B0
	RTS
bra_00_87B0:
	ORA #$80
	STA $0715,X
	TXA
	AND #$03
	CMP #$02
	BEQ bra_00_8795
	CPX #$04
	BCC bra_00_87C6
	JSR _loc_00_87CE
	JMP _loc_00_8803
bra_00_87C6:
	JSR _loc_00_87CE
	LDA #$01
	JMP _loc_00_8755
_loc_00_87CE:
	TXA
	ASL
	ASL
	TAY
	INY
	INY
	LDA $07C1,Y
	JSR _loc_00_88BB
	INY
	LDA $07C1,Y
	JMP _loc_00_88BB
_loc_00_87E1:
	TXA
	ASL
	ASL
	TAY
	LDA $07C1,Y
	JSR _loc_00_88BB
	INY
	LDA $07C1,Y
	JMP _loc_00_88BB
_loc_00_87F2:
	TXA
	AND #$03
	CMP #$02
	BEQ bra_00_8802
	CPX #$04
	BCC bra_00_8802
	LDA $0715,X
	BMI bra_00_8803
bra_00_8802:
	RTS
_loc_00_8803:
bra_00_8803:
	LDA $074B,X
_loc_00_8806:
	STA $02
	LDA $0781,X
	BMI bra_00_881B
	STA $03
	JSR _loc_00_8963
	LSR $02
	LSR $02
	LDA $02
	JMP _loc_00_8820
bra_00_881B:
	LDA $02
	LSR
	LSR
	LSR
_loc_00_8820:
	ORA #$30
	STA $02
	TXA
	ASL
	ASL
	TAY
	LDA $07C1,Y
	AND #$F0
	ORA $02
	JMP _loc_00_88BB
_loc_00_8832:
	TXA
	AND #$03
	CMP #$03
	BEQ bra_00_883C
	JMP _loc_00_884A
bra_00_883C:
	LDA $0739,X
	PHA
	TXA
	ASL
	ASL
	TAY
	INY
	INY
	PLA
	JMP _loc_00_88BB
_loc_00_884A:
	CPX #$04
	BCS bra_00_886F
	LDA $07B0,X
	BMI bra_00_8861
	CLC
	ADC $0742,X
	STA $02
	LDA $0739,X
	ADC #$00
	JMP _loc_00_8877
bra_00_8861:
	CLC
	ADC $0742,X
	STA $02
	LDA $0739,X
	SBC #$00
	JMP _loc_00_8877
bra_00_886F:
	LDA $0742,X
	STA $02
	LDA $0739,X
_loc_00_8877:
	AND #$3F
	TAY
	LDA table_00_897B,Y
	STA $00
	LDA table_00_89BC,Y
	STA $01
	LDA $02
	BEQ bra_00_88A0
	LDA $00
	SEC
	SBC table_00_897B + 1,Y
	STA $03
	JSR _loc_00_8963
	LDA $00
	SEC
	SBC $02
	STA $00
	LDA $01
	SBC #$00
	STA $01
bra_00_88A0:
	TXA
	ASL
	ASL
	TAY
	INY
	INY
	LDA $00
	JSR _loc_00_88BB
	INY
	LDA $07BF,Y
	BMI bra_00_88B9
	LDA $01
	CMP $07C1,Y
	BNE bra_00_88B9
	RTS
bra_00_88B9:
	LDA $01
_loc_00_88BB:
	STA $07C1,Y
	CPX #$04
	BCS bra_00_88CC
	LDA $0719,X
	BNE bra_00_88D8
	STY $07E2
	BEQ bra_00_88D2
bra_00_88CC:
	TYA
	AND #$0F
	STA $07E2
bra_00_88D2:
	LDA $07C1,Y
	JMP $07E1
bra_00_88D8:
	RTS
_loc_00_88D9:
	CPX #$03
	BEQ bra_00_8934
	LDA $0715,X
	AND #$10
	BEQ bra_00_8934
	DEC $07B9,X
	BPL bra_00_8934
	LDA #$00
	STA $07B9,X
	LDA $07BC,X
	LSR
	STA $03
	CLC
	ADC $07B0,X
	STA $02
	LDA $07B3,X
	BMI bra_00_8916
	CLC
	ADC $02
	CMP $07BC,X
	BCC bra_00_8926
	LDA #$00
	SEC
	SBC $07B3,X
	STA $07B3,X
	LDA $07BC,X
	JMP _loc_00_8926
bra_00_8916:
	CLC
	ADC $02
	BCS bra_00_8926
	LDA #$00
	SEC
	SBC $07B3,X
	STA $07B3,X
	LDA #$00
_loc_00_8926:
bra_00_8926:
	SEC
	SBC $03
	STA $07B0,X
	LDA $070C,X
	ORA #$20
	STA $070C,X
bra_00_8934:
	RTS
_loc_00_8935:
	LDA $07B6,X
	STA $07B9,X
	LDA #$00
	STA $07B0,X
	LDA $07B3,X
	BPL bra_00_8955
	EOR #$FF
	STA $07B3,X
	INC $07B3,X
	LDA $070C,X
	ORA #$20
	STA $070C,X
bra_00_8955:
	RTS
_loc_00_8956:
	TYA
	CLC
	ADC $00
	STA $00
	BCC bra_00_8960
	INC $01
bra_00_8960:
	LDY #$00
	RTS
_loc_00_8963:
	LDA $02
	BNE bra_00_8968
	RTS
bra_00_8968:
	DEC $03
	LDA #$00
	LDY #$08
bra_00_896E:
	LSR $02
	BCC bra_00_8974
	ADC $03
bra_00_8974:
	ROR
	DEY
	BNE bra_00_896E
	STA $02
	RTS

table_00_897B:
.byte $FF,$9A,$2D,$C6,$64,$08,$B2,$60,$13,$CA,$85,$44,$07,$CD,$96,$63,$32,$04,$D9,$B0,$89,$65,$42,$22,$03,$E6,$CB,$B1,$99,$82,$6C,$58,$44,$32,$21,$11,$01,$F3,$E5,$D8,$CC,$C1,$B6,$AC,$A2,$99,$90,$88,$80,$79,$72,$6C,$66,$60,$5B,$56,$51,$4C,$49,$45,$40,$3D,$39,$36,$33

table_00_89BC:
.byte $07,$07,$07,$06,$06,$06,$05,$05,$05,$04,$04,$04,$04,$03,$03,$03,$03,$03,$02,$02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

table_00_89FD:
.word table_00_89FD_9442
.word table_00_89FD_979A
.word table_00_89FD_99A5
.word table_00_89FD_9B85
.word table_00_89FD_9DC8
.word table_00_89FD_A008
.word table_00_89FD_A33B
.word table_00_89FD_A5E3
.word table_00_89FD_A727
.word table_00_89FD_A7CE
.word table_00_89FD_A861
.word table_00_89FD_A94F
.word table_00_89FD_A9E5
.word table_00_89FD_AB4F
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8E1B
.word table_00_89FD_8AAC
.word table_00_89FD_8AE2
.word table_00_89FD_8B18
.word table_00_89FD_8B50
.word table_00_89FD_8B81
.word table_00_89FD_8BAB
.word table_00_89FD_8BD5
.word table_00_89FD_8BFF
.word table_00_89FD_8C37
.word table_00_89FD_8C86
.word table_00_89FD_8C8B
.word table_00_89FD_8CEC
.word table_00_89FD_8D06
.word table_00_89FD_8D1D
.word table_00_89FD_8D35
.word table_00_89FD_8D67
.word table_00_89FD_8D8D
.word table_00_89FD_8DA5
.word table_00_89FD_8DC5
.word table_00_89FD_8DDD
.word table_00_89FD_8DF7
.word table_00_89FD_8E1B
.word table_00_89FD_8E2A
.word table_00_89FD_8E69
.word table_00_89FD_8EA8
.word table_00_89FD_8F09
.word table_00_89FD_8F22
.word table_00_89FD_8F37
.word table_00_89FD_8F4C
.word table_00_89FD_8F73
.word table_00_89FD_8FA0
.word table_00_89FD_8FC0
.word table_00_89FD_8FE2
.word table_00_89FD_9006
.word table_00_89FD_905D
.word table_00_89FD_907C
.word table_00_89FD_90A6
.word table_00_89FD_90C1
.word table_00_89FD_91F3
.word table_00_89FD_911A
.word table_00_89FD_913A
.word table_00_89FD_915A
.word table_00_89FD_917A
.word table_00_89FD_919A
.word table_00_89FD_91AE
.word table_00_89FD_90F8
.word table_00_89FD_9109
.word table_00_89FD_91C9
.word table_00_89FD_9212

; 8A9D хрен знает откуда читаются
.byte $4F,$04,$AB,$8A,$05,$AB,$8A,$06,$AB,$8A,$07,$AB,$8A,$FF,$D3

table_00_89FD_8AAC:
.byte $40,$07,$C6,$8A,$FF
.byte $CD,$5F,$92,$D4,$8C,$C4,$7F,$4F,$CA,$03,$C4,$32,$C5,$F9,$01,$CE,$07,$BD,$8A,$CB,$D3,$C4,$7F,$4C,$CA,$02,$CB,$01,$C4,$51,$48,$CA,$C5,$FB,$01,$C1,$FF,$CE,$05,$D1,$8A,$C5,$FC,$01,$CE,$08,$DA,$8A,$D3

table_00_89FD_8AE2:
.byte $40,$07,$FC,$8A,$FF
.byte $CD,$5F,$92,$D4,$8C,$C4,$7F,$58,$CA,$03,$C4,$3C,$C5,$F9,$01,$CE,$07,$F3,$8A,$CB,$D3,$C4,$7F,$4E,$CA,$02,$CB,$01,$C4,$5B,$48,$CA,$C5,$FB,$01,$C1,$FF,$CE,$05,$07,$8B,$C5,$FD,$01,$CE,$0F,$10,$8B,$D3

table_00_89FD_8B18:
.byte $40,$05,$20,$8B,$07,$39,$8B,$FF
.byte $CD,$63,$92,$C4,$3C,$5F,$CA,$01,$C1,$FE,$CE,$02,$27,$8B,$01,$C1,$02,$C5,$F1,$CE,$02,$2E,$8B,$CB,$D3,$C4,$5A,$49,$CA,$01,$C1,$01,$CE,$02,$3D,$8B,$C4,$32,$4B,$01,$C5,$F6,$CE,$03,$47,$8B,$CB,$D3

table_00_89FD_8B50:
.byte $40,$06,$58,$8B,$07,$6A,$8B,$FF
.byte $53,$CA,$01,$C1,$FE,$CE,$03,$5A,$8B,$01,$C1,$02,$CE,$03,$61,$8B,$CB,$D3,$C4,$7F,$48,$CA,$01,$C1,$01,$01,$CB,$01,$C4,$32,$4B,$CA,$01,$C5,$F8,$CE,$04,$78,$8B,$CB,$D3

table_00_89FD_8B81:
.byte $40,$07,$86,$8B,$FF
.byte $C4,$64,$4E,$CA,$01,$4A,$01,$CB,$02,$C4,$32,$4A,$CA,$01,$48,$01,$CB,$02,$C4,$28,$4A,$CA,$01,$48,$01,$CB,$02,$C4,$1E,$4A,$CA,$01,$48,$01,$CB,$02,$D3

table_00_89FD_8BAB:
.byte $40,$07,$B0,$8B,$FF
.byte $C4,$6E,$4D,$CA,$02,$CB,$01,$4B,$CA,$01,$C1,$01,$CE,$02,$B9,$8B,$C4,$28,$46,$07,$C1,$01,$CE,$02,$C3,$8B,$0B,$C5,$F6,$C1,$FF,$CE,$04,$CA,$8B,$CB,$D3

table_00_89FD_8BD5:
.byte $44,$06,$DD,$8B,$07,$E8,$8B,$FF
.byte $64,$CA,$01,$C1,$FE,$CE,$05,$DF,$8B,$CB,$D3,$C4,$7F,$4D,$CA,$01,$C1,$01,$CE,$02,$EC,$8B,$C4,$32,$4A,$01,$C5,$FB,$CE,$08,$F6,$8B,$CB,$D3

table_00_89FD_8BFF:
.byte $40,$07,$07,$8C,$05,$24,$8C,$FF
.byte $C4,$6E,$4C,$CA,$01,$CB,$01,$CA,$C5,$F6,$01,$CE,$05,$0F,$8C,$C4,$1E,$44,$C1,$FF,$C5,$F6,$08,$CE,$03,$19,$8C,$CB,$D3,$CD,$5F,$92,$C4,$64,$CA,$4C,$01,$CB,$01,$CA,$4C,$01,$47,$01,$48,$01,$CB,$D3

table_00_89FD_8C37:
.byte $42,$05,$3F,$8C,$07,$5D,$8C,$FF
.byte $CD,$63,$92,$C4,$01,$D4,$94,$06,$CA,$C5,$02,$7F,$CA,$02,$CB,$CE,$14,$48,$8C,$C5,$FE,$7F,$CA,$02,$CB,$CE,$14,$52,$8C,$D3,$C4,$50,$44,$CA,$C5,$0F,$01,$CE,$03,$61,$8C,$C5,$F6,$01,$CE,$05,$68,$8C,$C4,$3C,$46,$C1,$01,$C5,$08,$03,$CE,$06,$72,$8C,$C1,$FF,$C5,$F9,$05,$CE,$09,$7B,$8C,$CB,$D3

table_00_89FD_8C86:
.byte $42,$07,$93,$8C,$FF

table_00_89FD_8C8B:
.byte $42,$05,$C4,$8C,$07,$93,$8C,$FF
.byte $C4,$7F,$4C,$CA,$01,$CB,$C4,$50,$44,$CA,$C5,$0F,$01,$CE,$03,$9D,$8C,$C1,$01,$C5,$F6,$01,$CE,$07,$A4,$8C,$C4,$3C,$46,$C1,$01,$C5,$08,$03,$CE,$08,$B0,$8C,$C1,$FF,$C5,$F9,$05,$CE,$0E,$B9,$8C,$CB,$D3,$CD,$5F,$92,$C4,$64,$D4,$94,$CA,$77,$01,$71,$01,$52,$CE,$05,$CC,$8C,$C4,$00,$C5,$08,$7F,$CA,$06,$CB,$CE,$08,$D7,$8C,$C5,$FA,$7F,$CA,$06,$CB,$CE,$0A,$E1,$8C,$D3

table_00_89FD_8CEC:
.byte $40,$05,$F1,$8C,$FF
.byte $CD,$5F,$92,$D4,$8B,$C4,$7F,$48,$CA,$03,$C4,$1E,$01,$C5,$0F,$CE,$05,$FD,$8C,$CB,$D3

table_00_89FD_8D06:
.byte $40,$07,$0B,$8D,$FF
.byte $C4,$3C,$44,$CA,$02,$C4,$78,$4B,$CA,$01,$C4,$3C,$01,$C4,$1E,$01,$CB,$D3

table_00_89FD_8D1D:
.byte $44,$04,$25,$8D,$05,$29,$8D,$FF
.byte $6E,$D0,$2C,$8D,$75,$C2,$78,$CD,$63,$92,$C4,$79,$D1,$5A,$8D,$D3

table_00_89FD_8D35:
.byte $44,$04,$3D,$8D,$05,$41,$8D,$FF
.byte $6E,$D0,$44,$8D,$75,$C2,$78,$CD,$63,$92,$C4,$64,$D1,$5A,$8D,$03,$CA,$C3,$9C,$01,$C3,$64,$01,$CE,$10,$4E,$8D,$CB,$D3,$CA,$C3,$9C,$01,$C3,$64,$01,$CE,$03,$5B,$8D,$CB,$D2

table_00_89FD_8D67:
.byte $44,$04,$6F,$8D,$05,$73,$8D,$FF
.byte $6B,$D0,$76,$8D,$72,$C2,$78,$CD,$63,$92,$C4,$7A,$CA,$C1,$07,$01,$C1,$F9,$01,$CE,$04,$7C,$8D,$CB,$02,$CF,$02,$7B,$8D,$D3

table_00_89FD_8D8D:
.byte $46,$05,$92,$8D,$FF
.byte $CD,$5F,$92,$C4,$7F,$64,$CA,$02,$C4,$3E,$01,$C5,$EC,$CE,$03,$9C,$8D,$CB,$D3

table_00_89FD_8DA5:
.byte $46,$05,$AA,$8D,$FF
.byte $CD,$5F,$92,$C4,$7F,$70,$CA,$02,$C4,$52,$02,$C5,$FF,$CE,$0A,$B4,$8D,$CB,$01,$C5,$FE,$CE,$1E,$BC,$8D,$CB,$D3

table_00_89FD_8DC5:
.byte $40,$05,$CA,$8D,$FF
.byte $CD,$5F,$92,$C4,$7F,$6C,$CA,$01,$C4,$3E,$01,$C5,$EC,$CE,$03,$D4,$8D,$CB,$D3

table_00_89FD_8DDD:
.byte $40,$05,$E2,$8D,$FF
.byte $CD,$63,$92,$C4,$7F,$69,$CA,$01,$C4,$3E,$C1,$04,$01,$C5,$F6,$CE,$04,$EC,$8D,$CB,$D3

table_00_89FD_8DF7:		; тут как будто лишний байт, читается при звуке непослушания команды
.byte $40,$04,$03,$8E,$05,$FF
.byte $8D,$FF,$67,$D0,$04,$8E,$6B,$CD,$6B,$92,$C4,$7F,$CA,$01,$C4,$3E,$01,$C4,$64,$CA,$01,$01,$C5,$F6,$CE,$0A,$12,$8E,$CB,$D3

table_00_89FD_8E1B:
.byte $40,$05,$20,$8E,$FF
.byte $CD,$63,$92,$C4,$64,$67,$CA,$01,$CB,$D3

table_00_89FD_8E2A:
.byte $41,$05,$52,$8E,$07,$32,$8E,$FF
.byte $C4,$6E,$4C,$CA,$02,$CB,$01,$CA,$4D,$02,$C5,$EC,$49,$02,$C5,$F9,$01,$CE,$06,$40,$8E,$C5,$E7,$C5,$FD,$01,$CE,$03,$49,$8E,$CB,$D3,$CD,$63,$92,$C4,$7F,$D4,$8D,$46,$CA,$01,$52,$01,$47,$01,$53,$01,$48,$01,$54,$01,$4B,$01,$D3

table_00_89FD_8E69:
.byte $41,$05,$91,$8E,$07,$71,$8E,$FF
.byte $C4,$7F,$4C,$CA,$02,$CB,$01,$CA,$4F,$02,$C5,$EC,$4B,$02,$C5,$F6,$01,$CE,$06,$7F,$8E,$C5,$E2,$C5,$FE,$01,$CE,$05,$88,$8E,$CB,$D3,$CD,$63,$92,$C4,$7F,$D4,$8D,$46,$CA,$01,$52,$01,$47,$01,$53,$01,$48,$01,$54,$01,$4B,$01,$D3

table_00_89FD_8EA8:
.byte $40,$05,$B0,$8E,$07,$D8,$8E,$FF
.byte $CD,$5F,$92,$C4,$64,$D4,$94,$CA,$77,$01,$71,$01,$52,$CE,$05,$B8,$8E,$C4,$00,$C5,$10,$7F,$CA,$05,$CB,$CE,$04,$C3,$8E,$C5,$F4,$7F,$CA,$04,$CB,$CE,$05,$CD,$8E,$D3,$C4,$7F,$4C,$CA,$01,$CB,$C4,$50,$44,$CA,$C5,$0F,$01,$CE,$03,$E2,$8E,$C1,$01,$C5,$F6,$01,$CE,$07,$E9,$8E,$C4,$3C,$46,$C1,$01,$C5,$08,$01,$CE,$08,$F5,$8E,$C1,$FF,$C5,$F9,$02,$CE,$0E,$FE,$8E,$CB,$D3

table_00_89FD_8F09:
.byte $40,$05,$0E,$8F,$FF
.byte $CD,$5F,$92,$C4,$00,$D4,$94,$CA,$C5,$28,$7F,$CA,$09,$CB,$CE,$03,$16,$8F,$CB,$D3

table_00_89FD_8F22:
.byte $40,$05,$27,$8F,$FF
.byte $CD,$63,$92,$C4,$69,$58,$D4,$8B,$CA,$04,$C4,$3C,$5D,$04,$CB,$D3

table_00_89FD_8F37:
.byte $40,$07,$3C,$8F,$FF
.byte $C0,$04,$C4,$28,$CA,$C1,$01,$C5,$0F,$01,$CE,$04,$41,$8F,$CB,$D3

table_00_89FD_8F4C:
.byte $40,$07,$51,$8F,$FF
.byte $C4,$3C,$4A,$CA,$01,$C1,$01,$C5,$0F,$01,$CF,$04,$56,$8F,$C1,$FF,$C5,$FA,$01,$CF,$06,$5F,$8F,$CB,$03,$4A,$C4,$32,$CE,$04,$54,$8F,$CB,$D3

table_00_89FD_8F73:
.byte $40,$05,$7B,$8F,$07,$90,$8F,$FF
.byte $CD,$5F,$92,$D4,$8C,$C4,$7F,$4C,$CA,$01,$C4,$5A,$C5,$F8,$01,$CE,$06,$87,$8F,$CB,$D3,$C4,$32,$43,$CA,$02,$C4,$0B,$C5,$FE,$01,$CE,$05,$97,$8F,$CB,$D3

table_00_89FD_8FA0:
.byte $40,$07,$A5,$8F,$FF
.byte $D1,$B4,$8F,$C4,$44,$44,$01,$C5,$FB,$CE,$0C,$AB,$8F,$CB,$D3,$C4,$7F,$4D,$CA,$02,$C1,$01,$CE,$03,$B8,$8F,$D2

table_00_89FD_8FC0:
.byte $40,$07,$C5,$8F,$FF
.byte $C4,$00,$C0,$0C,$CA,$C5,$19,$01,$CE,$05,$CA,$8F,$14,$C1,$01,$C5,$FA,$04,$C1,$FF,$C5,$FA,$04,$CF,$06,$D2,$8F,$CB,$D3

table_00_89FD_8FE2:
.byte $40,$05,$E7,$8F,$FF
.byte $CD,$63,$92,$C4,$28,$D4,$9C,$70,$CA,$C5,$14,$01,$CE,$04,$F0,$8F,$D4,$95,$06,$D4,$9C,$03,$C5,$FA,$01,$CE,$0A,$FD,$8F,$CB,$D3

table_00_89FD_9006:
.byte $40,$05,$28,$90,$07,$0E,$90,$FF
.byte $C4,$14,$49,$CA,$C5,$02,$01,$CE,$0A,$12,$90,$C1,$FF,$CF,$05,$12,$90,$C5,$FE,$01,$CE,$32,$1F,$90,$CB,$D3,$CD,$63,$92,$C4,$14,$05,$63,$CA,$C3,$EC,$C5,$02,$01,$C1,$02,$01,$CE,$08,$30,$90,$C5,$FF,$01,$C3,$9C,$01,$CE,$08,$3C,$90,$6C,$C4,$0F,$C1,$01,$C5,$02,$01,$CE,$0A,$49,$90,$C5,$FF,$01,$C3,$64,$01,$CE,$14,$52,$90,$D3

table_00_89FD_905D:
.byte $40,$07,$62,$90,$FF
.byte $C4,$1B,$4A,$CA,$01,$C1,$FF,$C5,$14,$01,$CE,$05,$67,$90,$C1,$01,$02,$C5,$F1,$02,$CE,$06,$70,$90,$CB,$D3

table_00_89FD_907C:
.byte $40,$05,$81,$90,$FF
.byte $65,$D0,$85,$90,$CD,$6B,$92,$C4,$3C,$CA,$D4,$84,$01,$C5,$0F,$CE,$04,$8D,$90,$CD,$63,$92,$C1,$FA,$C4,$51,$D4,$84,$01,$C5,$F1,$CE,$04,$9D,$90,$CB,$D3

table_00_89FD_90A6:
.byte $40,$07,$AB,$90,$FF
.byte $C4,$7F,$43,$CA,$01,$49,$01,$44,$CB,$01,$C4,$64,$CA,$01,$C5,$F1,$CE,$04,$B8,$90,$CB,$D3

table_00_89FD_90C1:
.byte $42,$07,$C6,$90,$FF
.byte $C4,$05,$C0,$4E,$CA,$C5,$04,$01,$CE,$1E,$CB,$90,$CB,$01,$CA,$C1,$FE,$01,$CE,$03,$D5,$90,$C5,$FC,$02,$CB,$01,$CA,$C5,$FC,$02,$CE,$18,$E2,$90,$C5,$FF,$01,$CE,$05,$E9,$90,$C1,$01,$CF,$05,$E9,$90,$CB,$D3

table_00_89FD_90F8:
.byte $44,$07,$FD,$90,$FF
.byte $C4,$7F,$4F,$CA,$02,$CB,$05,$4D,$CA,$01,$CB,$D3

table_00_89FD_9109:
.byte $44,$07,$0E,$91,$FF
.byte $C4,$7F,$4D,$CA,$01,$CB,$03,$4B,$CA,$01,$CB,$D3

table_00_89FD_911A:
.byte $40,$05,$1F,$91,$FF
.byte $CD,$5F,$92,$C4,$7F,$66,$CA,$02,$C4,$52,$02,$C5,$FE,$CE,$05,$29,$91,$CB,$01,$C5,$FC,$CE,$0F,$31,$91,$CB,$D3

table_00_89FD_913A:
.byte $40,$05,$3F,$91,$FF
.byte $CD,$5F,$92,$C4,$7F,$64,$CA,$02,$C4,$52,$02,$C5,$FE,$CE,$05,$49,$91,$CB,$01,$C5,$FC,$CE,$0F,$51,$91,$CB,$D3

table_00_89FD_915A:
.byte $40,$05,$5F,$91,$FF
.byte $CD,$5F,$92,$C4,$7F,$69,$CA,$02,$C4,$52,$02,$C5,$FE,$CE,$05,$69,$91,$CB,$01,$C5,$FC,$CE,$0F,$71,$91,$CB,$D3

table_00_89FD_917A:
.byte $40,$05,$7F,$91,$FF
.byte $CD,$5F,$92,$C4,$7F,$68,$CA,$02,$C4,$52,$02,$C5,$FE,$CE,$05,$89,$91,$CB,$01,$C5,$FC,$CE,$0F,$91,$91,$CB,$D3

table_00_89FD_919A:
.byte $40,$05,$9F,$91,$FF
.byte $CD,$5F,$92,$C4,$64,$6C,$CA,$03,$CB,$03,$CE,$0C,$9F,$91,$D3

table_00_89FD_91AE:
.byte $40,$05,$B3,$91,$FF
.byte $CD,$5F,$92,$C4,$64,$70,$CA,$01,$CB,$01,$C4,$46,$6C,$CA,$01,$CB,$01,$CE,$10,$B3,$91,$D3

table_00_89FD_91C9:
.byte $40,$05,$CE,$91,$FF
.byte $6B,$CD,$6B,$92,$C4,$3C,$CA,$D4,$8C,$01,$C5,$14,$CE,$03,$D7,$91,$CD,$63,$92,$C1,$FA,$C4,$32,$CB,$03,$CA,$01,$D4,$9C,$C5,$E7,$CE,$02,$EB,$91,$CB,$D3

table_00_89FD_91F3:
.byte $40,$05,$01,$92,$07,$FB,$91,$FF
.byte $49,$C4,$0F,$D0,$09,$92,$CD,$6B,$92,$54,$C4,$3C,$D4,$8C,$CA,$01,$CB,$CE,$14,$09,$92,$CB,$D3

table_00_89FD_9212:
.byte $40,$07,$17,$92,$FF
.byte $C4,$7F,$4F,$CA,$02,$CB,$05,$4E,$CA,$02,$CB,$05,$4D,$CA,$02,$CB,$05,$4C,$CA,$02,$CB,$05,$4B,$CA,$02,$CB,$05,$49,$CA,$02,$CB,$05,$48,$CA,$02,$CB,$05,$47,$CA,$02,$CB,$05,$46,$CA,$02,$CB,$05,$45,$CA,$02,$CB,$05,$44,$CA,$02,$CB,$05,$43,$CA,$02,$CB,$05,$42,$CA,$02,$CB,$05,$41,$CA,$02,$CB,$D3,$00,$00,$F0,$08,$00,$00,$B0,$08,$00,$00,$70,$08,$00,$00,$30,$08,$A7,$92,$F0,$08,$A7,$92,$B0,$08,$A7,$92,$70,$08,$A7,$92,$30,$08,$B0,$92,$F0,$08,$B0,$92,$B0,$08,$B0,$92,$70,$08,$B0,$92,$30,$08,$B9,$92,$F0,$08,$B9,$92,$B0,$08,$B9,$92,$30,$08,$C2,$92,$F0,$08,$C2,$92,$B0,$08,$CB,$92,$F0,$08,$E1,$22,$FF,$05,$04,$00,$28,$02,$00,$E1,$46,$FF,$05,$04,$00,$28,$02,$00,$E1,$64,$FF,$05,$04,$00,$28,$02,$00,$E1,$14,$FF,$05,$04,$00,$28,$02,$00,$FA,$3C,$FF,$05,$04,$00,$28,$02,$00,$DC,$92,$F0,$08,$DC,$92,$B0,$08,$FA,$21,$FF,$00,$08,$EE,$08,$FE,$00,$E9,$92,$30,$08,$FA,$21,$FF,$F1,$08,$F8,$00,$0E,$93,$1B,$93,$CF,$93,$DB,$93,$7C,$93,$81,$93,$48,$93,$4D,$93,$52,$93,$57,$93,$96,$93,$9E,$93,$F0,$93,$19,$94,$3B,$93,$30,$08,$13,$93,$FF,$DE,$F9,$08,$0E,$CA,$0A,$CB,$D3,$30,$07,$23,$93,$05,$2D,$93,$FF,$46,$C4,$7F,$CA,$04,$C4,$3C,$01,$CB,$D3,$CD,$63,$92,$C4,$78,$53,$CA,$01,$54,$01,$51,$01,$CB,$D3,$30,$08,$40,$93,$FF,$DE,$FB,$10,$0E,$CA,$14,$CB,$D3,$30,$08,$5C,$93,$FF,$30,$08,$64,$93,$FF,$30,$08,$6C,$93,$FF,$30,$08,$74,$93,$FF,$DE,$FB,$10,$0D,$CA,$14,$CB,$D3,$DE,$FB,$10,$0C,$CA,$14,$CB,$D3,$DE,$FB,$10,$0B,$CA,$14,$CB,$D3,$DE,$FB,$10,$0A,$CA,$14,$CB,$D3,$30,$08,$86,$93,$FF,$30,$08,$8E,$93,$FF,$DE,$FB,$10,$0F,$CA,$14,$CB,$D3,$DE,$FB,$10,$0E,$CA,$14,$CB,$D3,$30,$05,$B6,$93,$08,$A6,$93,$FF,$30,$05,$BA,$93,$08,$AE,$93,$FF,$DE,$FB,$10,$0F,$CA,$03,$CB,$D3,$DE,$FB,$10,$0C,$CA,$03,$CB,$D3,$64,$D0,$BB,$93,$53,$CD,$67,$92,$D4,$A3,$C4,$7F,$CA,$02,$C4,$3C,$C5,$FF,$01,$CE,$3C,$C6,$93,$CB,$D3,$2F,$07,$D4,$93,$FF,$C4,$7F,$41,$CA,$02,$CB,$D3,$2F,$07,$E0,$93,$FF,$C4,$7F,$43,$CA,$03,$C4,$64,$C5,$FF,$01,$CE,$3C,$E7,$93,$CB,$D3,$30,$07,$FB,$93,$06,$02,$94,$05,$07,$94,$FF,$C4,$28,$45,$CA,$01,$CB,$D3,$7B,$CA,$02,$CB,$D3,$CD,$5F,$92,$C4,$64,$7A,$C3,$C0,$CA,$01,$C4,$14,$01,$C4,$05,$01,$CB,$D3,$30,$07,$24,$94,$06,$2B,$94,$05,$30,$94,$FF,$C4,$28,$45,$CA,$01,$CB,$D3,$77,$CA,$02,$CB,$D3,$CD,$5F,$92,$C4,$64,$76,$C3,$C0,$CA,$01,$C4,$14,$01,$C4,$05,$01,$CB,$D3

table_00_89FD_9442:
.byte $FF,$00,$50,$94,$01,$4B,$95,$02,$23,$96,$03,$D2,$96,$FF
.byte $CC,$88,$CD,$73,$92,$DB,$0A,$23,$82,$D8,$00,$C4,$46,$C7,$FF,$D1,$E1,$94,$0C,$75,$D1,$E1,$94,$0C,$76,$D1,$38,$95,$6B,$69,$6B,$09,$6E,$03,$6B,$C9,$D1,$38,$95,$0C,$70,$6E,$CE,$03,$69,$94,$03,$6B,$6B,$0C,$C9,$03,$6E,$6E,$0C,$C9,$03,$70,$70,$06,$C9,$C9,$03,$72,$C9,$72,$72,$72,$72,$72,$09,$C9,$0C,$72,$D1,$0A,$95,$CE,$02,$9A,$94,$D1,$42,$95,$D1,$42,$95,$D1,$42,$95,$64,$62,$06,$61,$CE,$02,$A1,$94,$09,$5F,$61,$06,$62,$09,$61,$62,$06,$64,$09,$66,$64,$06,$62,$0C,$61,$5D,$09,$5B,$5D,$06,$5F,$09,$61,$62,$06,$64,$66,$0C,$C9,$03,$66,$66,$66,$C9,$06,$C9,$0C,$66,$CF,$02,$9A,$94,$D0,$69,$94,$12,$72,$03,$72,$72,$72,$C9,$6E,$C9,$6E,$C9,$72,$C9,$09,$73,$03,$70,$12,$70,$06,$70,$70,$73,$12,$72,$03,$72,$72,$72,$C9,$6E,$C9,$6E,$C9,$72,$C9,$70,$72,$1E,$73,$D2,$06,$5F,$03,$62,$C9,$66,$09,$6B,$03,$69,$66,$64,$62,$61,$09,$5D,$5B,$5D,$06,$5F,$09,$61,$62,$06,$64,$66,$03,$64,$27,$66,$18,$C9,$0C,$69,$67,$2A,$66,$03,$67,$66,$12,$64,$62,$0C,$61,$D2,$03,$6B,$69,$6B,$09,$6E,$03,$6B,$C9,$D2,$03,$62,$61,$5F,$5D,$5F,$09,$66,$D2,$CD,$73,$92,$DB,$0A,$1E,$82,$D8,$00,$C4,$3E,$C7,$FF,$D1,$E7,$95,$6D,$6E,$1E,$70,$0C,$70,$D1,$E7,$95,$6D,$6E,$1E,$70,$0C,$72,$D1,$0F,$96,$D1,$0F,$96,$D1,$0F,$96,$0C,$6B,$69,$CE,$03,$6A,$95,$03,$66,$66,$0C,$C9,$03,$69,$69,$0C,$C9,$03,$6B,$6B,$06,$C9,$C9,$03,$6D,$C9,$6D,$6D,$6D,$6D,$6D,$09,$C9,$0C,$6D,$03,$5A,$C9,$5A,$5A,$5A,$C9,$5A,$5A,$58,$C9,$58,$58,$58,$C9,$58,$58,$56,$C9,$56,$56,$56,$C9,$56,$56,$58,$C9,$58,$58,$58,$C9,$58,$58,$CE,$06,$96,$95,$D1,$19,$96,$D1,$19,$96,$D1,$19,$96,$09,$5D,$0F,$5D,$CE,$02,$BB,$95,$18,$5B,$5D,$5D,$5D,$5B,$5D,$06,$61,$0C,$C9,$03,$61,$61,$61,$C9,$06,$C9,$0C,$61,$CF,$02,$96,$95,$D0,$6A,$95,$12,$6E,$03,$6E,$6E,$6E,$C9,$69,$C9,$69,$C9,$6E,$C9,$09,$70,$03,$6C,$12,$6C,$03,$6C,$C9,$6C,$C9,$6C,$C9,$12,$6E,$03,$6E,$6E,$6E,$C9,$69,$C9,$69,$C9,$6E,$C9,$D2,$03,$66,$66,$66,$09,$6B,$03,$66,$C9,$D2,$03,$5F,$06,$C9,$03,$5F,$06,$C9,$C9,$D2,$D8,$0C,$C7,$DC,$06,$DA,$08,$4A,$DA,$08,$48,$DA,$08,$4A,$DA,$08,$51,$DA,$08,$4A,$DA,$08,$48,$DA,$08,$4A,$51,$51,$4F,$4F,$4E,$4E,$5A,$5A,$06,$DA,$0C,$53,$58,$58,$56,$56,$CE,$03,$45,$96,$03,$47,$47,$0C,$C9,$03,$4A,$4A,$0C,$C9,$03,$4C,$4C,$06,$C9,$C9,$03,$4E,$C9,$4E,$4E,$4E,$4E,$4E,$09,$C9,$0C,$4E,$06,$53,$03,$53,$53,$06,$53,$03,$53,$53,$D1,$BE,$96,$06,$4F,$03,$4F,$4F,$06,$4F,$03,$4F,$4F,$D1,$BE,$96,$CE,$06,$6D,$96,$D1,$B1,$96,$D1,$B1,$96,$D1,$C9,$96,$4A,$4A,$4A,$4A,$51,$51,$51,$51,$D1,$C9,$96,$4E,$C9,$C9,$03,$4E,$4E,$06,$4E,$C9,$0C,$4E,$CF,$02,$6D,$96,$D0,$45,$96,$06,$DA,$08,$53,$53,$53,$53,$53,$51,$51,$51,$51,$D2,$06,$51,$03,$51,$51,$06,$51,$03,$51,$51,$D2,$4F,$4F,$4F,$4F,$51,$51,$51,$51,$D2,$CD,$F0,$92,$C4,$3E,$D1,$8F,$97,$09,$41,$03,$41,$0C,$41,$D1,$6B,$97,$D1,$8F,$97,$03,$41,$41,$12,$41,$D1,$6B,$97,$CE,$02,$D7,$96,$D1,$75,$97,$CE,$03,$F2,$96,$D1,$6B,$97,$CF,$03,$F2,$96,$41,$41,$0C,$C9,$03,$41,$41,$0C,$C9,$03,$41,$41,$06,$C9,$40,$41,$03,$41,$41,$41,$41,$0C,$41,$03,$48,$47,$46,$49,$D1,$75,$97,$CE,$0B,$1C,$97,$D1,$6B,$97,$CF,$02,$1C,$97,$D1,$75,$97,$CE,$03,$2A,$97,$D1,$6B,$97,$CF,$02,$2A,$97,$D1,$75,$97,$CE,$06,$38,$97,$D1,$80,$97,$D1,$75,$97,$CE,$0B,$42,$97,$D1,$6B,$97,$CF,$02,$42,$97,$D1,$75,$97,$CE,$03,$50,$97,$D1,$6B,$97,$CF,$02,$50,$97,$D1,$75,$97,$CE,$06,$5E,$97,$D1,$80,$97,$D0,$F2,$96,$03,$48,$48,$47,$47,$46,$46,$49,$49,$D2,$03,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$D2,$0C,$41,$06,$C9,$03,$41,$41,$0C,$41,$03,$48,$47,$46,$49,$D2,$12,$41,$03,$41,$41,$06,$41,$41,$41,$41,$D2

table_00_89FD_979A:
.byte $FF,$00,$A8,$97,$01,$56,$98,$02,$E4,$98,$03,$5C,$99,$FF
.byte $CC,$8C,$CD,$73,$92,$DB,$0A,$23,$82,$D8,$00,$C4,$46,$C7,$78,$C7,$78,$06,$58,$5F,$5E,$5F,$5D,$5B,$58,$53,$53,$53,$56,$57,$58,$5B,$58,$56,$CE,$02,$B9,$97,$C7,$FF,$D1,$16,$98,$D1,$4E,$98,$1E,$70,$D1,$16,$98,$D1,$4E,$98,$12,$70,$03,$6B,$6C,$6E,$70,$D1,$43,$98,$18,$70,$0C,$6C,$06,$6E,$B0,$80,$30,$70,$D1,$43,$98,$03,$73,$73,$73,$09,$C9,$CE,$02,$F5,$97,$03,$73,$73,$73,$C9,$06,$C9,$03,$77,$06,$C9,$03,$75,$C9,$76,$77,$09,$C9,$0C,$77,$D0,$B7,$97,$03,$6E,$6E,$6E,$6E,$70,$09,$C9,$03,$73,$73,$73,$73,$70,$09,$C9,$03,$6E,$6E,$6E,$6E,$70,$09,$C9,$03,$73,$C9,$12,$70,$CE,$03,$16,$98,$0C,$77,$75,$06,$73,$03,$72,$C9,$70,$09,$6E,$D2,$2A,$71,$03,$70,$71,$12,$75,$73,$0C,$71,$D2,$03,$6B,$6B,$6B,$6E,$C9,$73,$D2,$CD,$73,$92,$DB,$0A,$1E,$82,$D8,$00,$C4,$3E,$C7,$FF,$03,$6B,$C9,$6B,$6B,$CE,$10,$63,$98,$D1,$A3,$98,$D1,$A3,$98,$D1,$D9,$98,$18,$6C,$0C,$67,$06,$69,$AC,$80,$30,$6C,$D1,$D9,$98,$03,$6E,$6E,$6E,$09,$C9,$CE,$02,$82,$98,$03,$6E,$6E,$6E,$C9,$06,$C9,$03,$72,$06,$C9,$03,$70,$C9,$71,$72,$09,$C9,$0C,$72,$D0,$63,$98,$03,$69,$69,$69,$69,$6B,$09,$C9,$03,$6E,$6E,$6E,$6E,$6B,$09,$C9,$03,$69,$69,$69,$69,$6B,$09,$C9,$03,$6E,$C9,$12,$6B,$CE,$03,$A3,$98,$0C,$73,$72,$06,$70,$03,$6E,$C9,$6B,$09,$69,$03,$67,$67,$67,$69,$C9,$6E,$1E,$6B,$D2,$2A,$6C,$03,$6C,$6C,$12,$71,$70,$0C,$6C,$D2,$D8,$0C,$C7,$DC,$D1,$4A,$99,$CE,$02,$E8,$98,$D1,$4A,$99,$CE,$03,$EF,$98,$0C,$5F,$5D,$06,$5B,$03,$5A,$C9,$58,$09,$56,$03,$53,$53,$53,$56,$C9,$5B,$1E,$58,$CF,$02,$EF,$98,$06,$4D,$59,$CE,$08,$0E,$99,$48,$54,$48,$54,$48,$54,$48,$54,$48,$54,$4A,$56,$4B,$57,$4C,$58,$4D,$59,$CE,$08,$25,$99,$03,$5B,$5B,$5B,$09,$C9,$CE,$02,$2B,$99,$03,$5B,$5B,$5B,$C9,$06,$C9,$5F,$03,$C9,$5D,$C9,$5E,$5F,$09,$C9,$0C,$5F,$D0,$E8,$98,$06,$4C,$53,$52,$53,$51,$4F,$4C,$47,$47,$47,$4A,$4B,$4C,$4F,$4C,$4A,$D2,$CD,$F0,$92,$C4,$3E,$D1,$9A,$99,$CE,$07,$61,$99,$48,$48,$47,$47,$46,$46,$49,$48,$CF,$06,$61,$99,$D1,$9A,$99,$CE,$04,$74,$99,$03,$41,$41,$41,$09,$40,$CE,$02,$7B,$99,$03,$41,$41,$41,$40,$06,$40,$41,$03,$C9,$41,$C9,$41,$41,$09,$40,$0C,$41,$D0,$61,$99,$03,$42,$42,$42,$42,$06,$41,$03,$42,$42,$D2

table_00_89FD_99A5:
.byte $FF,$00,$B3,$99,$01,$68,$9A,$02,$C7,$9A,$03,$22,$9B,$FF
.byte $CC,$82,$CD,$E5,$92,$DB,$0A,$23,$82,$D8,$00,$C4,$46,$C7,$FF,$CD,$E5,$92,$03,$5A,$5A,$C9,$5A,$06,$58,$5A,$53,$55,$58,$55,$CE,$04,$C5,$99,$CD,$73,$92,$D1,$26,$9A,$CE,$02,$D8,$99,$03,$64,$64,$C9,$64,$06,$69,$66,$66,$64,$0C,$66,$CE,$04,$DF,$99,$D1,$26,$9A,$CE,$02,$EF,$99,$D1,$3E,$9A,$03,$64,$66,$66,$66,$06,$69,$66,$03,$6B,$69,$66,$C9,$0C,$66,$D1,$3E,$9A,$03,$64,$66,$C9,$66,$69,$69,$66,$C9,$69,$66,$66,$66,$0C,$66,$D1,$4B,$9A,$18,$66,$CE,$02,$F6,$99,$D0,$C2,$99,$09,$66,$03,$6D,$0C,$6D,$09,$66,$03,$6D,$0C,$6D,$09,$66,$03,$6D,$06,$6D,$6B,$69,$66,$0C,$66,$D2,$03,$72,$72,$72,$72,$06,$70,$6D,$70,$72,$0C,$72,$D2,$0C,$69,$6B,$06,$69,$66,$0C,$66,$06,$69,$6B,$69,$66,$18,$66,$0C,$69,$6B,$06,$69,$66,$0C,$66,$06,$69,$66,$66,$66,$D2,$CD,$73,$92,$D8,$00,$C4,$3E,$C7,$6E,$D4,$A3,$D4,$A2,$C7,$6E,$D1,$B6,$9A,$CE,$10,$77,$9A,$D4,$00,$C7,$FF,$03,$C9,$D1,$3E,$9A,$03,$64,$66,$66,$66,$06,$69,$66,$03,$6B,$69,$66,$C9,$0C,$66,$D1,$3E,$9A,$03,$64,$66,$C9,$66,$69,$69,$66,$C9,$69,$66,$66,$66,$09,$66,$03,$C9,$D1,$4B,$9A,$15,$66,$CF,$02,$7E,$9A,$D0,$73,$9A,$06,$6D,$61,$03,$6D,$61,$C9,$61,$C9,$6D,$6D,$6D,$6D,$61,$C9,$61,$D2,$D8,$0C,$C7,$DC,$03,$5A,$5A,$C9,$5A,$06,$58,$5A,$53,$55,$58,$55,$CE,$10,$CB,$9A,$30,$C9,$03,$4C,$4E,$4E,$4E,$06,$51,$4E,$03,$53,$51,$4E,$C9,$0C,$4E,$30,$C9,$03,$4C,$4E,$C9,$4E,$51,$51,$4E,$C9,$51,$4E,$4E,$4E,$0C,$4E,$0C,$51,$53,$06,$51,$4E,$0C,$4E,$06,$51,$53,$51,$4E,$18,$4E,$0C,$51,$53,$06,$51,$4E,$0C,$4E,$06,$51,$4E,$4E,$4E,$18,$4E,$CE,$02,$DB,$9A,$D0,$CB,$9A,$CD,$F0,$92,$C4,$3E,$D1,$74,$9B,$CE,$10,$27,$9B,$0C,$40,$40,$40,$40,$03,$41,$41,$41,$41,$06,$48,$46,$03,$41,$41,$41,$C9,$0C,$41,$0C,$40,$40,$40,$40,$03,$41,$41,$C9,$41,$48,$49,$46,$C9,$48,$49,$46,$47,$0C,$41,$D1,$74,$9B,$CE,$03,$56,$9B,$47,$47,$C9,$47,$48,$48,$C9,$48,$49,$49,$C9,$49,$46,$46,$47,$48,$CF,$02,$2E,$9B,$D0,$27,$9B,$06,$48,$46,$03,$48,$46,$C9,$46,$C9,$48,$48,$48,$48,$46,$C9,$46,$D2

table_00_89FD_9B85:
.byte $FF,$00,$93,$9B,$01,$30,$9C,$02,$DE,$9C,$03,$50,$9D,$FF
.byte $CC,$82,$CD,$73,$92,$DB,$0A,$23,$82,$D8,$00,$C4,$46,$C7,$FF,$03,$69,$C9,$69,$C9,$68,$68,$C9,$67,$C9,$67,$C9,$67,$68,$68,$68,$C9,$CE,$03,$A2,$9B,$69,$69,$69,$09,$C9,$03,$69,$69,$6C,$6C,$C9,$0F,$6B,$D1,$02,$9C,$CE,$02,$C4,$9B,$D1,$29,$9C,$71,$70,$06,$6E,$18,$70,$6C,$D1,$29,$9C,$71,$70,$06,$6E,$30,$70,$12,$70,$03,$6F,$70,$09,$73,$71,$06,$70,$18,$71,$6E,$12,$71,$03,$71,$71,$09,$75,$73,$06,$71,$12,$70,$03,$6B,$68,$18,$64,$D1,$02,$9C,$D0,$A2,$9B,$09,$70,$6C,$06,$70,$09,$6E,$0F,$71,$09,$6E,$6B,$06,$6E,$18,$70,$09,$6C,$69,$06,$6C,$09,$6E,$0F,$6B,$03,$64,$68,$6B,$70,$C9,$71,$70,$6E,$09,$6C,$0F,$69,$D2,$12,$6E,$03,$6D,$6E,$09,$D2,$CD,$73,$92,$DB,$0A,$1E,$82,$D8,$00,$C4,$3E,$C7,$FF,$03,$64,$C9,$64,$C9,$64,$64,$C9,$64,$C9,$64,$C9,$64,$64,$64,$64,$C9,$CE,$03,$3D,$9C,$65,$65,$65,$09,$C9,$03,$65,$65,$69,$69,$C9,$0F,$68,$D1,$A0,$9C,$CE,$02,$5F,$9C,$03,$56,$5B,$5F,$62,$CE,$04,$66,$9C,$58,$5B,$60,$64,$CE,$04,$6F,$9C,$CF,$02,$66,$9C,$58,$5B,$5E,$64,$CE,$04,$7B,$9C,$59,$5D,$60,$62,$CE,$04,$83,$9C,$59,$5D,$60,$65,$CE,$04,$8B,$9C,$12,$6B,$03,$68,$64,$18,$5F,$D1,$A0,$9C,$D0,$3D,$9C,$03,$5D,$5D,$C9,$5D,$C9,$5D,$5D,$5D,$C9,$5D,$C9,$5D,$C9,$5D,$5D,$5D,$5B,$5B,$C9,$5B,$C9,$5B,$5B,$5B,$C9,$5C,$C9,$5C,$C9,$5C,$5C,$5C,$5D,$5D,$C9,$5D,$C9,$5D,$5D,$5D,$C9,$5B,$C9,$5B,$C9,$5B,$5B,$5B,$5F,$64,$68,$6B,$C9,$6B,$6B,$6B,$09,$69,$0F,$64,$D2,$D8,$0C,$C7,$DC,$09,$51,$58,$06,$4C,$09,$4F,$58,$06,$4C,$CE,$03,$E2,$9C,$03,$51,$51,$51,$09,$C9,$03,$51,$51,$54,$54,$C9,$0F,$53,$D1,$28,$9D,$CE,$02,$FE,$9C,$0C,$4F,$4A,$4F,$4A,$4F,$48,$4C,$4F,$CE,$02,$05,$9D,$48,$49,$4F,$4C,$4D,$4C,$4A,$48,$4D,$48,$4D,$48,$4C,$53,$4C,$4C,$D1,$28,$9D,$D0,$E2,$9C,$09,$51,$58,$06,$4C,$09,$4A,$56,$06,$51,$09,$4F,$56,$06,$4A,$09,$4C,$58,$06,$53,$09,$4D,$59,$06,$54,$09,$4F,$56,$06,$4F,$4C,$C9,$0C,$4C,$09,$51,$58,$06,$4C,$D2,$CD,$F0,$92,$C4,$3E,$D1,$A4,$9D,$CE,$03,$55,$9D,$03,$41,$41,$41,$C9,$06,$40,$03,$48,$48,$49,$47,$C9,$48,$41,$41,$41,$41,$D1,$A4,$9D,$CE,$03,$6E,$9D,$D1,$B7,$9D,$CF,$02,$6E,$9D,$D1,$A4,$9D,$CE,$03,$7C,$9D,$48,$48,$C9,$48,$49,$49,$C9,$49,$46,$46,$C9,$46,$47,$47,$48,$48,$CF,$02,$7C,$9D,$D1,$A4,$9D,$CE,$03,$97,$9D,$D1,$B7,$9D,$D0,$55,$9D,$03,$DA,$04,$42,$06,$41,$03,$42,$42,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$D2,$03,$DA,$04,$41,$40,$48,$49,$46,$09,$47,$03,$48,$41,$41,$41,$41,$D2

table_00_89FD_9DC8:
.byte $FF,$00,$D6,$9D,$01,$BF,$9E,$02,$43,$9F,$03,$D7,$9F,$FF
.byte $CC,$80,$CD,$73,$92,$DB,$0A,$23,$96,$D8,$FE,$C4,$3E,$C7,$FF,$03,$D1,$B0,$9E,$5D,$C9,$CE,$03,$E5,$9D,$D1,$B0,$9E,$C4,$46,$64,$64,$D1,$8B,$9E,$09,$67,$21,$64,$03,$64,$64,$CE,$02,$F6,$9D,$D1,$9A,$9E,$D1,$8B,$9E,$09,$67,$21,$64,$06,$62,$D8,$0A,$03,$60,$5F,$60,$62,$64,$67,$C9,$66,$C9,$09,$64,$03,$62,$C9,$60,$C9,$15,$62,$1B,$5F,$03,$5E,$5D,$5E,$60,$62,$65,$C9,$64,$C9,$09,$62,$03,$60,$C9,$5E,$C9,$1B,$60,$03,$51,$52,$54,$56,$58,$59,$5B,$03,$5C,$5B,$5C,$5E,$60,$63,$C9,$0F,$62,$0C,$5E,$03,$5E,$5D,$5E,$60,$62,$65,$C9,$0F,$64,$0C,$60,$03,$60,$5F,$60,$62,$64,$67,$C9,$0F,$66,$06,$62,$66,$18,$67,$12,$66,$03,$64,$64,$D8,$FE,$D1,$8B,$9E,$09,$67,$21,$64,$03,$64,$64,$CE,$02,$70,$9E,$D1,$9A,$9E,$D1,$8B,$9E,$09,$67,$27,$64,$D0,$E5,$9D,$06,$6B,$03,$69,$6B,$06,$6B,$03,$69,$6B,$CF,$02,$8B,$9E,$D2,$06,$69,$03,$67,$69,$06,$69,$03,$67,$69,$CF,$02,$9A,$9E,$09,$66,$21,$62,$03,$64,$64,$D2,$5B,$C9,$5B,$C9,$5D,$5D,$C9,$5F,$C9,$5F,$C9,$5F,$5D,$5F,$D2,$CD,$E5,$92,$DB,$0A,$1E,$82,$D8,$FE,$C4,$46,$C7,$FF,$C4,$46,$D1,$1F,$9F,$CE,$04,$CE,$9E,$C4,$3E,$D1,$1F,$9F,$CE,$04,$D7,$9E,$D1,$31,$9F,$CE,$02,$DE,$9E,$D1,$1F,$9F,$CE,$02,$E5,$9E,$CD,$73,$92,$C4,$2F,$30,$5D,$5B,$5B,$59,$18,$5C,$5E,$5E,$60,$60,$62,$5F,$12,$63,$06,$C9,$CD,$E5,$92,$C4,$3E,$D1,$1F,$9F,$CE,$04,$07,$9F,$D1,$31,$9F,$CE,$02,$0E,$9F,$D1,$1F,$9F,$CE,$02,$15,$9F,$D0,$CC,$9E,$03,$5F,$C9,$5F,$C9,$61,$61,$C9,$62,$C9,$62,$C9,$62,$61,$62,$61,$C9,$D2,$03,$64,$C9,$64,$C9,$66,$66,$C9,$67,$C9,$67,$C9,$67,$66,$67,$66,$C9,$D2,$D8,$0A,$C7,$DC,$D1,$CB,$9F,$CE,$08,$47,$9F,$D1,$CB,$9F,$CE,$08,$4E,$9F,$D1,$D1,$9F,$CE,$04,$55,$9F,$D1,$CB,$9F,$CE,$04,$5C,$9F,$09,$51,$4C,$06,$51,$09,$4A,$51,$06,$4A,$09,$4F,$4A,$06,$4F,$09,$4F,$4A,$06,$4F,$09,$4F,$4A,$06,$4F,$09,$4F,$48,$06,$4F,$09,$4D,$54,$06,$48,$09,$4D,$54,$06,$48,$09,$4D,$54,$06,$48,$09,$4D,$52,$06,$4D,$09,$4F,$4A,$06,$4F,$09,$4F,$48,$06,$4F,$09,$51,$4C,$06,$51,$09,$51,$4A,$06,$51,$09,$4F,$4A,$06,$4F,$09,$53,$4E,$06,$53,$D1,$CB,$9F,$CE,$08,$B3,$9F,$D1,$D1,$9F,$CE,$04,$BA,$9F,$D1,$CB,$9F,$CE,$04,$C1,$9F,$D0,$47,$9F,$09,$4C,$51,$06,$4F,$D2,$09,$51,$4A,$06,$51,$D2,$CD,$F0,$92,$C4,$3E,$03,$42,$42,$C9,$42,$41,$C9,$42,$42,$40,$42,$40,$42,$41,$C9,$42,$42,$CE,$03,$DC,$9F,$47,$47,$C9,$47,$48,$48,$C9,$48,$49,$49,$C9,$49,$46,$46,$47,$48,$CF,$07,$DC,$9F,$D0,$DC,$9F

table_00_89FD_A008:
.byte $FF,$00,$16,$A0,$01,$EE,$A0,$02,$B9,$A1,$03,$B3,$A2,$FF
.byte $CC,$A8,$CD,$73,$92,$DB,$0A,$23,$82,$D8,$02,$C4,$46,$C7,$FF,$06,$5D,$5F,$5F,$5F,$62,$12,$61,$CE,$03,$25,$A0,$64,$62,$0C,$61,$CF,$02,$25,$A0,$D1,$93,$A0,$62,$61,$D1,$93,$A0,$5B,$5D,$CE,$02,$39,$A0,$D1,$A2,$A0,$03,$62,$5F,$62,$C9,$0C,$64,$03,$64,$5F,$62,$C9,$0C,$64,$03,$62,$5F,$62,$C9,$06,$64,$67,$0C,$66,$62,$CE,$02,$4A,$A0,$03,$64,$62,$60,$5F,$66,$64,$62,$60,$67,$66,$64,$62,$66,$64,$62,$60,$CE,$03,$67,$A0,$06,$64,$64,$C9,$67,$C9,$69,$0C,$AB,$80,$18,$6B,$06,$C9,$6B,$6B,$6B,$D1,$A2,$A0,$D0,$25,$A0,$06,$5D,$5F,$C9,$5D,$5F,$C9,$5D,$5F,$C9,$5D,$5F,$C9,$0C,$D2,$24,$64,$06,$66,$67,$69,$67,$C9,$66,$C9,$69,$C9,$A7,$80,$12,$67,$1E,$64,$06,$56,$58,$58,$56,$0C,$5B,$5A,$CE,$02,$A2,$A0,$1E,$60,$0C,$62,$06,$64,$1E,$66,$0C,$67,$06,$69,$1E,$6B,$0C,$69,$06,$67,$18,$66,$62,$1E,$60,$0C,$62,$06,$64,$18,$66,$06,$67,$66,$C9,$A4,$80,$30,$64,$06,$56,$58,$58,$56,$0C,$5B,$5A,$D2,$CD,$73,$92,$DB,$0A,$1E,$82,$D8,$02,$C4,$3E,$C7,$FF,$06,$56,$58,$58,$58,$5B,$12,$5A,$CE,$03,$FB,$A0,$12,$5D,$5B,$0C,$5A,$CF,$02,$FB,$A0,$D1,$64,$A1,$0C,$5B,$5A,$D1,$64,$A1,$0C,$54,$56,$CE,$02,$10,$A1,$D1,$72,$A1,$03,$5F,$5B,$5F,$C9,$0C,$5F,$03,$5F,$5B,$5F,$C9,$0C,$5F,$03,$5F,$5B,$5F,$C9,$06,$5F,$62,$0C,$61,$5F,$CE,$02,$23,$A1,$06,$5F,$5F,$5D,$5D,$5B,$5B,$5D,$5D,$CE,$03,$40,$A1,$06,$5F,$5F,$C9,$62,$C9,$64,$0C,$A6,$80,$18,$66,$06,$C9,$66,$66,$66,$D1,$72,$A1,$D0,$FB,$A0,$06,$56,$58,$C9,$56,$58,$C9,$56,$58,$C9,$56,$58,$C9,$D2,$C7,$78,$06,$DA,$08,$5F,$DA,$08,$5D,$DA,$08,$5F,$5D,$5F,$5F,$5D,$0C,$62,$61,$CE,$02,$72,$A1,$C7,$FF,$1E,$5B,$0C,$5D,$06,$5F,$1E,$62,$0C,$64,$06,$66,$1E,$67,$0C,$66,$06,$64,$18,$62,$5D,$1E,$5B,$0C,$5D,$06,$5F,$18,$62,$06,$64,$62,$C9,$9F,$80,$30,$5F,$06,$5D,$5F,$5F,$5D,$0C,$62,$61,$D2,$D8,$0E,$C7,$DC,$06,$4A,$4C,$4C,$4C,$4F,$4E,$4E,$4E,$CE,$03,$BD,$A1,$51,$51,$51,$4F,$4F,$4F,$4E,$4E,$CF,$02,$BD,$A1,$D1,$93,$A2,$0C,$4F,$4E,$D1,$93,$A2,$0C,$48,$4A,$CE,$02,$D6,$A1,$06,$D1,$A1,$A2,$D1,$AA,$A2,$D1,$A1,$A2,$4A,$4C,$4C,$4A,$0C,$4F,$4E,$CE,$02,$E6,$A1,$06,$48,$54,$48,$54,$48,$54,$48,$54,$D1,$AA,$A2,$D1,$A1,$A2,$D1,$AA,$A2,$48,$54,$48,$54,$48,$54,$48,$54,$D1,$AA,$A2,$D1,$A1,$A2,$4A,$4C,$4C,$4A,$0C,$4F,$4E,$06,$4C,$58,$4C,$58,$4C,$58,$4C,$58,$4F,$5B,$4F,$5B,$4E,$5A,$4A,$56,$CE,$02,$22,$A2,$4C,$58,$4E,$5A,$4F,$5B,$4E,$5A,$CE,$03,$37,$A2,$06,$4C,$4C,$C9,$4F,$C9,$51,$0C,$93,$80,$18,$53,$06,$C9,$53,$53,$53,$06,$D1,$A1,$A2,$D1,$AA,$A2,$D1,$A1,$A2,$4A,$4C,$4C,$4A,$0C,$4F,$4E,$CE,$02,$54,$A2,$06,$48,$54,$48,$54,$48,$54,$48,$54,$D1,$AA,$A2,$D1,$A1,$A2,$D1,$AA,$A2,$48,$54,$48,$54,$48,$54,$48,$54,$D1,$AA,$A2,$D1,$A1,$A2,$4A,$4C,$4C,$4A,$0C,$4F,$4E,$D0,$BD,$A1,$06,$4A,$4C,$C9,$4A,$4C,$C9,$4A,$4C,$C9,$4A,$4C,$C9,$D2,$4C,$58,$4C,$58,$4C,$58,$4C,$58,$D2,$4A,$56,$4A,$56,$4A,$56,$4A,$56,$D2,$CD,$F0,$92,$C4,$3E,$03,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$CE,$06,$B8,$A2,$47,$47,$C9,$47,$48,$48,$C9,$48,$49,$48,$49,$48,$46,$47,$48,$49,$CF,$08,$B8,$A2,$03,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$CE,$06,$DA,$A2,$47,$47,$C9,$47,$48,$48,$C9,$48,$49,$48,$49,$48,$46,$47,$48,$49,$03,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$CE,$08,$F8,$A2,$47,$47,$C9,$47,$48,$48,$C9,$48,$49,$48,$49,$48,$46,$47,$48,$49,$03,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$CE,$06,$16,$A3,$47,$47,$C9,$47,$48,$48,$C9,$48,$49,$48,$49,$48,$46,$47,$48,$49,$CF,$04,$16,$A3,$D0,$B8,$A2

table_00_89FD_A33B:
.byte $FF,$00,$49,$A3,$01,$60,$A4,$02,$E3,$A4,$03,$5A,$A5,$FF
.byte $CC,$82,$CD,$73,$92,$DB,$0A,$23,$82,$D8,$00,$C4,$46,$C7,$FF,$03,$58,$58,$C9,$56,$58,$C9,$5B,$5D,$58,$58,$C9,$56,$58,$C9,$53,$56,$CE,$04,$58,$A3,$D1,$A0,$A3,$D1,$08,$A4,$30,$70,$03,$73,$73,$70,$6E,$70,$C9,$C9,$C9,$73,$73,$70,$6E,$70,$C9,$C9,$C9,$73,$73,$70,$6E,$73,$73,$70,$6E,$6B,$6E,$C9,$6E,$70,$C9,$C9,$C9,$CE,$02,$75,$A3,$D1,$A0,$A3,$D0,$58,$A3,$03,$64,$64,$C9,$64,$64,$C9,$67,$C9,$09,$69,$03,$67,$69,$09,$C9,$03,$6B,$6B,$6B,$6B,$69,$C9,$67,$C9,$69,$67,$64,$62,$64,$C9,$C9,$C9,$03,$64,$64,$C9,$64,$64,$C9,$67,$C9,$09,$69,$03,$67,$69,$09,$C9,$06,$6B,$03,$6E,$6E,$6B,$6B,$69,$67,$69,$67,$64,$62,$64,$C9,$C9,$C9,$70,$70,$6E,$6B,$70,$70,$6E,$6B,$09,$6E,$03,$70,$70,$C9,$C9,$C9,$06,$70,$03,$73,$73,$70,$70,$6E,$6B,$6E,$70,$C9,$70,$70,$C9,$C9,$C9,$CE,$02,$E2,$A3,$D2,$12,$73,$06,$75,$18,$77,$06,$75,$73,$70,$6E,$18,$70,$03,$73,$73,$75,$73,$06,$70,$6E,$03,$70,$70,$73,$70,$06,$6E,$6B,$03,$6E,$6E,$70,$6E,$06,$6B,$69,$03,$6B,$6B,$6E,$6B,$06,$69,$67,$03,$64,$64,$C9,$64,$67,$67,$C9,$67,$69,$69,$C9,$69,$6B,$6B,$C9,$6B,$67,$67,$C9,$67,$69,$69,$C9,$69,$6B,$6B,$C9,$6B,$6E,$6E,$C9,$6E,$0C,$C9,$06,$70,$73,$12,$70,$06,$6E,$D2,$CD,$73,$92,$DB,$0A,$1E,$82,$D8,$00,$C4,$36,$C7,$FF,$D1,$9F,$A4,$CE,$02,$6D,$A4,$D1,$9F,$A4,$D1,$9F,$A4,$D1,$C1,$A4,$D1,$C1,$A4,$03,$C9,$D1,$08,$A4,$2D,$70,$03,$64,$C9,$64,$64,$CE,$10,$87,$A4,$D1,$9F,$A4,$D1,$9F,$A4,$D1,$C1,$A4,$D1,$C1,$A4,$D0,$6D,$A4,$03,$70,$C9,$C9,$C9,$70,$C9,$C9,$C9,$70,$C9,$73,$73,$70,$C9,$C9,$C9,$70,$C9,$73,$73,$70,$70,$6E,$6B,$70,$C9,$73,$73,$70,$C9,$C9,$C9,$D2,$03,$58,$C9,$C9,$C9,$58,$C9,$C9,$C9,$58,$C9,$5B,$5B,$58,$C9,$C9,$C9,$58,$C9,$5B,$5B,$58,$58,$56,$53,$58,$C9,$5B,$5B,$58,$C9,$C9,$C9,$D2,$D8,$0C,$C7,$DC,$D1,$48,$A5,$CE,$04,$E7,$A4,$D1,$48,$A5,$CE,$04,$EE,$A4,$06,$C9,$4C,$CE,$10,$F5,$A4,$06,$4C,$58,$4F,$5B,$4C,$58,$4A,$56,$CE,$02,$FC,$A4,$03,$5B,$5B,$12,$C9,$03,$58,$58,$12,$C9,$03,$56,$56,$12,$C9,$03,$53,$53,$12,$C9,$0C,$4C,$4F,$51,$53,$4F,$51,$53,$56,$C9,$06,$58,$5B,$12,$58,$06,$56,$30,$58,$06,$4C,$58,$CE,$10,$30,$A5,$D1,$48,$A5,$CE,$04,$37,$A5,$06,$C9,$4C,$CE,$10,$3E,$A5,$D0,$E7,$A4,$03,$4C,$4C,$C9,$4A,$4C,$C9,$4F,$51,$4C,$4C,$C9,$4A,$4C,$C9,$47,$4A,$D2,$CD,$F0,$92,$C4,$3E,$D1,$D8,$A5,$CE,$07,$5F,$A5,$41,$C9,$41,$41,$41,$41,$C9,$41,$CF,$02,$5F,$A5,$D1,$D8,$A5,$CE,$07,$72,$A5,$41,$C9,$41,$41,$41,$41,$C9,$41,$D1,$D8,$A5,$CE,$04,$81,$A5,$03,$41,$41,$12,$C9,$CE,$04,$88,$A5,$0C,$DA,$08,$41,$0C,$40,$06,$49,$46,$12,$41,$06,$48,$03,$48,$48,$C9,$48,$49,$49,$C9,$49,$46,$46,$C9,$46,$41,$41,$C9,$41,$D1,$D8,$A5,$CE,$07,$AF,$A5,$41,$C9,$41,$41,$41,$41,$C9,$41,$CF,$02,$AF,$A5,$D1,$D8,$A5,$CE,$03,$C2,$A5,$41,$C9,$41,$41,$41,$41,$C9,$41,$CF,$02,$C2,$A5,$D0,$5F,$A5,$03,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$D2

table_00_89FD_A5E3:
.byte $FF,$00,$F1,$A5,$01,$57,$A6,$02,$EA,$A6,$03,$0D,$A7,$FF
.byte $CC,$8C,$CD,$73,$92,$DB,$0A,$23,$82,$D8,$00,$C4,$46,$C7,$FF,$03,$56,$58,$5A,$5B,$5D,$5F,$60,$62,$5A,$5B,$5D,$5F,$60,$62,$64,$66,$24,$67,$0C,$69,$24,$66,$0C,$67,$24,$64,$0C,$66,$24,$62,$09,$60,$03,$5F,$09,$5D,$03,$5F,$09,$60,$03,$62,$09,$64,$03,$60,$09,$C9,$03,$A6,$80,$0C,$66,$03,$62,$09,$C9,$09,$66,$03,$66,$09,$C9,$03,$67,$0C,$C9,$09,$C9,$03,$67,$0C,$C9,$09,$C9,$03,$67,$0C,$C9,$03,$67,$09,$C9,$30,$5B,$D3,$CD,$73,$92,$DB,$0A,$1E,$82,$D8,$00,$C4,$3E,$C7,$FF,$03,$C9,$56,$58,$5A,$5B,$5D,$5F,$60,$62,$5A,$5B,$5D,$5F,$60,$62,$64,$03,$73,$6E,$6B,$67,$73,$6E,$6B,$67,$73,$6E,$6B,$67,$73,$6E,$6B,$67,$72,$6E,$6B,$67,$72,$6E,$6B,$67,$72,$6E,$6B,$67,$72,$6E,$6B,$67,$70,$6E,$6B,$67,$70,$6E,$6B,$67,$70,$6E,$6B,$67,$70,$6E,$6B,$67,$6E,$6B,$67,$62,$6E,$6B,$67,$62,$6E,$6B,$67,$62,$6E,$6B,$67,$62,$09,$5A,$03,$5A,$09,$5D,$03,$5D,$09,$60,$03,$5D,$09,$C9,$03,$A2,$80,$0C,$62,$03,$5D,$09,$C9,$09,$62,$03,$62,$09,$C9,$03,$5F,$0C,$C9,$09,$C9,$03,$60,$0C,$C9,$09,$C9,$03,$61,$0C,$C9,$03,$62,$09,$C9,$30,$56,$D3,$D8,$0C,$C7,$DC,$30,$C9,$06,$DA,$08,$4F,$DA,$08,$4E,$DA,$08,$4C,$DA,$08,$4A,$0C,$4A,$4E,$4C,$48,$4A,$4C,$4E,$51,$30,$C9,$18,$C9,$30,$4F,$D3,$CD,$F0,$92,$C4,$46,$30,$C9,$06,$DA,$20,$42,$09,$42,$03,$42,$CE,$08,$18,$A7,$30,$C9,$18,$C9,$30,$41,$D3

table_00_89FD_A727:
.byte $FF,$00,$35,$A7,$01,$70,$A7,$02,$AA,$A7,$03,$C2,$A7,$FF
.byte $CC,$92,$CD,$73,$92,$DB,$0A,$23,$82,$D8,$00,$C4,$4E,$C7,$FF,$D1,$62,$A7,$66,$6A,$6D,$72,$C9,$70,$0C,$6F,$6B,$D1,$62,$A7,$72,$72,$72,$72,$70,$6D,$6F,$C9,$70,$72,$C9,$C9,$D0,$44,$A7,$04,$64,$68,$6B,$70,$C9,$6B,$69,$C9,$6D,$70,$C9,$C9,$D2,$CD,$E5,$92,$DB,$0A,$1E,$82,$D8,$00,$C4,$46,$C7,$FF,$04,$C9,$D1,$9C,$A7,$66,$6A,$6D,$72,$C9,$70,$0C,$6F,$6B,$D1,$9C,$A7,$72,$72,$72,$72,$70,$6D,$6F,$C9,$70,$72,$C9,$D0,$7D,$A7,$04,$64,$68,$6B,$70,$C9,$6B,$69,$C9,$6D,$70,$C9,$C9,$D2,$D8,$0C,$C7,$78,$0C,$4C,$C9,$51,$C9,$4E,$C9,$53,$C9,$4C,$C9,$51,$C9,$4E,$C9,$53,$C9,$D0,$AE,$A7,$CD,$F0,$92,$C4,$1F,$04,$41,$C9,$41,$D0,$C7,$A7

table_00_89FD_A7CE:
.byte $FF,$00,$DC,$A7,$01,$0D,$A8,$02,$3C,$A8,$03,$54,$A8,$FF
.byte $CC,$6E,$CD,$73,$92,$DB,$0A,$23,$82,$D8,$FB,$C4,$46,$C7,$FF,$06,$6E,$6B,$6E,$18,$70,$03,$6C,$70,$06,$72,$6E,$72,$1E,$70,$06,$7A,$77,$7A,$18,$7C,$03,$78,$7C,$06,$7E,$7A,$7E,$1E,$7C,$D3,$D0,$EB,$A7,$CD,$73,$92,$DB,$0A,$1E,$82,$D8,$FB,$C4,$3E,$C7,$FF,$06,$6B,$67,$6B,$18,$69,$03,$69,$6C,$06,$6E,$6B,$6E,$1E,$6C,$06,$77,$73,$77,$18,$75,$03,$75,$78,$06,$7A,$77,$7A,$1E,$78,$D3,$D0,$1A,$A8,$D8,$07,$C7,$DC,$12,$4F,$1E,$51,$12,$53,$1E,$51,$12,$4F,$1E,$51,$12,$53,$1E,$51,$D3,$D0,$40,$A8,$CD,$F0,$92,$C4,$46,$06,$DA,$20,$42,$D3,$D0,$59,$A8

table_00_89FD_A861:
.byte $FF,$00,$6F,$A8,$01,$A9,$A8,$02,$E1,$A8,$03,$10,$A9,$FF
.byte $CC,$9E,$CD,$73,$92,$DB,$0A,$23,$82,$D8,$00,$C4,$46,$C7,$FF,$04,$64,$64,$64,$0C,$67,$69,$67,$CE,$02,$7E,$A8,$03,$64,$C9,$67,$C9,$69,$C9,$67,$C9,$CE,$04,$8A,$A8,$0C,$69,$04,$69,$69,$69,$0C,$6B,$04,$6B,$6B,$6B,$6D,$C9,$6B,$30,$6D,$D3,$CD,$73,$92,$DB,$0A,$1E,$82,$D8,$00,$C4,$3E,$C7,$FF,$04,$5F,$5F,$5F,$0C,$62,$64,$62,$CE,$02,$B6,$A8,$03,$5F,$C9,$62,$C9,$64,$C9,$62,$C9,$CE,$04,$C2,$A8,$0C,$64,$04,$64,$64,$64,$0C,$66,$04,$66,$66,$66,$68,$C9,$66,$30,$68,$D3,$D8,$0C,$C7,$DC,$04,$4C,$4C,$4C,$0C,$4F,$51,$4F,$CE,$02,$E5,$A8,$03,$4C,$C9,$4F,$C9,$51,$C9,$4F,$C9,$CE,$04,$F1,$A8,$0C,$51,$04,$51,$51,$51,$0C,$53,$04,$53,$53,$53,$55,$C9,$53,$30,$55,$D3,$CD,$F0,$92,$C4,$3E,$04,$41,$41,$41,$0C,$41,$41,$41,$CE,$02,$15,$A9,$03,$41,$C9,$41,$C9,$41,$C9,$41,$C9,$CE,$04,$21,$A9,$0C,$41,$04,$41,$41,$41,$0C,$41,$04,$41,$41,$41,$41,$C9,$41,$03,$48,$48,$48,$48,$49,$49,$49,$49,$46,$46,$46,$46,$42,$42,$42,$42,$D3

table_00_89FD_A94F:
.byte $FF,$00,$5D,$A9,$01,$82,$A9,$02,$A5,$A9,$03,$BF,$A9,$FF
.byte $CC,$A0,$CD,$73,$92,$DB,$0A,$23,$82,$D8,$00,$C4,$46,$C7,$FF,$04,$6B,$6B,$6B,$6E,$C9,$6E,$6B,$6B,$6B,$6E,$C9,$6E,$6B,$6B,$6B,$6E,$6B,$6E,$30,$70,$D3,$CD,$73,$92,$DB,$0A,$1E,$82,$D8,$00,$C4,$3E,$C7,$FF,$04,$68,$68,$68,$6B,$C9,$6B,$68,$68,$68,$6B,$C9,$6B,$68,$68,$68,$6B,$68,$6B,$30,$6D,$D3,$D8,$0C,$C7,$DC,$04,$53,$53,$53,$56,$C9,$56,$53,$53,$53,$56,$C9,$56,$53,$53,$53,$56,$53,$56,$30,$58,$D3,$CD,$F0,$92,$C4,$3E,$04,$41,$41,$41,$41,$C9,$41,$41,$41,$41,$41,$C9,$41,$41,$41,$41,$41,$41,$41,$03,$DA,$04,$47,$DA,$04,$48,$DA,$04,$49,$DA,$04,$42,$D3

table_00_89FD_A9E5:
.byte $FF,$00,$F3,$A9,$01,$52,$AA,$02,$AD,$AA,$03,$0F,$AB,$FF
.byte $CC,$A4,$CD,$73,$92,$DB,$0A,$23,$82,$D8,$00,$C4,$46,$C7,$FF,$06,$DA,$08,$58,$5B,$5A,$58,$5A,$58,$56,$53,$56,$CE,$04,$02,$AA,$06,$64,$64,$C9,$66,$C9,$67,$C9,$69,$CE,$03,$12,$AA,$12,$6B,$69,$06,$67,$C9,$CF,$02,$12,$AA,$06,$64,$64,$64,$C9,$C9,$64,$C9,$64,$C9,$62,$62,$62,$0C,$62,$67,$CE,$03,$29,$AA,$06,$64,$62,$64,$66,$C9,$67,$C9,$69,$67,$66,$62,$1E,$64,$CF,$02,$29,$AA,$D0,$02,$AA,$CD,$73,$92,$DB,$0A,$1E,$82,$D8,$00,$C4,$3E,$C7,$FF,$03,$64,$66,$67,$69,$6B,$21,$C9,$30,$C9,$CE,$04,$5F,$AA,$06,$5F,$5F,$C9,$61,$C9,$62,$C9,$64,$CE,$03,$6D,$AA,$12,$66,$64,$06,$62,$C9,$CF,$02,$6D,$AA,$06,$5F,$5F,$5F,$C9,$C9,$5F,$C9,$5F,$C9,$5D,$5D,$5D,$0C,$5D,$62,$CE,$03,$84,$AA,$06,$5F,$5F,$5F,$62,$C9,$62,$C9,$64,$62,$62,$5F,$1E,$5F,$CF,$02,$84,$AA,$D0,$5F,$AA,$D8,$0C,$C7,$C8,$06,$DA,$08,$4C,$4F,$4E,$4C,$4E,$4C,$4A,$47,$4A,$CE,$05,$B1,$AA,$DA,$08,$4C,$53,$5F,$5F,$51,$5D,$5D,$4F,$5B,$06,$DA,$08,$4C,$4F,$4E,$4C,$4E,$4C,$4A,$47,$4A,$DA,$08,$4C,$53,$5F,$5F,$51,$5D,$5D,$4F,$5B,$4C,$58,$4C,$58,$4C,$58,$4C,$58,$4A,$56,$4A,$56,$4A,$56,$4A,$56,$CE,$03,$E3,$AA,$4C,$4A,$4C,$4E,$C9,$4F,$C9,$51,$4F,$4E,$4A,$0C,$4C,$06,$58,$4C,$58,$CF,$02,$E3,$AA,$D0,$B1,$AA,$CD,$F0,$92,$C4,$3E,$03,$DA,$04,$42,$06,$41,$03,$42,$42,$CE,$07,$14,$AB,$DA,$04,$41,$C9,$41,$C9,$41,$CF,$02,$14,$AB,$03,$DA,$04,$42,$06,$41,$03,$42,$42,$CE,$06,$2C,$AB,$47,$47,$C9,$47,$DA,$04,$48,$49,$49,$C9,$49,$46,$47,$48,$48,$CF,$06,$2C,$AB,$D0,$14,$AB

table_00_89FD_AB4F:
.byte $FF,$00,$5D,$AB,$01,$03,$AC,$02,$B9,$AC,$03,$2F,$AD,$FF
.byte $CC,$A0,$CD,$73,$92,$DB,$0A,$23,$82,$D8,$00,$C4,$46,$C7,$FF,$06,$67,$64,$C9,$64,$62,$64,$C9,$64,$60,$62,$C9,$62,$62,$64,$C9,$64,$CE,$02,$6C,$AB,$06,$64,$1E,$C9,$0C,$62,$CE,$03,$81,$AB,$06,$64,$0C,$C9,$1E,$67,$CF,$02,$81,$AB,$D1,$D5,$AB,$CF,$02,$95,$AB,$06,$64,$64,$C9,$67,$C9,$67,$C9,$67,$66,$66,$C9,$1E,$64,$CE,$02,$9C,$AB,$06,$66,$66,$C9,$69,$C9,$69,$C9,$69,$67,$67,$C9,$1E,$66,$CE,$02,$AE,$AB,$06,$67,$67,$67,$0C,$C9,$67,$06,$67,$06,$66,$66,$C9,$1E,$6B,$D1,$D5,$AB,$D0,$6C,$AB,$1E,$64,$06,$62,$64,$62,$12,$67,$1E,$64,$CE,$02,$D5,$AB,$1E,$66,$06,$64,$66,$64,$0C,$69,$67,$06,$66,$03,$62,$C9,$06,$C9,$64,$30,$64,$06,$5F,$6B,$C9,$6B,$C9,$6B,$03,$6B,$6B,$6B,$C9,$D2,$CD,$E5,$92,$DB,$0A,$1E,$82,$D8,$00,$C4,$3E,$C7,$DC,$06,$62,$5F,$C9,$5F,$5D,$5F,$C9,$5F,$5B,$5D,$C9,$5D,$5D,$5F,$C9,$5F,$CE,$02,$10,$AC,$06,$5F,$1E,$C9,$0C,$5D,$CE,$03,$25,$AC,$06,$5F,$0C,$C9,$1E,$62,$CF,$02,$25,$AC,$D1,$7E,$AC,$CF,$02,$39,$AC,$CD,$73,$92,$06,$60,$60,$C9,$60,$C9,$60,$C9,$60,$60,$60,$C9,$1E,$60,$CE,$02,$43,$AC,$06,$62,$62,$C9,$62,$C9,$62,$C9,$62,$62,$62,$C9,$1E,$62,$CE,$02,$55,$AC,$06,$62,$62,$62,$0C,$C9,$62,$06,$62,$63,$63,$C9,$1E,$66,$CD,$E5,$92,$D1,$7E,$AC,$D0,$10,$AC,$06,$5B,$58,$58,$58,$56,$58,$58,$58,$CE,$02,$7E,$AC,$5B,$58,$58,$58,$54,$58,$58,$58,$CE,$02,$8B,$AC,$06,$5A,$56,$56,$56,$54,$56,$56,$56,$CE,$02,$97,$AC,$5B,$58,$58,$58,$56,$58,$58,$58,$5F,$66,$C9,$66,$C9,$03,$66,$C9,$66,$66,$66,$C9,$D2,$D8,$0C,$C7,$DC,$06,$4C,$4C,$53,$4C,$4A,$4C,$C9,$4C,$48,$4A,$C9,$4A,$4A,$51,$4C,$53,$CE,$02,$BD,$AC,$06,$4C,$1E,$C9,$0C,$4A,$CE,$03,$D2,$AC,$06,$4C,$0C,$C9,$1E,$4F,$CF,$02,$D2,$AC,$D1,$07,$AD,$CF,$02,$E6,$AC,$06,$DA,$20,$51,$DA,$20,$4A,$4F,$4F,$4F,$0C,$C9,$4F,$06,$4F,$4E,$4E,$C9,$1E,$53,$D1,$07,$AD,$D0,$BD,$AC,$06,$4C,$58,$CE,$08,$07,$AD,$48,$54,$CE,$08,$0E,$AD,$4A,$56,$CE,$08,$14,$AD,$4C,$58,$4C,$58,$4C,$58,$4C,$58,$53,$53,$C9,$53,$C9,$03,$53,$C9,$53,$53,$53,$C9,$D2,$CD,$F0,$92,$C4,$3E,$03,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$CE,$03,$34,$AD,$41,$41,$C9,$41,$47,$47,$C9,$47,$49,$49,$C9,$49,$41,$C9,$41,$41,$06,$41,$03,$42,$42,$42,$C9,$42,$42,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$CE,$03,$5B,$AD,$06,$41,$C9,$C9,$41,$03,$48,$48,$49,$49,$46,$46,$47,$48,$CF,$02,$5B,$AD,$03,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$CE,$07,$83,$AD,$41,$41,$C9,$41,$47,$47,$C9,$47,$49,$49,$C9,$49,$41,$C9,$41,$41,$CF,$02,$83,$AD,$03,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$CE,$03,$AE,$AD,$41,$41,$C9,$41,$47,$47,$C9,$47,$49,$49,$C9,$49,$41,$C9,$41,$41,$CF,$02,$AE,$AD,$06,$41,$41,$41,$C9,$C9,$41,$C9,$41,$41,$41,$C9,$41,$C9,$03,$48,$48,$49,$49,$46,$46,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$42,$C9,$42,$42,$06,$41,$03,$42,$42,$CE,$07,$EE,$AD,$41,$41,$C9,$41,$47,$47,$C9,$47,$49,$49,$C9,$49,$41,$C9,$41,$41,$D0,$34,$AD

; AE17
.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

.export _loc_00_AE80
_loc_00_AE80:
	JMP _loc_00_BB13
.export _loc_00_AE83
_loc_00_AE83:
	JMP _loc_00_BF06

.export _loc_00_AE86
_loc_00_AE86:
	LDA $0605
	ASL
	BCC bra_00_AEA4
	ASL
	BCS bra_00_AEE3
	ASL
	BCS bra_00_AEAD
	ASL
	BCS bra_00_AF06
	DEC $060C
	BNE bra_00_AEAC
	AND #$C0
	BEQ bra_00_AEA1
	JMP _loc_00_AFE9
bra_00_AEA1:
	JMP _loc_00_AF61
bra_00_AEA4:
	LDA $0604
	BPL bra_00_AEAC
	JMP _loc_00_AF3A
bra_00_AEAC:
	RTS
bra_00_AEAD:
	INC $060C
	LDA одноразовые_кнопки
	AND #(КНОПКА_СЕЛЕКТ + КНОПКА_СТАРТ + КНОПКА_А + КНОПКА_Б)
	BNE bra_00_AEC1
	LDY #$DD
	LDA $060C
	AND #$1C
	BNE bra_00_AED0
	BEQ bra_00_AECE
bra_00_AEC1:
	LDA $0605
	AND #$9F
	STA $0605
	LDA #$01
	STA $060C
bra_00_AECE:
	LDY #$FF
bra_00_AED0:
	STY буфер_атрибутов
	LDA #$01
	STA счетчик_буфера_атрибутов
	LDA #$90
	STA байт_2006_lo_атрибуты
	LDA #$23
	STA байт_2006_hi_атрибуты
	RTS
bra_00_AEE3:
	LDA $58
	BEQ bra_00_AEF8
	CMP #$07
	BCS bra_00_AEF8
	LDA удержанные_кнопки
	ORA удержанные_кнопки + 1
	AND #(КНОПКА_СЕЛЕКТ + КНОПКА_СТАРТ + КНОПКА_А + КНОПКА_Б)
	BEQ bra_00_AEF8
	LDA #$01
	STA $060D
bra_00_AEF8:
	DEC $060D
	BNE bra_00_AF05
	LDA $0605
	AND #$9F
	STA $0605
bra_00_AF05:
	RTS
bra_00_AF06:
	LDA $0608
	CLC
	ADC #$40
	STA $0608
	LDA $0607
	ADC #$00
	STA $0607
	LDA $0608
	BMI bra_00_AF1F
	JMP _loc_00_B0B8
bra_00_AF1F:
	LDA table_00_B118
	STA $0608
	STA $060F
	LDA table_00_B118 + 1
	STA $0607
	STA $0610
	LDA $0605
	AND #$EF
	STA $0605
	RTS
_loc_00_AF3A:
	LDA #$00
	STA $0604
	LDA #$FF
	STA $0609
	STA $060A
	LDA #$05
	STA $060E
	LDA $58
	BEQ bra_00_AF59
	CMP #$07
	BCS bra_00_AF59
	LDA #$02
	STA $060E
bra_00_AF59:
	LDA $0605
	ORA #$80
	STA $0605
_loc_00_AF61:
	LDA $060E
	STA $060C
	LDA $58
	BEQ bra_00_AF7C
	CMP #$07
	BCS bra_00_AF7C
	LDA удержанные_кнопки
	ORA удержанные_кнопки + 1
	AND #(КНОПКА_СЕЛЕКТ + КНОПКА_СТАРТ + КНОПКА_А + КНОПКА_Б)
	BEQ bra_00_AF7C
	LDA #$01
	STA $060C
bra_00_AF7C:
	LDA $0606
	ASL
	TAY
	LDA table_00_B11A,Y
	STA $32
	LDA table_00_B11A + 1,Y
	STA $33
	LDA #$00
	STA $28
	LDA #$FF
	STA $29
	INC $0609
	BNE bra_00_AF9B
	INC $060A
bra_00_AF9B:
	LDA $33
	CLC
	ADC $060A
	STA $33
	LDY $0609
_loc_00_AFA6:
	LDA ($32),Y
	BNE bra_00_AFB4
	LDY #$01
	STY $060C
	LDA #$FF
	JMP _loc_00_AFD6
bra_00_AFB4:
	BPL bra_00_AFBD
	CMP #$F0
	BCC bra_00_AFD6
	JMP _loc_00_B059
bra_00_AFBD:
	CMP #$20
	BCC bra_00_AFD6
	CMP #$50
	BCC bra_00_AFCE
	CLC
	ADC #$50
	STA $2A
	LDA #$DB
	BNE bra_00_AFDA
bra_00_AFCE:
	ORA #$80
	STA $2A
	LDA #$DA
	BNE bra_00_AFDA
_loc_00_AFD6:
bra_00_AFD6:
	STA $2A
	LDA #$FF
bra_00_AFDA:
	STA $29
	LDA $2A
	STA буфер_графики
	LDA $29
	STA буфер_атрибутов
	JMP _loc_00_B023
_loc_00_AFE9:
	LDA $060E
	STA $060C
	LDA $58
	BEQ bra_00_B004
	CMP #$07
	BCS bra_00_B004
	LDA удержанные_кнопки
	ORA удержанные_кнопки + 1
	AND #(КНОПКА_СЕЛЕКТ + КНОПКА_СТАРТ + КНОПКА_А + КНОПКА_Б)
	BEQ bra_00_B004
	LDA #$01
	STA $060C
bra_00_B004:
	LDA $0605
	LSR
	LSR
	AND #$02
	TAY
	LDA table_00_B01F,Y
	STA $32
	LDA table_00_B01F + 1,Y
	STA $33
	INC $060B
	LDY $060B
	JMP _loc_00_AFA6

table_00_B01F:
.byte $11,$06,$17,$06

_loc_00_B023:
	LDA #$01 
	STA счетчик_буфера_атрибутов 
	STA счетчик_буфера_графики
	LDA $0608
	STA байт_2006_lo_атрибуты
	CLC
	ADC #$20
	STA байт_2006_lo_графика
	PHP
	LDA $0607
	STA байт_2006_hi_атрибуты
	PLP
	ADC #$00
	STA байт_2006_hi_графика
	INC $0608
	BNE bra_00_B04C
	INC $0607
bra_00_B04C:
	LDA буфер_графики
	CMP #$FF
	BEQ bra_00_B058
	LDA #$35
	JSR _b07_C2E4
bra_00_B058:
	RTS
_loc_00_B059:
	SEC
	SBC #$F0
	JSR _b07_EC8F

table_00_B05F:		; байты после JSR
.word table_00_B05F_B073
.word table_00_B05F_B07E
.word table_00_B05F_B089
.word table_00_B05F_B092
.word table_00_B05F_B0A4
.word table_00_B05F_B0E9
.word table_00_B05F_B0F6
.word table_00_B05F_B0F7
.word table_00_B05F_B10F
.word table_00_B05F_B0A0

table_00_B05F_B073:
	LDA #$84
	STA $0605
	LDA #$FF
	STA $060B
	RTS

table_00_B05F_B07E:
	LDA #$88
	STA $0605
	LDA #$FF
	STA $060B
	RTS

table_00_B05F_B089:
	LDA $0605
	ORA #$20
	STA $0605
	RTS

table_00_B05F_B092:
	LDA #$0F
bra_00_B094:
	STA $060D
	LDA $0605
	ORA #$40
	STA $0605
	RTS

table_00_B05F_B0A0:
	LDA #$4A
	BNE bra_00_B094

table_00_B05F_B0A4:
	LDA $0605
	ORA #$10
	STA $0605
	LDA table_00_B118
	STA $0608
	LDA table_00_B118 + 1
	STA $0607
_loc_00_B0B8:
	LDX #$1B
	STX счетчик_буфера_атрибутов
	STX счетчик_буфера_графики
	LDA #$FF
bra_00_B0C2:
	STA буфер_атрибутов,X
	STA буфер_графики,X
	DEX
	BPL bra_00_B0C2
	LDA $0608
	STA байт_2006_lo_атрибуты
	LDA $0607
	STA байт_2006_hi_атрибуты
	LDA $0608
	CLC
	ADC #$20
	STA байт_2006_lo_графика
	LDA $0607
	ADC #$00
	STA байт_2006_hi_графика
	RTS

table_00_B05F_B0E9:
	LDA #$00
	STA $0605
	LDA $28
	BEQ bra_00_B0F5
	JMP _loc_00_B023
bra_00_B0F5:
	RTS

table_00_B05F_B0F6:
	RTS

table_00_B05F_B0F7:
	LDA $060F
	CLC
	ADC #$40
	STA $0608
	STA $060F
	LDA $0610
	ADC #$00
	STA $0607
	STA $0610
	RTS

table_00_B05F_B10F:
	LDA $0605
	AND #$F3
	STA $0605
	RTS

table_00_B118:
.byte $02,$23

table_00_B11A:
.word table_00_B11A_B18C
.word table_00_B11A_B18E
.word table_00_B11A_B1C2
.word table_00_B11A_B1F3
.word table_00_B11A_B222
.word table_00_B11A_B253
.word table_00_B11A_B285
.word table_00_B11A_B2BB
.word table_00_B11A_B2EE
.word table_00_B11A_B31F
.word table_00_B11A_B354
.word table_00_B11A_B387
.word table_00_B11A_B3BA
.word table_00_B11A_B3EA
.word table_00_B11A_B3FF
.word table_00_B11A_B417
.word table_00_B11A_B42E
.word table_00_B11A_B45B
.word table_00_B11A_B484
.word table_00_B11A_B49F
.word table_00_B11A_B4CD
.word table_00_B11A_B4FC
.word table_00_B11A_B528
.word table_00_B11A_B558
.word table_00_B11A_B570
.word table_00_B11A_B588
.word table_00_B11A_B59B
.word table_00_B11A_B5C4
.word table_00_B11A_B5EA
.word table_00_B11A_B5FF
.word table_00_B11A_B612
.word table_00_B11A_B61D
.word table_00_B11A_B62F
.word table_00_B11A_B63E
.word table_00_B11A_B656
.word table_00_B11A_B667
.word table_00_B11A_B67F
.word table_00_B11A_B694
.word table_00_B11A_B6A8
.word table_00_B11A_B6BB
.word table_00_B11A_B6C5
.word table_00_B11A_B6FF
.word table_00_B11A_B739
.word table_00_B11A_B772
.word table_00_B11A_B7A9
.word table_00_B11A_B7DF
.word table_00_B11A_B812
.word table_00_B11A_B846
.word table_00_B11A_B876
.word table_00_B11A_B8A7
.word table_00_B11A_B8DE
.word table_00_B11A_B913
.word table_00_B11A_B945
.word table_00_B11A_B97C
.word table_00_B11A_B9B1
.word table_00_B11A_BA26
.word table_00_B11A_BA9C

table_00_B11A_B18C:
.byte $F4,$F5

table_00_B11A_B18E:
.byte $F4,$EA,$A9,$B7,$A6,$EB,$00,$A0,$8F,$98,$00,$00,$00,$AF,$A3,$A7,$A9,$E3,$C3,$31,$B2,$B1,$27,$C9,$F7,$AE,$A8,$EC,$CD,$AD,$D3,$A9,$00,$00,$00,$00,$00,$00,$A8,$C8,$A3,$EC,$A3,$A3,$A7,$2A,$CF,$B6,$C5,$B3,$F2,$F5

table_00_B11A_B1C2:
.byte $F4,$EA,$C7,$C9,$B3,$B9,$EB,$8F,$A1,$97,$00,$00,$00,$AF,$A3,$A7,$A9,$E3,$C7,$A9,$CD,$A7,$C8,$B6,$A3,$F7,$AE,$A8,$EC,$A4,$C3,$3F,$AD,$00,$00,$00,$00,$00,$00,$A8,$C8,$A3,$EC,$A2,$A3,$35,$CA,$F2,$F5

table_00_B11A_B1F3:
.byte $F4,$EA,$AC,$2D,$EB,$00,$00,$8F,$A1,$99,$00,$00,$00,$AF,$A3,$A7,$A9,$E3,$2D,$3D,$CF,$A7,$D0,$B4,$F7,$AE,$A8,$EC,$A2,$B7,$C3,$00,$00,$00,$00,$00,$00,$00,$A8,$C8,$A3,$EC,$A7,$CF,$2D,$F2,$F5

table_00_B11A_B222:
.byte $F4,$EA,$BF,$C9,$3B,$B1,$EB,$8D,$8F,$91,$00,$00,$00,$AF,$A3,$A7,$A9,$E3,$A8,$D3,$A4,$C9,$D3,$A9,$B4,$A8,$F7,$AE,$A8,$EC,$C1,$AC,$AB,$00,$00,$00,$00,$00,$00,$00,$A8,$C8,$A3,$EC,$AA,$CF,$A7,$F2,$F5

table_00_B11A_B253:
.byte $F4,$EA,$A3,$CD,$A7,$3E,$EB,$8D,$8F,$92,$00,$00,$00,$AF,$A3,$A7,$A9,$E3,$2D,$3D,$CF,$A7,$D0,$B4,$F7,$AE,$A8,$EC,$35,$A4,$3D,$B3,$00,$00,$00,$00,$00,$00,$A8,$C8,$A3,$EC,$AE,$AA,$3E,$B6,$C5,$B3,$F2,$F5

table_00_B11A_B285:
.byte $F4,$EA,$2A,$CF,$A5,$A3,$EB,$9E,$9F,$90,$00,$00,$00,$AF,$A3,$A7,$A9,$E3,$A8,$D3,$A4,$C9,$D3,$A9,$B4,$A8,$F7,$AE,$A8,$EC,$B3,$AA,$C4,$BA,$00,$00,$00,$00,$00,$00,$A8,$C8,$A3,$EC,$A3,$A3,$A7,$2A,$CF,$B6,$C5,$B3,$F2,$F5

table_00_B11A_B2BB:
.byte $F4,$EA,$A4,$27,$2D,$CF,$EB,$8D,$8F,$93,$00,$00,$00,$AF,$A3,$A7,$A9,$E3,$C7,$A9,$CD,$A7,$C8,$B6,$A3,$C5,$B3,$F7,$AE,$A8,$EC,$AC,$A7,$B6,$BA,$BC,$C4,$BA,$00,$00,$00,$A8,$C8,$A3,$EC,$A4,$C3,$3F,$AD,$F2,$F5

table_00_B11A_B2EE:
.byte $F4,$EA,$A6,$B7,$B1,$AA,$EB,$A0,$8F,$94,$00,$00,$00,$AF,$A3,$A7,$A9,$E3,$2D,$3D,$CF,$A7,$D0,$B4,$F7,$AE,$A8,$EC,$A5,$D0,$B2,$00,$00,$00,$00,$00,$00,$00,$A8,$C8,$A3,$EC,$B8,$A3,$29,$CA,$C1,$F2,$F5

table_00_B11A_B31F:
.byte $F4,$EA,$A9,$C4,$CF,$EB,$00,$8D,$8F,$95,$00,$00,$00,$AF,$A3,$A7,$A9,$E3,$A8,$D3,$A4,$C9,$D3,$A9,$B4,$A8,$F7,$AE,$A8,$EC,$A2,$B7,$C3,$E9,$A9,$C0,$00,$00,$00,$00,$A8,$C8,$A3,$EC,$B6,$C0,$29,$AC,$A3,$C4,$BA,$F2,$F5

table_00_B11A_B354:
.byte $F4,$EA,$A7,$A3,$2E,$A8,$EB,$A0,$8F,$96,$00,$00,$00,$AF,$A3,$A7,$A9,$E3,$A8,$D3,$A4,$C9,$D3,$A9,$B4,$A8,$F7,$AE,$A8,$EC,$AC,$A7,$B6,$00,$00,$00,$00,$00,$00,$00,$A8,$C8,$A3,$EC,$A6,$CF,$B6,$BA,$AB,$F2,$F5

table_00_B11A_B387:
.byte $F4,$EA,$B3,$B9,$CE,$EB,$00,$8F,$A1,$9A,$00,$00,$00,$AF,$A3,$A7,$A9,$E3,$C3,$31,$B2,$B1,$27,$C9,$F7,$AE,$A8,$EC,$A2,$A3,$35,$CA,$00,$00,$00,$00,$00,$00,$A8,$C8,$A3,$EC,$A2,$B7,$C3,$E2,$A6,$B1,$A9,$F2,$F5

table_00_B11A_B3BA:
.byte $F4,$EA,$A7,$CA,$CC,$AE,$EB,$9E,$9F,$9B,$00,$00,$00,$AF,$A3,$A7,$A9,$E3,$C3,$31,$B2,$B1,$27,$C9,$F7,$AE,$A8,$EC,$B4,$D5,$34,$D5,$E2,$3E,$A2,$00,$00,$00,$A8,$C8,$A3,$EC,$CD,$AD,$D3,$A9,$F2,$F5

table_00_B11A_B3EA:
.byte $F4,$F0,$00,$EA,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E8,$F2,$F5

table_00_B11A_B3FF:
.byte $F4,$F0,$00,$EA,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$DF,$DF,$F2,$F5

table_00_B11A_B417:
.byte $F4,$F0,$00,$EA,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$DF,$DE,$F2,$F5

table_00_B11A_B42E:
.byte $F4,$A9,$B7,$A6,$EA,$2F,$D0,$B1,$A3,$00,$C6,$A4,$AD,$D3,$A4,$31,$DF,$DF,$F7,$00,$00,$00,$A8,$A2,$A3,$A3,$CB,$B4,$E9,$A3,$B1,$31,$A8,$31,$2F,$DF,$00,$C1,$CF,$B6,$DF,$DF,$F2,$F4,$F5

table_00_B11A_B45B:
.byte $F4,$C7,$C9,$B3,$B9,$EA,$BA,$C9,$BA,$C9,$31,$D0,$2F,$D9,$D5,$DF,$DF,$00,$3F,$D9,$A9,$B7,$E9,$F7,$00,$00,$00,$00,$C0,$A7,$AF,$B4,$B2,$D3,$D9,$31,$A3,$DF,$F2,$F4,$F5

table_00_B11A_B484:
.byte $F4,$AC,$2D,$EA,$3B,$C9,$3B,$C9,$00,$2F,$CF,$A7,$A3,$31,$2F,$DF,$00,$3E,$D5,$3C,$D5,$D9,$DF,$DF,$F2,$F4,$F5

table_00_B11A_B49F:
.byte $F4,$BF,$C9,$3B,$B1,$EA,$C1,$AC,$AB,$B2,$D1,$D9,$CF,$DF,$00,$C6,$A4,$AD,$D3,$A4,$A7,$D0,$6D,$BA,$F7,$00,$00,$00,$00,$A6,$C1,$C5,$2A,$00,$C0,$D0,$B4,$B4,$B9,$D9,$D0,$DF,$DF,$F2,$F4,$F5

table_00_B11A_B4CD:
.byte $F4,$A3,$CD,$A7,$3E,$EA,$27,$BB,$A2,$BB,$A2,$D0,$DF,$00,$27,$BB,$A2,$BB,$A2,$BB,$A2,$D0,$DF,$DF,$F7,$00,$00,$00,$00,$AD,$AD,$B6,$3E,$27,$E9,$A9,$A3,$B4,$D7,$2E,$C8,$D9,$DF,$DF,$F2,$F4,$F5

table_00_B11A_B4FC:
.byte $F4,$2A,$CF,$A5,$A3,$EA,$31,$D4,$D9,$D0,$DF,$00,$AC,$A3,$AB,$A4,$31,$2F,$D9,$D0,$DF,$F7,$00,$00,$00,$00,$A6,$E2,$A6,$CB,$B7,$E9,$C0,$A7,$AF,$B5,$AA,$D9,$D0,$DF,$DF,$F2,$F4,$F5

table_00_B11A_B528:
.byte $F4,$A4,$27,$2D,$CF,$EA,$A4,$BC,$D1,$E2,$BC,$D1,$E2,$BC,$D1,$DF,$00,$A4,$BC,$D1,$DF,$DF,$F7,$00,$00,$00,$00,$A4,$E2,$A4,$E2,$BC,$E2,$BC,$E2,$BC,$D0,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E8,$F2,$F4,$F5

table_00_B11A_B558:
.byte $F4,$A6,$B7,$B1,$AA,$EA,$C7,$D0,$AD,$D1,$D9,$DF,$00,$C0,$A7,$AF,$B5,$A8,$D0,$DF,$DF,$F2,$F4,$F5

table_00_B11A_B570:
.byte $F4,$A9,$C4,$CF,$EA,$A3,$AA,$A3,$AA,$DF,$00,$2B,$D9,$D0,$DF,$2B,$D9,$A4,$D0,$DF,$DF,$F2,$F4,$F5

table_00_B11A_B588:
.byte $F4,$A7,$A3,$2E,$A8,$EA,$28,$D1,$BB,$D0,$BB,$D0,$BB,$DF,$D0,$DF,$F2,$F4,$F5

table_00_B11A_B59B:
.byte $F4,$B3,$B9,$A6,$EA,$C8,$A9,$AD,$D3,$A4,$31,$2F,$DF,$00,$3B,$B6,$B6,$DF,$DF,$F7,$00,$00,$00,$B3,$28,$C4,$E9,$C4,$C8,$A3,$31,$2F,$DF,$00,$CD,$B7,$DF,$DF,$F2,$F4,$F5

table_00_B11A_B5C4:
.byte $F4,$A7,$CA,$CC,$AE,$EA,$A3,$A5,$D9,$A3,$DF,$00,$B5,$B4,$D9,$C4,$E9,$AC,$A3,$AB,$D9,$A4,$B6,$F7,$00,$00,$00,$00,$A8,$3D,$CF,$34,$D9,$AE,$E8,$F2,$F4,$F5

table_00_B11A_B5EA:
.byte $F4,$F0,$00,$EA,$A6,$C0,$A5,$D0,$B4,$E9,$A3,$A3,$C5,$B3,$31,$B6,$DF,$DE,$F2,$F4,$F5

table_00_B11A_B5FF:
.byte $F4,$F0,$00,$EA,$BD,$C2,$E9,$BD,$C2,$E9,$B6,$CA,$BF,$35,$B9,$E8,$F2,$F4,$F5

table_00_B11A_B612:
.byte $F4,$F0,$00,$EA,$A5,$D0,$00,$DE,$F2,$F4,$F5

table_00_B11A_B61D:
.byte $F4,$F0,$00,$EA,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E8,$F2,$F4,$F5

table_00_B11A_B62F:
.byte $F4,$F0,$00,$EA,$A5,$A5,$D9,$D9,$D9,$D0,$DF,$DE,$F2,$F4,$F5

table_00_B11A_B63E:
.byte $F4,$F0,$00,$EA,$2A,$A5,$D0,$E8,$C5,$31,$C7,$DF,$00,$B0,$CF,$B6,$BA,$E2,$E2,$E2,$E8,$F2,$F4,$F5

table_00_B11A_B656:
.byte $F4,$F0,$00,$EA,$A6,$E2,$A6,$AB,$CA,$30,$D9,$D0,$DF,$DF,$F2,$F4,$F5

table_00_B11A_B667:
.byte $F4,$F0,$00,$EA,$31,$D4,$D9,$D0,$DF,$00,$A4,$E2,$A4,$CA,$AC,$A3,$CF,$31,$C7,$DF,$DF,$F2,$F4,$F5

table_00_B11A_B67F:
.byte $F4,$F0,$00,$EA,$F1,$00,$DE,$00,$B5,$C9,$A2,$A5,$2E,$E9,$35,$A4,$C4,$E8,$F2,$F4,$F5

table_00_B11A_B694:
.byte $F4,$F0,$00,$EA,$F1,$00,$31,$B9,$E8,$00,$A2,$C9,$27,$B5,$A4,$00,$E3,$F2,$F4,$F5

table_00_B11A_B6A8:
.byte $F4,$F0,$00,$EA,$F1,$00,$A7,$C7,$DF,$DE,$00,$2A,$D7,$D9,$DF,$DF,$F2,$F4,$F5

table_00_B11A_B6BB:
.byte $F4,$F0,$00,$EA,$E2,$E2,$E2,$E2,$F2,$F5

table_00_B11A_B6C5:
.byte $F4,$C1,$AC,$AB,$EA,$C4,$AD,$C4,$AD,$E9,$C1,$AC,$AB,$00,$C7,$D0,$E3,$00,$A4,$D0,$CB,$AD,$A3,$D9,$B6,$A2,$E3,$F7,$00,$00,$34,$CF,$CD,$AD,$B4,$A9,$CB,$CA,$B6,$CF,$B4,$E8,$A2,$E2,$C9,$E2,$27,$E2,$B5,$E2,$E3,$E2,$E3,$E2,$E3,$F2,$F4,$F5

table_00_B11A_B6FF:
.byte $F4,$C1,$AC,$AB,$EA,$C1,$AC,$AB,$00,$C1,$CF,$B6,$BA,$AB,$B5,$00,$A3,$B3,$C4,$A6,$A4,$A5,$CF,$AD,$B4,$A3,$CA,$F7,$00,$00,$BA,$C7,$E8,$31,$A7,$C8,$E9,$A7,$B6,$C8,$2E,$C6,$A4,$AD,$D3,$A4,$AD,$B4,$B9,$E8,$2D,$D1,$B9,$D7,$E3,$F2,$F4,$F5

table_00_B11A_B739:
.byte $F4,$C1,$AC,$AB,$EA,$BB,$D9,$A3,$E9,$C1,$AC,$AB,$00,$34,$D9,$AE,$E8,$B1,$31,$A3,$C0,$E9,$CA,$AE,$00,$B7,$F7,$00,$00,$AD,$B4,$A3,$C0,$D4,$AE,$E8,$6C,$D0,$BA,$A2,$B5,$B7,$E9,$C3,$D0,$AF,$D9,$2D,$CE,$A3,$CB,$B4,$B9,$E3,$F2,$F4,$F5

table_00_B11A_B772:
.byte $F4,$C1,$AC,$AB,$EA,$E2,$E2,$E2,$C4,$AD,$C4,$AD,$00,$C1,$AC,$AB,$00,$34,$AE,$E8,$A3,$C0,$E9,$B7,$D0,$6F,$CF,$BB,$F7,$00,$00,$C0,$C7,$B6,$A7,$B6,$BA,$D9,$E8,$B9,$C2,$A3,$A7,$C8,$E9,$C0,$B1,$AB,$CF,$35,$B9,$E3,$F2,$F4,$F5

table_00_B11A_B7A9:
.byte $F4,$B1,$A7,$AD,$EA,$E3,$AE,$6E,$E2,$AD,$D2,$D9,$2E,$E3,$BB,$E9,$A2,$C3,$BA,$BD,$CA,$00,$AD,$A2,$A3,$B7,$F7,$00,$00,$AB,$A4,$A7,$CE,$BB,$D0,$A8,$AE,$CA,$00,$AE,$6E,$AD,$D1,$CA,$E2,$AD,$D2,$D9,$2E,$34,$AE,$E8,$F2,$F5

table_00_B11A_B7DF:
.byte $F4,$B1,$A7,$AD,$EA,$E3,$AE,$6E,$E2,$AC,$6F,$D9,$B1,$E3,$BB,$E9,$AF,$CF,$AD,$D2,$BA,$A7,$C8,$31,$CE,$F7,$00,$00,$BF,$2B,$AD,$B4,$A9,$CB,$CA,$00,$AE,$6E,$AD,$D1,$CA,$E2,$AC,$6F,$D9,$B1,$34,$AE,$E8,$F2,$F5

table_00_B11A_B812:
.byte $F4,$B1,$A7,$AD,$EA,$E3,$AE,$6E,$E2,$35,$C9,$CF,$A9,$E3,$BB,$E9,$AF,$CF,$AD,$D2,$BA,$6B,$CD,$D9,$CE,$F7,$00,$00,$A2,$D0,$6D,$AD,$B4,$A9,$CB,$CA,$00,$AE,$6E,$AD,$D1,$CA,$E2,$35,$C9,$CF,$A9,$34,$AE,$E8,$F2,$F5

table_00_B11A_B846:
.byte $F4,$B1,$A7,$AD,$EA,$E3,$2B,$C2,$E2,$B6,$27,$29,$B3,$E3,$BB,$E9,$A7,$CF,$34,$CF,$3F,$A4,$AD,$B7,$F7,$00,$00,$C5,$A9,$31,$B3,$00,$B1,$31,$BA,$00,$2B,$C2,$E2,$B6,$27,$29,$B3,$34,$AE,$E8,$F2,$F5

table_00_B11A_B876:
.byte $F4,$B1,$A7,$AD,$EA,$E3,$A6,$B7,$D2,$A4,$B1,$A6,$CA,$E3,$BB,$E9,$AF,$CF,$AD,$D2,$BA,$B3,$A7,$CB,$CE,$F7,$00,$00,$A3,$C5,$AD,$B4,$A9,$CB,$CA,$00,$C0,$BF,$A4,$BA,$B1,$A6,$CA,$DE,$34,$AE,$E8,$F2,$F5

table_00_B11A_B8A7:
.byte $F4,$B1,$A7,$AD,$EA,$B0,$BA,$BF,$A7,$BA,$E3,$A2,$A3,$B4,$C2,$E3,$BB,$E9,$C3,$CF,$3B,$D9,$BA,$BC,$B5,$B1,$B2,$F7,$00,$00,$B7,$E9,$A2,$2A,$B4,$A9,$31,$AC,$A3,$E8,$A8,$D0,$B5,$00,$A6,$C5,$A9,$B7,$B1,$B2,$C0,$AE,$E8,$F2,$F5

table_00_B11A_B8DE:
.byte $F4,$B1,$A7,$AD,$EA,$C1,$B6,$AC,$CF,$00,$B0,$CB,$2D,$D1,$00,$27,$CF,$3B,$D0,$B4,$A9,$31,$AC,$A3,$E8,$F7,$00,$00,$3F,$A9,$C4,$A7,$2A,$B6,$27,$C8,$E9,$A6,$A4,$A5,$CF,$AD,$C0,$AE,$BA,$34,$E2,$E2,$E2,$DF,$F2,$F4,$F5

table_00_B11A_B913:
.byte $F4,$E7,$EA,$B4,$A9,$BA,$AE,$2D,$D1,$6B,$CF,$E2,$A7,$D0,$6D,$00,$2D,$D3,$A4,$BF,$D9,$A4,$E3,$F7,$00,$A2,$B5,$F0,$AD,$D3,$A4,$00,$B5,$00,$F1,$6F,$A3,$CF,$B5,$00,$BC,$B3,$C7,$A4,$34,$AE,$E8,$F2,$F4,$F5

table_00_B11A_B945:
.byte $F4,$E7,$EA,$BB,$D9,$A3,$00,$C1,$A8,$B2,$D1,$CF,$34,$D9,$AE,$E3,$00,$A8,$D1,$6C,$E2,$A8,$D1,$6C,$E3,$F7,$00,$00,$A3,$C0,$B9,$D7,$E7,$E7,$E7,$E7,$34,$E7,$E7,$E7,$E7,$AD,$B4,$CA,$BA,$C7,$E3,$00,$A4,$BD,$D0,$E3,$F2,$F4,$F5

table_00_B11A_B97C:
.byte $F4,$E7,$EA,$E2,$E2,$E2,$E2,$A6,$B7,$A3,$AC,$CF,$E8,$AB,$AB,$31,$AA,$BA,$BB,$B6,$AD,$31,$AA,$35,$E9,$F7,$00,$00,$E7,$E7,$E7,$E7,$BB,$E7,$E7,$E7,$E7,$B7,$E7,$E7,$E7,$E7,$AD,$B4,$CA,$C8,$AD,$A3,$C7,$E8,$F2,$F4,$F5

table_00_B11A_B9B1:
.byte $F4,$F3,$C5,$D0,$B1,$D9,$DF,$E3,$F3,$00,$B5,$A4,$B5,$A4,$00,$B4,$A9,$BA,$AE,$2D,$D1,$6B,$CF,$E2,$A7,$D0,$6D,$34,$F7,$C6,$A4,$AD,$D3,$A4,$AD,$B1,$CD,$B9,$F3,$E3,$F3,$E3,$F3,$E3,$F3,$00,$C1,$AC,$AB,$A7,$CF,$2A,$A8,$DF,$E3,$F9,$F7,$F4,$C1,$CF,$B6,$D0,$DF,$F3,$00,$C7,$A9,$C5,$D0,$B4,$A9,$CB,$B1,$A6,$CB,$A3,$B7,$00,$C1,$AC,$AB,$A7,$C8,$F7,$A2,$A3,$BA,$00,$AD,$CA,$AD,$C7,$D0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$F3,$E3,$B2,$D2,$D0,$E3,$F9,$F9,$F9,$F9,$F5

table_00_B11A_BA26:
.byte $F4,$F3,$A2,$D0,$F3,$00,$C4,$AD,$C4,$AD,$E9,$C1,$AC,$AB,$34,$AE,$E8,$F3,$00,$B4,$A9,$BA,$AE,$2D,$D1,$6B,$CF,$E2,$A7,$D0,$6D,$F7,$2C,$CF,$B9,$CF,$00,$31,$D0,$B1,$B9,$E8,$F3,$F3,$34,$C4,$E9,$AF,$A3,$A3,$D0,$6B,$A3,$C5,$D0,$B1,$2D,$D1,$B6,$A3,$E8,$F9,$F7,$F4,$C1,$CF,$B6,$00,$B5,$D0,$B4,$C4,$00,$A7,$D0,$AB,$C7,$A7,$D0,$B1,$CD,$E3,$F3,$F3,$F7,$C0,$B1,$E9,$B2,$D1,$CF,$AE,$BB,$A2,$CA,$CD,$C7,$DF,$F3,$00,$B0,$BA,$B5,$A8,$BB,$00,$27,$CF,$3B,$D0,$B4,$B9,$E3,$F9,$F9,$F9,$F9,$F5

table_00_B11A_BA9C:
.byte $F4,$F3,$C4,$AD,$C4,$AD,$F3,$00,$C1,$AC,$AB,$C7,$E8,$F3,$00,$C0,$AA,$B2,$D1,$D0,$B1,$CF,$31,$D0,$B4,$DF,$DE,$F3,$F3,$F7,$B6,$D9,$CF,$31,$F3,$00,$27,$D0,$A7,$C9,$DF,$DF,$F3,$00,$A6,$A4,$A5,$CF,$AD,$B4,$B1,$BA,$B7,$B6,$D9,$E3,$F9,$F7,$F4,$AF,$A7,$A3,$BA,$A7,$3E,$BB,$00,$A2,$B3,$A3,$D0,$B4,$AB,$B5,$B9,$E8,$F3,$34,$C4,$E9,$AB,$CF,$B6,$AB,$B5,$34,$F7,$A9,$2D,$AA,$2E,$F3,$00,$B3,$28,$AB,$B0,$BB,$00,$C6,$A4,$AD,$D3,$A4,$AD,$B4,$C7,$B9,$F3,$E3,$F3,$E3,$F3,$E3,$F9,$F9,$F9,$F9,$F5

_loc_00_BB13:
	LDA #$FF
	STA номер_управляемого
	STA номер_управляемого + 1
	STA номер_управляемого + 2
	STA номер_управляемого + 3
	LDX #$00
	LDY #$00
	LDA опция_режим_сложность
	AND #$F0
	BEQ bra_00_BB35
_loc_00_BB2B:
	BMI bra_00_BB35
	INY
	INY
	INY
	INY
	ASL
	JMP _loc_00_BB2B
bra_00_BB35:
	LDA table_00_BDB9,Y
	STA номер_управляемого,X
	INY
	INX
	CPX $5D
	BCC bra_00_BB35
	LDY #$08
	STY банк_спрайтов
	INY
	STY банк_спрайтов + 3
	LDA номер_команды + 1
	AND #$0F
	TAY
	LDA table_00_BEF6,Y
	ORA номер_команды + 1
	STA номер_команды + 1
	JSR _loc_00_BFF8
	JSR _loc_00_BFF3
	LDA флаг_владения_мячом_команды
	ORA флаг_владения_мячом_команды + 1
	AND #$01
	BNE bra_00_BB6C
	INC флаг_владения_мячом_команды + 1
bra_00_BB6C:
	LDA $055B
	ASL
	ORA флаг_владения_мячом_команды
	ASL
	TAY
	LDA table_00_BDE8,Y
	STA $2C
	LDA table_00_BDE8 + 1,Y
	STA $2D
	LDA $055B
	ASL
	ORA флаг_владения_мячом_команды + 1
	ASL
	TAY
	LDA table_00_BDE8,Y
	STA $2E
	LDA table_00_BDE8 + 1,Y
	STA $2F
	LDA флаг_владения_мячом_команды
	STA $2B
	LDA #$00
	STA сила_мяча
	STA таймер_действия_мяча
	STA таймер_электрического_мяча
	STA таймер_мокрого_мяча
	LDA $055B
	BEQ bra_00_BBB4
	LDA #$20
	STA режим_игры_на_поле
	LDA #$01
	STA тип_экрана
	BNE bra_00_BBBA
bra_00_BBB4:
	LDA #$01
	STA тип_экрана
	STA режим_игры_на_поле
bra_00_BBBA:
	LDY #$00
	LDX #$0E
bra_00_BBBE:
	LDA table_00_BDE3,Y
	STA номер_движения,X
	LDA #$03
	STA a: $61,X
	INX
	INY
	CPY $5D
	BCC bra_00_BBBE
	BEQ bra_00_BBBE
_loc_00_BBD1:
	CPX #$04
	BCS bra_00_BBDE
	LDA #$00
	STA номер_движения,X
	INX
	JMP _loc_00_BBD1
bra_00_BBDE:
	LDA опция_режим_сложность
	AND #$20
	BNE bra_00_BBE7
	JMP _loc_00_BCAA
bra_00_BBE7:
	LDA счетчик_смен
	CMP #$0A
	BCC bra_00_BC2C
	AND #$01
	BNE bra_00_BC2C
	LDY #$00
	STY флаг_владения_мячом_команды
	STY флаг_владения_мячом_команды + 1
	LDA счет_команды + 1
	CMP счет_команды
	BCC bra_00_BC05
	BEQ bra_00_BC1C
	INY
bra_00_BC05:
	LDA #$01
	STA флаг_владения_мячом_команды,Y
	LDA #$09
	STA тип_экрана
	LDA опция_режим_сложность
	AND #$DF
	STA опция_режим_сложность
	LDA #$00
	STA счетчик_смен
	JMP _loc_00_BCAA
bra_00_BC1C:
	LDA счетчик_смен
	AND #$0F
	CMP #$0A
	BCC bra_00_BC27
	LDA #$00
bra_00_BC27:
	ORA #$80
	STA счетчик_смен
bra_00_BC2C:
	LDA опция_режим_сложность
	BPL bra_00_BC3E
	LDA счетчик_смен
	AND #$01
	BEQ bra_00_BC3E
	LDA номер_управляемого + 1
	BPL bra_00_BC68
	BMI bra_00_BC5B
bra_00_BC3E:
	LDA счетчик_смен
	AND #$01
	TAY
	LDA счетчик_смен
	AND #$0F
	STA номер_управляемого,Y
	LDA счетчик_смен
	AND #$01
	EOR #$01
	ORA #$02
	TAY
	LDA номер_управляемого,Y
	BPL bra_00_BC68
bra_00_BC5B:
	LDA счетчик_смен
	AND #$01
	EOR #$01
	TAY
	ORA #$0A
	STA номер_управляемого,Y
bra_00_BC68:
	LDX #$0B
bra_00_BC6A:
	TXA
	AND #$01
	TAY
	LDA номер_команды,Y
	AND #$80
	STA $1C
	LDA позиция_управление,X
	AND #$7F
	ORA $1C
	STA позиция_управление,X
	DEX
	BPL bra_00_BC6A
	LDA #$00
	STA $068E
	JSR _b07_вращение_рандома
	STA $068F
	LDA #< table_00_BDF8
	STA $2E
	LDA #> table_00_BDF8
	STA $2F
	LDA #$00
	STA номер_тайма
	STA время_тайма_терции
	STA время_тайма_секунды_десятки
	STA время_тайма_минуты
	LDA #$08
	STA время_тайма_секунды_единицы
_loc_00_BCAA:
	LDX #$00
_loc_00_BCAC:
	LDA #$FF
	STA смена_угла_движения,X
	STA номер_действия,X
	LDA table_00_BDC9,X
	STA a: $61,X
	LDA table_00_BDD6,X
	STA номер_движения,X
	LDA #$7F
	STA a: $74,X
	LDA #$00
	STA номер_анимации,X
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
	LDA опция_режим_сложность
	AND #$20
	BNE bra_00_BCFA
	TXA
	ROR
	ROR
bra_00_BCFA:
	AND #$80
	STA направление_движения,X
	TXA
	AND #$01
	BNE bra_00_BD2E
	LDA опция_режим_сложность
	AND #$20
	BNE bra_00_BD2E
	TXA
	AND #$FE
	ASL
	TAY
	SEC
	LDA #$00
	SBC ($2C),Y
	STA координата_X_lo,X
	INY
	LDA #$02
	SBC ($2C),Y
	STA координата_X_hi,X
	INY
	LDA ($2C),Y
	STA координата_Y_lo,X
	INY
	LDA ($2C),Y
	STA координата_Y_hi,X
	JMP _loc_00_BD4F
bra_00_BD2E:
	TXA
	AND #$FE
	ASL
	TAY
	CLC
	LDA #$00
	ADC ($2E),Y
	STA координата_X_lo,X
	INY
	LDA #$02
	ADC ($2E),Y
	STA координата_X_hi,X
	INY
	LDA ($2E),Y
	STA координата_Y_lo,X
	INY
	LDA ($2E),Y
	STA координата_Y_hi,X
_loc_00_BD4F:
	INX
	CPX #$0D
	BCS bra_00_BD57
	JMP _loc_00_BCAC
bra_00_BD57:
	LDA #$30
	STA смещение_камеры
	LDA #$0C
	STA объект_камеры
	LDA $055B
	ASL
	ASL
	TAY
	LDA $2B
	LSR
	BCC bra_00_BD6E
	INY
	INY
bra_00_BD6E:
	LDX #$00
	LDA опция_режим_сложность
	AND #$20
	BEQ bra_00_BD7D
	LDA #$4C
	STA объект_камеры
	LDY #$10
bra_00_BD7D:
	LDA table_00_BDA7,Y
	STA a: байт_для_2005_X,X
	STA a: $F0,X
	INY
	INX
	CPX #$02
	BCC bra_00_BD7D
	LDA #$48
	STA a: байт_для_2005_Y
	STA a: $F2
	LDA #$00
	STA a: $EF
	STA a: $F3
	LDY #$1B
	LDA #$00
bra_00_BDA0:
	STA $056C,Y
	DEY
	BPL bra_00_BDA0
	RTS

table_00_BDA7:
.byte $80,$01,$80,$01,$80,$02,$80,$00,$80,$02,$80,$00,$80,$02,$80,$00,$98,$02

table_00_BDB9:
.byte $00,$0A,$FF,$FF,$00,$01,$0A,$0B,$00,$01,$0A,$0B,$00,$01,$0A,$0B

table_00_BDC9:
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01

table_00_BDD6:
.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

table_00_BDE3:
.byte $01,$02,$03,$04,$05

table_00_BDE8:		; читается из 2х мест
.word table_00_BDE8_BE32
.word table_00_BDE8_BE16
.word table_00_BDE8_BE6A
.word table_00_BDE8_BE4E
.word table_00_BDE8_BEA2
.word table_00_BDE8_BE86
.word table_00_BDE8_BEDA
.word table_00_BDE8_BEBE

table_00_BDF8:
.byte $E8,$00,$C0,$00,$E8,$00,$C0,$00,$E8,$00,$C0,$00,$E8,$00,$C0,$00,$E8,$00,$C0,$00,$68,$01,$C0,$00,$10,$01,$C1,$00

table_00_BDE8_BE16:
.byte $70,$00,$C0,$00,$30,$00,$80,$00,$30,$00,$00,$01,$00,$01,$80,$00,$00,$01,$00,$01,$60,$01,$C0,$00,$00,$00,$C1,$00

table_00_BDE8_BE32:
.byte $0C,$00,$C0,$00,$0C,$00,$98,$00,$0C,$00,$E8,$00,$D0,$00,$80,$00,$D0,$00,$00,$01,$60,$01,$C0,$00,$00,$00,$C1,$00

table_00_BDE8_BE4E:
.byte $D0,$FF,$C0,$00,$30,$00,$80,$00,$30,$00,$00,$01,$10,$01,$C8,$00,$18,$01,$E0,$00,$60,$01,$C0,$00,$D0,$00,$E0,$00

table_00_BDE8_BE6A:
.byte $50,$FF,$E0,$00,$00,$FF,$60,$00,$60,$FF,$B0,$00,$D0,$00,$80,$00,$D0,$00,$00,$01,$60,$01,$C0,$00,$30,$FF,$E0,$00

table_00_BDE8_BE86:
.byte $D0,$FF,$C0,$00,$30,$00,$80,$00,$30,$00,$00,$01,$10,$01,$B8,$00,$18,$01,$A0,$00,$60,$01,$C0,$00,$D0,$00,$A0,$00

table_00_BDE8_BEA2:
.byte $50,$FF,$A0,$00,$00,$FF,$20,$01,$60,$FF,$D0,$00,$D0,$00,$80,$00,$D0,$00,$00,$01,$60,$01,$C0,$00,$30,$FF,$A0,$00

table_00_BDE8_BEBE:
.byte $D0,$FF,$C0,$00,$30,$00,$80,$00,$30,$00,$00,$01,$10,$01,$B8,$00,$20,$01,$C8,$00,$60,$01,$C0,$00,$D0,$00,$C0,$00

table_00_BDE8_BEDA:
.byte $50,$FF,$C0,$00,$60,$FF,$60,$00,$60,$FF,$20,$01,$D0,$00,$80,$00,$D0,$00,$00,$01,$60,$01,$C0,$00,$30,$FF,$C0,$00

table_00_BEF6:
.byte $00,$40,$00,$40,$00,$40,$40,$00,$00,$00,$40,$00,$00,$00,$00,$40

_loc_00_BF06:
	LDX #$0B
bra_00_BF08:
	LDA $05D5,X
	AND #$0F
	STA $1C
	LDA table_00_BF1F,X
	AND #$03
	JSR _b07_EC8F

table_00_BF17:		; байты после JSR
.word table_00_BF17_BF39
.word table_00_BF17_BF45
.word table_00_BF17_BF54
.word table_00_BF17_BF5D

table_00_BF1F:		; читается из 2х мест
.byte $00,$43,$41,$82,$81,$C2,$83,$01,$02,$02,$40,$C0

_loc_00_BF2B:
	LDA $05D5,X
	AND #$F0
	ORA $1C
	STA $05D5,X
	DEX
	BPL bra_00_BF08
	RTS

table_00_BF17_BF39:
	JSR _loc_00_BF7C
	JSR _loc_00_BFAA
	JSR _loc_00_BFBA
	JMP _loc_00_BF2B

table_00_BF17_BF45:
	JSR _loc_00_BF7C
	JSR _loc_00_BFC6
	JSR _loc_00_BFAA
	JSR _loc_00_BFD2
	JMP _loc_00_BF2B

table_00_BF17_BF54:
	JSR _loc_00_BFBA
	JSR _loc_00_BFB2
	JMP _loc_00_BF2B

table_00_BF17_BF5D:
	JSR _loc_00_BFDE
	JMP _loc_00_BF2B
bra_00_BF63:
	CLC
	LDA $1C
	ADC #$01
	CMP #$10
	BCC bra_00_BF6E
	LDA #$0F
bra_00_BF6E:
	STA $1C
bra_00_BF70:
	RTS
bra_00_BF71:
	SEC
	LDA $1C
	SBC #$01
	BPL bra_00_BF6E
	LDA #$00
	BEQ bra_00_BF6E
_loc_00_BF7C:
	JSR _loc_00_BFE6
	TYA
	BMI bra_00_BF70
	STA $1D
	LSR
	CLC
	ADC $1D
	ADC расстановка_команды
	TAY
	LDA table_00_BF1F,X
	AND #$F0
	CMP table_00_BF98,Y
	BEQ bra_00_BF63
	BNE bra_00_BF71

table_00_BF98:
.byte $00,$00,$00,$40,$40,$40,$40,$40,$00,$80,$00,$80,$80,$80,$80,$C0,$C0,$C0

_loc_00_BFAA:
	JSR _loc_00_BFE6
	TYA
	BMI bra_00_BF71
	BPL bra_00_BF70
_loc_00_BFB2:
	JSR _loc_00_BFE6
	TYA
	BPL bra_00_BF63
	BMI bra_00_BF70
_loc_00_BFBA:
	LDA счет_команды
	CMP счет_команды + 1
	BEQ bra_00_BF70
	BCC bra_00_BF63
	BCS bra_00_BF70
_loc_00_BFC6:
	LDA счет_команды
	CMP счет_команды + 1
	BEQ bra_00_BF70
	BCC bra_00_BF71
	BCS bra_00_BF70
_loc_00_BFD2:
	LDA счет_команды
	CMP счет_команды + 1
	BEQ bra_00_BF70
	BCC bra_00_BF70
	BCS bra_00_BF63
_loc_00_BFDE:
	JSR _b07_вращение_рандома
	BPL bra_00_BF63
	BMI bra_00_BF71
	RTS
_loc_00_BFE6:
	LDY #$0A
bra_00_BFE8:
	TXA
	CMP номер_игрока,Y
	BEQ bra_00_BFF2
	DEY
	DEY
	BPL bra_00_BFE8
bra_00_BFF2:
	RTS
_loc_00_BFF3:
	LDA #$19
	JMP _b07_C344
_loc_00_BFF8:
	LDA #$1A
	JMP _b07_C344

.segment "BANK_00_ID"
.byte $00