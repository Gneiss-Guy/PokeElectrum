	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_POKEFAN_M
	const SEAFOAMGYM_SUPER_NERD1
	const SEAFOAMGYM_SUPER_NERD2
	const SEAFOAMGYM_GYM_GUIDE

SeafoamGym_MapScripts:
	def_scene_scripts
	scene_script SeafoamGymNoopScene ; unusable

	def_callbacks

SeafoamGymNoopScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUIDE
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	setevent EVENT_BEAT_HIKER_GARRY
	setevent EVENT_BEAT_SUPER_NERD_MERLE
	setevent EVENT_BEAT_SUPER_NERD_AVERY
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end

TrainerHikerGarry:
	trainer HIKER, GARRY, EVENT_BEAT_HIKER_GARRY, HikerGarrySeenText, HikerGarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerGarryAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdMerle:
	trainer SUPER_NERD, MERLE, EVENT_BEAT_SUPER_NERD_MERLE, SupernerdMerleSeenText, SupernerdMerleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdMerleAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdAvery:
	trainer SUPER_NERD, AVERY, EVENT_BEAT_SUPER_NERD_AVERY, SupernerdAverySeenText, SupernerdAveryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdAveryAfterBattleText
	waitbutton
	closetext
	end

SeafoamGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	iftrue .TalkedToSeafoamGymGuideScript
	writetext SeafoamGymGuideWinText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	end

.TalkedToSeafoamGymGuideScript:
	writetext SeafoamGymGuideWinText2
	waitbutton
	closetext
	end

BlaineIntroText:
	text "BLAINE: Waaah!"

	para "My GYM in CINNABAR"
	line "burned down."

	para "My fire-breathing"
	line "#MON and I are"

	para "homeless because"
	line "of the volcano."

	para "Waaah!"

	para "But I'm back in"
	line "business as a GYM"

	para "LEADER here in"
	line "this cave."

	para "If you can beat"
	line "me, I'll give you"
	cont "a BADGE."

	para "Ha! You'd better"
	line "have BURN HEAL!"
	done

BlaineWinLossText:
	text "BLAINE: Awesome."
	line "I've burned out…"

	para "You've earned"
	line "VOLCANOBADGE!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> received"
	line "VOLCANOBADGE."
	done

BlaineAfterBattleText:
	text "BLAINE: I did lose"
	line "this time, but I'm"

	para "going to win the"
	line "next time."

	para "When I rebuild my"
	line "CINNABAR GYM,"

	para "we'll have to have"
	line "a rematch."
	done

BlaineFightDoneText:
	text "BLAINE: My fire"
	line "#MON will be"

	para "even stronger."
	line "Just you watch!"
	done

HikerGarrySeenText:
	text "#MON battles"
	line "in a cave?"

	para "Of course there's"
	line "a HIKER here!"
	done

HikerGarryBeatenText:
	text "Is this cave"
	line "collapsing now?"
	done

HikerGarryAfterBattleText:
	text "The other lads in"
	line "here are nerdy but"
	cont "they're tough too."
	done

SupernerdMerleSeenText:
	text "Incredible!"
	line "Wonderful!"
	cont "Unbelievable!"
	done

SupernerdMerleBeatenText:
	text "Do you realise"
	line "where we are?"
	done

SupernerdMerleAfterBattleText:
	text "Rock formations"
	line "can reveal so much"
	cont "information!"

	para "These rocks show"
	line "SEAFOAM has"
	cont "volcanic origins."

	para "Magma once flowed"
	line "in this chamber!"
	done

SupernerdAverySeenText:
	text "Gwah-ha-ha! We may"
	line "not have a gym but"
	cont "we're unstoppable!"
	done

SupernerdAveryBeatenText:
	text "You might just"
	line "douse our fire!"
	done

SupernerdAveryAfterBattleText:
	text "Blaine has an"
	line "unquenchable"
	cont "spirit!"

	para "The loss of his"
	line "gym really hurt"
	cont "him initially."

	para "Now he's back and"
	line "tougher than ever!"
	cont "Gwah-ha-ha!"
	done

SeafoamGymGuideWinText:
	text "Yo!"

	para "… Huh? It's over"
	line "already?"

	para "Sorry, sorry!"

	para "CINNABAR GYM was"
	line "gone, so I didn't"

	para "know where to find"
	line "you."

	para "But, hey, you're"
	line "plenty strong even"

	para "without my advice."
	line "I knew you'd win!"
	done

SeafoamGymGuideWinText2:
	text "A #MON GYM can"
	line "be anywhere as"

	para "long as the GYM"
	line "LEADER is there."

	para "There's no need"
	line "for a building."
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  8, ROUTE_20, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  8,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerGarry, -1
	object_event  8,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerSupernerdMerle, -1
	object_event  6,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdAvery, -1
	object_event  3,  7, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, EVENT_SEAFOAM_GYM_GYM_GUIDE
