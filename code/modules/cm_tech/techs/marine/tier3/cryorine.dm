
/datum/tech/repeatable/cryomarine
	name = "Wake Up Additional Troops"
	desc = "Wakes up additional troops to fight against any threats."
	icon_state = "cryotroops"

	announce_message = "Из крио был выведен дополнительный отряд."

	required_points = 6
	increase_per_purchase = 6

	flags = TREE_FLAG_MARINE
	tier = /datum/tier/three

/datum/tech/repeatable/cryomarine/can_unlock(mob/M)
	. = ..()
	if(!.)
		return
	if(!SSticker.mode)
		to_chat(M, SPAN_WARNING("You can't do this right now!"))
		return

/datum/tech/repeatable/cryomarine/on_unlock()
	. = ..()
	SSticker.mode.get_specific_call(/datum/emergency_call/cryo_squad/tech, TRUE, FALSE) // "Marine Cryo Reinforcements (Tech)"
