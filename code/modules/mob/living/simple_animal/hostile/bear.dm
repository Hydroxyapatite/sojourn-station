//Space bears!
/mob/living/simple_animal/hostile/bear
	name = "black bear"
	desc = "A bear of the common black bear variety."
	icon = 'icons/mob/mobs-bear.dmi'
	icon_state = "bearfloor"
	icon_gib = "bear_gib"
	icon_dead = "bear_dead"
	speak_emote = list("growls", "roars")
	emote_see = list("stares ferociously", "stomps")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/bearmeat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	stop_automated_movement_when_pulled = 0
	maxHealth = 60
	health = 60
	melee_damage_lower = 20
	melee_damage_upper = 30
	leather_amount = 6
	bones_amount = 4
	special_parts = list(/obj/item/animal_part/wolf_tooth)

	//Space bears aren't affected by atmos.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	var/stance_step = 0

	faction = "russian"

/mob/living/simple_animal/hostile/bear/hudson
	name = "Hudson"
	desc = "A legendary black space bear. It's quite sparkly."
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	icon_state = "space_bear"
	icon_gib = "bear_gib"
	icon_dead = "space_bear_dead"
	maxHealth = 120
	health = 120
	melee_damage_lower = 30
	melee_damage_upper = 40

/mob/living/simple_animal/hostile/bear/brown
	name = "brown bear"
	desc = "A bear of the common brown bear variety."
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	icon_state = "brownbear"
	icon_gib = "brownbear_gib"
	icon_dead = "brownbear_dead"

/mob/living/simple_animal/hostile/bear/polar
	name = "polar bear"
	desc = "A bear of the uncommon polar bear variety."
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	icon_state = "polarbear"
	icon_gib = "brownbear_gib"
	icon_dead = "polarbear_dead"

/mob/living/simple_animal/hostile/bear/excelsior
	name = "excelsior armored bear"
	desc = "A huge bear outfitted with armor and trained by the excelsior judging from the markings on his armor. Who comes up with this shit?"
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	icon_state = "combatbear"
	icon_gib = "brownbear_gib"
	icon_dead = "combatbear_dead"
	faction = "excelsior"
	maxHealth = 400
	health = 400
	melee_damage_lower = 30
	melee_damage_upper = 40
	special_parts = list(/obj/item/animal_part/wolf_tooth,/obj/item/animal_part/wolf_tooth)

/mob/living/simple_animal/hostile/bear/Life()
	. =..()
	if(!.)
		return

	switch(stance)

		if(HOSTILE_STANCE_TIRED)
			stop_automated_movement = 1
			stance_step++
			if(stance_step >= 10) //rests for 10 ticks
				if(target_mob && (target_mob in ListTargets(10)))
					stance = HOSTILE_STANCE_ATTACK //If the mob he was chasing is still nearby, resume the attack, otherwise go idle.
				else
					stance = HOSTILE_STANCE_IDLE

		if(HOSTILE_STANCE_ALERT)
			stop_automated_movement = 1
			var/found_mob = 0
			if(target_mob && (target_mob in ListTargets(10)))
				if(!(SA_attackable(target_mob)))
					stance_step = max(0, stance_step) //If we have not seen a mob in a while, the stance_step will be negative, we need to reset it to 0 as soon as we see a mob again.
					stance_step++
					found_mob = 1
					src.set_dir(get_dir(src,target_mob))	//Keep staring at the mob

					if(stance_step in list(1,4,7)) //every 3 ticks
						var/action = pick( list( "growls at [target_mob].", "stares angrily at [target_mob].", "prepares to attack [target_mob]!", "closely watches [target_mob]." ) )
						if(action)
							visible_emote(action)
			if(!found_mob)
				stance_step--

			if(stance_step <= -20) //If we have not found a mob for 20-ish ticks, revert to idle mode
				stance = HOSTILE_STANCE_IDLE
			if(stance_step >= 7)   //If we have been staring at a mob for 7 ticks,
				stance = HOSTILE_STANCE_ATTACK

		if(HOSTILE_STANCE_ATTACKING)
			if(stance_step >= 20)	//attacks for 20 ticks, then it gets tired and needs to rest
				visible_emote("is worn out and needs to rest.")
				stance = HOSTILE_STANCE_TIRED
				stance_step = 0
				walk(src, 0) //This stops the bear's walking
				return



/mob/living/simple_animal/hostile/bear/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(stance != HOSTILE_STANCE_ATTACK && stance != HOSTILE_STANCE_ATTACKING)
		stance = HOSTILE_STANCE_ALERT
		stance_step = 6
		target_mob = user
	..()

/mob/living/simple_animal/hostile/bear/attack_hand(mob/living/carbon/human/M as mob)
	if(stance != HOSTILE_STANCE_ATTACK && stance != HOSTILE_STANCE_ATTACKING)
		stance = HOSTILE_STANCE_ALERT
		stance_step = 6
		target_mob = M
	..()

/mob/living/simple_animal/hostile/bear/allow_spacemove()
	return ..()//No drifting in space for space bears!

/mob/living/simple_animal/hostile/bear/FindTarget()
	. = ..()
	if(.)
		visible_emote("stares alertly at [.].")
		stance = HOSTILE_STANCE_ALERT

/mob/living/simple_animal/hostile/bear/LoseTarget()
	..(5)

/mob/living/simple_animal/hostile/bear/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	visible_emote(list("slashes at [target_mob]!", "bites [target_mob]!"))

	var/damage = rand(20,30)

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_CHEST, BP_L_ARM, BP_R_ARM, BP_L_LEG , BP_R_LEG)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.damage_through_armor(damage, BRUTE, affecting, ARMOR_MELEE, 0, 0, sharp = 1, edge = 1)

		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L
	//else if(istype(target_mob,/obj/mecha))
		//var/obj/mecha/M = target_mob
		//M.attack_animal(src)
		//return M

/mob/living/simple_animal/hostile/bear/mukwah
	name = "mukwah"
	desc = "A bear that escaped from the abandoned zoo labs before mutating into a creature known as a mukwah. Unlike a standard bear, a mukwah is much more powerful, a heavy hitter that is \
	slow but with a strength that exceeds even other powerful fauna."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "yaoguai"
	icon_dead = "yaoguai_dead"
	maxHealth = 400
	health = 400
	melee_damage_lower = 40 //Low health but an extremely powerful hitter
	melee_damage_upper = 50
	leather_amount = 10
	bones_amount = 10
	pixel_x = -16
	special_parts = list(/obj/item/animal_part/wolf_tooth,/obj/item/animal_part/wolf_tooth)