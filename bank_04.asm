.segment "BANK_04"
.include "ram_copy.inc"
.include "val_copy.inc"

.import _b07_C2E4
.import _b07_F691
.import _b07_FA6D
.import _b07_C344
.import _b07_CEBD
.import _b07_FAEE

.export _loc_04_8000
_loc_04_8000:
	JMP _loc_04_8031
.export _loc_04_8003
_loc_04_8003:
	JMP _loc_04_AF94
.export _loc_04_8006
_loc_04_8006:
	JMP _loc_04_AF8D
	JMP _loc_04_B204
.export _loc_04_800C
_loc_04_800C:
	JMP _loc_04_B204		; копия предыдущего, который не используется
.export _loc_04_800F
_loc_04_800F:
	JMP _loc_04_B316
.export _loc_04_8012
_loc_04_8012:
	JMP _loc_04_BCE3
.export _loc_04_8015
_loc_04_8015:
	JMP _loc_04_B4B2
.export _loc_04_8018
_loc_04_8018:
	JMP _loc_04_B8AB
.export _loc_04_801B
_loc_04_801B:
	JMP _loc_04_BDE3
.export _loc_04_801E
_loc_04_801E:
	JMP _loc_04_BA1B
.export _loc_04_8021
_loc_04_8021:
	JMP _loc_04_BB1E
.export _loc_04_8024
_loc_04_8024:
	JMP _loc_04_BBEC

_loc_04_8027:
	LDA #$06
	JMP _b07_C344
_loc_04_802C:
	LDA #$25
	JMP _b07_C344
_loc_04_8031:
	LDA режим_игры_на_поле
	BPL bra_04_8036
	RTS
bra_04_8036:
	LDA #$40
	STA счетчик_спрайтов
	LDX #$FC
	LDA $F4
	BNE bra_04_8044
	JMP _loc_04_818B
_loc_04_8044:
bra_04_8044:
	DEC $F4
	BPL bra_04_804B
	JMP _loc_04_818B
bra_04_804B:
	LDY $F4
	LDA приоритет_отрисовки_спрайта,Y
	AND #$1F
	TAY
	LDA $03AF,Y
	STA $1C
	LDA $03C2,Y
	STA $1D
	LDA $03D5,Y
	STA $1E
	LDA #$00
	STA $25
	LDY $F4
	LDA приоритет_отрисовки_спрайта,Y
	CMP #$20
	BCC bra_04_8088
	AND #$E0
	CMP #$20
	BNE bra_04_8078
	JMP _loc_04_8216
bra_04_8078:
	CMP #$40
	BNE bra_04_807F
	JMP _loc_04_8240
bra_04_807F:
	LDA #$20
	STA $25
	LDA приоритет_отрисовки_спрайта,Y
	AND #$1F
bra_04_8088:
	TAY
	LDA $1E
	SEC
	SBC $1D
	BCS bra_04_8096
	SEC
	SBC #$06
	JMP _loc_04_8098
bra_04_8096:
	LDA #$FF
_loc_04_8098:
	STA $1F
	LDA $0074,Y
	STA $20
	AND #$80
	EOR #$80
	LSR
	ORA $25
	STA $21
	LDA table_04_83BC,Y
	STA $24
	LDA лицо_игрока,Y
	STA $22
	LDA $0061,Y
	CMP #$03
	BNE bra_04_80BC
	JMP _loc_04_8296
bra_04_80BC:
	ASL
	TAY
	LDA table_04_83D8,Y
	STA $3A
	LDA table_04_83D8 + 1,Y
	STA $3B
	LDA $20
	AND #$7F
	ASL
	TAY
	LDA ($3A),Y
	STA $34
	INY
	LDA ($3A),Y
	STA $35
	LDY #$01
	LDA ($34),Y
	STA $2C
	INY
	LDA ($34),Y
	STA $2D
	INY
	LDA ($34),Y
	STA $2E
	INY
	LDA ($34),Y
	STA $2F
	INY
	LDA ($34),Y
	STA $30
	INY
	LDA ($34),Y
	STA $31
	INY
	LDA ($34),Y
	STA $32
	INY
	LDA ($34),Y
	STA $33
	LDY #$00
	LDA ($34),Y
	STA $2B
_loc_04_8106:
	LDA ($32),Y
	CMP $1F
	BCS bra_04_8119
	CLC
	ADC $1D
	CMP ограничитель_Y_спрайтов
	BCS bra_04_8119
	STA спрайт_Y,X
	JMP _loc_04_811C
bra_04_8119:
	JMP _loc_04_8180
_loc_04_811C:
	LDA ($2C),Y
	CMP #$06
	BCC bra_04_8125
	JMP _loc_04_813A
bra_04_8125:
	STY $44
	STA $36
	LDA $22
	ASL
	ADC $22
	ASL
	ADC $36
	TAY
	LDA table_04_82C6,Y
	LDY $44
	JMP _loc_04_813A
_loc_04_813A:
	STA спрайт_тайл,X
	LDA ($2E),Y
	EOR $21
	ORA $24
	STA спрайт_атрибут,X
	LDA $20
	BPL bra_04_814F
	LDA ($30),Y
	JMP _loc_04_8156
bra_04_814F:
	LDA ($30),Y
	EOR #$FF
	SEC
	SBC #$07
_loc_04_8156:
	BPL bra_04_8166
	CLC
	ADC $1C
	STA спрайт_X,X
	BPL bra_04_8172
	LDA $1C
	BPL bra_04_8180
	BMI bra_04_8172
bra_04_8166:
	CLC
	ADC $1C
	STA спрайт_X,X
	BMI bra_04_8172
	LDA $1C
	BMI bra_04_8180
_loc_04_8172:
bra_04_8172:
	DEC счетчик_спрайтов
	DEX
	DEX
	DEX
	DEX
	CPX #$FC
	BNE bra_04_8180
	JMP _loc_04_81B4
_loc_04_8180:
bra_04_8180:
	INY
	CPY $2B
	BEQ bra_04_8188
	JMP _loc_04_8106
bra_04_8188:
	JMP _loc_04_8044
_loc_04_818B:
	LDA номер_погодного_эффекта
	BNE bra_04_81A0
	LDA #$F8
bra_04_8192:
	STA спрайт_Y,X
	DEX
	DEX
	DEX
	DEX
	CPX #$FC
	BNE bra_04_8192
	JMP _loc_04_81B4
bra_04_81A0:
	LDA #$F8
_loc_04_81A2:
	STA спрайт_Y,X
	DEX
	DEX
	DEX
	DEX
	CPX #$FC
	BEQ bra_04_81B4
	CPX #$30
	BCC bra_04_81B4
	JMP _loc_04_81A2
_loc_04_81B4:
bra_04_81B4:
	LDA $F4
	BEQ bra_04_81BE
	BPL bra_04_81BF
	LDA #$00
	STA $F4
bra_04_81BE:
	RTS
bra_04_81BF:
	LDX $F4
	LDA #$FC
	STA $1C
bra_04_81C5:
	LDA приоритет_отрисовки_спрайта,X
	CMP #$0E
	BCC bra_04_820C
	AND #$1F
	TAY
	SEC
	SBC #$0E
	STA $1F
	LDA $03AF,Y
	STA $1D
	LDA $03C2,Y
	CMP #$C0
	BCC bra_04_820C
	STA $1E
	LDY $1C
	LDA $1E
	CLC
	ADC #$F5
	STA спрайт_Y,Y
	LDA $1D
	CLC
	ADC #$FC
	STA спрайт_X,Y
	LDA #$01
	STA спрайт_атрибут,Y
	STY $44
	LDY $1F
	LDA table_04_83D3,Y
	LDY $44
	STA спрайт_тайл,Y
	LDA $1C
	SEC
	SBC #$04
	STA $1C
bra_04_820C:
	DEX
	BPL bra_04_81C5
	LDA #$FF
	STA $F4
	JMP _loc_04_81B4
_loc_04_8216:
	LDY #$00
	LDA #$01
	STA $2B
	LDA $1E
	CLC
	ADC #$F8
	CMP ограничитель_Y_спрайтов
	BCC bra_04_8228
	JMP _loc_04_8044
bra_04_8228:
	STA спрайт_Y,X
	LDA #$A1
	STA спрайт_тайл,X
	LDA #$01
	STA спрайт_атрибут,X
	LDA $1C
	CLC
	ADC #$FC
	STA спрайт_X,X
	JMP _loc_04_8172
_loc_04_8240:
	LDA $1E
	CLC
	ADC #$F9
	CMP ограничитель_Y_спрайтов
	BCC bra_04_824C
	JMP _loc_04_8044
bra_04_824C:
	STA спрайт_Y,X
	LDA #$B7
	STA спрайт_тайл,X
	LDA #$00
	STA спрайт_атрибут,X
	LDA $1C
	CLC
	ADC #$F8
	STA спрайт_X,X
	DEC счетчик_спрайтов
	DEX
	DEX
	DEX
	DEX
	CPX #$FC
	BNE bra_04_826F
	JMP _loc_04_81B4
bra_04_826F:
	LDA $1E
	CLC
	ADC #$F9
	CMP ограничитель_Y_спрайтов
	BCC bra_04_827B
	JMP _loc_04_8044
bra_04_827B:
	STA спрайт_Y,X
	LDA #$B7
	STA спрайт_тайл,X
	LDA #$40
	STA спрайт_атрибут,X
	LDA $1C
	STA спрайт_X,X
	LDY #$01
	LDA #$02
	STA $2B
	JMP _loc_04_8172
_loc_04_8296:
	LDA $20
	AND #$7F
	TAY
	AND #$01
	CLC
	ADC #$01
	STA $24
	LDA $1D
	CLC
	ADC #$F5
	STA спрайт_Y,X
	LDA table_04_83CE,Y
	STA спрайт_тайл,X
	LDA $24
	STA спрайт_атрибут,X
	LDA $1C
	CLC
	ADC #$FC
	STA спрайт_X,X
	LDY #$00
	LDA #$01
	STA $2B
	JMP _loc_04_8172

table_04_82C6:
.byte $00,$01,$02,$03,$04,$05,$9B,$9C,$BB,$BC,$04,$FE,$AB,$AC,$BA,$03,$04,$05,$AD,$AE,$BF,$03,$04,$05,$CD,$CE,$ED,$EE,$BD,$BE,$8D,$8E,$9F,$03,$04,$05,$DD,$DE,$DF,$03,$04,$05,$EB,$EC,$FF,$03,$04,$05,$CB,$CC,$EF,$03,$04,$05,$DB,$DC,$CF,$03,$04,$05,$9D,$9E,$AF,$03,$04,$05,$8B,$8C,$8F,$03,$04,$05,$8B,$8C,$8F,$BC,$BD,$BE,$8D,$8E,$9F,$BC,$BD,$BE,$9B,$9C,$BB,$BC,$BD,$BE,$9D,$9E,$AF,$BC,$BD,$BE,$AB,$AC,$BA,$BC,$BD,$BE,$AD,$AE,$BF,$BC,$BD,$BE,$4B,$4C,$4F,$7C,$7D,$7E,$4D,$4E,$5F,$7C,$7D,$7E,$5B,$5C,$7B,$7C,$7D,$7E,$5D,$5E,$6F,$7C,$7D,$7E,$6B,$6C,$7A,$7C,$7D,$7E,$6D,$6E,$7F,$7C,$7D,$7E,$84,$85,$86,$87,$04,$05,$88,$89,$8A,$8B,$04,$05,$8C,$8D,$8E,$8F,$04,$05,$B0,$B1,$B2,$B3,$04,$05,$98,$99,$9A,$9B,$04,$05,$9C,$9D,$9E,$9F,$04,$05,$A4,$A5,$A6,$A7,$04,$05,$A8,$A9,$AA,$AB,$04,$05,$AC,$AD,$AE,$AF,$04,$05,$B4,$B5,$B6,$B7,$04,$05,$B8,$B9,$BA,$BB,$04,$05,$BC,$BD,$BE,$BF,$04,$05,$CA,$CB,$CC,$CD,$CE,$CF,$DA,$DB,$DC,$DD,$DE,$DF,$EA,$EB,$EC,$ED,$EE,$EF,$FA,$FB,$FC,$FD,$FE,$FF,$CC,$CD,$FC,$FD,$FE,$FF

table_04_83BC:
.byte $01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$00,$00,$00,$00,$00,$00

table_04_83CE:
.byte $C0,$C1,$D0,$D1,$C2

table_04_83D3:
.byte $C2,$C0,$C1,$D0,$D1

table_04_83D8:
.word table_04_83D8_83EC
.word table_04_83D8_84E0
.word table_04_83D8_856C
.word table_04_83D8_8570
.word table_04_83D8_8492
.word table_04_83D8_857A
.word table_04_83D8_85B6
.word table_04_83D8_85E4
.word table_04_83D8_ACCF
.word table_04_83D8_866E

table_04_83D8_83EC:
.word off_04_8676
.word off_04_867F
.word off_04_8688
.word off_04_8691
.word off_04_869A
.word off_04_86A3
.word off_04_86AC
.word off_04_86B5
.word off_04_86BE
.word off_04_86C7
.word off_04_86D0
.word off_04_86D9
.word off_04_86E2
.word off_04_86EB
.word off_04_86F4
.word off_04_86FD
.word off_04_8706
.word off_04_870F
.word off_04_8718
.word off_04_8721
.word off_04_872A
.word off_04_8733
.word off_04_873C
.word off_04_8745
.word off_04_874E
.word off_04_8757
.word off_04_8760
.word off_04_8769
.word off_04_8772
.word off_04_877B
.word off_04_8784
.word off_04_878D
.word off_04_8796
.word off_04_879F
.word off_04_87A8
.word off_04_87B1
.word off_04_87BA
.word off_04_87BA
.word off_04_87C3
.word off_04_87CC
.word off_04_87D5
.word off_04_87DE
.word off_04_87E7
.word off_04_87F0
.word off_04_87F9
.word off_04_8802
.word off_04_880B
.word off_04_8814
.word off_04_881D
.word off_04_8826
.word off_04_882F
.word off_04_882F
.word off_04_882F
.word off_04_882F
.word off_04_8838
.word off_04_8841
.word off_04_884A
.word off_04_8853
.word off_04_885C
.word off_04_8865
.word off_04_886E
.word off_04_8877
.word off_04_8880
.word off_04_8889
.word off_04_8892
.word off_04_889B
.word off_04_88A4
.word off_04_88AD
.word off_04_88B6
.word off_04_88BF
.word off_04_88C8
.word off_04_88D1
.word off_04_88DA
.word off_04_88E3
.word off_04_88EC
.word off_04_88F5
.word off_04_88FE
.word off_04_8907
.word off_04_8910
.word off_04_8910
.word off_04_8919
.word off_04_8922
.word off_04_892B

table_04_83D8_8492:
.word off_04_8934
.word off_04_893D
.word off_04_8946
.word off_04_894F
.word off_04_8958
.word off_04_8961
.word off_04_896A
.word off_04_8973
.word off_04_897C
.word off_04_8985
.word off_04_898E
.word off_04_8997
.word off_04_89A0
.word off_04_89A9
.word off_04_89B2
.word off_04_89BB
.word off_04_89C4
.word off_04_89D6
.word off_04_89DF
.word off_04_89E8
.word off_04_89F1
.word off_04_89FA
.word off_04_89FA
.word off_04_89FA
.word off_04_89FA
.word off_04_8A03
.word off_04_8A0C
.word off_04_8A15
.word off_04_8A1E
.word off_04_88AD
.word off_04_88B6
.word off_04_88BF
.word off_04_88C8
.word off_04_88D1
.word off_04_88E3
.word off_04_88EC
.word off_04_8907
.word off_04_8910
.word off_04_89CD

table_04_83D8_84E0:
.word off_04_8A27
.word off_04_8A30
.word off_04_8A39
.word off_04_8A42
.word off_04_8A4B
.word off_04_8A54
.word off_04_8A5D
.word off_04_8A66
.word off_04_8A6F
.word off_04_8A78
.word off_04_8A81
.word off_04_8A8A
.word off_04_8A93
.word off_04_8B3E
.word off_04_8A9C
.word off_04_8AA5
.word off_04_8AAE
.word off_04_8AB7
.word off_04_8AC0
.word off_04_8AC9
.word off_04_8AD2
.word off_04_8ADB
.word off_04_8AE4
.word off_04_8AED
.word off_04_8AF6
.word off_04_8AFF
.word off_04_8B08
.word off_04_8B11
.word off_04_8B1A
.word off_04_8B23
.word off_04_8B2C
.word off_04_8B35
.word off_04_8B3E
.word off_04_8B47
.word off_04_8B50
.word off_04_8B59
.word off_04_8B62
.word off_04_8A8A
.word off_04_8B6B
.word off_04_8B74
.word off_04_8B7D
.word off_04_8B86
.word off_04_8B8F
.word off_04_8B98
.word off_04_8BA1
.word off_04_8BAA
.word off_04_8BB3
.word off_04_8BBC
.word off_04_8BC5
.word off_04_8BCE
.word off_04_8BD7
.word off_04_8BE0
.word off_04_8BE9
.word off_04_8BF2
.word off_04_8BFB
.word off_04_8C04
.word off_04_8C0D
.word off_04_8C16
.word off_04_8C1F
.word off_04_8C28
.word off_04_8C31
.word off_04_8B6B
.word off_04_8C3A
.word off_04_8C43
.word off_04_8C4C
.word off_04_8C55
.word off_04_8C5E
.word off_04_8C67
.word off_04_8C70
.word off_04_8C79

table_04_83D8_856C:
.word off_04_8C82
.word off_04_8C8B

table_04_83D8_8570:
.word off_04_8C94
.word off_04_8C9D
.word off_04_8CA6
.word off_04_8CAF
.word off_04_8CB8

table_04_83D8_857A:
.word off_04_8CC1
.word off_04_8CCA
.word off_04_8CD3
.word off_04_8CDC
.word off_04_8CE5
.word off_04_8CEE
.word off_04_8CF7
.word off_04_8D00
.word off_04_8D09
.word off_04_8D12
.word off_04_8D1B
.word off_04_8D24
.word off_04_8D2D
.word off_04_8D36
.word off_04_8D3F
.word off_04_8D48
.word off_04_8D51
.word off_04_8D5A
.word off_04_8D63
.word off_04_8D6C
.word off_04_8D75
.word off_04_8D7E
.word off_04_8D87
.word off_04_8D90
.word off_04_8D90
.word off_04_8D90
.word off_04_8D90
.word off_04_8D99
.word off_04_8DA2
.word off_04_8DAB

table_04_83D8_85B6:
.word off_04_8DB4
.word off_04_8DBD
.word off_04_8DC6
.word off_04_8DCF
.word off_04_8DD8
.word off_04_8DE1
.word off_04_8DEA
.word off_04_8DF3
.word off_04_8DFC
.word off_04_8E05
.word off_04_8E0E
.word off_04_8E17
.word off_04_8E20
.word off_04_8E29
.word off_04_8E32
.word off_04_8E3B
.word off_04_8E44
.word off_04_8E4D
.word off_04_8E56
.word off_04_8E5F
.word off_04_8E68
.word off_04_8E71
.word off_04_8E7A

table_04_83D8_85E4:
.word off_04_8E83
.word off_04_8E8C
.word off_04_8E95
.word off_04_8E9E
.word off_04_8EA7
.word off_04_8EB0
.word off_04_8EB9
.word off_04_8EC2
.word off_04_8ECB
.word off_04_8ED4
.word off_04_8EDD
.word off_04_8EE6
.word off_04_8EEF
.word off_04_8EF8
.word off_04_8F01
.word off_04_8F0A
.word off_04_8F13
.word off_04_8F1C
.word off_04_8F25
.word off_04_8F2E
.word off_04_8F37
.word off_04_8F40
.word off_04_8F49
.word off_04_8F52
.word off_04_8F52
.word off_04_8F5B
.word off_04_8F64
.word off_04_8F6D
.word off_04_8F76
.word off_04_8F7F
.word off_04_8F88
.word off_04_8F91
.word off_04_8F9A
.word off_04_8FA3
.word off_04_8FAC
.word off_04_8FB5
.word off_04_8FBE
.word off_04_8FC7
.word off_04_8FD0
.word off_04_8FD9
.word off_04_8FE2
.word off_04_8FEB
.word off_04_8FF4
.word off_04_8FFD
.word off_04_9006
.word off_04_9006
.word off_04_900F
.word off_04_9018
.word off_04_9021
.word off_04_902A
.word off_04_9033
.word off_04_903C
.word off_04_9045
.word off_04_9045
.word off_04_904E
.word off_04_9057
.word off_04_9060
.word off_04_9069
.word off_04_9072
.word off_04_9057
.word off_04_9060
.word off_04_9069
.word off_04_9072
.word off_04_88AD
.word off_04_88B6
.word off_04_907B
.word off_04_88A4
.word off_04_88DA
.word off_04_86BE

table_04_83D8_866E:
.word off_04_9084
.word off_04_908D
.word off_04_9096
.word off_04_909F

off_04_8676:
.byte $08
.word off_04_9803
.word off_04_99C8
.word off_04_A101
.word off_04_A694

off_04_867F:
.byte $09
.word off_04_96BD
.word off_04_99C9
.word off_04_A40F
.word off_04_AB66

off_04_8688:
.byte $09
.word off_04_9738
.word off_04_99E6
.word off_04_A481
.word off_04_A9E7

off_04_8691:
.byte $0A
.word off_04_9591
.word off_04_9CA5
.word off_04_A2E8
.word off_04_AA65

off_04_869A:
.byte $08
.word off_04_981B
.word off_04_9DBD
.word off_04_9EBD
.word off_04_AC43

off_04_86A3:
.byte $08
.word off_04_980B
.word off_04_9CA7
.word off_04_A519
.word off_04_A85D

off_04_86AC:
.byte $0A
.word off_04_95CD
.word off_04_99E6
.word off_04_A322
.word off_04_AA93

off_04_86B5:
.byte $08
.word off_04_97FB
.word off_04_9A2C
.word off_04_A511
.word off_04_A728

off_04_86BE:
.byte $08
.word off_04_97F3
.word off_04_99CA
.word off_04_A509
.word off_04_AC3B

off_04_86C7:
.byte $09
.word off_04_96E1
.word off_04_9BB1
.word off_04_A433
.word off_04_AB8A

off_04_86D0:
.byte $0A
.word off_04_95D7
.word off_04_99E6
.word off_04_A32C
.word off_04_AA9D

off_04_86D9:
.byte $0A
.word off_04_9609
.word off_04_9D20
.word off_04_A35E
.word off_04_AACF

off_04_86E2:
.byte $08
.word off_04_97AB
.word off_04_9D9B
.word off_04_A4E1
.word off_04_AC0B

off_04_86EB:
.byte $09
.word off_04_96CF
.word off_04_99C9
.word off_04_A421
.word off_04_AB78

off_04_86F4:
.byte $0B
.word off_04_946A
.word off_04_99E6
.word off_04_A1C0
.word off_04_A959

off_04_86FD:
.byte $09
.word off_04_96EA
.word off_04_99E6
.word off_04_A43C
.word off_04_AB93

off_04_8706:
.byte $09
.word off_04_96FC
.word off_04_9A0D
.word off_04_A44E
.word off_04_ABA5

off_04_870F:
.byte $09
.word off_04_9704
.word off_04_9D7A
.word off_04_A457
.word off_04_ABAE

off_04_8718:
.byte $08
.word off_04_9763
.word off_04_99E8
.word off_04_A4AB
.word off_04_ABE3

off_04_8721:
.byte $09
.word off_04_970D
.word off_04_9A88
.word off_04_A460
.word off_04_ABB7

off_04_872A:
.byte $0A
.word off_04_955F
.word off_04_9CDD
.word off_04_A2B6
.word off_04_AA33

off_04_8733:
.byte $0A
.word off_04_94E9
.word off_04_99C8
.word off_04_A23E
.word off_04_A9C9

off_04_873C:
.byte $0A
.word off_04_94DF
.word off_04_9CA5
.word off_04_A234
.word off_04_A9C0

off_04_8745:
.byte $0A
.word off_04_9613
.word off_04_9D28
.word off_04_A368
.word off_04_AAD9

off_04_874E:
.byte $0C
.word off_04_9321
.word off_04_99E6
.word off_04_A082
.word off_04_A823

off_04_8757:
.byte $08
.word off_04_97EB
.word off_04_99E6
.word off_04_A501
.word off_04_AC2B

off_04_8760:
.byte $08
.word off_04_97DB
.word off_04_9DAD
.word off_04_A4F1
.word off_04_AC2B

off_04_8769:
.byte $0A
.word off_04_94B7
.word off_04_9C91
.word off_04_A20C
.word off_04_A99A

off_04_8772:
.byte $08
.word off_04_97CB
.word off_04_9DAA
.word off_04_9EBD
.word off_04_AC23

off_04_877B:
.byte $09
.word off_04_963F
.word off_04_9CA6
.word off_04_A396
.word off_04_AB07

off_04_8784:
.byte $08
.word off_04_979B
.word off_04_99C8
.word off_04_A4D9
.word off_04_ABFB

off_04_878D:
.byte $08
.word off_04_9793
.word off_04_99C8
.word off_04_A101
.word off_04_A69C

off_04_8796:
.byte $0A
.word off_04_950F
.word off_04_9CC2
.word off_04_A266
.word off_04_A9E7

off_04_879F:
.byte $08
.word off_04_9783
.word off_04_99C8
.word off_04_A4CB
.word off_04_A694

off_04_87A8:
.byte $09
.word off_04_965A
.word off_04_9D44
.word off_04_A3B1
.word off_04_AB0F

off_04_87B1:
.byte $08
.word off_04_976B
.word off_04_9D94
.word off_04_A4B3
.word off_04_ABEB

off_04_87BA:
.byte $09
.word off_04_9663
.word off_04_9D4D
.word off_04_A3BA
.word off_04_AB18

off_04_87C3:
.byte $09
.word off_04_966C
.word off_04_9D56
.word off_04_A3C3
.word off_04_AB21

off_04_87CC:
.byte $08
.word off_04_9873
.word off_04_99C8
.word off_04_A568
.word off_04_A9B7

off_04_87D5:
.byte $08
.word off_04_984B
.word off_04_99E6
.word off_04_A543
.word off_04_AC6B

off_04_87DE:
.byte $08
.word off_04_9843
.word off_04_99F2
.word off_04_A53B
.word off_04_AC63

off_04_87E7:
.byte $0A
.word off_04_94D5
.word off_04_99C8
.word off_04_A22A
.word off_04_A9B7

off_04_87F0:
.byte $09
.word off_04_96B4
.word off_04_9CA5
.word off_04_A406
.word off_04_AB5D

off_04_87F9:
.byte $0A
.word off_04_95B9
.word off_04_9D05
.word off_04_A310
.word off_04_AA83

off_04_8802:
.byte $08
.word off_04_9823
.word off_04_9DC5
.word off_04_A523
.word off_04_AC4B

off_04_880B:
.byte $08
.word off_04_982B
.word off_04_9DCD
.word off_04_A52B
.word off_04_AC53

off_04_8814:
.byte $08
.word off_04_9853
.word off_04_99E6
.word off_04_A54B
.word off_04_A5FE

off_04_881D:
.byte $08
.word off_04_9753
.word off_04_9CA6
.word off_04_A49C
.word off_04_ABDB

off_04_8826:
.byte $09
.word off_04_9651
.word off_04_9ADD
.word off_04_A3A8
.word off_04_A92E

off_04_882F:
.byte $09
.word off_04_9648
.word off_04_9D3B
.word off_04_A39F
.word off_04_A9AE

off_04_8838:
.byte $0A
.word off_04_9537
.word off_04_9CD3
.word off_04_A28E
.word off_04_AA0B

off_04_8841:
.byte $0B
.word off_04_9454
.word off_04_9C47
.word off_04_A1AA
.word off_04_A943

off_04_884A:
.byte $0A
.word off_04_952D
.word off_04_9CCA
.word off_04_A284
.word off_04_AA01

off_04_8853:
.byte $09
.word off_04_9636
.word off_04_9D32
.word off_04_A38D
.word off_04_AAFE

off_04_885C:
.byte $09
.word off_04_962D
.word off_04_9C92
.word off_04_A384
.word off_04_AAF5

off_04_8865:
.byte $09
.word off_04_9626
.word off_04_9A0D
.word off_04_A37B
.word off_04_AAEC

off_04_886E:
.byte $09
.word off_04_96C6
.word off_04_99E6
.word off_04_A418
.word off_04_AB6F

off_04_8877:
.byte $08
.word off_04_97E3
.word off_04_9DB5
.word off_04_A4F9
.word off_04_AC33

off_04_8880:
.byte $09
.word off_04_96AB
.word off_04_99E6
.word off_04_A3FD
.word off_04_AB54

off_04_8889:
.byte $09
.word off_04_961D
.word off_04_99E6
.word off_04_A372
.word off_04_AAE3

off_04_8892:
.byte $0C
.word off_04_9373
.word off_04_9BE9
.word off_04_A0D6
.word off_04_A874

off_04_889B:
.byte $0D
.word off_04_92AC
.word off_04_9B68
.word off_04_A00F
.word off_04_A7AE

off_04_88A4:
.byte $0C
.word off_04_9397
.word off_04_9B05
.word off_04_A0ED
.word off_04_A88C

off_04_88AD:
.byte $0A
.word off_04_94F3
.word off_04_9CAF
.word off_04_A248
.word off_04_A875

off_04_88B6:
.byte $0B
.word off_04_9407
.word off_04_9BFD
.word off_04_A15D
.word off_04_A8FC

off_04_88BF:
.byte $0A
.word off_04_94FD
.word off_04_9CB8
.word off_04_A252
.word off_04_A9D3

off_04_88C8:
.byte $08
.word off_04_97D3
.word off_04_99CC
.word off_04_A3BA
.word off_04_AC1B

off_04_88D1:
.byte $08
.word off_04_97BB
.word off_04_9DA2
.word off_04_A4E9
.word off_04_AC1B

off_04_88DA:
.byte $0B
.word off_04_9428
.word off_04_9C22
.word off_04_A17E
.word off_04_A91A

off_04_88E3:
.byte $0A
.word off_04_9519
.word off_04_9A0C
.word off_04_A270
.word off_04_A9ED

off_04_88EC:
.byte $0A
.word off_04_9523
.word off_04_9A0C
.word off_04_A27A
.word off_04_A9F7

off_04_88F5:
.byte $0D
.word off_04_92E0
.word off_04_9B98
.word off_04_A043
.word off_04_A7E2

off_04_88FE:
.byte $0D
.word off_04_9307
.word off_04_9BB1
.word off_04_A068
.word off_04_A809

off_04_8907:
.byte $0C
.word off_04_937F
.word off_04_9BF5
.word off_04_A0E2
.word off_04_A880

off_04_8910:
.byte $0C
.word off_04_938B
.word off_04_9C01
.word off_04_A0E2
.word off_04_A880

off_04_8919:
.byte $08
.word off_04_978B
.word off_04_99E6
.word off_04_A4D3
.word off_04_A5FE

off_04_8922:
.byte $08
.word off_04_977B
.word off_04_99E6
.word off_04_A4C3
.word off_04_A5FE

off_04_892B:
.byte $08
.word off_04_975B
.word off_04_99E6
.word off_04_A4A3
.word off_04_A5FE

off_04_8934:
.byte $0A
.word off_04_9573
.word off_04_9CE7
.word off_04_A2CA
.word off_04_AA47

off_04_893D:
.byte $0D
.word off_04_92ED
.word off_04_9BA4
.word off_04_A050
.word off_04_A7EF

off_04_8946:
.byte $0A
.word off_04_9587
.word off_04_9CF1
.word off_04_A2DE
.word off_04_AA5B

off_04_894F:
.byte $0C
.word off_04_93A3
.word off_04_9C0D
.word off_04_A0F9
.word off_04_A898

off_04_8958:
.byte $0A
.word off_04_959B
.word off_04_9CF1
.word off_04_A2F2
.word off_04_AA6F

off_04_8961:
.byte $0D
.word off_04_92D3
.word off_04_9B8D
.word off_04_A036
.word off_04_A7D5

off_04_896A:
.byte $0D
.word off_04_92B9
.word off_04_9B75
.word off_04_A01C
.word off_04_A7BB

off_04_8973:
.byte $12
.word off_04_9111
.word off_04_99FA
.word off_04_9E75
.word off_04_A61C

off_04_897C:
.byte $0A
.word off_04_95C3
.word off_04_9A0C
.word off_04_A318
.word off_04_AA8B

off_04_8985:
.byte $0B
.word off_04_93F1
.word off_04_9AF3
.word off_04_A147
.word off_04_A8E6

off_04_898E:
.byte $09
.word off_04_9687
.word off_04_99E8
.word off_04_A3DC
.word off_04_A746

off_04_8997:
.byte $09
.word off_04_9690
.word off_04_99E8
.word off_04_A3E5
.word off_04_AB3C

off_04_89A0:
.byte $09
.word off_04_9699
.word off_04_9D68
.word off_04_A3EE
.word off_04_AB45

off_04_89A9:
.byte $09
.word off_04_96A2
.word off_04_9D68
.word off_04_A3F4
.word off_04_AB4B

off_04_89B2:
.byte $0C
.word off_04_9367
.word off_04_9BDD
.word off_04_A0CA
.word off_04_A868

off_04_89BB:
.byte $0A
.word off_04_95FF
.word off_04_9D16
.word off_04_A354
.word off_04_AAC5

off_04_89C4:
.byte $07
.word off_04_988A
.word off_04_9DDF
.word off_04_A577
.word off_04_AC91

off_04_89CD:
.byte $07
.word off_04_988A
.word off_04_9DDF
.word off_04_A577
.word off_04_AC8A

off_04_89D6:
.byte $0D
.word off_04_9292
.word off_04_9B4E
.word off_04_9FF5
.word off_04_A794

off_04_89DF:
.byte $0B
.word off_04_9475
.word off_04_9C5D
.word off_04_A1CB
.word off_04_A964

off_04_89E8:
.byte $01
.word off_04_9291
.word off_04_99C8
.word off_04_9E23
.word off_04_A5C6

off_04_89F1:
.byte $01
.word off_04_9291
.word off_04_99C8
.word off_04_9E5C
.word off_04_A5C6

off_04_89FA:
.byte $01
.word off_04_90EA
.word off_04_99CE
.word off_04_9E23
.word off_04_A5C6

off_04_8A03:
.byte $0C
.word off_04_934F
.word off_04_99E6
.word off_04_A0B2
.word off_04_A850

off_04_8A0C:
.byte $0A
.word off_04_95E1
.word off_04_9D0C
.word off_04_A336
.word off_04_AAA7

off_04_8A15:
.byte $0A
.word off_04_95EB
.word off_04_99E6
.word off_04_A340
.word off_04_AAB1

off_04_8A1E:
.byte $0E
.word off_04_924D
.word off_04_9B0B
.word off_04_9FB0
.word off_04_A74F

off_04_8A27:
.byte $04
.word off_04_985B
.word off_04_99D2
.word off_04_A1A6
.word off_04_A5C5

off_04_8A30:
.byte $04
.word off_04_9938
.word off_04_9AE4
.word off_04_9EC9
.word off_04_A602

off_04_8A39:
.byte $04
.word off_04_985B
.word off_04_9DF9
.word off_04_A45B
.word off_04_A6DA

off_04_8A42:
.byte $04
.word off_04_9938
.word off_04_9DF6
.word off_04_9EC9
.word off_04_A6B0

off_04_8A4B:
.byte $04
.word off_04_97D5
.word off_04_99D2
.word off_04_9EC9
.word off_04_AA19

off_04_8A54:
.byte $06
.word off_04_98B8
.word off_04_9DE8
.word off_04_A5A2
.word off_04_ACBE

off_04_8A5D:
.byte $06
.word off_04_9891
.word off_04_9DE6
.word off_04_A57E
.word off_04_AC98

off_04_8A66:
.byte $04
.word off_04_992C
.word off_04_99D2
.word off_04_A1A6
.word off_04_A5C5

off_04_8A6F:
.byte $04
.word off_04_97D5
.word off_04_99D2
.word off_04_9EC9
.word off_04_A602

off_04_8A78:
.byte $04
.word off_04_9922
.word off_04_9DDB
.word off_04_9EC9
.word off_04_A602

off_04_8A81:
.byte $04
.word off_04_97D5
.word off_04_9DF3
.word off_04_9EC9
.word off_04_A6B0

off_04_8A8A:
.byte $04
.word off_04_9905
.word off_04_99D2
.word off_04_9EC9
.word off_04_A602

off_04_8A93:
.byte $04
.word off_04_9969
.word off_04_99D2
.word off_04_A1A6
.word off_04_A812

off_04_8A9C:
.byte $02
.word off_04_9992
.word off_04_99F9
.word off_04_9E7C
.word off_04_A5C8

off_04_8AA5:
.byte $02
.word off_04_97B7
.word off_04_99CE
.word off_04_9E7C
.word off_04_A5C8

off_04_8AAE:
.byte $04
.word off_04_986B
.word off_04_9DDB
.word off_04_9EC9
.word off_04_A602

off_04_8AB7:
.byte $04
.word off_04_91B5
.word off_04_99FF
.word off_04_9EC9
.word off_04_A602

off_04_8AC0:
.byte $04
.word off_04_9957
.word off_04_9E01
.word off_04_9EC9
.word off_04_A602

off_04_8AC9:
.byte $08
.word off_04_983B
.word off_04_99FA
.word off_04_A533
.word off_04_AC5B

off_04_8AD2:
.byte $08
.word off_04_985B
.word off_04_9DD5
.word off_04_A553
.word off_04_AC73

off_04_8ADB:
.byte $08
.word off_04_986B
.word off_04_9DDB
.word off_04_A560
.word off_04_AC7B

off_04_8AE4:
.byte $04
.word off_04_9912
.word off_04_9DEE
.word off_04_9EC9
.word off_04_A602

off_04_8AED:
.byte $04
.word off_04_9916
.word off_04_9DEE
.word off_04_9EC9
.word off_04_A602

off_04_8AF6:
.byte $04
.word off_04_991A
.word off_04_9DEE
.word off_04_9EC9
.word off_04_A602

off_04_8AFF:
.byte $04
.word off_04_991E
.word off_04_9DEF
.word off_04_A2CE
.word off_04_ACC4

off_04_8B08:
.byte $03
.word off_04_9988
.word off_04_99D2
.word off_04_A14C
.word off_04_ACC8

off_04_8B11:
.byte $03
.word off_04_9988
.word off_04_99D2
.word off_04_A14C
.word off_04_A612

off_04_8B1A:
.byte $04
.word off_04_9926
.word off_04_9AE4
.word off_04_9EC9
.word off_04_A602

off_04_8B23:
.byte $04
.word off_04_9928
.word off_04_9DF6
.word off_04_9EC9
.word off_04_A602

off_04_8B2C:
.byte $03
.word off_04_998B
.word off_04_99D2
.word off_04_9F68
.word off_04_A5C8

off_04_8B35:
.byte $03
.word off_04_919B
.word off_04_99D2
.word off_04_9E6E
.word off_04_A5C8

off_04_8B3E:
.byte $04
.word off_04_9930
.word off_04_99D2
.word off_04_9EC9
.word off_04_A602

off_04_8B47:
.byte $04
.word off_04_9934
.word off_04_99D2
.word off_04_9FF6
.word off_04_A602

off_04_8B50:
.byte $06
.word off_04_98A3
.word off_04_99FA
.word off_04_A590
.word off_04_ACA9

off_04_8B59:
.byte $06
.word off_04_98AF
.word off_04_99FA
.word off_04_A596
.word off_04_ACB5

off_04_8B62:
.byte $06
.word off_04_98B2
.word off_04_9A02
.word off_04_A59C
.word off_04_ACB8

off_04_8B6B:
.byte $04
.word off_04_993C
.word off_04_99D2
.word off_04_9EC9
.word off_04_A602

off_04_8B74:
.byte $04
.word off_04_9940
.word off_04_9DF9
.word off_04_A45A
.word off_04_A602

off_04_8B7D:
.byte $04
.word off_04_9944
.word off_04_9DF9
.word off_04_A45A
.word off_04_A602

off_04_8B86:
.byte $04
.word off_04_9948
.word off_04_9DDA
.word off_04_A355
.word off_04_A810

off_04_8B8F:
.byte $02
.word off_04_9273
.word off_04_99CE
.word off_04_9E7C
.word off_04_A5DF

off_04_8B98:
.byte $04
.word off_04_994B
.word off_04_9DFD
.word off_04_A5A8
.word off_04_A602

off_04_8BA1:
.byte $02
.word off_04_986C
.word off_04_9C92
.word off_04_9E7C
.word off_04_A771

off_04_8BAA:
.byte $04
.word off_04_9953
.word off_04_99D2
.word off_04_9EC9
.word off_04_A602

off_04_8BB3:
.byte $04
.word off_04_919C
.word off_04_99D2
.word off_04_9EC9
.word off_04_A602

off_04_8BBC:
.byte $06
.word off_04_9897
.word off_04_99FA
.word off_04_A584
.word off_04_AC9E

off_04_8BC5:
.byte $05
.word off_04_9905
.word off_04_99D2
.word off_04_9FDA
.word off_04_A65C

off_04_8BCE:
.byte $04
.word off_04_995B
.word off_04_99D2
.word off_04_A45B
.word off_04_A5C5

off_04_8BD7:
.byte $04
.word off_04_9663
.word off_04_99D2
.word off_04_9EC9
.word off_04_A602

off_04_8BE0:
.byte $06
.word off_04_98A9
.word off_04_99FA
.word off_04_A57F
.word off_04_ACAF

off_04_8BE9:
.byte $04
.word off_04_996D
.word off_04_9DEE
.word off_04_9EC9
.word off_04_A602

off_04_8BF2:
.byte $04
.word off_04_9971
.word off_04_9DEE
.word off_04_9EC9
.word off_04_A602

off_04_8BFB:
.byte $04
.word off_04_9975
.word off_04_9DDB
.word off_04_9EC9
.word off_04_A602

off_04_8C04:
.byte $04
.word off_04_9978
.word off_04_9E05
.word off_04_A45B
.word off_04_A5C5

off_04_8C0D:
.byte $04
.word off_04_997C
.word off_04_9E08
.word off_04_A45B
.word off_04_A5C5

off_04_8C16:
.byte $04
.word off_04_9667
.word off_04_99D2
.word off_04_9EC9
.word off_04_A69E

off_04_8C1F:
.byte $04
.word off_04_9663
.word off_04_99D2
.word off_04_9EC9
.word off_04_AA19

off_04_8C28:
.byte $04
.word off_04_9980
.word off_04_99D2
.word off_04_A1A6
.word off_04_A5C5

off_04_8C31:
.byte $04
.word off_04_9984
.word off_04_9A00
.word off_04_A1A6
.word off_04_A5C5

off_04_8C3A:
.byte $04
.word off_04_990A
.word off_04_9DDB
.word off_04_9EC9
.word off_04_A602

off_04_8C43:
.byte $04
.word off_04_990E
.word off_04_9A02
.word off_04_A45A
.word off_04_A602

off_04_8C4C:
.byte $09
.word off_04_967E
.word off_04_9D4D
.word off_04_A3D3
.word off_04_AB33

off_04_8C55:
.byte $09
.word off_04_9675
.word off_04_9D5F
.word off_04_A3CC
.word off_04_AB2A

off_04_8C5E:
.byte $02
.word off_04_998E
.word off_04_99CE
.word off_04_A357
.word off_04_ACCD

off_04_8C67:
.byte $02
.word off_04_998E
.word off_04_99CE
.word off_04_A5B2
.word off_04_ACCB

off_04_8C70:
.byte $02
.word off_04_998E
.word off_04_99CE
.word off_04_A5B0
.word off_04_A5BD

off_04_8C79:
.byte $01
.word off_04_9384
.word off_04_99CE
.word off_04_9E23
.word off_04_A5C6

off_04_8C82:
.byte $01
.word off_04_9580
.word off_04_99CE
.word off_04_9E0F
.word off_04_A5C6

off_04_8C8B:
.byte $02
.word off_04_9990
.word off_04_9A01
.word off_04_9E7C
.word off_04_A799

off_04_8C94:
.byte $01
.word off_04_937F
.word off_04_99CE
.word off_04_9E0F
.word off_04_A8A4

off_04_8C9D:
.byte $01
.word off_04_9380
.word off_04_99CE
.word off_04_9E0F
.word off_04_A8A4

off_04_8CA6:
.byte $01
.word off_04_9382
.word off_04_99CE
.word off_04_9E0F
.word off_04_A8A4

off_04_8CAF:
.byte $01
.word off_04_9383
.word off_04_99CE
.word off_04_9E0F
.word off_04_A8A4

off_04_8CB8:
.byte $01
.word off_04_9381
.word off_04_99CE
.word off_04_9E0F
.word off_04_A8A4

off_04_8CC1:
.byte $01
.word off_04_90E5
.word off_04_99CE
.word off_04_9E5C
.word off_04_A5C6

off_04_8CCA:
.byte $01
.word off_04_95C6
.word off_04_99CE
.word off_04_9E5C
.word off_04_A5C6

off_04_8CD3:
.byte $0D
.word off_04_9314
.word off_04_99E6
.word off_04_A075
.word off_04_A816

off_04_8CDC:
.byte $0F
.word off_04_91FA
.word off_04_9AD7
.word off_04_9F5D
.word off_04_A6FE

off_04_8CE5:
.byte $0E
.word off_04_925B
.word off_04_9B19
.word off_04_9FBE
.word off_04_A75D

off_04_8CEE:
.byte $0E
.word off_04_923F
.word off_04_9B00
.word off_04_9FA2
.word off_04_A741

off_04_8CF7:
.byte $0D
.word off_04_92C6
.word off_04_9B80
.word off_04_A029
.word off_04_A7C8

off_04_8D00:
.byte $0E
.word off_04_9217
.word off_04_9AF2
.word off_04_9F7A
.word off_04_A719

off_04_8D09:
.byte $02
.word off_04_90AA
.word off_04_99CE
.word off_04_9E22
.word off_04_A5C8

off_04_8D12:
.byte $02
.word off_04_90A8
.word off_04_99CE
.word off_04_9E22
.word off_04_A5C8

off_04_8D1B:
.byte $02
.word off_04_9996
.word off_04_99CE
.word off_04_9E22
.word off_04_A5C8

off_04_8D24:
.byte $02
.word off_04_9994
.word off_04_99CE
.word off_04_9E22
.word off_04_A5C8

off_04_8D2D:
.byte $04
.word off_04_994F
.word off_04_99CC
.word off_04_A29C
.word off_04_A6B0

off_04_8D36:
.byte $01
.word off_04_9384
.word off_04_99CE
.word off_04_9E5C
.word off_04_A5C6

off_04_8D3F:
.byte $09
.word off_04_9726
.word off_04_99E8
.word off_04_A470
.word off_04_A91A

off_04_8D48:
.byte $09
.word off_04_971D
.word off_04_99E6
.word off_04_A470
.word off_04_A91A

off_04_8D51:
.byte $0B
.word off_04_941D
.word off_04_9B05
.word off_04_A173
.word off_04_A856

off_04_8D5A:
.byte $0B
.word off_04_941D
.word off_04_9B05
.word off_04_A173
.word off_04_A911

off_04_8D63:
.byte $09
.word off_04_9716
.word off_04_99E8
.word off_04_A469
.word off_04_ABC0

off_04_8D6C:
.byte $0B
.word off_04_9412
.word off_04_9A84
.word off_04_A168
.word off_04_A907

off_04_8D75:
.byte $04
.word off_04_995F
.word off_04_99CC
.word off_04_A29C
.word off_04_A6B0

off_04_8D7E:
.byte $04
.word off_04_9963
.word off_04_99CC
.word off_04_A29C
.word off_04_A6B0

off_04_8D87:
.byte $04
.word off_04_95A5
.word off_04_99CE
.word off_04_A29C
.word off_04_A602

off_04_8D90:
.byte $04
.word off_04_9965
.word off_04_99CE
.word off_04_A5AC
.word off_04_A602

off_04_8D99:
.byte $0E
.word off_04_9277
.word off_04_9B33
.word off_04_9FDA
.word off_04_A779

off_04_8DA2:
.byte $0E
.word off_04_9209
.word off_04_9AE4
.word off_04_9F6C
.word off_04_A70D

off_04_8DAB:
.byte $0F
.word off_04_91EB
.word off_04_9AC8
.word off_04_9F4E
.word off_04_A6F1

off_04_8DB4:
.byte $06
.word off_04_98BE
.word off_04_99FA
.word off_04_A298
.word off_04_A729

off_04_8DBD:
.byte $06
.word off_04_937F
.word off_04_99FA
.word off_04_A298
.word off_04_A729

off_04_8DC6:
.byte $06
.word off_04_98C4
.word off_04_99FA
.word off_04_A298
.word off_04_A729

off_04_8DCF:
.byte $06
.word off_04_98CA
.word off_04_99FA
.word off_04_A298
.word off_04_A729

off_04_8DD8:
.byte $06
.word off_04_98D0
.word off_04_99FA
.word off_04_A298
.word off_04_A729

off_04_8DE1:
.byte $06
.word off_04_98D6
.word off_04_99FA
.word off_04_A298
.word off_04_A729

off_04_8DEA:
.byte $06
.word off_04_98DC
.word off_04_99FA
.word off_04_A298
.word off_04_A729

off_04_8DF3:
.byte $06
.word off_04_98E2
.word off_04_99FA
.word off_04_A298
.word off_04_A729

off_04_8DFC:
.byte $06
.word off_04_98E8
.word off_04_99FA
.word off_04_A298
.word off_04_A729

off_04_8E05:
.byte $06
.word off_04_929F
.word off_04_99FA
.word off_04_A298
.word off_04_A729

off_04_8E0E:
.byte $06
.word off_04_98EE
.word off_04_99FA
.word off_04_A298
.word off_04_A729

off_04_8E17:
.byte $06
.word off_04_98F4
.word off_04_99FA
.word off_04_A298
.word off_04_A729

off_04_8E20:
.byte $06
.word off_04_98FA
.word off_04_99FA
.word off_04_A298
.word off_04_A729

off_04_8E29:
.byte $10
.word off_04_91DB
.word off_04_9AB8
.word off_04_9F3E
.word off_04_A6E4

off_04_8E32:
.byte $08
.word off_04_9773
.word off_04_9ABF
.word off_04_A4BB
.word off_04_ABF3

off_04_8E3B:
.byte $18
.word off_04_90C0
.word off_04_99B0
.word off_04_9E24
.word off_04_A5CC

off_04_8E44:
.byte $09
.word off_04_96F3
.word off_04_9D71
.word off_04_A445
.word off_04_AB9C

off_04_8E4D:
.byte $18
.word off_04_90A8
.word off_04_9998
.word off_04_9E0C
.word off_04_A5B4

off_04_8E56:
.byte $09
.word off_04_96D8
.word off_04_9D71
.word off_04_A42A
.word off_04_AB81

off_04_8E5F:
.byte $0E
.word off_04_9225
.word off_04_9998
.word off_04_9F88
.word off_04_A727

off_04_8E68:
.byte $0B
.word off_04_93FC
.word off_04_9998
.word off_04_A152
.word off_04_A8F1

off_04_8E71:
.byte $0E
.word off_04_9231
.word off_04_9998
.word off_04_9F94
.word off_04_A733

off_04_8E7A:
.byte $0B
.word off_04_93DB
.word off_04_9998
.word off_04_A131
.word off_04_A8D0

off_04_8E83:
.byte $0B
.word off_04_93D0
.word off_04_99E6
.word off_04_A126
.word off_04_A8C5

off_04_8E8C:
.byte $0B
.word off_04_93C5
.word off_04_99E6
.word off_04_A11B
.word off_04_A8BA

off_04_8E95:
.byte $08
.word off_04_97C3
.word off_04_99E8
.word off_04_A002
.word off_04_A68A

off_04_8E9E:
.byte $0B
.word off_04_93BA
.word off_04_99E8
.word off_04_A110
.word off_04_A8AF

off_04_8EA7:
.byte $0B
.word off_04_93AF
.word off_04_99E8
.word off_04_A105
.word off_04_A8A4

off_04_8EB0:
.byte $0B
.word off_04_94AC
.word off_04_99E8
.word off_04_A201
.word off_04_A8A4

off_04_8EB9:
.byte $10
.word off_04_91BB
.word off_04_9A9A
.word off_04_9F1E
.word off_04_A6C4

off_04_8EC2:
.byte $10
.word off_04_917B
.word off_04_9A5D
.word off_04_9EDF
.word off_04_A684

off_04_8ECB:
.byte $0C
.word off_04_9339
.word off_04_9A84
.word off_04_A09A
.word off_04_A838

off_04_8ED4:
.byte $0C
.word off_04_9345
.word off_04_9BC7
.word off_04_A0A6
.word off_04_A844

off_04_8EDD:
.byte $10
.word off_04_91CB
.word off_04_9AA8
.word off_04_9F2E
.word off_04_A6D4

off_04_8EE6:
.byte $10
.word off_04_918B
.word off_04_9A6D
.word off_04_9EEF
.word off_04_A694

off_04_8EEF:
.byte $0A
.word off_04_95A5
.word off_04_99E8
.word off_04_A2FC
.word off_04_A688

off_04_8EF8:
.byte $12
.word off_04_90ED
.word off_04_99D8
.word off_04_9E51
.word off_04_A5F9

off_04_8F01:
.byte $11
.word off_04_916A
.word off_04_9A4E
.word off_04_9ECE
.word off_04_A675

off_04_8F0A:
.byte $0A
.word off_04_9569
.word off_04_99E8
.word off_04_A2C0
.word off_04_AA3D

off_04_8F13:
.byte $0A
.word off_04_9555
.word off_04_9A0C
.word off_04_A2AC
.word off_04_AA29

off_04_8F1C:
.byte $0A
.word off_04_954B
.word off_04_9A0C
.word off_04_A2A2
.word off_04_AA1F

off_04_8F25:
.byte $0A
.word off_04_9541
.word off_04_9BF9
.word off_04_A298
.word off_04_AA15

off_04_8F2E:
.byte $0A
.word off_04_9507
.word off_04_9BF9
.word off_04_A25C
.word off_04_A9DD

off_04_8F37:
.byte $09
.word off_04_972F
.word off_04_9A0D
.word off_04_A478
.word off_04_ABC9

off_04_8F40:
.byte $0B
.word off_04_94A1
.word off_04_9C86
.word off_04_A1F6
.word off_04_A98F

off_04_8F49:
.byte $0B
.word off_04_9496
.word off_04_9C7D
.word off_04_A1EC
.word off_04_A985

off_04_8F52:
.byte $0B
.word off_04_948B
.word off_04_9C73
.word off_04_A1E1
.word off_04_A97A

off_04_8F5B:
.byte $0A
.word off_04_94CB
.word off_04_99E6
.word off_04_A220
.word off_04_A9AE

off_04_8F64:
.byte $0A
.word off_04_94C1
.word off_04_9C9B
.word off_04_A216
.word off_04_A9A4

off_04_8F6D:
.byte $08
.word off_04_987B
.word off_04_99D3
.word off_04_A216
.word off_04_A5FE

off_04_8F76:
.byte $08
.word off_04_97A3
.word off_04_9A15
.word off_04_A216
.word off_04_AC03

off_04_8F7F:
.byte $08
.word off_04_9833
.word off_04_9A15
.word off_04_A216
.word off_04_AC03

off_04_8F88:
.byte $0B
.word off_04_9480
.word off_04_9C68
.word off_04_A1D6
.word off_04_A96F

off_04_8F91:
.byte $0D
.word off_04_92FA
.word off_04_9B5B
.word off_04_A05B
.word off_04_A7FC

off_04_8F9A:
.byte $0D
.word off_04_929F
.word off_04_9B5B
.word off_04_A002
.word off_04_A7A1

off_04_8FA3:
.byte $0A
.word off_04_957D
.word off_04_9A0C
.word off_04_A2D4
.word off_04_AA51

off_04_8FAC:
.byte $0A
.word off_04_95AF
.word off_04_9CFB
.word off_04_A306
.word off_04_AA79

off_04_8FB5:
.byte $0A
.word off_04_95F5
.word off_04_9BF8
.word off_04_A34A
.word off_04_AABB

off_04_8FBE:
.byte $09
.word off_04_974A
.word off_04_9D8C
.word off_04_A493
.word off_04_A9AE

off_04_8FC7:
.byte $0B
.word off_04_9433
.word off_04_9C2B
.word off_04_A189
.word off_04_A922

off_04_8FD0:
.byte $0B
.word off_04_943E
.word off_04_9C35
.word off_04_A194
.word off_04_A92D

off_04_8FD9:
.byte $0D
.word off_04_9285
.word off_04_9B41
.word off_04_9FE8
.word off_04_A787

off_04_8FE2:
.byte $0C
.word off_04_935B
.word off_04_9BD1
.word off_04_A0BE
.word off_04_A85C

off_04_8FEB:
.byte $11
.word off_04_9159
.word off_04_9A3D
.word off_04_9EBD
.word off_04_A664

off_04_8FF4:
.byte $12
.word off_04_9147
.word off_04_9A2D
.word off_04_9EAB
.word off_04_A652

off_04_8FFD:
.byte $0B
.word off_04_9449
.word off_04_9C3F
.word off_04_A19F
.word off_04_A938

off_04_9006:
.byte $0B
.word off_04_945F
.word off_04_9C52
.word off_04_A1B5
.word off_04_A94E

off_04_900F:
.byte $0C
.word off_04_932D
.word off_04_9BBC
.word off_04_A08E
.word off_04_A82E

off_04_9018:
.byte $0E
.word off_04_9269
.word off_04_9B27
.word off_04_9FCC
.word off_04_A76B

off_04_9021:
.byte $15
.word off_04_90D8
.word off_04_99C8
.word off_04_9E3C
.word off_04_A5E4

off_04_902A:
.byte $12
.word off_04_9123
.word off_04_9A0C
.word off_04_9E87
.word off_04_A62E

off_04_9033:
.byte $06
.word off_04_989D
.word off_04_99FA
.word off_04_A58A
.word off_04_ACA4

off_04_903C:
.byte $05
.word off_04_9900
.word off_04_99D2
.word off_04_A470
.word off_04_A811

off_04_9045:
.byte $12
.word off_04_90FF
.word off_04_99E8
.word off_04_9E63
.word off_04_A60A

off_04_904E:
.byte $12
.word off_04_9135
.word off_04_9A1E
.word off_04_9E99
.word off_04_A640

off_04_9057:
.byte $10
.word off_04_919B
.word off_04_9A7D
.word off_04_9EFE
.word off_04_A6A4

off_04_9060:
.byte $10
.word off_04_91AB
.word off_04_9A8D
.word off_04_9F0E
.word off_04_A6B4

off_04_9069:
.byte $07
.word off_04_9883
.word off_04_99E8
.word off_04_A570
.word off_04_AC83

off_04_9072:
.byte $08
.word off_04_97B3
.word off_04_99E8
.word off_04_9EBD
.word off_04_AC13

off_04_907B:
.byte $0B
.word off_04_93E6
.word off_04_9C19
.word off_04_A13C
.word off_04_A8DB

off_04_9084:
.byte $08
.word off_04_978B
.word off_04_99D3
.word off_04_A3BA
.word off_04_A5FE

off_04_908D:
.byte $08
.word off_04_9863
.word off_04_9A14
.word off_04_A55B
.word off_04_AC2B

off_04_9096:
.byte $09
.word off_04_9741
.word off_04_9D83
.word off_04_A48A
.word off_04_ABD2

off_04_909F:
.byte $08
.word off_04_9813
.word off_04_99D3
.word off_04_A51F
.word off_04_A5FE

off_04_90A8:
.byte $40,$41

off_04_90AA:
.byte $42,$43,$50,$51,$52,$53,$54,$60,$61,$62,$63,$64,$70,$72,$73,$72,$46,$47,$46,$46,$48,$48

off_04_90C0:
.byte $51,$52,$53,$54,$60,$61,$62,$63,$64,$70,$71,$72,$73,$72,$40,$41,$42,$43,$50,$45,$45,$45,$48,$48

off_04_90D8:
.byte $08,$09,$18,$19,$28,$29,$27,$37,$38,$39,$3A,$0C,$0D

off_04_90E5:
.byte $0E,$0F,$1A,$1B,$2A

off_04_90EA:
.byte $2B,$0B,$0A

off_04_90ED:
.byte $11,$12,$21,$22,$13,$14,$15,$23,$24,$33,$34,$30,$31,$09,$0A,$37,$00,$01

off_04_90FF:
.byte $40,$41,$42,$40,$50,$53,$51,$52,$60,$61,$70,$71,$72,$73,$75,$76,$77,$43

off_04_9111:
.byte $CE,$CF,$DE,$DF,$EE,$EF,$FE,$FF,$CF,$DF,$EF,$FF,$CE,$DE,$EE,$FE,$D5,$D5

off_04_9123:
.byte $24,$25,$26,$34,$35,$36,$08,$09,$27,$37,$0A,$38,$39,$07,$17,$0C,$0D,$0E

off_04_9135:
.byte $40,$40,$41,$42,$53,$50,$51,$52,$60,$61,$70,$71,$72,$73,$75,$76,$77,$43

off_04_9147:
.byte $4E,$4F,$4B,$5C,$5D,$5E,$5F,$6F,$7F,$7E,$6A,$6B,$7A,$7B,$5B,$47,$48,$49

off_04_9159:
.byte $5C,$5D,$5E,$5F,$6C,$6D,$6E,$6F,$7C,$7D,$7E,$7F,$4E,$4F,$4C,$4D,$4B

off_04_916A:
.byte $12,$21,$22,$25,$26,$35,$36,$14,$23,$33,$13,$34,$30,$31,$09,$0A,$37

off_04_917B:
.byte $43,$44,$02,$03,$53,$54,$40,$41,$42,$50,$51,$52,$2F,$2E,$64,$0F

off_04_918B:
.byte $4B,$4C,$5B,$1F,$2E,$2F,$EC,$ED,$4C,$4B,$1F,$5B,$2F,$2E,$EA,$EB

off_04_919B:
.byte $E8

off_04_919C:
.byte $E9,$EA,$F9,$FA,$D3,$C3,$D3,$E3,$E2,$30,$30,$31,$31,$E1,$63

off_04_91AB:
.byte $E8,$E9,$EA,$C3,$D3,$F9,$FA,$D3,$E1,$63

off_04_91B5:
.byte $E2,$E3,$F2,$F2,$F3,$F3

off_04_91BB:
.byte $1F,$2E,$2F,$1F,$2F,$2E,$4B,$5B,$4C,$4C,$4B,$5B,$EA,$EB,$EC,$ED

off_04_91CB:
.byte $44,$54,$43,$53,$42,$52,$2E,$51,$2F,$50,$60,$61,$00,$01,$64,$0F

off_04_91DB:
.byte $00,$01,$02,$03,$10,$11,$12,$13,$14,$20,$21,$22,$23,$24,$32,$33

off_04_91EB:
.byte $6D,$7D,$7D,$4C,$5C,$6C,$6D,$6F,$7F,$4C,$5E,$5E,$4F,$5F,$4E

off_04_91FA:
.byte $00,$01,$0A,$18,$19,$1A,$28,$37,$17,$27,$29,$38,$39,$EA,$EA

off_04_9209:
.byte $4C,$4C,$5C,$5C,$6C,$6D,$6D,$6C,$7D,$7D,$4E,$5E,$4E,$5E

off_04_9217:
.byte $2A,$3A,$3B,$3C,$22,$29,$38,$39,$00,$01,$2D,$3D,$0F,$37

off_04_9225:
.byte $66,$67,$68,$69,$6A,$77,$78,$79,$7A,$56,$57,$58

off_04_9231:
.byte $5B,$5C,$56,$57,$58,$66,$67,$68,$69,$6A,$49,$4A,$4B,$4B

off_04_923F:
.byte $06,$06,$32,$33,$12,$13,$14,$15,$23,$24,$25,$26,$38,$39

off_04_924D:
.byte $29,$3B,$3C,$02,$03,$46,$56,$60,$08,$18,$7F,$7E,$7C,$7D

off_04_925B:
.byte $06,$06,$32,$33,$34,$35,$36,$15,$23,$24,$25,$38,$26,$39

off_04_9269:
.byte $EE,$EF,$FE,$FF,$DC,$DD,$EB,$EC,$ED,$FB

off_04_9273:
.byte $FC,$FD,$58,$59

off_04_9277:
.byte $4C,$4D,$5C,$5D,$6C,$6D,$7D,$4D,$5D,$6D,$7D,$4C,$5C,$6C

off_04_9285:
.byte $D3,$D4,$D5,$FC,$FD,$2D,$2E,$2F,$3D,$3E,$3F,$3C

off_04_9291:
.byte $2C

off_04_9292:
.byte $41,$51,$52,$47,$48,$70,$71,$72,$08,$18,$08,$18,$41

off_04_929F:
.byte $A9,$AA,$AB,$B9,$BA,$BB,$30,$31,$8C,$8D,$00,$01,$8E

off_04_92AC:
.byte $F0,$F1,$F2,$63,$62,$30,$31,$EA,$EA,$01,$E5,$E5,$00

off_04_92B9:
.byte $40,$50,$47,$48,$3D,$3E,$3F,$40,$50,$4F,$4F,$6F,$49

off_04_92C6:
.byte $00,$01,$0C,$0D,$1B,$1C,$1D,$0F,$0B,$1F,$26,$38,$37

off_04_92D3:
.byte $41,$41,$51,$52,$47,$48,$70,$71,$72,$46,$56,$46,$56

off_04_92E0:
.byte $F0,$F1,$F2,$80,$81,$95,$91,$60,$E5,$E5,$00,$01,$FD

off_04_92ED:
.byte $4A,$16,$66,$5A,$65,$3B,$3C,$08,$18,$08,$18,$02,$03

off_04_92FA:
.byte $30,$31,$89,$8A,$8B,$99,$9A,$9B,$9C,$9D,$00,$01,$9E

off_04_9307:
.byte $E2,$00,$01,$C6,$F5,$F6,$F7,$95,$80,$81,$91,$60,$FD

off_04_9314:
.byte $00,$01,$08,$09,$28,$38,$17,$27,$2F,$3F,$3E,$26,$39

off_04_9321:
.byte $00,$01,$14,$26,$80,$91,$15,$11,$60,$81,$25,$95

off_04_932D:
.byte $30,$31,$CE,$CF,$DE,$DF,$58,$59,$68,$69,$78,$79

off_04_9339:
.byte $28,$29,$33,$34,$2B,$2C,$1D,$2D,$1D,$3D,$00,$01

off_04_9345:
.byte $0D,$2F,$2E,$2C,$3C,$3B,$1D,$1D,$3D,$2D

off_04_934F:
.byte $00,$01,$4C,$4D,$4E,$7C,$7D,$5C,$5D,$7E,$60,$7F

off_04_935B:
.byte $C3,$C4,$C5,$FC,$FD,$0B,$0C,$3C,$3D,$0F,$1C,$3B

off_04_9367:
.byte $08,$02,$03,$58,$18,$69,$57,$68,$79,$67,$78,$77

off_04_9373:
.byte $62,$80,$91,$60,$96,$00,$32,$33,$06,$77,$81,$95

off_04_937F:
.byte $C0

off_04_9380:
.byte $C1

off_04_9381:
.byte $C2

off_04_9382:
.byte $D0

off_04_9383:
.byte $D1

off_04_9384:
.byte $D2,$80,$FD,$91,$60,$95,$81

off_04_938B:
.byte $C7,$C8,$C9,$D7,$D8,$D2,$80,$FD,$91,$60,$95,$81

off_04_9397:
.byte $4A,$65,$66,$16,$5A,$F5,$F6,$F7,$E2,$00,$01,$C6

off_04_93A3:
.byte $08,$02,$03,$08,$18,$3B,$3C,$18,$30,$31,$63,$62

off_04_93AF:
.byte $0B,$0C,$1B,$1C,$38,$39,$3A,$03,$E2,$02,$2A

off_04_93BA:
.byte $28,$29,$33,$34,$18,$19,$1A,$08,$00,$01,$0A

off_04_93C5:
.byte $00,$01,$13,$14,$12,$22,$32,$10,$11,$20,$21

off_04_93D0:
.byte $00,$01,$13,$14,$23,$24,$33,$34,$12,$22,$32

off_04_93DB:
.byte $5D,$59,$5A,$6B,$6C,$6D,$7E,$6F,$7D,$4D,$4C

off_04_93E6:
.byte $F0,$F1,$F2,$E5,$00,$01,$63,$62,$30,$31,$E5

off_04_93F1:
.byte $09,$0A,$38,$39,$28,$19,$1A,$00,$01,$5E,$5F

off_04_93FC:
.byte $6B,$6C,$6D,$7B,$7C,$7D,$59,$5A,$5D,$76,$6E

off_04_9407:
.byte $4A,$65,$66,$16,$C7,$C8,$D7,$D8,$C9,$D2,$5A

off_04_9412:
.byte $72,$73,$70,$71,$69,$6A,$7A,$5B,$5B,$6B,$7B

off_04_941D:
.byte $55,$56,$57,$65,$66,$67,$74,$75,$76,$54,$77

off_04_9428:
.byte $E2,$01,$F5,$F6,$F7,$63,$62,$30,$31,$C6,$00

off_04_9433:
.byte $B3,$E0,$E1,$C0,$C1,$C2,$D0,$D1,$D2,$B3,$2C

off_04_943E:
.byte $D6,$D7,$D8,$E6,$E7,$E8,$F8,$B3,$C7,$C8,$2C

off_04_9449:
.byte $4B,$44,$45,$46,$54,$55,$56,$64,$74,$64,$74

off_04_9454:
.byte $16,$77,$96,$00,$4A,$5A,$32,$33,$06,$66,$65

off_04_945F:
.byte $4B,$46,$56,$45,$55,$44,$54,$64,$74,$64,$74

off_04_946A:
.byte $00,$01,$45,$46,$47,$55,$56,$57,$91,$60,$64

off_04_9475:
.byte $43,$44,$53,$54,$41,$64,$64,$70,$71,$72,$41

off_04_9480:
.byte $7B,$7C,$60,$60,$70,$61,$71,$6B,$6C,$4D,$4D

off_04_948B:
.byte $31,$30,$21,$22,$11,$12,$20,$50,$51,$52,$72

off_04_9496:
.byte $32,$12,$21,$22,$30,$31,$27,$10,$11,$64,$4E

off_04_94A1:
.byte $46,$55,$56,$57,$67,$30,$31,$78,$5D,$5E,$4F

off_04_94AC:
.byte $0B,$0C,$1B,$1C,$18,$19,$1A,$08,$00,$01,$0A

off_04_94B7:
.byte $1B,$03,$02,$60,$1C,$0C,$2A,$1A,$95,$A6

off_04_94C1:
.byte $4B,$4C,$5B,$5C,$58,$59,$68,$69,$6A,$7D

off_04_94CB:
.byte $50,$51,$11,$12,$20,$21,$22,$30,$31,$52

off_04_94D5:
.byte $44,$53,$54,$60,$95,$43,$02,$03,$36,$A2

off_04_94DF:
.byte $44,$54,$64,$60,$02,$03,$43,$53,$36,$A2

off_04_94E9:
.byte $C8,$C9,$E5,$D8,$D9,$DA,$04,$05,$C7,$E6

off_04_94F3:
.byte $63,$30,$31,$C0,$C1,$C2,$D0,$D1,$D2,$62

off_04_94FD:
.byte $63,$30,$31,$C7,$C8,$D7,$D8,$C9,$D2,$62

off_04_9507:
.byte $19,$1A,$1B,$28,$39,$3A,$29,$2A

off_04_950F:
.byte $02,$03,$1A,$1B,$80,$91,$61,$60,$92,$A6

off_04_9519:
.byte $30,$31,$D6,$D9,$DA,$FA,$FB,$FC,$E0,$E1

off_04_9523:
.byte $D9,$DA,$D6,$FA,$FB,$FC,$30,$31,$E0,$E1

off_04_952D:
.byte $71,$72,$77,$62,$63,$96,$00,$32,$33,$06

off_04_9537:
.byte $70,$95,$77,$62,$63,$96,$33,$32,$06,$00

off_04_9541:
.byte $19,$1A,$1B,$28,$29,$2A,$39,$3A,$02,$03

off_04_954B:
.byte $21,$22,$27,$08,$06,$07,$30,$31,$04,$05

off_04_9555:
.byte $12,$21,$22,$17,$18,$27,$30,$31,$00,$01

off_04_955F:
.byte $E5,$E6,$77,$62,$63,$32,$33,$C6,$D6,$32

off_04_9569:
.byte $21,$22,$06,$07,$30,$31,$04,$05,$38,$2B

off_04_9573:
.byte $03,$0B,$0C,$1B,$1C,$5E,$5F,$02,$08,$18

off_04_957D:
.byte $90,$91,$A0

off_04_9580:
.byte $A1,$92,$A2,$B0,$B3,$80,$81

off_04_9587:
.byte $03,$0B,$0C,$1C,$02,$30,$31,$1B,$46,$56

off_04_9591:
.byte $14,$24,$25,$26,$00,$01,$15,$11,$95,$34

off_04_959B:
.byte $03,$0B,$0C,$1C,$02,$1B,$5E,$5F,$46,$56

off_04_95A5:
.byte $00,$01,$10,$11,$12,$20,$21,$22,$30,$31

off_04_95AF:
.byte $86,$87,$88,$96,$97,$98,$82,$83,$B3,$B3

off_04_95B9:
.byte $02,$03,$0B,$28,$11,$17,$26,$97,$B3,$B4

off_04_95C3:
.byte $30,$31,$1D

off_04_95C6:
.byte $1E,$1F,$2D,$2E,$2F,$00,$01

off_04_95CD:
.byte $02,$03,$1B,$0C,$1C,$1A,$2A,$60,$95,$A6

off_04_95D7:
.byte $04,$05,$3A,$3B,$40,$41,$50,$51,$60,$61

off_04_95E1:
.byte $4E,$5C,$5D,$63,$6D,$6E,$00,$01,$0D,$0E

off_04_95EB:
.byte $00,$01,$4C,$4D,$4E,$6B,$6C,$5D,$7F,$7E

off_04_95F5:
.byte $B3,$84,$85,$93,$94,$95,$A3,$A4,$A5,$A8

off_04_95FF:
.byte $CC,$DC,$EC,$DD,$ED,$CC,$DC,$EC,$CA,$CB

off_04_9609:
.byte $43,$44,$03,$64,$60,$02,$42,$54,$1C,$53

off_04_9613:
.byte $30,$31,$77,$62,$63,$33,$32,$06,$96,$00

off_04_961D:
.byte $02,$03,$1B,$13,$1A,$2A,$A6,$70,$95

off_04_9626:
.byte $83,$84,$13,$93,$A8,$34,$64

off_04_962D:
.byte $02,$03,$60,$95,$1A,$11,$A6,$2A,$36

off_04_9636:
.byte $17,$B5,$09,$0A,$0B,$A5,$A4,$02,$A7

off_04_963F:
.byte $30,$31,$13,$00,$01,$E3,$E4,$F3,$F4

off_04_9648:
.byte $35,$38,$82,$0F,$36,$92,$A6,$61,$60

off_04_9651:
.byte $40,$41,$36,$50,$51,$60,$95,$79,$79

off_04_965A:
.byte $A4,$0A,$02,$09,$A7,$0B,$17,$A5,$B5

off_04_9663:
.byte $C6,$C7,$D6,$D7

off_04_9667:
.byte $C8,$C9,$D8,$D9,$DA

off_04_966C:
.byte $60,$94,$64,$0F,$38,$35,$B6,$36,$93

off_04_9675:
.byte $F8,$F9,$FA,$FB,$FA,$F8,$F8,$F8,$F9

off_04_967E:
.byte $E5,$E6,$E7,$F5,$F6,$F7,$E8,$E9,$EA

off_04_9687:
.byte $12,$13,$14,$22,$23,$24,$32,$33,$34

off_04_9690:
.byte $15,$17,$25,$26,$27,$35,$36,$37,$61

off_04_9699:
.byte $14,$24,$34,$33,$23,$13,$12,$22,$32

off_04_96A2:
.byte $15,$25,$35,$17,$27,$37,$36,$26,$61

off_04_96AB:
.byte $02,$03,$1B,$A6,$71,$72,$13,$1A,$2A

off_04_96B4:
.byte $40,$41,$51,$60,$04,$05,$36,$50,$61

off_04_96BD:
.byte $10,$11,$21,$16,$2B,$00,$01,$66,$65

off_04_96C6:
.byte $02,$03,$36,$60,$95,$1A,$11,$2A,$A6

off_04_96CF:
.byte $60,$83,$84,$93,$94,$02,$03,$64,$3B

off_04_96D8:
.byte $42,$44,$55,$74,$65,$75,$70,$47,$46

off_04_96E1:
.byte $36,$03,$02,$26,$A0,$27,$37,$28,$11

off_04_96EA:
.byte $35,$38,$60,$0F,$82,$36,$92,$95,$A6

off_04_96F3:
.byte $42,$44,$55,$65,$74,$75,$70,$71,$45

off_04_96FC:
.byte $1B,$61,$34,$13,$1A,$2A,$A6,$02

off_04_9704:
.byte $03,$64,$02,$FC,$FD,$FB,$EA,$FA,$0A

off_04_970D:
.byte $58,$68,$48,$67,$A2,$59,$69,$6A,$49

off_04_9716:
.byte $58,$68,$59,$78,$79,$60,$70

off_04_971D:
.byte $52,$53,$60,$61,$64,$70,$71,$72,$73

off_04_9726:
.byte $50,$51,$60,$61,$64,$70,$71,$72,$73

off_04_972F:
.byte $53,$54,$39,$3A,$49,$77,$6D,$02,$03

off_04_9738:
.byte $00,$01,$10,$11,$12,$95,$60,$91,$A6

off_04_9741:
.byte $02,$03,$12,$13,$22,$23,$30,$31,$33

off_04_974A:
.byte $A6,$A7,$B6,$B7,$B4,$B5,$B2,$B0,$B3

off_04_9753:
.byte $B8,$B1,$B2,$04,$05,$A2,$B0,$75

off_04_975B:
.byte $04,$05,$40,$41,$50,$51,$34,$95

off_04_9763:
.byte $29,$39,$B8,$88,$89,$99,$9A,$8A

off_04_976B:
.byte $85,$86,$3E,$3D,$0B,$17,$87,$3F

off_04_9773:
.byte $15,$16,$25,$26,$04,$05,$30,$31

off_04_977B:
.byte $00,$01,$10,$11,$21,$12,$95,$91

off_04_9783:
.byte $40,$41,$50,$51,$60,$61,$04,$05

off_04_978B:
.byte $00,$01,$10,$11,$20,$21,$30,$31

off_04_9793:
.byte $10,$11,$20,$21,$71,$72,$00,$01

off_04_979B:
.byte $10,$11,$20,$70,$A6,$95,$00,$01

off_04_97A3:
.byte $75,$76,$6B,$6C,$7B,$7C,$79,$7A

off_04_97AB:
.byte $0A,$09,$19,$18,$02,$17,$08,$0B

off_04_97B3:
.byte $E4,$E5,$E6,$E7

off_04_97B7:
.byte $F4,$F5,$F6,$F7

off_04_97BB:
.byte $30,$31,$E3,$E4,$F3,$F4,$E6,$E7

off_04_97C3:
.byte $25,$26,$27,$35,$36,$37,$15,$17

off_04_97CB:
.byte $02,$19,$18,$3C,$0A,$09,$08,$2C

off_04_97D3:
.byte $30,$31

off_04_97D5:
.byte $E8,$E9,$F8,$F9,$E6,$E7

off_04_97DB:
.byte $31,$30,$2A,$1B,$1A,$03,$02,$A6

off_04_97E3:
.byte $85,$87,$3F,$17,$0B,$3D,$3E,$86

off_04_97EB:
.byte $00,$01,$11,$20,$21,$31,$30,$90

off_04_97F3:
.byte $0D,$0E,$1D,$1E,$00,$01,$1F,$47

off_04_97FB:
.byte $2C,$2D,$2E,$2F,$3C,$3D,$3E,$3F

off_04_9803:
.byte $10,$11,$20,$21,$30,$31,$00,$01

off_04_980B:
.byte $30,$31,$02,$03,$1A,$1B,$2A,$A6

off_04_9813:
.byte $04,$05,$14,$15,$20,$21,$30,$31

off_04_981B:
.byte $2C,$08,$09,$0A,$3C,$18,$19,$02

off_04_9823:
.byte $22,$23,$22,$23,$A3,$A3,$98,$98

off_04_982B:
.byte $0A,$09,$08,$18,$19,$02,$17,$0B

off_04_9833:
.byte $73,$74,$6B,$6C,$7B,$7C,$79,$7A

off_04_983B:
.byte $C3,$C4,$D3,$D4,$C7,$D7,$D6,$C6

off_04_9843:
.byte $96,$B8,$B0,$B1,$B2,$75,$B9,$04

off_04_984B:
.byte $00,$01,$10,$11,$20,$34,$A6,$95

off_04_9853:
.byte $02,$03,$1A,$1B,$2A,$A6,$70,$95

off_04_985B:
.byte $C3,$D3,$C4,$D4,$C7,$D7,$D6,$C6

off_04_9863:
.byte $00,$01,$11,$20,$21,$30,$31,$32

off_04_986B:
.byte $FC

off_04_986C:
.byte $FD,$FC,$FD,$C7,$D7,$D6,$C6

off_04_9873:
.byte $11,$20,$21,$30,$31,$90,$00,$01

off_04_987B:
.byte $4B,$4C,$5B,$5C,$6B,$6C,$7B,$7C

off_04_9883:
.byte $E4,$E5,$F4,$F5,$E0,$F8,$D9

off_04_988A:
.byte $C3,$C4,$D3,$D4,$C3,$D3,$C5

off_04_9891:
.byte $CA,$CA,$C3,$C4,$D3,$D4

off_04_9897:
.byte $E0,$F2,$F3,$F4,$E2,$E1

off_04_989D:
.byte $1C,$1D,$1E,$1F,$3C,$2C

off_04_98A3:
.byte $C6,$C7,$D6,$D7,$CA,$DA

off_04_98A9:
.byte $D8,$D9,$DA,$C8,$C9,$C6

off_04_98AF:
.byte $C8,$D8,$CA

off_04_98B2:
.byte $C9,$D9,$DA,$C8,$D8,$CA

off_04_98B8:
.byte $E8,$E9,$F8,$F9,$CA,$CA

off_04_98BE:
.byte $A0,$A1,$A2,$B0,$B1,$B2

off_04_98C4:
.byte $E0,$E1,$E2,$F0,$F1,$F2

off_04_98CA:
.byte $A3,$A4,$A5,$B3,$B4,$B5

off_04_98D0:
.byte $C3,$C4,$C5,$D3,$D4,$D5

off_04_98D6:
.byte $E3,$E4,$E5,$F3,$F4,$F5

off_04_98DC:
.byte $A6,$A7,$A8,$B6,$B7,$B8

off_04_98E2:
.byte $C6,$C7,$C8,$D6,$D7,$D8

off_04_98E8:
.byte $E6,$E7,$E8,$F6,$F7,$F8

off_04_98EE:
.byte $C9,$CA,$CB,$D9,$DA,$DB

off_04_98F4:
.byte $E9,$EA,$EB,$F9,$FA,$FB

off_04_98FA:
.byte $EC,$ED,$EE,$FC,$FD,$FE

off_04_9900:
.byte $2D,$2E,$3D,$3E,$2F

off_04_9905:
.byte $E0,$E1,$F0,$F1,$E2

off_04_990A:
.byte $F4,$E4,$F4,$E4

off_04_990E:
.byte $E3,$E2,$F2,$F3

off_04_9912:
.byte $D8,$D8,$D8,$D8

off_04_9916:
.byte $D9,$D9,$D9,$D9

off_04_991A:
.byte $C8,$C9,$C9,$C9

off_04_991E:
.byte $DA,$DA,$DA,$C8

off_04_9922:
.byte $FA,$FB,$FA,$FB

off_04_9926:
.byte $F4,$F4

off_04_9928:
.byte $F5,$F5,$F4,$F4

off_04_992C:
.byte $E7,$F7,$E1,$F3

off_04_9930:
.byte $E6,$E7,$F6,$F7

off_04_9934:
.byte $E8,$E7,$F8,$F7

off_04_9938:
.byte $C5,$C5,$D5,$D5

off_04_993C:
.byte $E2,$E3,$F2,$F3

off_04_9940:
.byte $F1,$F0,$E0,$E1

off_04_9944:
.byte $F3,$F2,$E2,$E3

off_04_9948:
.byte $FB,$F9,$FA

off_04_994B:
.byte $FA,$FB,$FA,$F9

off_04_994F:
.byte $46,$47,$00,$01

off_04_9953:
.byte $E3,$E4,$CA,$FB

off_04_9957:
.byte $F2,$F2,$E2,$E3

off_04_995B:
.byte $E8,$FA,$E9,$F9

off_04_995F:
.byte $48,$49,$00,$01

off_04_9963:
.byte $4A,$4B

off_04_9965:
.byte $00,$01,$11,$90

off_04_9969:
.byte $EA,$F3,$E5,$CA

off_04_996D:
.byte $E5,$E5,$E5,$E5

off_04_9971:
.byte $F5,$F5,$F5,$F5

off_04_9975:
.byte $E6,$E7,$E6

off_04_9978:
.byte $E7,$E7,$F6,$F7

off_04_997C:
.byte $E7,$E7,$FC,$FC

off_04_9980:
.byte $CA,$DA,$FC,$FD

off_04_9984:
.byte $E1,$F1,$E1,$F1

off_04_9988:
.byte $E4,$E5,$D2

off_04_998B:
.byte $E6,$E9,$EA

off_04_998E:
.byte $C2,$C2

off_04_9990:
.byte $B7,$B7

off_04_9992:
.byte $E4,$E4

off_04_9994:
.byte $41,$45

off_04_9996:
.byte $44,$41

off_04_9998:
.byte $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$02,$02,$02,$42,$02,$02,$02,$42,$42,$02

off_04_99B0:
.byte $03,$03,$03,$03,$03,$03,$03,$03,$03,$02,$02,$02,$02,$42,$03,$03,$03,$03,$03,$02,$02,$42,$42,$02

off_04_99C8:
.byte $01

off_04_99C9:
.byte $01

off_04_99CA:
.byte $01,$01

off_04_99CC:
.byte $01,$01

off_04_99CE:
.byte $00,$00,$01,$01

off_04_99D2:
.byte $00

off_04_99D3:
.byte $00,$00,$00,$00,$01

off_04_99D8:
.byte $01,$01,$01,$01,$00,$00,$00,$00,$01,$00,$01,$01,$01,$00

off_04_99E6:
.byte $00,$00

off_04_99E8:
.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01

off_04_99F2:
.byte $01,$01,$01,$01,$01,$01,$01

off_04_99F9:
.byte $40

off_04_99FA:
.byte $00,$00,$00,$00,$00

off_04_99FF:
.byte $00

off_04_9A00:
.byte $00

off_04_9A01:
.byte $00

off_04_9A02:
.byte $40,$40,$40,$40,$40,$40,$40,$40,$00,$40

off_04_9A0C:
.byte $01

off_04_9A0D:
.byte $01,$01,$01,$01,$01,$01,$01

off_04_9A14:
.byte $00

off_04_9A15:
.byte $00,$00,$01,$01,$01,$01,$00,$00,$00

off_04_9A1E:
.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

off_04_9A2C:
.byte $01

off_04_9A2D:
.byte $01,$01,$00,$01,$01,$01,$01,$00,$01,$00,$01,$01,$01,$01,$01,$01

off_04_9A3D:
.byte $00,$01,$01,$01,$01,$00,$00,$00,$01,$00,$00,$01,$01,$01,$01,$01,$00

off_04_9A4E:
.byte $01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,$01,$01,$01,$00

off_04_9A5D:
.byte $00,$00,$01,$01,$00,$00,$01,$01,$01,$00,$01,$01,$41,$41,$00,$00

off_04_9A6D:
.byte $01,$01,$01,$01,$01,$01,$00,$00,$41,$41,$41,$41,$41,$41,$40,$40

off_04_9A7D:
.byte $01,$01,$01,$01,$01,$C1,$01

off_04_9A84:
.byte $01,$01,$01,$01

off_04_9A88:
.byte $01,$01,$01,$01,$41

off_04_9A8D:
.byte $01,$01,$01,$01,$C1,$01,$01,$01,$01,$41,$01,$01,$01

off_04_9A9A:
.byte $01,$01,$01,$41,$41,$41,$01,$01,$01,$41,$41,$41,$00,$00

off_04_9AA8:
.byte $40,$40,$40,$40,$41,$41,$01,$41,$01,$40,$01,$01,$41,$41,$40,$00

off_04_9AB8:
.byte $03,$03,$03,$03,$02,$02,$02

off_04_9ABF:
.byte $02,$02,$03,$03,$03,$03,$03,$03,$03

off_04_9AC8:
.byte $41,$01,$41,$00,$00,$00,$01,$00,$00,$40,$01,$41,$40,$40,$40

off_04_9AD7:
.byte $00,$00,$01,$01,$01,$01

off_04_9ADD:
.byte $01,$01,$01,$01,$01,$01,$01

off_04_9AE4:
.byte $00,$40,$00,$40,$00,$01,$41,$40,$01,$41,$00,$01,$40,$41

off_04_9AF2:
.byte $01

off_04_9AF3:
.byte $01,$01,$01,$01,$01,$01,$01,$00,$00,$01,$01,$00,$01

off_04_9B00:
.byte $40,$00,$00,$00,$01

off_04_9B05:
.byte $01,$01,$01,$01,$01,$01

off_04_9B0B:
.byte $01,$01,$01,$00,$00,$01,$01,$41,$41,$41,$41,$41,$01,$01

off_04_9B19:
.byte $40,$00,$00,$00,$01,$01,$01,$01,$01,$01,$01,$41,$41,$41

off_04_9B27:
.byte $00,$00,$00,$01,$00,$00,$01,$01,$01,$00,$01,$01

off_04_9B33:
.byte $00,$00,$00,$01,$00,$01,$01,$40,$41,$41,$41,$40,$40,$40

off_04_9B41:
.byte $01,$01,$01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$40

off_04_9B4E:
.byte $00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$41,$41,$40

off_04_9B5B:
.byte $01,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00

off_04_9B68:
.byte $01,$01,$01,$41,$41,$01,$01,$00,$40,$00,$01,$41,$00

off_04_9B75:
.byte $01,$01,$01,$01,$01,$01,$01,$41,$41,$01,$41

off_04_9B80:
.byte $00,$00,$01,$01,$01,$01,$01,$00,$01,$01,$01,$41,$41

off_04_9B8D:
.byte $00,$40,$01,$01,$01,$01,$01,$01,$01,$41,$41

off_04_9B98:
.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$41,$00,$00

off_04_9BA4:
.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$41,$41,$00,$00

off_04_9BB1:
.byte $01,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01

off_04_9BBC:
.byte $01,$01,$00,$01,$00,$01,$00,$00,$00,$00,$01

off_04_9BC7:
.byte $01,$41,$41,$01,$01,$01,$01,$41,$41,$41

off_04_9BD1:
.byte $01,$01,$01,$00,$00,$00,$00,$01,$01,$00,$01,$01

off_04_9BDD:
.byte $41,$00,$00,$01,$41,$01,$01,$01,$01,$01,$01,$01

off_04_9BE9:
.byte $41,$01,$01,$41,$41,$00,$01,$41,$01,$41,$01,$41

off_04_9BF5:
.byte $00,$00,$00

off_04_9BF8:
.byte $01

off_04_9BF9:
.byte $01,$00,$01,$01

off_04_9BFD:
.byte $01,$01,$01,$01

off_04_9C01:
.byte $00,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$01

off_04_9C0D:
.byte $41,$00,$00,$01,$41,$01,$01,$01,$01,$01,$41,$41

off_04_9C19:
.byte $01,$01,$01,$40,$00,$00,$41,$41,$01

off_04_9C22:
.byte $01,$00,$01,$01,$01,$41,$41,$01,$01

off_04_9C2B:
.byte $01,$00,$00,$00,$00,$00,$01,$01,$01,$01

off_04_9C35:
.byte $00,$01,$00,$01,$01,$01,$01,$01,$00,$00

off_04_9C3F:
.byte $00,$01,$01,$01,$01,$01,$01,$01

off_04_9C47:
.byte $01,$41,$41,$00,$01,$01,$01,$41,$01,$01,$01

off_04_9C52:
.byte $00,$41,$41,$41,$41,$41,$41,$01,$01,$41,$41

off_04_9C5D:
.byte $01,$01,$01,$01,$00,$01,$41,$01,$01,$01,$40

off_04_9C68:
.byte $01,$01,$00,$00,$00,$00,$00,$01,$01,$00,$40

off_04_9C73:
.byte $01,$01,$01,$01,$01,$01,$01,$00,$00,$01

off_04_9C7D:
.byte $00,$01,$01,$01,$01,$01,$01,$01,$01

off_04_9C86:
.byte $00,$00,$00,$01,$01,$01,$01,$00,$01,$01,$01

off_04_9C91:
.byte $C1

off_04_9C92:
.byte $C0,$C0,$C1,$C1,$C1,$C1,$C1,$C1,$C1

off_04_9C9B:
.byte $00,$00,$00,$00,$01,$00,$01,$00,$00,$00

off_04_9CA5:
.byte $01

off_04_9CA6:
.byte $01

off_04_9CA7:
.byte $01,$01,$00,$00,$01,$01,$01,$01

off_04_9CAF:
.byte $41,$01,$01,$00,$00,$00,$01,$01,$00

off_04_9CB8:
.byte $41,$01,$01,$00,$00,$00,$00,$00,$00,$41

off_04_9CC2:
.byte $00,$00,$01,$01,$01,$01,$41,$41

off_04_9CCA:
.byte $01,$01,$41,$41,$41,$41,$00,$01,$41

off_04_9CD3:
.byte $01,$01,$41,$41,$41,$41,$41,$01,$01,$00

off_04_9CDD:
.byte $01,$01,$01,$01,$01,$01,$01,$00,$01,$41

off_04_9CE7:
.byte $00,$01,$01,$01,$01,$01,$01,$00,$41,$41

off_04_9CF1:
.byte $00,$01,$01,$01,$00,$01,$01,$01,$41,$41

off_04_9CFB:
.byte $01,$00,$01,$01,$01,$01,$01,$00,$01,$01

off_04_9D05:
.byte $00,$00,$41,$01,$01,$41,$01

off_04_9D0C:
.byte $01,$01,$01,$41,$01,$01,$00,$00,$01,$01

off_04_9D16:
.byte $00,$00,$00,$00,$00,$40,$40,$40,$00,$00

off_04_9D20:
.byte $01,$01,$00,$01,$01,$00,$01,$01

off_04_9D28:
.byte $01,$01,$41,$41,$41,$41,$01,$01,$41,$00

off_04_9D32:
.byte $C1,$C1,$01,$01,$C1,$C1,$C1,$C0,$81

off_04_9D3B:
.byte $00,$00,$01,$01,$01,$01,$01,$41,$41

off_04_9D44:
.byte $01,$C1,$00,$C1,$01,$01,$01,$01,$01

off_04_9D4D:
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00

off_04_9D56:
.byte $01,$01,$01,$41,$40,$40,$01,$C1,$01

off_04_9D5F:
.byte $00,$00,$00,$00,$40,$40,$C0,$80,$C0

off_04_9D68:
.byte $C1,$C1,$C1,$C1,$C1,$C1,$C1,$C1,$C1

off_04_9D71:
.byte $03,$03,$03,$03,$03,$03,$42,$42,$42

off_04_9D7A:
.byte $00,$01,$00,$01,$01,$01,$01,$01,$C1

off_04_9D83:
.byte $00,$00,$00,$00,$02,$01,$01,$01,$03

off_04_9D8C:
.byte $00,$00,$01,$01,$01,$01,$01,$41

off_04_9D94:
.byte $01,$01,$41,$41,$01,$01,$01

off_04_9D9B:
.byte $C1,$C1,$C1,$C1,$00,$01,$C1

off_04_9DA2:
.byte $01,$01,$00,$00,$01,$01,$40,$40

off_04_9DAA:
.byte $00,$C1,$C1

off_04_9DAD:
.byte $C1,$C1,$C1,$C1,$C1,$C0,$C0,$C1

off_04_9DB5:
.byte $81,$81,$41,$81,$81,$C1,$C1,$81

off_04_9DBD:
.byte $01,$01,$01,$01,$01,$01,$01,$C0

off_04_9DC5:
.byte $01,$01,$81,$81,$01,$81,$01,$81

off_04_9DCD:
.byte $41,$41,$41,$41,$41,$80,$81,$81

off_04_9DD5:
.byte $40,$40,$40,$40,$00

off_04_9DDA:
.byte $00

off_04_9DDB:
.byte $00,$00,$80,$80

off_04_9DDF:
.byte $00,$00,$00,$00,$40,$40,$00

off_04_9DE6:
.byte $01,$41

off_04_9DE8:
.byte $00,$00,$00,$00,$01,$41

off_04_9DEE:
.byte $00

off_04_9DEF:
.byte $40,$80,$C0,$00

off_04_9DF3:
.byte $80,$80,$80

off_04_9DF6:
.byte $80,$C0,$80

off_04_9DF9:
.byte $C0,$C0,$C0,$C0

off_04_9DFD:
.byte $40,$C0,$C0,$C0

off_04_9E01:
.byte $80,$C0,$80,$80

off_04_9E05:
.byte $00,$80,$00

off_04_9E08:
.byte $00,$80,$00,$80

off_04_9E0C:
.byte $E4,$EC,$F4

off_04_9E0F:
.byte $FC,$DC,$E4,$EC,$F4,$FC,$DC,$E4,$EC,$F4,$FC,$DC,$EC,$F4,$FC,$FF,$E4,$E1,$E9

off_04_9E22:
.byte $F0

off_04_9E23:
.byte $F8

off_04_9E24:
.byte $E4,$EC,$F4,$FC,$DC,$E4,$EC,$F4,$FC,$DC,$E4,$EC,$F4,$FC,$E4,$EC,$F4,$FC,$DC,$FF,$E1,$E9,$F0,$F8

off_04_9E3C:
.byte $F9,$01,$F9,$01,$F9,$01,$F1,$F1,$F9,$01,$09,$F1,$F9,$01,$09,$09,$11,$09,$11,$11,$E9

off_04_9E51:
.byte $06,$0E,$06,$0E,$EE,$F6,$FE,$F6,$FE,$F6,$FE

off_04_9E5C:
.byte $00,$08,$EE,$F6,$FE,$01,$09

off_04_9E63:
.byte $EF,$F7,$FF,$08,$EF,$08,$F6,$FE,$FB,$03,$F0

off_04_9E6E:
.byte $F7,$FF,$07,$F7,$FF,$07,$EB

off_04_9E75:
.byte $F0,$F8,$F0,$F8,$F0,$F8,$F0

off_04_9E7C:
.byte $F8,$00,$00,$00,$00,$08,$08,$08,$08,$F8,$00

off_04_9E87:
.byte $F9,$01,$09,$F9,$01,$09,$F9,$01,$F1,$F1,$E9,$F9,$01,$09,$09,$F1,$F9,$01

off_04_9E99:
.byte $F0,$05,$F7,$FF,$05,$F0,$F6,$FE,$FB,$03,$EF,$F7,$FF,$06,$F7,$FF,$07,$04

off_04_9EAB:
.byte $FA,$02,$0C,$F2,$FA,$02,$0A,$0A,$0A,$02,$F2,$FA,$F2,$FA,$F2,$FA,$02,$02

off_04_9EBD:
.byte $F0,$F8,$00,$08,$F0,$F8,$00,$08,$F0,$F8,$00,$08

off_04_9EC9:
.byte $F8,$00,$F8,$00,$F0

off_04_9ECE:
.byte $0E,$06,$0E,$FE,$06,$FE,$06,$F6,$F6,$F6,$EE,$FE,$00,$08,$EE,$F6,$FE

off_04_9EDF:
.byte $05,$0D,$F8,$00,$05,$0D,$F5,$FD,$05,$F3,$FB,$03,$FB,$03,$EB,$F0

off_04_9EEF:
.byte $05,$0D,$04,$0C,$03,$0B,$05,$0D,$F1,$F9,$F2,$FA,$F3,$FB,$F9

off_04_9EFE:
.byte $F1,$F9,$01,$F9,$01,$F1,$09,$08,$09,$01,$F1,$F8,$08,$00,$F2,$F9

off_04_9F0E:
.byte $F1,$F9,$01,$09,$F1,$F9,$01,$08,$F2,$F9,$01,$09,$F1,$F9,$01,$09

off_04_9F1E:
.byte $FC,$F3,$FB,$08,$09,$11,$F5,$F4,$FD,$07,$0F,$10,$F5,$FD,$0F,$07

off_04_9F2E:
.byte $ED,$ED,$F5,$F5,$F5,$F7,$F7,$FF,$FF,$07,$FD,$05,$02,$FA,$0F,$0A

off_04_9F3E:
.byte $E0,$E8,$F0,$F8,$DC,$E4,$EC,$F4,$FC,$DC,$E4,$EC,$F4,$FC,$EF,$F7

off_04_9F4E:
.byte $08,$00,$08,$F8,$F8,$F8,$00,$10,$10,$10,$00,$08,$00,$00,$08

off_04_9F5D:
.byte $F6,$FE,$04,$F6,$FE,$06,$F5,$F0,$F0,$F0,$FD

off_04_9F68:
.byte $F8,$00,$04,$EE

off_04_9F6C:
.byte $F8,$10,$F8,$10,$F8,$00,$08,$10,$00,$08,$00,$00,$08,$08

off_04_9F7A:
.byte $EE,$EE,$F6,$FE,$F5,$FD,$F9,$01,$F6,$FE,$04,$06,$06,$F1

off_04_9F88:
.byte $DC,$E4,$EC,$F4,$FC,$E4,$EC,$F4,$FC,$EE,$F6,$FE

off_04_9F94:
.byte $F9,$01,$EE,$F6,$FE,$DC,$E4,$EC,$F4,$FC,$E4,$EC,$F4,$FC

off_04_9FA2:
.byte $EE,$01,$F4,$FC,$E7,$EF,$F7,$FF,$EF,$F7,$FF,$F0,$F8,$00

off_04_9FB0:
.byte $01,$FA,$02,$FA,$02,$05,$05,$06,$F2,$F2,$FE,$F9,$F4,$FC

off_04_9FBE:
.byte $EC,$03,$F5,$FD,$E8,$F0,$F8,$00,$F0,$F8,$00,$F9,$01,$F1

off_04_9FCC:
.byte $E9,$F1,$E9,$F1,$F8,$00,$F0,$F8,$00,$F1,$F9,$01,$F7,$FF

off_04_9FDA:
.byte $F8,$00,$F8,$00,$F8,$00,$00,$08,$08,$08,$08,$10,$10,$10

off_04_9FE8:
.byte $F8,$00,$08,$FD,$05,$F9,$01,$09,$FA,$01,$09,$F2,$0E

off_04_9FF5:
.byte $F7

off_04_9FF6:
.byte $F7,$FF,$F7,$FF,$F4,$FC,$04,$07,$07,$EF,$EF,$FE

off_04_A002:
.byte $F1,$F9,$01,$F1,$F9,$01,$F8,$00,$EF,$F7,$F8,$00,$EF

off_04_A00F:
.byte $F3,$FB,$03,$F9,$01,$F8,$00,$06,$F0,$00,$04,$F2,$F8

off_04_A01C:
.byte $F0,$F0,$F7,$FF,$F1,$F9,$01,$05,$05,$F8,$FD,$FF,$F8

off_04_A029:
.byte $F1,$F9,$F2,$FA,$EA,$F2,$FA,$E9,$01,$EA,$F1,$F9,$01

off_04_A036:
.byte $F7,$FE,$F7,$FF,$F7,$FF,$F4,$FC,$04,$F2,$F2,$03,$03

off_04_A043:
.byte $F2,$FA,$02,$F1,$F9,$FE,$F5,$F6,$03,$F1,$F7,$FF,$FF

off_04_A050:
.byte $F8,$03,$FB,$00,$F3,$F8,$00,$06,$07,$F0,$F0

off_04_A05B:
.byte $F8,$00,$F1,$F9,$01,$F1,$F9,$01,$FB,$03,$F8,$00,$03

off_04_A068:
.byte $F1,$F7,$FF,$03,$F3,$FB,$03,$FE,$F1,$F9,$F5,$F6,$FF

off_04_A075:
.byte $F5,$FD,$F4,$FC,$F4,$F8,$EF,$EF,$04,$04,$FC,$F0,$00

off_04_A082:
.byte $FB,$03,$F6,$04,$F0,$F3,$FE,$03,$F6,$F8,$FE,$FE

off_04_A08E:
.byte $F8,$00,$EA,$F2,$EA,$F2,$F8,$00,$F9,$01,$F9,$01

off_04_A09A:
.byte $F7,$FE,$F7,$FE,$F6,$FE,$F0,$F0,$05,$05,$F8,$00

off_04_A0A6:
.byte $F5,$F7,$FF,$FD,$FD,$F5,$EF,$04,$EF,$04,$F7,$FF

off_04_A0B2:
.byte $F6,$FE,$F2,$FA,$02,$EE,$F6,$FB,$03,$F2,$F4,$FC

off_04_A0BE:
.byte $F8,$00,$08,$FB,$03,$F7,$FF,$EF,$F7,$07,$FF,$07

off_04_A0CA:
.byte $EA,$F2,$FA,$01,$EA,$F2,$FA,$02,$F2,$FA,$02,$FB

off_04_A0D6:
.byte $00,$F2,$F5,$03,$F5,$FA,$02,$F3,$FA,$02,$FA,$FB

off_04_A0E2:
.byte $F2,$FA,$02,$F2,$FA,$02,$F1,$FF,$F4,$F6,$FE

off_04_A0ED:
.byte $F9,$F4,$FC,$04,$01,$F4,$FC,$04,$F2,$F8,$00,$04

off_04_A0F9:
.byte $F0,$F8,$00,$06,$F0,$F8,$00,$07

off_04_A101:
.byte $F8,$00,$F9,$01

off_04_A105:
.byte $F8,$00,$F8,$00,$F6,$FE,$06,$02,$F4,$FA,$05

off_04_A110:
.byte $F7,$FF,$F7,$FF,$F5,$FD,$05,$F5,$F9,$01,$05

off_04_A11B:
.byte $FB,$03,$F8,$00,$F0,$08,$08,$F8,$00,$F8,$00

off_04_A126:
.byte $FB,$03,$F8,$00,$F8,$00,$F8,$00,$F0,$08,$08

off_04_A131:
.byte $09,$06,$0E,$04,$0C,$14,$1C,$12,$14,$0C,$04

off_04_A13C:
.byte $F3,$FB,$03,$F2,$F8,$00,$F9,$01,$F8,$00,$04

off_04_A147:
.byte $FA,$02,$EA,$F2,$F2

off_04_A14C:
.byte $F8,$00,$FA,$02,$F8,$00

off_04_A152:
.byte $04,$0C,$14,$04,$0C,$14,$06,$0E,$09,$1C,$10

off_04_A15D:
.byte $F9,$F4,$FC,$04,$F4,$FC,$F4,$FC,$04,$04,$01

off_04_A168:
.byte $F8,$00,$F8,$00,$F8,$00,$00,$00,$F6,$F0,$F8

off_04_A173:
.byte $F7,$FF,$07,$F6,$FE,$06,$F0,$F8,$00,$F8,$00

off_04_A17E:
.byte $F3,$01,$F5,$FD,$05,$FA,$02,$F8,$00,$05,$F9

off_04_A189:
.byte $F8,$F5,$FD,$F4,$FC,$04,$F4,$FC,$04,$FE,$EC

off_04_A194:
.byte $F1,$F9,$01,$F1,$F9,$01,$F5,$FF,$F9,$01,$06

off_04_A19F:
.byte $F5,$F5,$FD,$05,$F5,$FD,$05

off_04_A1A6:
.byte $F8,$F8,$00,$00

off_04_A1AA:
.byte $04,$02,$F5,$FA,$F9,$01,$02,$F3,$FA,$FC,$F4

off_04_A1B5:
.byte $03,$F3,$F3,$FB,$FB,$03,$03,$F8,$F8,$00,$00

off_04_A1C0:
.byte $EE,$F6,$EC,$F4,$FC,$EC,$F4,$FC,$F0,$F2,$FA

off_04_A1CB:
.byte $F7,$FF,$F7,$FF,$F7,$EF,$07,$F4,$FC,$04,$FE

off_04_A1D6:
.byte $F9,$01,$FF,$F7,$F7,$FF,$FF,$F9,$01,$F7,$FF

off_04_A1E1:
.byte $08,$00,$05,$0D,$05,$0D,$FE,$00,$08,$00,$F8

off_04_A1EC:
.byte $10,$0E,$06,$0E,$00,$08,$FE,$FE,$06,$09

off_04_A1F6:
.byte $01,$F9,$01,$09,$09,$00,$08,$F9,$F9,$01,$09

off_04_A201:
.byte $F8,$00,$F8,$00,$F7,$FF,$07,$F7,$FB,$03,$07

off_04_A20C:
.byte $F9,$FB,$03,$01,$07,$07,$00,$01,$F9,$F8

off_04_A216:
.byte $F9,$01,$F9,$01,$F9,$01,$F9,$01,$09,$09

off_04_A220:
.byte $00,$08,$05,$0D,$FE,$05,$0D,$00,$08,$00

off_04_A22A:
.byte $FE,$F5,$FD,$F6,$FE,$F6,$F3,$FB,$EE,$EE

off_04_A234:
.byte $FC,$FB,$FD,$F5,$F1,$F9,$F5,$F4,$EC,$ED

off_04_A23E:
.byte $F3,$FB,$F7,$F0,$F8,$00,$F3,$FB,$EC,$FF

off_04_A248:
.byte $F9,$F8,$00,$F4,$FC,$04,$F4,$FC,$04,$01

off_04_A252:
.byte $FA,$F8,$00,$F5,$FD,$F5,$FD,$05,$05,$02

off_04_A25C:
.byte $F7,$FF,$07,$F7,$00,$08,$FF,$07,$FA,$02

off_04_A266:
.byte $F2,$FA,$F4,$FC,$ED,$F0,$F7,$FF,$F5,$FD

off_04_A270:
.byte $F8,$00,$F2,$FA,$02,$F2,$FA,$02,$F9,$01

off_04_A27A:
.byte $FA,$02,$F2,$F2,$FA,$02,$F8,$00,$F9,$01

off_04_A284:
.byte $F8,$00,$02,$01,$F9,$F5,$FA,$02,$F3,$FA

off_04_A28E:
.byte $F8,$00,$02,$01,$F9,$F5,$F3,$02,$FA,$FA

off_04_A298:
.byte $F8,$00,$08,$F8

off_04_A29C:
.byte $00,$08,$00,$08,$FB,$03

off_04_A2A2:
.byte $06,$0E,$FE,$FF,$07,$0F,$00,$08,$01,$09

off_04_A2AC:
.byte $0E,$06,$0E,$FE,$06,$FE,$00,$08,$01,$09

off_04_A2B6:
.byte $F8,$00,$F5,$F6,$FE,$04,$05,$FD,$FD,$F5

off_04_A2C0:
.byte $05,$0D,$06,$0E,$00,$08,$00,$08,$FE,$FD

off_04_A2CA:
.byte $01,$F9,$01,$F8

off_04_A2CE:
.byte $00,$F8,$00,$F9,$F1,$F1

off_04_A2D4:
.byte $F0,$F8,$F0,$F8,$00,$00,$F0,$FD,$F8,$00

off_04_A2DE:
.byte $01,$FA,$02,$01,$F9,$F8,$00,$F9,$F4,$F4

off_04_A2E8:
.byte $F8,$F8,$00,$06,$FD,$05,$00,$05,$FF,$F9

off_04_A2F2:
.byte $00,$F9,$01,$00,$F8,$F8,$F8,$00,$F3,$F3

off_04_A2FC:
.byte $01,$09,$FE,$06,$0E,$FE,$06,$0E,$00,$08

off_04_A306:
.byte $F0,$F8,$00,$F0,$F8,$00,$F3,$FB,$F4,$FD

off_04_A310:
.byte $FC,$04,$F0,$FC,$03,$F0,$04,$F8

off_04_A318:
.byte $F8,$00,$F1,$F9,$01,$F1,$F9,$01,$F8,$00

off_04_A322:
.byte $F1,$F9,$FB,$ED,$ED,$F3,$F4,$F3,$FB,$FC

off_04_A32C:
.byte $F5,$FD,$06,$09,$F6,$FE,$F6,$FE,$F7,$FF

off_04_A336:
.byte $04,$FD,$05,$F7,$F4,$FC,$F8,$00,$F7,$FF

off_04_A340:
.byte $F6,$FE,$F2,$FA,$02,$F3,$FB,$03,$FB,$F5

off_04_A34A:
.byte $FD,$FD,$05,$F5,$FD,$05,$F5,$FD,$05,$0C

off_04_A354:
.byte $F4

off_04_A355:
.byte $F4,$F4

off_04_A357:
.byte $FC,$FC,$04,$04,$04,$F8,$00

off_04_A35E:
.byte $F4,$FC,$F9,$FD,$F5,$F1,$EC,$FB,$EC,$F3

off_04_A368:
.byte $F8,$00,$02,$01,$F9,$F3,$02,$FA,$F5,$FA

off_04_A372:
.byte $F5,$FD,$FF,$F3,$F7,$F8,$00,$F7,$FF

off_04_A37B:
.byte $F4,$FC,$F3,$F6,$FE,$F8,$FE,$F2,$FA

off_04_A384:
.byte $FB,$F3,$FC,$F4,$F9,$F4,$F3,$FB,$02

off_04_A38D:
.byte $F0,$F5,$FD,$04,$F0,$F4,$FC,$04,$F7

off_04_A396:
.byte $F8,$00,$F0,$F7,$FF,$F7,$FF,$F8,$00

off_04_A39F:
.byte $FD,$05,$FD,$05,$F6,$FD,$05,$00,$08

off_04_A3A8:
.byte $F8,$00,$F6,$F8,$00,$F8,$00,$F7,$FF

off_04_A3B1:
.byte $F5,$ED,$ED,$F4,$FB,$01,$01,$FD,$FC

off_04_A3BA:
.byte $F8,$00,$F8,$00,$F8,$00,$F8,$00,$F0

off_04_A3C3:
.byte $F6,$FF,$FE,$F5,$F4,$FC,$FD,$06,$F7

off_04_A3CC:
.byte $F4,$FC,$F4,$FC,$04,$04,$04

off_04_A3D3:
.byte $F4,$FC,$04,$F4,$FC,$04,$F4,$FC,$04

off_04_A3DC:
.byte $F8,$00,$08,$F8,$00,$08,$F8,$00,$08

off_04_A3E5:
.byte $F8,$08,$F8,$00,$08,$F8,$00,$08,$00

off_04_A3EE:
.byte $F8,$F8,$F8,$00,$00,$00

off_04_A3F4:
.byte $08,$08,$08,$F8,$F8,$F8,$00,$00,$00

off_04_A3FD:
.byte $F5,$FD,$FF,$00,$F8,$00,$F3,$F7,$F8

off_04_A406:
.byte $F5,$FD,$FD,$F5,$F5,$FD,$F4,$F5,$FD

off_04_A40F:
.byte $F6,$FE,$FF,$02,$F7,$F6,$FE,$FA,$F2

off_04_A418:
.byte $F3,$FB,$EC,$F2,$FA,$F5,$FA,$F3,$FB

off_04_A421:
.byte $F6,$F4,$FC,$F6,$FE,$F2,$FA,$FE,$06

off_04_A42A:
.byte $04,$0C,$04,$0C,$04,$0C,$0C,$04,$07

off_04_A433:
.byte $F2,$08,$00,$08,$00,$F8,$F8,$00,$07

off_04_A43C:
.byte $F8,$00,$F7,$00,$F8,$F1,$F8,$FF,$00

off_04_A445:
.byte $04,$0C,$04,$04,$0C,$0C,$0C,$04,$07

off_04_A44E:
.byte $FE,$FE,$F8,$F2,$F6,$F7,$FF,$F4,$FC

off_04_A457:
.byte $F9,$00,$F1

off_04_A45A:
.byte $F8

off_04_A45B:
.byte $00,$00,$F8,$F8,$F1

off_04_A460:
.byte $F3,$F3,$F4,$F6,$01,$FB,$FB,$FE,$FC

off_04_A469:
.byte $00,$00,$08,$F8,$00,$F8,$F8

off_04_A470:
.byte $F8,$00,$F8,$00,$08,$F8,$00,$F8

off_04_A478:
.byte $00,$08,$00,$08,$F8,$08,$00,$FB,$03

off_04_A481:
.byte $F7,$FF,$F7,$FF,$F8,$00,$F8,$F7,$00

off_04_A48A:
.byte $F8,$00,$F8,$00,$F8,$00,$F8,$00,$07

off_04_A493:
.byte $F8,$00,$F8,$00,$F8,$00,$08,$04,$FB

off_04_A49C:
.byte $F8,$FF,$FF,$F6,$FE,$F0,$F7

off_04_A4A3:
.byte $F7,$FF,$F7,$FF,$F7,$FF,$F9,$FF

off_04_A4AB:
.byte $00,$FF,$02,$F9,$01,$F7,$FF,$F7

off_04_A4B3:
.byte $F0,$F8,$F7,$FF,$07,$07,$FF,$F0

off_04_A4BB:
.byte $04,$0C,$04,$0C,$00,$08,$00,$08

off_04_A4C3:
.byte $F6,$FE,$F6,$FE,$00,$F8,$00,$F7

off_04_A4CB:
.byte $F5,$FD,$F5,$FD,$F6,$FE,$F4,$FC

off_04_A4D3:
.byte $F5,$FD,$F5,$FD,$F7,$FF

off_04_A4D9:
.byte $F8,$00,$F9,$F8,$01,$00,$F8,$00

off_04_A4E1:
.byte $F0,$F8,$F8,$00,$F0,$08,$00,$08

off_04_A4E9:
.byte $F8,$00,$F8,$00,$F8,$00,$00,$F8

off_04_A4F1:
.byte $F7,$FF,$FF,$F8,$00,$FA,$02,$F7

off_04_A4F9:
.byte $F0,$FF,$F0,$07,$07,$FF,$F8,$F8

off_04_A501:
.byte $FA,$02,$02,$FA,$02,$00,$F8,$FA

off_04_A509:
.byte $F4,$FC,$F4,$FC,$F7,$FF,$04,$04

off_04_A511:
.byte $F8,$00,$08,$10,$F8,$00,$08,$10

off_04_A519:
.byte $F7,$FF,$F4,$FC,$F6,$FE

off_04_A51F:
.byte $F7,$FF,$F7,$FF

off_04_A523:
.byte $F8,$00,$F8,$00,$F0,$F0,$08,$08

off_04_A52B:
.byte $F0,$F8,$00,$00,$F8,$F0,$08,$08

off_04_A533:
.byte $F8,$00,$F8,$00,$F0,$F0,$F8,$08

off_04_A53B:
.byte $F3,$F4,$F3,$FB,$FB,$F3,$F3,$FB

off_04_A543:
.byte $F6,$FE,$F6,$FE,$F8,$F8,$00,$FE

off_04_A54B:
.byte $F5,$FD,$F7,$FF,$F8,$00,$F7,$FF

off_04_A553:
.byte $00,$00,$F8,$F8,$F8,$F8,$08,$EF

off_04_A55B:
.byte $F8,$00,$00,$F8,$00

off_04_A560:
.byte $F8,$00,$F8,$00,$08,$08,$F0,$F8

off_04_A568:
.byte $00,$F9,$01,$F8,$00,$F8,$F8,$00

off_04_A570:
.byte $F0,$F8,$F0,$F8,$00,$00,$08

off_04_A577:
.byte $EA,$F2,$EA,$F2,$FA,$FA,$F2

off_04_A57E:
.byte $08

off_04_A57F:
.byte $F0,$F8,$00,$F8,$00

off_04_A584:
.byte $F0,$F0,$F8,$00,$F0,$F8

off_04_A58A:
.byte $F1,$F9,$01,$09,$11,$E9

off_04_A590:
.byte $F6,$FE,$F6,$FE,$FD,$06

off_04_A596:
.byte $F7,$F7,$FD,$FF,$FF,$06

off_04_A59C:
.byte $F8,$F8,$F1,$00,$00,$FA

off_04_A5A2:
.byte $F8,$00,$F8,$00,$09,$EF

off_04_A5A8:
.byte $FC,$04,$FC,$04

off_04_A5AC:
.byte $00,$08,$08,$00

off_04_A5B0:
.byte $EE,$0A

off_04_A5B2:
.byte $F2,$06

off_04_A5B4:
.byte $D8,$D8,$D8,$D8,$E0,$E0,$E0,$E0,$E0

off_04_A5BD:
.byte $E8,$E8,$E8,$E8,$E8,$F0,$F0,$F0

off_04_A5C5:
.byte $F0

off_04_A5C6:
.byte $F8,$F0

off_04_A5C8:
.byte $F8,$F8,$F8,$F8

off_04_A5CC:
.byte $E2,$E2,$E2,$E2,$EA,$EA,$EA,$EA,$EA,$F2,$F2,$F2,$F2,$F2,$DA,$DA,$DA,$DA,$E2

off_04_A5DF:
.byte $FA,$FA,$FA,$FA,$FA

off_04_A5E4:
.byte $C6,$C6,$CE,$CE,$D6,$D6,$D6,$DE,$DE,$DE,$E0,$E6,$E6,$E6,$E8,$CE,$CE,$D6,$D6,$C6,$D7

off_04_A5F9:
.byte $E8,$E8,$F0,$F0,$E0

off_04_A5FE:
.byte $E0,$E0,$E8,$E8

off_04_A602:
.byte $F0,$F0,$F8,$F8,$D8,$D8,$D8,$E0

off_04_A60A:
.byte $E0,$D8,$D8,$D8,$E8,$E0,$E0,$E0

off_04_A612:
.byte $F8,$F8,$F0,$E8,$E8,$E8,$F0,$F0,$F0,$D9

off_04_A61C:
.byte $B8,$B8,$C0,$C0,$C8,$C8,$D0,$D0,$B8,$C0,$C8,$D0,$B8,$C0,$C8,$D0,$D8,$D8

off_04_A62E:
.byte $D0,$D0,$D0,$D8,$D8,$D8,$C8,$C8,$D8,$E0,$D9,$E0,$E0,$E0,$E8,$E8,$E8,$E8

off_04_A640:
.byte $E0,$D8,$D8,$D8,$E0,$E8,$E0,$E0,$F8,$F8,$F0,$E8,$E8,$E8,$F0,$F0,$F0,$D1

off_04_A652:
.byte $D8,$D8,$D6,$E0,$E0,$E0,$E0,$E8,$F0,$F0

off_04_A65C:
.byte $F0,$F0,$F8,$F8,$E8,$E8,$E8,$F8

off_04_A664:
.byte $E0,$E0,$E0,$E0,$E8,$E8,$E8,$E8,$F0,$F0,$F0,$F0,$D8,$D8,$F8,$F8,$D8

off_04_A675:
.byte $E8,$F0,$F0,$E0,$E0,$E8,$E8,$E0,$E8,$F0,$E0,$F0,$F8,$F8,$D8

off_04_A684:
.byte $D8,$D8,$E0,$E0

off_04_A688:
.byte $E0,$E0

off_04_A68A:
.byte $E8,$E8,$E8,$F0,$F0,$F0,$F8,$F8,$F4,$D7

off_04_A694:
.byte $E8,$E8,$F0,$F0,$F8,$F8,$E0,$E0

off_04_A69C:
.byte $E7,$E7

off_04_A69E:
.byte $EF,$EF,$F7,$F7,$DF,$DF

off_04_A6A4:
.byte $E0,$E0,$E0,$E8,$E8,$E8,$E0,$E8,$F0,$F0,$F8,$F8

off_04_A6B0:
.byte $F8,$F8,$F0,$F0

off_04_A6B4:
.byte $DF,$DF,$DF,$DF,$E7,$E7,$E7,$E7,$EF,$EF,$EF,$EF,$F7,$F7,$F7,$F7

off_04_A6C4:
.byte $F0,$F8,$F8,$EF,$F7,$F7,$E8,$F0,$E8,$E7,$E7,$EF,$E0,$E0,$DF,$DF

off_04_A6D4:
.byte $D8,$E0,$D8,$E0,$E8,$F0

off_04_A6DA:
.byte $F8,$F0,$F8,$F0,$E8,$E8,$E0,$E0,$F4,$D7

off_04_A6E4:
.byte $E0,$E0,$E0,$E0,$E8,$E8,$E8,$E8,$E8,$F0,$F0,$F0,$F0

off_04_A6F1:
.byte $F0,$F8,$F8,$E0,$E8,$F0,$F0,$E8,$F0,$E0,$E8,$E8,$D8

off_04_A6FE:
.byte $E0,$E0,$E0,$E8,$E8,$E8,$F0,$F8,$EA,$F2,$F0,$F8,$F8,$D8,$D7

off_04_A70D:
.byte $DF,$DF,$E7,$E7,$EF,$F0,$F0,$EF,$F8,$F8,$E0,$E8

off_04_A719:
.byte $E0,$E8,$E8,$E8,$F0,$F0,$F8,$F8,$E0,$E0,$E0,$E8,$D6,$F8

off_04_A727:
.byte $F0

off_04_A728:
.byte $F0

off_04_A729:
.byte $F0,$F0,$F0,$F8,$F8,$F8,$F8,$E8,$E8,$E8

off_04_A733:
.byte $E0,$E0,$E8,$E8,$E8,$F0,$F0,$F0,$F0,$F0,$F8,$F8,$F8,$F8

off_04_A741:
.byte $D7,$D7,$E0,$E0,$E8

off_04_A746:
.byte $E8,$E8,$E8,$F0,$F0,$F0,$F8,$F8,$F8

off_04_A74F:
.byte $F0,$E8,$E8,$E0,$E0,$E7,$EF,$F8,$DF,$E7,$F8,$F8,$F0,$F0

off_04_A75D:
.byte $D5,$D4,$E0,$E0,$E8,$E8,$E8,$E8,$F0,$F0,$F0,$F8,$F8,$F8

off_04_A76B:
.byte $DE,$DF,$E6,$E7,$E6,$E6

off_04_A771:
.byte $EE,$EE,$EE,$F6,$F6,$F6,$DE,$DE

off_04_A779:
.byte $DF,$E0,$E7,$E8,$EF,$F0,$F8,$E0,$E8,$F0,$F8,$DF,$E7,$EF

off_04_A787:
.byte $F8,$F8,$F8,$E0,$E0,$E8,$E8,$E8,$F0,$F0,$F0,$F0,$DF

off_04_A794:
.byte $E1,$E9,$E9,$F1,$F1

off_04_A799:
.byte $F9,$F9,$F9,$E2,$EA,$E2,$EA,$E1

off_04_A7A1:
.byte $E8,$E8,$E8,$F0,$F0,$F0,$F8,$F8,$D6,$D6,$E0,$E0,$DE

off_04_A7AE:
.byte $E8,$E8,$E8,$F0,$F0,$F8,$F8,$D7,$D6,$E0,$E0,$E0,$E0

off_04_A7BB:
.byte $E2,$EA,$F0,$F0,$F8,$F8,$F8,$E2,$EA,$E8,$E8,$E0,$E0

off_04_A7C8:
.byte $E2,$E2,$E8,$E8,$F0,$F0,$F0,$D9,$F0,$E8,$F8,$F8,$F8

off_04_A7D5:
.byte $E1,$E1,$E9,$E9,$F1,$F1,$F9,$F9,$F9,$E8,$F0,$E8,$F0

off_04_A7E2:
.byte $E8,$E8,$E8,$F0,$F0,$F8,$F8,$F8,$E0,$E0,$E0,$E0,$F0

off_04_A7EF:
.byte $EF,$F4,$F7,$EF,$F4,$E7,$E7,$DE,$E6,$DE,$E6,$DF,$DF

off_04_A7FC:
.byte $F8,$F8,$E8,$E8,$E8,$F0,$F0,$F0,$D6,$D6,$E0,$E0,$DE

off_04_A809:
.byte $E0,$E0,$E0,$E0,$E8,$E8,$E8

off_04_A810:
.byte $F8

off_04_A811:
.byte $F0

off_04_A812:
.byte $F0,$F8,$F8,$F0

off_04_A816:
.byte $E0,$E0,$E8,$E8,$F0,$F8,$EA,$F2,$E8,$F0,$F0,$F8,$F8

off_04_A823:
.byte $E0,$E0,$E8,$F0,$F0,$F8,$E8,$E8,$F8,$F0,$F0

off_04_A82E:
.byte $F8,$F8,$EA,$EB,$F2,$F3,$E0,$E0,$E8,$E8

off_04_A838:
.byte $F0,$F0,$F8,$F8,$E8,$E8,$E8,$F0,$E0,$E8,$E0,$E0

off_04_A844:
.byte $E8,$F8,$F8,$E8,$F0,$F0,$E1,$E8,$E9,$F0,$E0,$E0

off_04_A850:
.byte $D8,$D8,$E0,$E0,$E0,$E8

off_04_A856:
.byte $E8,$E8,$E8,$F0,$F0,$F0

off_04_A85C:
.byte $F8

off_04_A85D:
.byte $F8,$F8,$E0,$E0,$E8,$E8,$F0,$F0,$E8,$F0,$F0

off_04_A868:
.byte $E1,$E2,$E2,$E2,$E9,$EA,$EA,$EA,$F2,$F2,$F2,$FA

off_04_A874:
.byte $F0

off_04_A875:
.byte $F0,$F8,$F8,$E0,$E0,$E0,$E8,$E8,$E8,$F0,$F8

off_04_A880:
.byte $E0,$E0,$E0,$E8,$E8,$E8,$EF,$F0,$F7,$F8,$F8,$F0

off_04_A88C:
.byte $EE,$F3,$F6,$F3,$EE,$E6,$E6,$E6,$DE,$DE,$DE,$DE

off_04_A898:
.byte $DF,$E0,$E0,$DF,$E7,$E8,$E8,$E7,$F8,$F8,$F0,$F0

off_04_A8A4:
.byte $F5,$F5,$FD,$FD,$ED,$ED,$ED,$E5,$E5,$E5,$E5

off_04_A8AF:
.byte $F0,$F0,$F8,$F8,$E8,$E8,$E8,$E0,$E0,$E0,$E0

off_04_A8BA:
.byte $DF,$DF,$E7,$E7,$EB,$E7,$EF,$EF,$EF,$F7,$F7

off_04_A8C5:
.byte $E0,$E0,$E8,$E8,$F0,$F0,$F8,$F8,$EC,$E8,$F0

off_04_A8D0:
.byte $E0,$E8,$E8,$F0,$F0,$F0,$F8,$D9,$F8,$F8,$F8

off_04_A8DB:
.byte $E8,$E8,$E8,$E0,$E0,$E0,$F0,$F0,$F8,$F8,$E0

off_04_A8E6:
.byte $E8,$E8,$E7,$E8,$E0,$F0,$F0,$E0,$E0,$F8,$F8

off_04_A8F1:
.byte $F0,$F0,$F0,$F8,$F8,$F8,$E8,$E8,$E0,$F8,$D9

off_04_A8FC:
.byte $EE,$F3,$F6,$F3,$DE,$DE,$E6,$E6,$DE,$E6,$EE

off_04_A907:
.byte $F8,$F8,$F0,$F0,$E0,$E0,$E8,$D8,$D8,$E0

off_04_A911:
.byte $E8,$E8,$E7,$F0,$F0,$EF,$F8,$F8,$F8

off_04_A91A:
.byte $E0,$E0,$E8,$E8,$E8,$F0,$F0,$F8

off_04_A922:
.byte $F8,$E0,$E0,$E8,$E8,$E8,$F0,$F0,$F0,$F8,$E0

off_04_A92D:
.byte $E8

off_04_A92E:
.byte $E8,$E8,$F0,$F0,$F0,$F8,$F8,$E0,$E0,$D8

off_04_A938:
.byte $D6,$E0,$E0,$E0,$E8,$E8,$E8,$F0,$F8,$F0,$F8

off_04_A943:
.byte $F3,$E6,$DE,$DE,$EE,$EE,$DE,$E6,$E6,$F6,$F3

off_04_A94E:
.byte $D5,$DF,$E7,$DF,$E7,$DF,$E7,$EF,$F7,$EF,$F7

off_04_A959:
.byte $E0,$E0,$E8,$E8,$E8,$F0,$F0,$F0,$F8,$F8,$F8

off_04_A964:
.byte $E9,$E9,$F1,$F1,$E3,$EE,$EE,$F9,$F9,$F9,$E3

off_04_A96F:
.byte $F8,$F8,$D2,$DA,$E2,$DA,$E2,$F0,$F0,$EA,$EA

off_04_A97A:
.byte $F8,$F8,$F0,$F0,$E8,$E8,$F0,$E0,$E0,$E8,$E3

off_04_A985:
.byte $D8,$E8,$F0,$F0,$F8,$F8,$F0,$E8,$E8,$E0

off_04_A98F:
.byte $E0,$E8,$E8,$E8,$F0,$F8,$F8,$E0,$F0,$F0,$E0

off_04_A99A:
.byte $F0,$F8,$F8,$E0,$E7,$EF,$E8,$F0,$E0,$E8

off_04_A9A4:
.byte $E0,$E0,$E8,$E8,$F0,$F0,$F8,$F8,$F8,$F0

off_04_A9AE:
.byte $E0,$E0,$E8,$E8,$F0,$F0,$F0,$F8,$F8

off_04_A9B7:
.byte $E8,$F0,$F0,$F8,$F8,$E8,$E0,$E0,$EF

off_04_A9C0:
.byte $E8,$F0,$F8,$F8,$E0,$E0,$E8,$F0,$EE

off_04_A9C9:
.byte $E8,$E8,$F8,$F0,$F0,$F0,$E0,$E0,$E8,$F8

off_04_A9D3:
.byte $F0,$F8,$F8,$E0,$E0,$E8,$E8,$E0,$E8,$F0

off_04_A9DD:
.byte $EC,$EC,$EC,$F3,$FB,$FB,$F4,$F4,$E4,$E4

off_04_A9E7:
.byte $E0,$E0,$E8,$E8,$F0,$F8

off_04_A9ED:
.byte $F8,$F8,$F0,$F0,$F0,$E8,$E8,$E8,$E0,$E0

off_04_A9F7:
.byte $F0,$F1,$F1,$E9,$E8,$E9,$F8,$F8,$E1,$E1

off_04_AA01:
.byte $F7,$F7,$E7,$EF,$EF,$DF,$DF,$DF,$E7,$E7

off_04_AA0B:
.byte $F7,$F7,$E7,$EF,$EF,$DF,$E7,$DF,$E7,$DF

off_04_AA15:
.byte $EB,$EB,$EB,$F3

off_04_AA19:
.byte $F3,$F3,$FB,$FB,$E3,$E3

off_04_AA1F:
.byte $F0,$F0,$F0,$E8,$E8,$E8,$F8,$F8,$E0,$E0

off_04_AA29:
.byte $E8,$F0,$F0,$E8,$E8,$F0,$F8,$F8,$E0,$E0

off_04_AA33:
.byte $F8,$F8,$E8,$F0,$F0,$E1,$E8,$E0,$E8,$E0

off_04_AA3D:
.byte $F0,$F0,$E8,$E8,$F8,$F8,$E0,$E0,$E8,$F0

off_04_AA47:
.byte $E0,$E8,$E8,$F0,$F0,$F8,$F8,$E0,$DF,$E7

off_04_AA51:
.byte $E8,$E8,$F0,$F0,$E8,$F0,$F8,$F8,$E0,$E0

off_04_AA5B:
.byte $E2,$EA,$EA,$F2,$E2,$F8,$F8,$F2,$EA,$F2

off_04_AA65:
.byte $E8,$F0,$F0,$F0,$E0,$E0,$E8,$E8,$F8,$F8

off_04_AA6F:
.byte $DE,$E6,$E6,$EE,$DE,$EE,$F6,$F6,$E6,$EE

off_04_AA79:
.byte $E8,$E8,$E8,$F0,$F0,$F0,$E0,$E0,$F7,$F8

off_04_AA83:
.byte $E8,$E8,$F2,$F0,$F0,$FA,$F8,$F0

off_04_AA8B:
.byte $F8,$F8,$E8,$E8,$E8,$F0,$F0,$F0

off_04_AA93:
.byte $E0,$E0,$E8,$E9,$F1,$E8,$F0,$F8,$F8,$F0

off_04_AA9D:
.byte $E0,$E0,$EF,$EE,$E8,$E8,$F0,$F0,$F8,$F8

off_04_AAA7:
.byte $E8,$F0,$F0,$F0,$E8,$E8,$E0,$E0,$F8,$F8

off_04_AAB1:
.byte $D8,$D8,$E0,$E0,$E0,$E8,$E8,$E8,$F0,$F0

off_04_AABB:
.byte $F7,$DF,$DF,$E7,$E7,$E7,$EF,$EF,$EF,$E7

off_04_AAC5:
.byte $C0,$C8,$D0,$C8,$D0,$C0,$C8,$D0,$D8,$D8

off_04_AACF:
.byte $E8,$E8,$E0,$F8,$F8,$E0,$E8,$F0,$F0,$F0

off_04_AAD9:
.byte $F8,$F8,$E8,$F0,$F0,$E8,$E0,$E8,$E0,$E0

off_04_AAE3:
.byte $E1,$E1,$E9,$EF,$E9,$F1,$F1,$F9,$F9

off_04_AAEC:
.byte $E8,$E8,$F0,$F0,$F0,$F8,$F8,$E1,$E1

off_04_AAF5:
.byte $FC,$FC,$E4,$E4,$F4,$F4,$EC,$EC,$EC

off_04_AAFE:
.byte $EA,$EA,$EA,$EA,$F2,$F2,$F2,$F2,$FA

off_04_AB07:
.byte $F8,$F8,$EB,$E0,$E0,$E8,$E8,$F0

off_04_AB0F:
.byte $F0,$F8,$F0,$F8,$E8,$F0,$F8,$F0,$F8

off_04_AB18:
.byte $DE,$DE,$E6,$E6,$EE,$EE,$F6,$F6,$EE

off_04_AB21:
.byte $F8,$F0,$F8,$E8,$E0,$E0,$E8,$EF,$F0

off_04_AB2A:
.byte $EC,$EC,$F4,$F4,$F4,$EC,$FC,$FC,$FC

off_04_AB33:
.byte $EC,$EC,$EC,$F4,$F4,$F4,$FC,$FC,$FC

off_04_AB3C:
.byte $E8,$E8,$F0,$F0,$F0,$F8,$F8,$F8,$E8

off_04_AB45:
.byte $F8,$F0,$E8,$E8,$F0,$F8

off_04_AB4B:
.byte $F8,$F0,$E8,$F8,$F0,$E8,$E8,$F0,$F8

off_04_AB54:
.byte $E1,$E1,$E9,$F1,$F9,$F9,$EF,$E9,$F1

off_04_AB5D:
.byte $E8,$E8,$F0,$F8,$E0,$E0,$F0,$F0,$F8

off_04_AB66:
.byte $E7,$E7,$EF,$F4,$EF,$DF,$DF,$F7,$F4

off_04_AB6F:
.byte $E3,$E3,$F3,$FB,$FB,$EB,$EB,$F3,$F3

off_04_AB78:
.byte $F8,$E8,$E8,$F0,$F0,$E1,$E1,$F8,$EE

off_04_AB81:
.byte $D8,$D8,$E0,$E0,$E8,$E8,$F0,$F0,$F8

off_04_AB8A:
.byte $F4,$E8,$E8,$F8,$F8,$F0,$F8,$F0,$F0

off_04_AB93:
.byte $E0,$E0,$F8,$E8,$E8,$F0,$F0,$F8,$F0

off_04_AB9C:
.byte $DA,$DA,$E2,$EA,$E2,$EA,$F2,$F2,$FA

off_04_ABA5:
.byte $E8,$F8,$F8,$EE,$E8,$F0,$F0,$E0,$E0

off_04_ABAE:
.byte $E2,$F8,$E2,$F0,$F0,$E8,$F8,$E8,$EA

off_04_ABB7:
.byte $F0,$F8,$E8,$E0,$F1,$F0,$F8,$E0,$E8

off_04_ABC0:
.byte $EA,$F2,$ED,$FA,$FA,$EA,$F2,$E2,$E2

off_04_ABC9:
.byte $F3,$F3,$FB,$FB,$EB,$EB,$EB,$E3,$E3

off_04_ABD2:
.byte $E0,$E0,$E8,$E8,$F0,$F0,$F8,$F8,$DC

off_04_ABDB:
.byte $F8,$E7,$EF,$E0,$E0,$E8,$E8,$F0

off_04_ABE3:
.byte $D8,$E0,$F8,$F0,$F0,$E8,$E8,$E0

off_04_ABEB:
.byte $F0,$F0,$F8,$F8,$F2,$FA,$F0,$F8

off_04_ABF3:
.byte $E8,$E8,$F0,$F0,$E0,$E0,$D8,$D8

off_04_ABFB:
.byte $E7,$E7,$EF,$F7,$EF,$F7,$DF,$DF

off_04_AC03:
.byte $E0,$E0,$F0,$F0,$F8,$F8,$E8,$E8

off_04_AC0B:
.byte $F8,$F8,$F0,$F0,$F0,$F8,$F8,$F0

off_04_AC13:
.byte $CF,$CF,$CF,$CF,$D7,$D7,$D7,$D7

off_04_AC1B:
.byte $F8,$F8,$E8,$E8,$F0,$F0,$E0,$E0

off_04_AC23:
.byte $F0,$F0,$F0,$EE,$F8,$F8,$F8,$F6

off_04_AC2B:
.byte $E0,$E0,$E8,$F0,$F0,$F8,$F8,$E8

off_04_AC33:
.byte $FB,$FB,$F3,$F1,$F9,$F3,$F3,$FB

off_04_AC3B:
.byte $F0,$F0,$F8,$F8,$E8,$E8,$F8,$F0

off_04_AC43:
.byte $F2,$F0,$F0,$F0,$FA,$F8,$F8,$F8

off_04_AC4B:
.byte $F1,$F1,$F9,$F9,$F1,$F9,$F1,$F9

off_04_AC53:
.byte $F0,$F0,$F0,$F8,$F8,$F8,$F0,$F8

off_04_AC5B:
.byte $F0,$F0,$F8,$F8,$F0,$F8,$E8,$F0

off_04_AC63:
.byte $D8,$F8,$E8,$E8,$F0,$F0,$E0,$E0

off_04_AC6B:
.byte $DE,$DE,$E6,$E6,$EE,$F6,$EE,$F6

off_04_AC73:
.byte $F0,$F8,$F0,$F8,$E0,$E8,$F0,$F8

off_04_AC7B:
.byte $F0,$F0,$F8,$F8,$E8,$F0,$F8,$E8

off_04_AC83:
.byte $D0,$D0,$D8,$D8,$D8,$D0,$D8

off_04_AC8A:
.byte $D3,$D3,$DB,$DB,$D3,$DB,$E3

off_04_AC91:
.byte $D2,$D2,$DA,$DA,$D2,$DA,$E2

off_04_AC98:
.byte $F4,$F4,$F0,$F0,$F8,$F8

off_04_AC9E:
.byte $EF,$F7,$F7,$F7,$E7,$EF

off_04_ACA4:
.byte $EE,$EE,$EE,$F0,$F4

off_04_ACA9:
.byte $F1,$F1,$F9,$F9,$E9,$F2

off_04_ACAF:
.byte $F7,$F7,$F7,$EF,$EF,$EF

off_04_ACB5:
.byte $F1,$F9,$E9

off_04_ACB8:
.byte $F1,$F9,$F2,$F1,$F9,$E9

off_04_ACBE:
.byte $F3,$F3,$FB,$FB,$F6,$F6

off_04_ACC4:
.byte $F1,$F9,$F9,$F2

off_04_ACC8:
.byte $F9,$F7,$F1

off_04_ACCB:
.byte $DD,$F2

off_04_ACCD:
.byte $F7,$D8

table_04_83D8_ACCF:
.word table_04_83D8_ACCF_ACDD
.word table_04_83D8_ACCF_ACE6
.word table_04_83D8_ACCF_ACEF
.word table_04_83D8_ACCF_ACF8
.word table_04_83D8_ACCF_AD01
.word table_04_83D8_ACCF_AD0A
.word table_04_83D8_ACCF_AD13

table_04_83D8_ACCF_ACDD:
.byte $16
.word off_04_ADAC
.word off_04_AE4A
.word off_04_AEEC
.word off_04_AF77

table_04_83D8_ACCF_ACE6:
.byte $18
.word off_04_AD4E
.word off_04_ADF4
.word off_04_AE92
.word off_04_AF34

table_04_83D8_ACCF_ACEF:
.byte $17
.word off_04_AD7E
.word off_04_AE1C
.word off_04_AEC2
.word off_04_AF60

table_04_83D8_ACCF_ACF8:
.byte $17
.word off_04_AD95
.word off_04_AE33
.word off_04_AED9
.word off_04_AF4C

table_04_83D8_ACCF_AD01:
.byte $18
.word off_04_AD66
.word off_04_AE0C
.word off_04_AEAA
.word off_04_AF4C

table_04_83D8_ACCF_AD0A:
.byte $19
.word off_04_AD1C
.word off_04_ADC2
.word off_04_AE60
.word off_04_AF02

table_04_83D8_ACCF_AD13:
.byte $19
.word off_04_AD35
.word off_04_ADDB
.word off_04_AE79
.word off_04_AF1B

off_04_AD1C:
.byte $3C,$3D,$3E,$3F,$4C,$4D,$4E,$4F,$5C,$5D,$5E,$5F,$6C,$6D,$6E,$6F,$7C,$7D,$7E,$7F,$5B,$6B,$7B,$6A,$7A

off_04_AD35:
.byte $3C,$3D,$3E,$3F,$4F,$39,$3A,$3B,$55,$56,$57,$58,$59,$65,$66,$67,$68,$69,$75,$76,$77,$78,$79,$6A,$7A

off_04_AD4E:
.byte $01,$02,$03,$04,$11,$12,$13,$21,$22,$50,$51,$52,$53,$54,$60,$61,$62,$63,$64,$70,$71,$72,$73,$74

off_04_AD66:
.byte $01,$02,$03,$04,$11,$12,$13,$14,$22,$23,$24,$0B,$0C,$1A,$1B,$1C,$1D,$1E,$2A,$2B,$2C,$2D,$2E,$2F

off_04_AD7E:
.byte $45,$46,$47,$48,$35,$36,$37,$38,$21,$26,$27,$28,$01,$02,$11,$12,$03,$17,$18,$19,$08,$09,$49

off_04_AD95:
.byte $01,$02,$03,$04,$05,$06,$13,$14,$15,$16,$00,$23,$24,$10,$25,$07,$1D,$1E,$20,$0D,$0E,$0F,$1F

off_04_ADAC:
.byte $01,$02,$03,$04,$11,$12,$13,$14,$21,$22,$23,$24,$31,$32,$33,$34,$41,$42,$43,$44,$30,$40

off_04_ADC2:
.byte $01,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$01,$02,$00,$00,$01,$02,$01,$01,$01,$02,$02,$02,$02,$02

off_04_ADDB:
.byte $01,$01,$01,$01,$01,$01,$01,$01,$02,$00,$00,$01,$01,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02

off_04_ADF4:
.byte $01,$01,$01,$01,$01,$00,$00,$01,$00,$00,$01,$01,$01,$01,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02

off_04_AE0C:
.byte $01,$01,$01,$01,$01,$00,$00,$01,$00,$00,$01,$01,$01,$02,$02,$02

off_04_AE1C:
.byte $02,$02,$02,$02,$02,$02,$02,$02,$01,$00,$00,$02,$01,$01,$01,$00,$01,$00,$02,$01,$01,$01,$02

off_04_AE33:
.byte $01,$01,$01,$01,$01,$01,$00,$01,$02,$00,$02,$00,$01,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02

off_04_AE4A:
.byte $01,$01,$01,$01,$01,$00,$00,$01,$01,$00,$00,$01,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02

off_04_AE60:
.byte $EA,$F2,$FA,$02,$EA,$F2,$FA,$02,$EA,$F2,$FA,$02,$EA,$F2,$FA,$02,$EA,$F2,$FA,$02,$E2,$E2,$E2,$DA,$DA

off_04_AE79:
.byte $EA,$F2,$FA,$02,$02,$EA,$F2,$FA,$E2,$EA,$F2,$FA,$02,$E2,$EA,$F2,$FA,$02,$E2,$EA,$F2,$FA,$02,$DA,$DA

off_04_AE92:
.byte $E9,$F1,$F9,$01,$E9,$F1,$F9,$E8,$F0,$F8,$00,$08,$01,$09,$E1,$E9,$F1,$F9,$01,$E1,$E9,$F1,$F9,$01

off_04_AEAA:
.byte $E8,$F0,$F8,$00,$E8,$F0,$F8,$00,$EF,$F7,$FF,$DF,$E7,$DA,$E2,$EA,$F2,$FA,$D8,$E0,$E8,$F0,$F8,$00

off_04_AEC2:
.byte $E1,$E9,$F1,$F9,$E3,$EB,$F3,$FB,$E8,$F0,$F8,$00,$E9,$F1,$E9,$F1,$F9,$F9,$01,$09,$01,$09,$01

off_04_AED9:
.byte $E9,$F1,$F9,$01,$E9,$F1,$F9,$01,$E8,$F0,$E0,$F8,$00,$DB,$E3,$EB,$F3,$FB,$E0

off_04_AEEC:
.byte $E8,$F0,$F8,$00,$E8,$F0,$F8,$00,$E7,$EF,$F7,$FF,$E8,$F0,$F8,$00,$E8,$F0,$F8,$00,$E0,$E0

off_04_AF02:
.byte $E0,$E2,$E2,$E2,$E8,$EA,$EA,$EA,$F0,$F2,$F2,$F2,$F8,$FA,$FA,$FA,$00,$02,$02,$02,$F0,$F8,$00,$F8,$00

off_04_AF1B:
.byte $E0,$E2,$E2,$E2,$EA,$E8,$EA,$EA,$F0,$F0,$F2,$F2,$F2,$F8,$F8,$FA,$FA,$FA,$00,$00,$02,$02,$02,$F8,$00

off_04_AF34:
.byte $E0,$E0,$E0,$E0,$E8,$E8,$E8,$F0,$F0,$F0,$F0,$F0,$E8,$E8,$F8,$F8,$F8,$F8,$F8,$00,$00,$00,$00,$00

off_04_AF4C:
.byte $E0,$E0,$E0,$E0,$E8,$E8,$E8,$E8,$F0,$F0,$F0,$F0,$F0,$F8,$F8,$F8,$F8,$F8,$00,$00

off_04_AF60:
.byte $00,$00,$00,$00,$F8,$F8,$F8,$F8,$F0,$F0,$F0,$F0,$E0,$E0,$E8,$E8,$E0,$E8,$E8,$E8,$E0,$E0,$00

off_04_AF77:
.byte $E0,$E0,$E0,$E0,$E8,$E8,$E8,$E8,$F0,$F0,$F0,$F0,$F8,$F8,$F8,$F8,$00,$00,$00,$00,$F8,$00

_loc_04_AF8D:
	LDA #$01
	STA $1D
	JMP _loc_04_AFB9
_loc_04_AF94:
	LDY игрок_с_мячом
	LDA номер_движения,Y
	AND #$7F
	TAY
	LDA table_04_B07C,Y
	BPL bra_04_AFB7
	ASL
	TAY
	LDA table_04_B0D8,Y
	STA $2C
	LDA table_04_B0D8 + 1,Y
	STA $2D
	LDY игрок_с_мячом
	LDA подтип_анимации,Y
	TAY
	LDA ($2C),Y
bra_04_AFB7:
	STA $1D
_loc_04_AFB9:
	LDY игрок_с_мячом
	LDA #$00
	STA $1C
	STA $2F
	STA $31
	STA $33
	LDA скорость_X_lo,Y
	STA скорость_X_lo,X
	LDA скорость_X_hi,Y
	STA скорость_X_hi,X
	LDA скорость_Y_lo,Y
	STA скорость_Y_lo,X
	LDA скорость_Y_hi,Y
	STA скорость_Y_hi,X
	LDA скорость_Z_lo,Y
	STA скорость_Z_lo,X
	LDA скорость_Z_hi,Y
	STA скорость_Z_hi,X
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
	LDA направление_движения,Y
	STA направление_движения,X
	BPL bra_04_B018
	DEC $1C
bra_04_B018:
	LDA $1D
	ASL
	TAY
	LDA table_04_B0EF,Y
	STA $2C
	LDA table_04_B0EF + 1,Y
	STA $2D
	LDY игрок_с_мячом
	LDA номер_кадра_анимации,Y
	ASL
	ADC номер_кадра_анимации,Y
	TAY
	CLC
	LDA $1C
	BPL bra_04_B037
	SEC
bra_04_B037:
	LDA ($2C),Y
	BPL bra_04_B03D
	DEC $2F
bra_04_B03D:
	EOR $1C
	ADC координата_X_lo,X
	STA координата_X_lo,X
	LDA $2F
	EOR $1C
	ADC координата_X_hi,X
	STA координата_X_hi,X
	INY
	CLC
	LDA ($2C),Y
	BPL bra_04_B057
	DEC $31
bra_04_B057:
	ADC координата_Y_lo,X
	STA координата_Y_lo,X
	LDA $31
	ADC координата_Y_hi,X
	STA координата_Y_hi,X
	INY
	CLC
	LDA ($2C),Y
	BPL bra_04_B06D
	DEC $33
bra_04_B06D:
	ADC координата_Z_lo,X
	STA координата_Z_lo,X
	LDA $33
	ADC координата_Z_hi,X
	STA координата_Z_hi,X
	RTS

table_04_B07C:
.byte $00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$82,$00,$00,$00,$81,$00,$00,$00,$00,$00,$83,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80,$80,$00,$00,$00,$00,$00,$10,$00,$00,$09,$00,$00,$00,$00,$0A,$0B,$00,$00,$00,$00,$00,$80,$80,$0C,$00,$00,$00,$00,$00,$09,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0F,$00,$00,$00,$00

table_04_B0D8:
.word table_04_B0D8_B0E0
.word table_04_B0D8_B0E2
.word table_04_B0D8_B0EA
.word table_04_B0D8_B0ED

table_04_B0D8_B0E0:
.byte $07,$08

table_04_B0D8_B0E2:
.byte $05,$05,$05,$06,$05,$05,$05,$05

table_04_B0D8_B0EA:
.byte $04,$03,$03

table_04_B0D8_B0ED:
.byte $0D,$0E

table_04_B0EF:
.word table_04_B0EF_B11D
.word table_04_B0EF_B111
.word table_04_B0EF_B19E
.word table_04_B0EF_B159
.word table_04_B0EF_B15F
.word table_04_B0EF_B132
.word table_04_B0EF_B141
.word table_04_B0EF_B192
.word table_04_B0EF_B198
.word table_04_B0EF_B18C
.word table_04_B0EF_B180
.word table_04_B0EF_B186
.word table_04_B0EF_B1A4
.word table_04_B0EF_B1AA
.word table_04_B0EF_B1B3
.word table_04_B0EF_B1BC
.word table_04_B0EF_B1D4

table_04_B0EF_B111:
.byte $04,$01,$08,$04,$01,$09,$04,$01,$08,$04,$01,$09

table_04_B0EF_B11D:
.byte $0C,$01,$00,$0C,$01,$00,$0C,$01,$00,$0C,$01,$00,$0C,$01,$00,$0C,$01,$00,$0C,$01,$00

table_04_B0EF_B132:
.byte $0C,$01,$00,$0C,$01,$00,$0C,$01,$00,$F4,$FF,$0A,$F4,$FF,$0A

table_04_B0EF_B141:
.byte $00,$01,$FA,$00,$01,$FA,$00,$01,$FA,$F4,$FF,$0A,$F4,$FF,$0A,$0C,$01,$00,$0C,$01,$00,$0C,$01,$00

table_04_B0EF_B159:
.byte $07,$FF,$01,$07,$FF,$01

table_04_B0EF_B15F:
.byte $01,$01,$1C,$07,$FF,$01,$07,$FF,$01,$0C,$01,$00,$0C,$01,$00,$0C,$01,$00,$0C,$01,$00,$0C,$01,$00,$0C,$01,$00,$0C,$01,$00,$0C,$01,$00

table_04_B0EF_B180:
.byte $0C,$FF,$00,$0C,$FF,$00

table_04_B0EF_B186:
.byte $08,$FF,$18,$08,$FF,$18

table_04_B0EF_B18C:
.byte $F8,$FF,$18,$F8,$FF,$18

table_04_B0EF_B192:
.byte $04,$E4,$00,$04,$E4,$00

table_04_B0EF_B198:
.byte $08,$04,$00,$08,$04,$00

table_04_B0EF_B19E:
.byte $08,$01,$00,$08,$01,$00

table_04_B0EF_B1A4:
.byte $01,$01,$1C,$01,$01,$1C

table_04_B0EF_B1AA:
.byte $02,$01,$1A,$02,$01,$1A,$02,$01,$1A

table_04_B0EF_B1B3:
.byte $FD,$01,$1A,$FD,$01,$1A,$FD,$01,$1A

table_04_B0EF_B1BC:
.byte $0C,$01,$00,$0C,$01,$00,$F8,$01,$00,$F8,$01,$04,$00,$01,$1C,$0A,$01,$08,$0C,$01,$00,$0C,$01,$00

table_04_B0EF_B1D4:
.byte $0C,$01,$00,$08,$FF,$00,$F8,$FF,$00,$F6,$04,$00,$0C,$01,$00,$08,$FF,$00,$F8,$FF,$00,$F6,$04,$00,$0C,$01,$00,$08,$FF,$00,$F8,$FF,$00,$F6,$04,$00,$0C,$01,$00,$08,$FF,$00,$F8,$FF,$00,$F6,$04,$00

_loc_04_B204:
	JSR _loc_04_B26E
	JMP _loc_04_B20D
	JMP _loc_04_B26E		; прыжок не используется, верхний JSR можно переписать
_loc_04_B20D:
	LDX #$00
bra_04_B20F:
	LDA приоритет_отрисовки_спрайта,X
	AND #$1F
	TAY
	SEC
	LDA координата_Y_lo,Y
	SBC байт_для_2005_Y
	STA $C1,X
	INX
	CPX $F4
	BCC bra_04_B20F
	LDA $F4
	STA $2B
	BEQ bra_04_B26D
	DEC $2B
_loc_04_B22D:
	LDA $2B
	BEQ bra_04_B26D
	LDX #$00
	STX $1C
bra_04_B235:
	LDA $C1,X
	CMP $C2,X
	BCS bra_04_B25F
	LDA приоритет_отрисовки_спрайта + 1,X
	STA $1F
	LDA приоритет_отрисовки_спрайта,X
	STA приоритет_отрисовки_спрайта + 1,X
	LDA $1F
	STA приоритет_отрисовки_спрайта,X
	LDA $C2,X
	STA $1F
	LDA $C1,X
	STA $C2,X
	LDA $1F
	STA $C1,X
	INC $1C
bra_04_B25F:
	INX
	CPX $2B
	BCC bra_04_B235
	LDA $1C
	BEQ bra_04_B26D
	DEC $2B
	JMP _loc_04_B22D
bra_04_B26D:
	RTS
_loc_04_B26E:
	LDX #$12
	LDA #$00
bra_04_B272:
	STA флаг_видимости,X
	DEX
	BPL bra_04_B272
	LDA $F3
	BEQ bra_04_B27E
	LDA #$10
bra_04_B27E:
	STA $F5
	LDA $F4
	BNE bra_04_B288
	JMP _loc_04_B315
bra_04_B288:
	LDX #$00
_loc_04_B28A:
	LDA приоритет_отрисовки_спрайта,X
	AND #$1F
	TAY
	LDA координата_X_lo,Y
	SEC
	SBC $F0
	STA $03AF,Y
	LDA координата_X_hi,Y
	SBC $F1
	BNE bra_04_B2FB
	LDA $03AF,Y
	CMP #$08
	BCC bra_04_B2FB
	CLC
	LDA координата_Y_lo,Y
	ADC $F5
	STA $2C
	LDA координата_Y_hi,Y
	ADC #$00
	STA $2D
	SEC
	LDA $2C
	SBC $F2
	STA $2C
	STA $03D5,Y
	LDA $2D
	SBC $F3
	STA $2D
	SEC
	LDA $2C
	SBC координата_Z_lo,Y
	STA $03C2,Y
	LDA $2D
	SBC координата_Z_hi,Y
	BNE bra_04_B2EB
	LDA $2D
	BEQ bra_04_B2DF
	LDA #$FF
	STA $03D5,Y
bra_04_B2DF:
	LDA #$01
	STA флаг_видимости,Y
	LDA приоритет_отрисовки_спрайта,X
	AND #$20
	BEQ bra_04_B30D
bra_04_B2EB:
	LDA приоритет_отрисовки_спрайта,X
	AND #$20
	BEQ bra_04_B2FB
	LDA $2D
	BEQ bra_04_B30D
	LDA #$FF
	STA $03D5,Y
bra_04_B2FB:
	TXA
	TAY
	DEX
	DEC $F4
bra_04_B301:
	LDA приоритет_отрисовки_спрайта + 1,Y
	STA приоритет_отрисовки_спрайта,Y
	INY
	CPY $F4
	BCC bra_04_B301
bra_04_B30D:
	INX
	CPX $F4
	BCS bra_04_B315
	JMP _loc_04_B28A
_loc_04_B315:
bra_04_B315:
	RTS

_loc_04_B316:
	LDY #$00
	STY $05FC
	LDA сила_ветра
_loc_04_B31E:
	CMP table_04_B48E,Y
	BEQ bra_04_B32C
	BCC bra_04_B32C
	INC $05FC
	INY
	JMP _loc_04_B31E
bra_04_B32C:
	LDA сторона_ветра_дождя
	AND #$E0
	LSR
	LSR
	LSR
	TAY
	LDA table_04_B492,Y
	STA $2C
	LDA table_04_B492 + 1,Y
	STA $2D
	LDA table_04_B492 + 2,Y
	STA $2E
	LDA table_04_B492 + 3,Y
	STA $2F
	LDA #$00
	STA $0600
	STA $05FF
	STA $0602
	STA $0601
	LDA сила_ветра
	BEQ bra_04_B396
	STA $1C
bra_04_B35E:
	ASL $1C
	BCC bra_04_B384
	CLC
	LDA $2C
	ADC $0600
	STA $0600
	LDA $2D
	ADC $05FF
	STA $05FF
	CLC
	LDA $2E
	ADC $0602
	STA $0602
	LDA $2F
	ADC $0601
	STA $0601
bra_04_B384:
	LDA $2D
	ASL
	ROR $2D
	ROR $2C
	LDA $2F
	ASL
	ROR $2F
	ROR $2E
	LDA $1C
	BNE bra_04_B35E
bra_04_B396:
	LDX #$00
	LDA номер_погодного_эффекта
	CMP #ПОГОДА_СМЕРЧ
	BEQ bra_04_B3A2
	JMP _loc_04_B44D
_loc_04_B3A2:
bra_04_B3A2:
	LDY #$0D
	JSR _b07_FA6D
	CMP #$80
	BCC bra_04_B3AE
	JMP _loc_04_B445
bra_04_B3AE:
	LSR
	LSR
	LSR
	AND #$0C
	STA $1C
	TAY
	CPX #$0C
	BNE bra_04_B3BC
	INY
	INY
bra_04_B3BC:
	LDA состояние_игрока,X
	BPL bra_04_B3C2
	INY
bra_04_B3C2:
	TYA
	ASL
	TAY
	LDA table_04_B44E,Y
	STA $2C
	STA $2E
	LDA table_04_B44E + 1,Y
	STA $2D
	STA $2F
	LDA координата_X_hi,X
	CMP $0334
	BEQ bra_04_B3E0
	BCC bra_04_B3FB
	JMP _loc_04_B3EA
bra_04_B3E0:
	LDA координата_X_lo,X
	CMP $0321
	BEQ bra_04_B40C
	BCC bra_04_B3FB
_loc_04_B3EA:
	CLC
	LDA $2C
	EOR #$FF
	ADC #$01
	STA $2C
	LDA $2D
	EOR #$FF
	ADC #$00
	STA $2D
bra_04_B3FB:
	CLC
	LDA скорость_X_lo,X
	ADC $2C
	STA скорость_X_lo,X
	LDA скорость_X_hi,X
	ADC $2D
	STA скорость_X_hi,X
bra_04_B40C:
	LDA координата_Y_hi,X
	CMP $036D
	BEQ bra_04_B419
	BCC bra_04_B434
	JMP _loc_04_B423
bra_04_B419:
	LDA координата_Y_lo,X
	CMP $035A
	BEQ bra_04_B445
	BCC bra_04_B434
_loc_04_B423:
	CLC
	LDA $2E
	EOR #$FF
	ADC #$01
	STA $2E
	LDA $2F
	EOR #$FF
	ADC #$00
	STA $2F
bra_04_B434:
	CLC
	LDA скорость_Y_lo,X
	ADC $2E
	STA скорость_Y_lo,X
	LDA скорость_Y_hi,X
	ADC $2F
	STA скорость_Y_hi,X
_loc_04_B445:
bra_04_B445:
	INX
	CPX #$0D
	BCS bra_04_B44D
	JMP _loc_04_B3A2
_loc_04_B44D:
bra_04_B44D:
	RTS

table_04_B44E:
.byte $00,$01
.byte $40,$00
.byte $40,$00
.byte $40,$00
.byte $C0,$00
.byte $30,$00
.byte $30,$00
.byte $30,$00
.byte $A0,$00
.byte $20,$00
.byte $20,$00
.byte $20,$00
.byte $80,$00
.byte $10,$00
.byte $10,$00
.byte $10,$00
.byte $40,$00
.byte $18,$00
.byte $18,$00
.byte $18,$00
.byte $20,$00
.byte $10,$00
.byte $10,$00
.byte $10,$00
.byte $10,$00
.byte $08,$00
.byte $08,$00
.byte $08,$00
.byte $08,$00
.byte $04,$00
.byte $04,$00
.byte $04,$00

table_04_B48E:
.byte $00,$03,$05,$80

table_04_B492:
.byte $00,$00,$80,$FF
.byte $A6,$00,$AD,$FF
.byte $00,$01,$00,$00
.byte $A6,$00,$53,$00
.byte $00,$00,$80,$00
.byte $5A,$FF,$53,$00
.byte $00,$FF,$00,$00
.byte $5A,$FF,$AD,$FF

_loc_04_B4B2:
	LDA режим_игры_на_поле
	AND #$01
	BEQ bra_04_B4BE
	JSR _loc_04_B850
	JMP _loc_04_B4C8
bra_04_B4BE:
	LDX #$00
bra_04_B4C0:
	JSR _loc_04_B4C9
	INX
	CPX #$04
	BCC bra_04_B4C0
_loc_04_B4C8:
	RTS
_loc_04_B4C9:
	STX $43
	LDA номер_управляемого,X
	BMI bra_04_B4DB
	TAX
	LDA позиция_управление,X
	BMI bra_04_B4DB
	LDA номер_действия,X
	BMI bra_04_B4DE
bra_04_B4DB:
	JMP _loc_04_B724
bra_04_B4DE:
	LDX $43
	JSR _b07_FAEE
	LDA удержанные_кнопки,X
	STA $1D
	LDA одноразовые_кнопки,X
	STA $1E
	LDA $056C,X
	STA $1F
	LDA $0570,X
	STA $20
	LDA $057C,X
	STA $21
	LDA номер_управляемого,X
	TAX
	LDA режим_игры_на_поле
	AND #$40
	BNE bra_04_B536
	LDA состояние_игрока,X
	AND #$01
	BNE bra_04_B556
	CPX #$0A
	BCS bra_04_B541
	LDY игрок_с_мячом
	CPY #$0A
	BCC bra_04_B529
	LDA состояние_мяча
	AND #$40
	BEQ bra_04_B529
	LDA флаг_кипера_в_штрафной - $0A,Y
	BPL bra_04_B536
bra_04_B529:
	TXA
	AND #$01
	TAY
	LDA $067A,Y
	AND #$0F
	CMP #$0F
	BEQ bra_04_B556
bra_04_B536:
	LDA #$03
	STA $1C
	JMP _loc_04_B578
	CPX #$0A
	BCC bra_04_B556
bra_04_B541:
	LDA флаг_кипера_в_штрафной - $0A,X
	BMI bra_04_B556
	LDA #$04
	STA $1C
	LDA состояние_игрока,X
	AND #$40
	BNE bra_04_B578
	INC $1C
	JMP _loc_04_B578
bra_04_B556:
	LDA #$00
	STA $1C
	TXA
	AND #$01
	TAY
	LDA флаг_владения_мячом_команды
	ORA флаг_владения_мячом_команды + 1
	BPL bra_04_B578
	INC $1C
	LDA флаг_владения_мячом_команды,Y
	BPL bra_04_B578
	INC $1C
	LDA состояние_игрока,X
	AND #$40
	BNE bra_04_B578
	INC $1C
_loc_04_B578:
bra_04_B578:
	LDA $1C
	ASL
	TAY
	LDA table_04_B737,Y
	STA $2E
	LDA table_04_B737 + 1,Y
	STA $2F
	LDA #$00
	STA $1C
	LDA состояние_игрока,X
	AND #$B0
	BEQ bra_04_B5A3
	INC $1C
	LDA состояние_игрока,X
	BMI bra_04_B5A3
	INC $1C
	LDA состояние_игрока,X
	ASL
	ASL
	BMI bra_04_B5A3
	INC $1C
bra_04_B5A3:
	LDA $1C
	ASL
	TAY
	LDA ($2E),Y
	STA $2C
	INY
	LDA ($2E),Y
	STA $2D
	LDA состояние_игрока,X
	BPL bra_04_B5D6
	LDA таймер_действия,X
	BEQ bra_04_B5CF
	LDA номер_движения,X
	AND #$7F
	CMP #$58
	BEQ bra_04_B5CF
	LDA $1E
	AND #$C0
	BEQ bra_04_B5CF
	LDA #$45
	JMP _loc_04_B721
bra_04_B5CF:
	LDA $1E
	LSR
	JMP _loc_04_B614
bra_04_B5D6:
	LDA $20
	BPL bra_04_B614
	LDA $1D
	AND #$0C
	BEQ bra_04_B5EB
	LDY #$01
	LDA ($2C),Y
	BMI bra_04_B5EB
	JMP _loc_04_B721
bra_04_B5EB:
	LDA $1D
	AND #$03
	BEQ bra_04_B5FB
	LDY #$00
	LDA ($2C),Y
	BMI bra_04_B5EB
	JMP _loc_04_B721
bra_04_B5FB:
	LDA состояние_игрока,X
	AND #$08
	BEQ bra_04_B60B
	LDY #$02
	LDA ($2C),Y
	BMI bra_04_B60B
	JMP _loc_04_B721
bra_04_B60B:
	LDY #$03
	LDA ($2C),Y
	BMI bra_04_B614
	JMP _loc_04_B721
_loc_04_B614:
bra_04_B614:
	ASL
	BPL bra_04_B647
	LDA номер_движения_мяча
	AND #$7F
	CMP #$0A
	BNE bra_04_B62E
	CPX игрок_с_мячом
	BNE bra_04_B62E
	LDY #$04
	LDA ($2C),Y
	BMI bra_04_B62E
	JMP _loc_04_B721
bra_04_B62E:
	LDA $1D
	AND #$0C
	BEQ bra_04_B63E
	LDY #$05
	LDA ($2C),Y
	BMI bra_04_B63E
	JMP _loc_04_B721
bra_04_B63E:
	LDY #$06
	LDA ($2C),Y
	BMI bra_04_B647
	JMP _loc_04_B721
bra_04_B647:
	ASL
	BPL bra_04_B696
	LDA номер_движения,X
	AND #$7F
	CMP #$02
	BNE bra_04_B65C
	LDY #$0B
	LDA ($2C),Y
	BMI bra_04_B65C
	JMP _loc_04_B721
bra_04_B65C:
	LDA $1D
	AND #$0F
	BNE bra_04_B66C
	LDY #$07
	LDA ($2C),Y
	BMI bra_04_B66C
	JMP _loc_04_B721
bra_04_B66C:
	LDA $1D
	AND #$0C
	BEQ bra_04_B67C
	LDY #$08
	LDA ($2C),Y
	BMI bra_04_B67C
	JMP _loc_04_B721
bra_04_B67C:
	TXA
	EOR $1D
	AND #$01
	BNE bra_04_B68D
	LDY #$09
	LDA ($2C),Y
	BMI bra_04_B68D
	JMP _loc_04_B721
bra_04_B68D:
	LDY #$0A
	LDA ($2C),Y
	BMI bra_04_B696
	JMP _loc_04_B721
bra_04_B696:
	LDA состояние_игрока,X
	BMI bra_04_B712
	LDA номер_движения,X
	AND #$7F
	CMP #$03
	BNE bra_04_B6BC
	LDA $1D
	AND #$03
	BNE bra_04_B6B7
	LDA $1D
	AND #$0C
	BEQ bra_04_B6BC
	LDA #$27
	JMP _loc_04_B70F
bra_04_B6B7:
	LDA #$2A
	JMP _loc_04_B70F
bra_04_B6BC:
	LDA состояние_игрока,X
	AND #$08
	BEQ bra_04_B6E6
	LDA состояние_игрока,X
	AND #$50
	BEQ bra_04_B6FE
	AND #$10
	BNE bra_04_B6DA
	LDA $21
	AND #$0C
	BEQ bra_04_B6FE
	LDA #$24
	JMP _loc_04_B70F
bra_04_B6DA:
	LDA $21
	AND #$0C
	BEQ bra_04_B6FE
	LDA #$25
	JMP _loc_04_B70F
bra_04_B6E6:
	LDA $21
	AND #$0F
	BNE bra_04_B70A
	LDA $1D
	AND #$0F
	BNE bra_04_B6F9
	LDA #$01
	JMP _loc_04_B70F
bra_04_B6F9:
	LDA #$20
	JMP _loc_04_B70F
bra_04_B6FE:
	LDA $21
	AND #$0F
	BEQ bra_04_B712
	LDA #$1D
	JMP _loc_04_B70F
bra_04_B70A:
	LDA #$21
	JMP _loc_04_B70F
_loc_04_B70F:
	STA номер_действия,X
bra_04_B712:
	LDA $1D
	AND #$0F
	TAY
	LDA table_04_B727,Y
	STA смена_угла_движения,X
	JMP _loc_04_B724
_loc_04_B721:
	STA номер_действия,X
_loc_04_B724:
	LDX $43
	RTS

table_04_B727:
.byte $FF,$40,$C0,$00,$80,$60,$A0,$00,$00,$20,$E0,$00,$00,$00,$00,$00

table_04_B737:
.word table_04_B737_B745
.word table_04_B737_B74D
.word table_04_B737_B755
.word table_04_B737_B75D
.word table_04_B737_B76D
.word table_04_B737_B765
.word table_04_B737_B775

table_04_B737_B745:
.word off_04_B77D
.word off_04_B789
.word off_04_B795
.word off_04_B801

table_04_B737_B74D:
.word off_04_B7D1
.word off_04_B7DD
.word off_04_B7C5
.word off_04_B801

table_04_B737_B755:
.word off_04_B7AD
.word off_04_B7B9
.word off_04_B7A1
.word off_04_B801

table_04_B737_B75D:
.word off_04_B7E9
.word off_04_B7F5
.word off_04_B7E9
.word off_04_B801

table_04_B737_B765:
.word off_04_B80D
.word off_04_B819
.word off_04_B825
.word off_04_B801

table_04_B737_B76D:
.word off_04_B831
.word off_04_B7B9
.word off_04_B831
.word off_04_B801

table_04_B737_B775:
.word off_04_B83D
.word off_04_B844
.word off_04_B83D
.word off_04_B801

off_04_B77D:
.byte $30,$30,$30,$30,$0D,$08,$08,$07,$07,$31,$31,$31

off_04_B789:
.byte $FF,$FF,$FF,$FF,$35,$35,$35,$33,$34,$32,$34,$34

off_04_B795:
.byte $44,$44,$44,$44,$08,$08,$08,$07,$07,$07,$07,$07

off_04_B7A1:
.byte $44,$44,$44,$44,$0A,$0A,$0A,$09,$09,$09,$09,$09

off_04_B7AD:
.byte $10,$30,$30,$0E,$0D,$0A,$0A,$09,$09,$09,$09,$09

off_04_B7B9:
.byte $FF,$FF,$FF,$FF,$39,$39,$39,$37,$38,$46,$38,$38

off_04_B7C5:
.byte $44,$44,$44,$44,$23,$23,$23,$22,$22,$22,$22,$19

off_04_B7D1:
.byte $30,$30,$30,$30,$23,$23,$23,$22,$22,$22,$22,$19

off_04_B7DD:
.byte $FF,$FF,$FF,$FF,$42,$42,$42,$3B,$3B,$3B,$3B,$3B

off_04_B7E9:
.byte $30,$30,$30,$30,$11,$11,$11,$11,$11,$11,$11,$11

off_04_B7F5:
.byte $30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30

off_04_B801:
.byte $10,$30,$30,$30,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

off_04_B80D:
.byte $52,$3E,$52,$52,$22,$29,$22,$22,$28,$41,$41,$41

off_04_B819:
.byte $FF,$FF,$FF,$FF,$54,$54,$54,$54,$54,$54,$54,$54

off_04_B825:
.byte $52,$3E,$52,$52,$22,$29,$22,$22,$28,$41,$41,$41

off_04_B831:
.byte $30,$30,$30,$30,$0A,$0A,$0A,$09,$09,$09,$09,$09

off_04_B83D:
.byte $30,$30,$30,$30,$17,$17,$17

off_04_B844:
.byte $30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30

_loc_04_B850:
	LDA позиция_управление
	AND позиция_управление + 1
	BMI bra_04_B867
	LDX #$00
bra_04_B85A:
	LDA номер_управляемого,X
	CMP игрок_с_мячом
	BEQ bra_04_B87E
	INX
	CPX #$04
	BCC bra_04_B85A
bra_04_B867:
	LDA счетчик_кадров
	AND #$1F
	BNE bra_04_B8A7
	LDX игрок_с_мячом
	LDA #$02
	ORA игрок_с_мячом
	ORA #$10
	STA направление_паса,X
	JMP _loc_04_B8A2
bra_04_B87E:
	LDA одноразовые_кнопки,X
	BMI bra_04_B8A2
	ASL
	BMI bra_04_B89E
	LDA одноразовые_кнопки
	AND #(КНОПКА_СЕЛЕКТ + КНОПКА_СТАРТ)
	BNE bra_04_B8A2
	LDA удержанные_кнопки,X
	LSR
	LSR
	AND #(КНОПКА_ВНИЗ/4 + КНОПКА_ВВЕРХ/4)
	TAY
	LDX игрок_с_мячом
	LDA table_04_B8A8,Y
	STA смена_угла_движения,X
	JMP _loc_04_B8A7
bra_04_B89E:
	LDA #$09
	BNE bra_04_B8A4
_loc_04_B8A2:
bra_04_B8A2:
	LDA #$0A
bra_04_B8A4:
	STA номер_действия,X
_loc_04_B8A7:
bra_04_B8A7:
	RTS

table_04_B8A8:
.byte $00,$80,$00

_loc_04_B8AB:
	STX $43
	LDA номер_управляемого,X
	TAX
	LDA позиция_управление,X
	BMI bra_04_B8BB
	LDA номер_действия,X
	BMI bra_04_B8BE
bra_04_B8BB:
	JMP _loc_04_B9E2
bra_04_B8BE:
	LDX $43
	JSR _b07_FAEE
	LDA удержанные_кнопки,X
	STA $1D
	LDA одноразовые_кнопки,X
	STA $1E
	LDA $056C,X
	STA $1F
	LDA $0570,X
	STA $20
	LDA $057C,X
	STA $21
	LDA номер_управляемого,X
	TAX
	LDA #$00
	STA $1C
	LDA состояние_игрока,X
	AND #$B0
	BEQ bra_04_B902
	INC $1C
	LDA состояние_игрока,X
	BMI bra_04_B902
	INC $1C
	LDA состояние_игрока,X
	ASL
	ASL
	BMI bra_04_B902
	INC $1C
bra_04_B902:
	LDA $1C
	ASL
	TAY
	LDA table_04_B9F5,Y
	STA $2C
	LDA table_04_B9F5 + 1,Y
	STA $2D
	LDA состояние_игрока,X
	BPL bra_04_B91C
	LDA $1E
	LSR
	JMP _loc_04_B94F
bra_04_B91C:
	LDA $20
	BPL bra_04_B94F
	LDA $1D
	AND #$03
	BEQ bra_04_B93E
	LDA направление_движения,X
	ROL
	ROL
	EOR $1D
	AND #$01
	BEQ bra_04_B939
	LDA #$09
	JMP _loc_04_B9DF
bra_04_B939:
	LDA #$0A
	JMP _loc_04_B9DF
bra_04_B93E:
	LDA состояние_игрока,X
	AND #$08
	BEQ bra_04_B94A
	LDA #$09
	JMP _loc_04_B9DF
bra_04_B94A:
	LDA #$08
	JMP _loc_04_B9DF
_loc_04_B94F:
bra_04_B94F:
	ASL
	BPL bra_04_B96B
	LDA $1D
	AND #$0C
	BEQ bra_04_B962
	LDY #$05
	LDA ($2C),Y
	BMI bra_04_B962
	JMP _loc_04_B9DF
bra_04_B962:
	LDY #$06
	LDA ($2C),Y
	BMI bra_04_B96B
	JMP _loc_04_B9DF
bra_04_B96B:
	ASL
	BPL bra_04_B9A8
	LDA $1D
	AND #$0F
	BNE bra_04_B97E
	LDY #$07
	LDA ($2C),Y
	BMI bra_04_B97E
	JMP _loc_04_B9DF
bra_04_B97E:
	LDA $1D
	AND #$0C
	BEQ bra_04_B98E
	LDY #$08
	LDA ($2C),Y
	BMI bra_04_B98E
	JMP _loc_04_B9DF
bra_04_B98E:
	TXA
	EOR $1D
	AND #$01
	BNE bra_04_B99F
	LDY #$09
	LDA ($2C),Y
	BMI bra_04_B99F
	JMP _loc_04_B9DF
bra_04_B99F:
	LDY #$0A
	LDA ($2C),Y
	BMI bra_04_B9A8
	JMP _loc_04_B9DF
bra_04_B9A8:
	LDA состояние_игрока,X
	BMI bra_04_B9D0
	LDA $21
	AND #$0F
	BNE bra_04_B9C3
	LDA $1D
	AND #$0F
	BNE bra_04_B9BF
	LDA #$01
	BNE bra_04_B9CD
bra_04_B9BF:
	LDA #$06
	BNE bra_04_B9CD
bra_04_B9C3:
	AND #$03
	BNE bra_04_B9CB
	LDA #$0D
	BNE bra_04_B9CD
bra_04_B9CB:
	LDA #$07
bra_04_B9CD:
	STA номер_действия,X
bra_04_B9D0:
	LDA $1D
	AND #$0F
	TAY
	LDA table_04_B9E5,Y
	STA смена_угла_движения,X
	JMP _loc_04_B9E2
_loc_04_B9DF:
	STA номер_действия,X
_loc_04_B9E2:
	LDX $43
	RTS

table_04_B9E5:
.byte $FF,$40,$C0,$00,$80,$60,$A0,$00,$00,$20,$E0,$00,$00,$00,$00,$00

table_04_B9F5:
.word table_04_B9F5_BA05
.word table_04_B9F5_BA05
.word table_04_B9F5_BA05
.word table_04_B9F5_BA05
.word table_04_B9F5_BA05
.word table_04_B9F5_BA10
.word table_04_B9F5_BA05
.word table_04_B9F5_BA05

table_04_B9F5_BA05:
.byte $0A,$08,$09,$08,$04,$04,$04,$05,$05,$05,$05

table_04_B9F5_BA10:
.byte $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08

_loc_04_BA1B:
	LDY игрок_с_мячом
	LDA направление_движения,Y
	STA направление_движения,X
	LDA смена_угла_движения,Y
	STA смена_угла_движения,X
	LDA #$00
	STA разновидность_супера
	STA номер_супера
	STA флаг_настройки_красного_супера
	LDA координата_X_lo,X
	STA $2C
	LDA координата_X_hi,X
	STA $2D
	LDA направление_движения,X
	BPL bra_04_BA51
	CLC
	LDA #$00
	SBC $2C
	STA $2C
	LDA #$04
	SBC $2D
	STA $2D
bra_04_BA51:
	LDY #$00
bra_04_BA53:
	LDA $2D
	CMP table_04_BB0E + 1,Y
	BEQ bra_04_BA5E
	BCC bra_04_BA6B
	BCS bra_04_BA65
bra_04_BA5E:
	LDA $2C
	CMP table_04_BB0E,Y
	BCC bra_04_BA6B
bra_04_BA65:
	INY
	INY
	CPY #$06
	BCC bra_04_BA53
bra_04_BA6B:
	STY $1C
	LDA координата_Z_hi,X
	BNE bra_04_BAD3
	LDY игрок_с_мячом
	LDA номер_движения,Y
	AND #$7F
	CMP #$33
	BEQ bra_04_BA82
	CMP #$37
	BNE bra_04_BA92
bra_04_BA82:
	JSR _loc_04_BDC0
	LDA координата_Z_lo,X
	CMP table_04_BDD7,Y
	BCC bra_04_BAD3
	INC $1C
	JMP _loc_04_BA9D
bra_04_BA92:
	JSR _loc_04_BDC0
	LDA координата_Z_lo,X
	CMP table_04_BDDD,Y
	BCC bra_04_BAD3
_loc_04_BA9D:
	LDY $1C
	LDA table_04_BB16,Y
	BPL bra_04_BAC7
	LDA игрок_с_мячом
	AND #$01
	TAY
	LDA номер_команды,Y
	AND #$0F
	BNE bra_04_BABA
	LDY игрок_с_мячом
	CLC
	LDA #$10
	ADC номер_игрока,Y
bra_04_BABA:
	ASL
	STA $1C
	TAY
	LDA table_04_BD12 + 1,Y
	JSR _loc_04_BB02
	LDA table_04_BD12,Y
bra_04_BAC7:
	STA номер_супера
	CMP #$1E		; видимо мексиканский супер
	BNE bra_04_BAD3
	LDA #$7F
	STA таймер_электрического_мяча
bra_04_BAD3:
	LDY игрок_с_мячом
	LDA сила_игрока,Y
	JSR _loc_04_BB02
	LDA состояние_игрока,Y
	LSR
	BCS bra_04_BAEF
	LDA номер_движения,Y
	AND #$7F
	CMP #$43
	BEQ bra_04_BAEF
	CMP #$47
	BNE bra_04_BAF4
bra_04_BAEF:
	LDA #$28
	JSR _loc_04_BB02
bra_04_BAF4:
	LDY номер_супера
	CPY #$03
	BCS bra_04_BB01
	LDA table_04_BD0F,Y
	JSR _loc_04_BB02
bra_04_BB01:
	RTS
_loc_04_BB02:
	CLC
	ADC сила_мяча
	BCC bra_04_BB0A
	LDA #$FF
bra_04_BB0A:
	STA сила_мяча
	RTS

table_04_BB0E:
.byte $60,$01,$90,$02,$50,$03,$FF,$09

table_04_BB16:
.byte $00,$00,$02,$FF,$01,$FF,$00,$00

_loc_04_BB1E:
	LDY #$00
	LDA направление_движения,X
	BPL bra_04_BB27
	LDY #$04
bra_04_BB27:
	LDA флаг_прозрачного_мяча
	BMI bra_04_BB2E
	INY
	INY
bra_04_BB2E:
	LDA table_04_BBC0,Y
	STA $2E
	STA $051B
	LDA table_04_BBC0 + 1,Y
	STA $2F
	STA $051C
	LDY #$00
bra_04_BB40:
	SEC
	LDA table_04_BBBA,Y
	SBC координата_Y_lo,X
	LDA table_04_BBBA + 1,Y
	SBC координата_Y_hi,X
	BCS bra_04_BB53
	INY
	INY
	BCC bra_04_BB40
bra_04_BB53:
	LDA table_04_BBC8,Y
	STA $2C
	LDA table_04_BBC8 + 1,Y
	STA $2D
	LDA номер_супера
	AND #$7F
	BEQ bra_04_BB69
	LDY #$08
	JMP _loc_04_BB80
bra_04_BB69:
	LDA смена_угла_движения,X
	CMP #$FF
	BNE bra_04_BB78
	LDA направление_движения,X
	ORA #$40
	STA смена_угла_движения,X
bra_04_BB78:
	AND #$C0
	LSR
	LSR
	LSR
	LSR
	LSR
	TAY
_loc_04_BB80:
	LDA ($2C),Y
	STA $30
	STA $051D
	INY
	LDA ($2C),Y
	STA $31
	STA $051E
	BPL bra_04_BBB3
	LDA координата_Y_lo,X
	STA $30
	STA $051D
	LDA координата_Y_hi,X
	STA $31
	STA $051E
	LDA #$00
	STA $2E
	STA $051B
	LDA $2F
	BEQ bra_04_BBB3
	LDA #$04
	STA $2F
	STA $051C
bra_04_BBB3:
	JSR _b07_F691
	STA смена_угла_движения,X
	RTS

table_04_BBBA:
.byte $A0,$00
.byte $E0,$00
.byte $80,$01

table_04_BBC0:
.byte $80,$03
.byte $00,$04
.byte $80,$00
.byte $00,$00

table_04_BBC8:		; что-то связано с траекторией красного супера
.word table_04_BBC8_BBCE
.word table_04_BBC8_BBD8
.word table_04_BBC8_BBE2

table_04_BBC8_BBCE:
.byte $A8,$00,$A8,$00,$C0,$00,$A8,$00,$C0,$00

table_04_BBC8_BBD8:
.byte $A8,$00,$FF,$FF,$D8,$00,$FF,$FF,$C0,$00

table_04_BBC8_BBE2:
.byte $C0,$00,$D8,$00,$D8,$00,$D8,$00,$C0,$00

_loc_04_BBEC:
	LDA номер_супера
	ASL
	TAY
	LDA table_04_BD69,Y
	STA разновидность_супера
	ASL
	TAY
	LDA table_04_BD4A,Y		; 60фпс возможно
	BEQ bra_04_BC07
	STA $2D
	LDA #$00
	STA $2C
	JSR _loc_04_802C
bra_04_BC07:
	LDA разновидность_супера
	ASL
	TAY
	LDA table_04_BD4A + 1,Y		; 60фпс
	STA скорость_Z_hi,X
	LDA #$00
	STA скорость_Z_lo,X
	JSR _loc_04_BC62
	LDA флаг_настройки_красного_супера
	BMI bra_04_BC3D
	DEC флаг_настройки_красного_супера
	LDY #$00
	LDA номер_супера
	AND #$7F
	BEQ @чтение_таблицы
	INY
	CMP #$04
	BCC @чтение_таблицы
	INY
@чтение_таблицы:
	LDA table_04_BC5F_красный_супер,Y
	JSR _b07_C2E4
	JSR _loc_04_8027
	JSR _loc_04_8027
bra_04_BC3D:
	LDA координата_Z_hi,X
	BPL bra_04_BC4D
	LDA #$00
	STA координата_Z_lo,X
	STA координата_Z_hi,X
	JMP _loc_04_BC5E
bra_04_BC4D:
	LDA разновидность_супера
	BNE bra_04_BC5E
	LDA координата_Z_lo,X
	CMP #$08
	BCS bra_04_BC5E
	LDA #$08
	STA координата_Z_lo,X
_loc_04_BC5E:
bra_04_BC5E:
	RTS

table_04_BC5F_красный_супер:
.byte $29,$28,$2A

_loc_04_BC62:
	LDY разновидность_супера
	LDA table_04_BD5E,Y
	BPL bra_04_BC6F
	JSR _loc_04_BC7F
	LDA $2C
bra_04_BC6F:
	STA таймер_действия_мяча
	LDA #$00
	STA гравитация_hi,X
	LDA #$0D		; 60fps
	STA гравитация_lo,X
	RTS

_loc_04_BC7F:
	LDA #$B0
	STA $2C
	LDA #$00
	STA $2D
	LDY #$00
	LDA направление_движения,X
	BPL bra_04_BCA1
	CLC
	LDA $2C
	EOR #$FF
	ADC #$01
	STA $2C
	LDA $2D
	EOR #$FF
	ADC #$00
	STA $2D
bra_04_BCA1:
	CLC
	LDA $2D
	ADC #$02
	STA $2D
	SEC
	LDA координата_X_lo,X
	SBC $2C
	STA $2C
	LDA координата_X_hi,X
	SBC $2D
	STA $2D
	EOR направление_движения,X
	BMI bra_04_BCC2
	LDA #$00
	STA $2C
	STA $2D
bra_04_BCC2:
	LDA $2D
	BPL bra_04_BCD7
	CLC
	LDA $2C
	EOR #$FF
	ADC #$01
	STA $2C
	LDA $2D
	EOR #$FF
	ADC #$00
	STA $2D
bra_04_BCD7:
	LDY #$00
bra_04_BCD9:
	LSR $2D
	ROR $2C
	INY
	CPY #$03
	BCC bra_04_BCD9
	RTS

_loc_04_050F:
_loc_04_BCE3:
	LDA номер_супера
	ASL
	TAY
	LDA table_04_BD69 - 1,Y
	BNE bra_04_BCF5
	STA разновидность_супера
	STA сила_мяча
	BEQ bra_04_BD0E
bra_04_BCF5:
	BPL bra_04_BD03
	LDY координата_Z_lo,X
	BEQ bra_04_BD01
	LDY таймер_действия_мяча
	BEQ bra_04_BD0E
bra_04_BD01:
	AND #$7F
bra_04_BD03:
	STA номер_супера
	LDA #$00
	STA таймер_кадра_анимации,X
	STA номер_кадра_анимации,X
bra_04_BD0E:
	RTS

table_04_BD0F:
.byte $0A,$14,$1E

table_04_BD12:
.byte $04,$0F,$16,$0F,$18,$0F,$17,$1E,$04,$0F,$1A,$0F,$1B,$0F,$19,$20,$04,$0F,$21,$1B,$1F,$0F,$20,$1E,$04,$0F,$1D,$1A,$1C,$16,$1E,$0F,$04,$14,$05,$1E,$06,$14,$07,$14,$08,$1E,$09,$1E,$0A,$1E,$0B,$14,$0C,$14,$0D,$14,$0E,$1E,$0F,$14

table_04_BD4A:
.byte $08,$00
.byte $08,$F8
.byte $08,$01
.byte $10,$04
.byte $08,$00
.byte $00,$00
.byte $00,$01
.byte $08,$00
.byte $04,$00
.byte $04,$06

; 60фпс тайцмер полета мяча
; 60fps частично, изменен лишь первый байт с 10 на 30 для обычного удара
table_04_BD5E:
.byte $30,$18,$FF,$7F,$7F,$20,$20,$FF,$7F,$00,$00

table_04_BD69:		; читается из 2х мест
.byte $00,$83,$01,$83,$02,$00,$03,$00,$04,$2A,$07,$00,$04,$10,$01,$04,$05,$11,$06,$00,$08,$00,$04,$00,$04,$95,$09,$14,$04,$12,$02,$00,$04,$12,$07,$13,$01,$00,$03,$0E,$05,$0D,$05,$00,$04,$A2,$09,$A3,$09,$24,$07,$28,$01,$29,$06,$00,$04,$A7,$09,$00,$04,$00,$04,$00,$04,$00,$04,$17,$04,$18,$04,$00,$04,$26,$01,$00,$04,$1D,$08,$00,$04,$25,$07,$2B,$06,$13,$01

_loc_04_BDC0:
	LDY игрок_с_мячом
	LDA позиция_управление,Y
	BPL bra_04_BDD1
	CLC
	LDA опция_режим_сложность
	AND #$03
	ADC #$03
	BNE bra_04_BDD5
bra_04_BDD1:
	LDA опция_режим_сложность
	AND #$03
bra_04_BDD5:
	TAY
	RTS

table_04_BDD7:
.byte $10,$1C,$24,$24,$1C,$14

table_04_BDDD:
.byte $20,$32,$38,$38,$32,$2C

_loc_04_BDE3:
	LDA #< table_04_BE08
	STA $30
	LDA #> table_04_BE08
	STA $31
	LDA #< _loc_04_BCE3
	STA $32
	LDA #> _loc_04_BCE3
	STA $33
	LDA режим_игры_на_поле
	AND #$40
	BEQ bra_04_BE01
	LDA #$00
	BEQ bra_04_BE04
bra_04_BE01:
	LDA номер_супера
bra_04_BE04:
	JSR _b07_CEBD
	RTS

table_04_BE08:
.word off_04_BE64
.word off_04_BE6D
.word off_04_BE6D
.word off_04_BE6D
.word off_04_BE76
.word off_04_BE7D
.word off_04_BE86
.word off_04_BE8D
.word off_04_BE99
.word off_04_BE9E
.word off_04_BEAC
.word off_04_BEB3
.word off_04_BEB8
.word off_04_BEBF
.word off_04_BED6
.word off_04_BEE3
.word off_04_BE94
.word off_04_BEA5
.word off_04_BE8D
.word off_04_BE86
.word off_04_BECD
.word off_04_BEC4
.word off_04_BEEC
.word off_04_BEF5
.word off_04_BF04
.word off_04_BF13
.word off_04_BF2B
.word off_04_BF34
.word off_04_BF44
.word off_04_BF4D
.word off_04_BF5B
.word off_04_BF64
.word off_04_BF6B
.word off_04_BF70
.word off_04_BEFF
.word off_04_BF0E
.word off_04_BF19
.word off_04_BF3B
.word off_04_BF42
.word off_04_BF52
.word off_04_BF2B
.word off_04_BF34
.word off_04_BE82
.word off_04_BE7D

off_04_BE64:
.byte $01,$80,$01,$81,$01,$82,$01,$83
.byte $FE

off_04_BE6D:
.byte $01,$00,$01,$1C,$01,$02,$01,$1D
.byte $FE

off_04_BE76:
.byte $01,$08,$01,$10,$01,$0A
.byte $FE

off_04_BE7D:
.byte $01,$34,$01,$35
.byte $FE

off_04_BE82:		; часть следующего
.byte $01,$41,$00,$45

off_04_BE86:
.byte $01,$0B,$01,$0C,$01,$0D
.byte $FE

off_04_BE8D:
.byte $01,$8B,$01,$8C,$01,$8D
.byte $FE

off_04_BE94:
.byte $01,$0E,$01,$0F
.byte $FE

off_04_BE99:
.byte $01,$18,$01,$19
.byte $FE

off_04_BE9E:
.byte $01,$00,$01,$0D,$01,$0A
.byte $FE

off_04_BEA5:
.byte $01,$08,$01,$09,$01,$0A
.byte $FE

off_04_BEAC:
.byte $04,$13,$04,$14,$04,$15
.byte $FE

off_04_BEB3:
.byte $02,$16,$02,$17
.byte $FE

off_04_BEB8:
.byte $01,$B6,$01,$B7,$01,$B8
.byte $FE

off_04_BEBF:
.byte $02,$1A,$02,$1B
.byte $FE

off_04_BEC4:
.byte $01,$00,$01,$1C,$01,$02,$01,$1D
.byte $FF

off_04_BECD:
.byte $02,$11,$02,$12,$02,$11,$02,$12
.byte $FF

off_04_BED6:
.byte $01,$08,$01,$10,$01,$0A,$01,$08,$01,$10,$01,$0A
.byte $FF

off_04_BEE3:
.byte $01,$18,$01,$0D,$01,$19,$01,$8D
.byte $FE

off_04_BEEC:
.byte $01,$25,$01,$26,$01,$27,$01,$28
.byte $FE

off_04_BEF5:		; часть следующего
.byte $03,$2D,$03,$31,$02,$32,$02,$33,$FC,$02

off_04_BEFF:
.byte $02,$32,$02,$33
.byte $FE

off_04_BF04:		; часть следующего
.byte $03,$2D,$03,$2E,$02,$2F,$02,$30,$FC,$02

off_04_BF0E:
.byte $02,$2F,$02,$30
.byte $FE

off_04_BF13:		; часть следующего
.byte $02,$40,$01,$41,$00,$45

off_04_BF19:		; часть следующего
.byte $08,$45,$01,$41,$02,$00,$02,$45,$01,$00,$01,$01,$01,$02,$01,$03,$FC,$04

off_04_BF2B:
.byte $01,$3C,$01,$3D,$01,$3E,$01,$3F
.byte $FE

off_04_BF34:
.byte $02,$39,$02,$3A,$02,$3B
.byte $FE

off_04_BF3B:
.byte $01,$3B,$01,$3A,$01,$39
.byte $FF

off_04_BF42:		; часть следующего
.byte $00,$39

off_04_BF44:
.byte $01,$29,$01,$2A,$01,$2B,$01,$2C
.byte $FE

off_04_BF4D:
.byte $01,$20,$01,$21
.byte $FE

off_04_BF52:
.byte $01,$1E,$01,$1F,$01,$1E,$01,$1F
.byte $FF

off_04_BF5B:
.byte $01,$3C,$01,$3D,$01,$3E,$01,$3F
.byte $FE

off_04_BF64:
.byte $01,$22,$01,$23,$01,$24
.byte $FE

off_04_BF6B:
.byte $01,$40,$01,$41
.byte $FE

off_04_BF70:
.byte $01,$42,$01,$43,$01,$44,$01,$C3
.byte $FE

; BF79 fill FF

.segment "BANK_04_ID"
.byte $04 