ПОГОДА_НЕТ			= $00
ПОГОДА_МОЛНИЯ		= $01
ПОГОДА_ДОЖДЬ		= $02
ПОГОДА_СМЕРЧ		= $03
ПОГОДА_ВЕТЕР		= $04
ПОГОДА_СЕТКА		= $05	; рваная сетка
ПОГОДА_06_ХЗ		= $06

КНОПКА_ВПРАВО		= $01
КНОПКА_ВЛЕВО		= $02
КНОПКА_ВНИЗ			= $04
КНОПКА_ВВЕРХ		= $08
КНОПКА_СТАРТ		= $10
КНОПКА_СЕЛЕКТ		= $20
КНОПКА_Б			= $40
КНОПКА_А			= $80

ЭКРАН_KICKOFF		= $01







;		; кнопки
;		BTN_RIGHT				= $01
;		BTN_LEFT				= $02
;		BTN_DOWN				= $04
;		BTN_UP					= $08
;		BTN_START				= $10
;		BTN_SELECT				= $20
;		BTN_B					= $40
;		BTN_A					= $80
;		
;		; game_mode_flags = $03A4
;		F_1_PLAYER				= $00	; противоположность 80
;		F_TIMEUP			 	= $01	; время вышло
;		FLAG_GM_UNKNOWN_02	 	= $02
;		FLAG_GM_UNKNOWN_04	 	= $04
;		FLAG_GM_UNKNOWN_08	 	= $08
;		FLAG_GM_UNKNOWN_10	 	= $10
;		F_OUT_OF_PLAY		 	= $20	; игроки ждут пока стоят на разводке/пока мяч вне игры
;		F_CONTINUE	 			= $40	; экран ввода пароля
;		F_2_PLAYERS		 		= $80	; режим 2 players если = 1, иначе 1 player
;		
;		
;		; plr_flags = $00
;		FLAG_PL_UNKNOWN		= $01	; ваще не понятно что это
;		F_VISIBLE			= $02	; игрок виден на экране
;		F_CONTROL			= $04	; игрок управляемый
;		F_BUSY				= $08	; игрок чем-то занят и на него нельзя переключиться
;											; состояние проверяется лишь в 03_E4D9, и то сразу очищается если стоит
;		
;		FLAG_PL_UNKNOWN_CLEAR	= $FE
;		F_VISIBLE_CLEAR		= $FD
;		F_CONTROL_CLEAR		= $FB
;		F_BUSY_CLEAR		= $F7
;		F_ALL_CLEAR			= $F0
;		
;		; plr_state = $12
;		STATE_IDLE				= $00	; стоять в ожидании, поворачиваться к мячу на месте, может убиться об летящий мяч
;		STATE_UNKNOWN_01		= $01	; ???
;		STATE_WITH_BALL			= $02	; управляемый игрок или бот с мячом
;		STATE_FOLLOW_BALL		= $03	; бежать к приземлению мяча
;		STATE_WITHOUT_BALL		= $04	; управляемый игрок без мяча
;		STATE_DEAD				= $05	; труп
;		STATE_DODGE				= $06	; увернуться от подката
;		STATE_UNKNOWN_07		= $07   ; ???
;		STATE_UNKNOWN_08		= $08   ; ???
;		STATE_UNKNOWN_09		= $09	; ??? видимо не используется
;		STATE_UNKNOWN_0A		= $0A   ; ???
;		STATE_UNKNOWN_0B		= $0B	; ??? видимо не используется
;		STATE_THROW_IN			= $0C   ; стоит на месте для выбивания из throw in
;		STATE_GOAL_KICK			= $0D   ; (для киперов) стоит на месте для пробивания goal kick
;		STATE_CORNER_KICK		= $0E   ; стоит на месте для пробивания corner kick
;		STATE_RUN_AREA			= $0F	; бежать на какую-то зону
;		STATE_UNKNOWN_10		= $10	; ???
;		STATE_FOLLOW_ENEMY		= $11	; бежать за соперником с мячом
;		STATE_FREEZE			= $12	; неактивный после гола, когда игроки замирают
;		STATE_UNKNOWN_13		= $13	; ???
;		STATE_UNKNOWN_14		= $14	; ???
;		STATE_RUN_BASE			= $15	; бежать на свою позицию когда кипер завладел мячом
;		STATE_GK_GET_BALL		= $16	; (для киперов) владеет мячом, даже когда еще находится в анимации падения
;		STATE_UNKNOWN_17		= $17	; ???
;		STATE_UNKNOWN_18		= $18	; ???
;		STATE_UNKNOWN_19		= $19	; ???
;		
;		; звуки и мелодии
;		SOUND_OFF				= $01	; выключить звук
;		SOUND_DEAD				= $02	; игрок умер от мяча или подката, или его затоптали
;		SOUND_SHOOT				= $03	; обычный удар или навес
;		SOUND_SHOOT_FAST		= $04	; удар в одно касание
;		SOUND_RECEIVE			= $05	; принятие мяча на грудь
;		SOUND_THROW				= $06	; бросок мяча руками
;		SOUND_CATCH				= $07	; кипер словил мяч
;		SOUND_TACKLE			= $08	; подкат
;		SOUND_unk_09			= $09	; хз, сигнал какой-то
;		SOUND_TIME_LOW			= $0A	; сигнал что время кончается
;		SOUND_TIME_UP			= $0B	; сигнал когда время вышло
;		SOUND_WHISTLE			= $0C	; свисток на разводке или мяч вне игры
;		SOUND_GOALSPOT			= $0D	; удар о штангу или перекладину
;		SOUND_FANS				= $0E	; шум зрителей
;		SOUND_OPTION_SELECT		= $0F	; выбор опции в главном меню
;		MUSIC_FIELD				= $10	; главная мелодия игры на поле
;		MUSIC_LOGO				= $11	; мелодия логотипа
;		MUSIC_GOAL				= $12	; мелодия гола
;		MUSIC_HALF_TIME			= $13	; мелодия в перерыве на эеране со счетом
;		MUSIC_GAME_NUMBER		= $14	; мелодия экрана с номером игры
;		MUSIC_FINAL				= $15	; финальная мелодия титров
;		MUSIC_TEAM_SELECT		= $16	; мелодия экрана выбора команд
;		MUSIC_PENALTY			= $17	; мелодия пенальти
;		SOUND_SELECT 			= $18	; выбор чего-либо
;		SOUND_WHISTLE_FANS		= $1A	; свисток после гола и шум зрителей
;		SOUND_WRONG 			= $1B	; неправильный пароль
;		SOUND_MISS_CATCH		= $1C	; кипер выпустил мяч из рук во время ловли
;		MUSIC_QUIET				= $20	; постепенное уменьшение громкости музыки
;		