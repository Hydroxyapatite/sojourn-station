/obj/item/weapon/gun/energy/laser
	name = "\"Lightfall\" laser rifle"
	desc = "\"Old Testament\" brand laser carbine. Deadly and radiant, like the ire of God it represents."
	icon = 'icons/obj/guns/energy/laser.dmi'
	icon_state = "laser"
	item_state = "laser"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 5)
	price_tag = 1250
	projectile_type = /obj/item/projectile/beam/midlaser
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
	)
	twohanded = TRUE

/obj/item/weapon/gun/energy/laser/railgun
	name = "\"Reductor\" rail rifle"
	desc = "\"Artificer's Guild\" brand rail gun. This gun features a sleek and deadly design but it may burn out a battery when used."
	icon = 'icons/obj/guns/energy/railgun.dmi'
	icon_state = "railgun"
	item_state = "railgun"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/rail.ogg'
	item_charge_meter = TRUE
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	twohanded = TRUE
	flags = CONDUCT
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 6, TECH_ENGINEERING = 6)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 8, MATERIAL_SILVER = 10)
	charge_cost = 2000
	gun_tags = list(GUN_PROJECTILE, GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	suitable_cell = /obj/item/weapon/cell/large
	one_hand_penalty = 10
	fire_delay = 14 //Equivalent to a pump then fire time
	recoil_buildup = 1.2
	damage_multiplier = 0.9
	init_firemodes = list(
		list(mode_name="slug", projectile_type=/obj/item/projectile/bullet/shotgun/railgun, icon="kill"),
		list(mode_name="stun", projectile_type=/obj/item/projectile/bullet/shotgun/beanbag/railgun, icon="stun"),
		list(mode_name="incendiary", projectile_type=/obj/item/projectile/bullet/shotgun/incendiary/railgun, icon="destroy"),
	)
	var/consume_cell = TRUE
	price_tag = 1750

/obj/item/weapon/gun/energy/laser/railgun/consume_next_projectile()
	.=..()
	if(. && consume_cell && cell.empty())
		visible_message(SPAN_WARNING("\The [cell] of \the [src] burns out!"))
		qdel(cell)
		cell = null
		playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
		new /obj/effect/decal/cleanable/ash(get_turf(src))
	return .

/obj/item/weapon/gun/energy/laser/railgun/pistol
	name = "\"Myrmidon\" rail pistol"
	desc = "\"Artificer's Guild\" brand rail pistol. This gun features a sleek and deadly design but it may burn out a battery when used."
	icon = 'icons/obj/guns/energy/railpistol.dmi'
	icon_state = "railpistol"
	item_state = "railpistol"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/rail.ogg'
	suitable_cell = /obj/item/weapon/cell/medium
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	origin_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 4, TECH_ENGINEERING = 4)
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_STEEL = 4, MATERIAL_SILVER = 5)
	gun_tags = list(GUN_PROJECTILE, GUN_LASER, GUN_ENERGY)
	fire_delay = 12
	charge_cost = 200
	recoil_buildup = 0.8
	damage_multiplier = 0.8
	can_dual = TRUE
	twohanded = FALSE
	init_firemodes = list(
		list(mode_name="slug", projectile_type=/obj/item/projectile/bullet/kurtz/railgun, icon="kill"),
		list(mode_name="stun", projectile_type=/obj/item/projectile/bullet/kurtz/rubber/railgun, icon="stun"),
		list(mode_name="incendiary", projectile_type=/obj/item/projectile/bullet/kurtz/incendiary, icon="destroy"),
	)
	consume_cell = TRUE
	price_tag = 1250
	gun_tags = list(GUN_ENERGY,)

/obj/item/weapon/gun/energy/shrapnel
	name = "\"Shellshock\" scrap rifle"
	desc = "A slapped together junk design made as a copy of the far superior Reductor rail gun. It's projectiles fire slower and it has a wider delay between shots with the \
	same issue of burning batteries out. The matter contained in empty cells can be converted directly into ammunition as well, if the safety bolts are loosened properly."
	icon = 'icons/obj/guns/energy/energyshotgun.dmi'
	icon_state = "eshotgun"
	item_state = "eshotgun"
	item_charge_meter = TRUE
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	gun_tags = list(GUN_PROJECTILE, GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	twohanded = TRUE
	flags = CONDUCT
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 8)
	charge_cost = 100
	suitable_cell = /obj/item/weapon/cell/medium
	one_hand_penalty = 10
	fire_delay = 14 //Equivalent to a pump then fire time
	recoil_buildup = 1.2
	damage_multiplier = 0.8
	fire_sound = 'sound/weapons/energy_shotgun.ogg'
	init_firemodes = list(
		list(mode_name="slug", projectile_type=/obj/item/projectile/bullet/hrifle/railgun, icon="kill"),
		list(mode_name="grenade", mode_desc="fires a frag synth-shell", projectile_type=/obj/item/projectile/bullet/grenade/frag/weak, charge_cost=10000, icon="grenade"),
		list(mode_name="incendiary", projectile_type=/obj/item/projectile/bullet/lrifle/incendiary, icon="destroy"),
	)
	var/consume_cell = FALSE
	price_tag = 500

/obj/item/weapon/gun/energy/shrapnel/consume_next_projectile()
	if(!cell) return null
	if(!ispath(projectile_type)) return null
	if(consume_cell && !cell.checked_use(charge_cost))
		visible_message(SPAN_WARNING("\The [cell] of \the [src] burns out!"))
		qdel(cell)
		cell = null
		playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
		new /obj/effect/decal/cleanable/ash(get_turf(src))
		return new projectile_type(src)
	else if(!consume_cell && !cell.checked_use(charge_cost))
		return null
	else
		return new projectile_type(src)

/obj/item/weapon/gun/energy/shrapnel/attackby(obj/item/I, mob/user)
	..()
	if(I.has_quality(QUALITY_BOLT_TURNING))
		if(I.use_tool(user, src, WORKTIME_SLOW, QUALITY_BOLT_TURNING, FAILCHANCE_VERY_HARD, required_stat = STAT_MEC))
			if(consume_cell)
				consume_cell = FALSE
				to_chat(user, SPAN_NOTICE("You secure the safety bolts and tune down the capacitor to safe levels, preventing the weapon from destroying empty cells for use as ammuniton."))
			else
				consume_cell = TRUE
				to_chat(user, SPAN_NOTICE("You loosen the safety bolts and overclock the capacitor to unsafe levels, allowing the weapon to destroy empty cells for use as ammunition."))

/obj/item/weapon/gun/energy/lasersmg
	name = "Disco Vazer \"Lasblender\""
	desc = "This conversion of the \"Texan\" that enables it to shoot lasers. Unlike in other laser weapons, the process of creating a laser is based on a chain reaction of localized micro-explosions. \
	While this method is charge-effective, it worsens accuracy, and the chain-reaction makes the gun always fire in bursts. A viable choice for those who have lots of batteries and few bullets. \
	Sometimes jokingly called the \"Disco Vazer\"."
	icon = 'icons/obj/guns/energy/lasersmg-1.dmi'
	icon_state = "lasersmg"
	item_state = "lasersmg"
	w_class = ITEM_SIZE_NORMAL
	fire_sound = 'sound/weapons/Laser.ogg'
	suitable_cell = /obj/item/weapon/cell/medium
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam/weak/smg
	charge_meter = FALSE
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 11, MATERIAL_STEEL = 13, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 1, MATERIAL_GLASS = 2)
	price_tag = 500
	damage_multiplier = 0.5 //makeshift laser
	recoil_buildup = 2
	one_hand_penalty = 3
	init_offset = 7 //makeshift laser
	projectile_type = /obj/item/projectile/beam
	suitable_cell = /obj/item/weapon/cell/medium
	charge_cost = 25 // 4 bursts with a 800m cell
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		BURST_8_ROUND,
		FULL_AUTO_400
		)

/obj/item/weapon/gun/energy/lasersmg/alt
	name = "Disco Vazer \"Lasblender\""
	desc = "This conversion of the \"MAC\" that enables it to shoot lasers. Unlike in other laser weapons, the process of creating a laser is based on a chain reaction of localized micro-explosions. \
	While this method is charge-effective, it worsens accuracy, and the chain-reaction makes the gun always fire in bursts. A viable choice for those who have lots of batteries and few bullets. \
	Sometimes jokingly called the \"Disco Vazer\"."

/obj/item/weapon/gun/energy/lasersmg/process_projectile(var/obj/item/projectile/P, mob/living/user, atom/target, var/target_zone, var/params=null)
	projectile_color = pick(list("#FF0000", "#0000FF", "#00FF00", "#FFFF00", "#FF00FF", "#00FFFF", "#FFFFFF", "#000000"))
	..()
	return ..()

/obj/item/weapon/gun/energy/lasersmg/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (cell)
		iconstring += "_mag"
		itemstring += "_mag"


/obj/item/weapon/gun/energy/lasersmg/update_icon()
	overlays.Cut()
	..()
	if(istype(cell, /obj/item/weapon/cell/medium/moebius/nuclear))
		overlays += image(icon, "nuke_cell")

	else if(istype(cell, /obj/item/weapon/cell/medium/moebius))
		overlays += image(icon, "moeb_cell")

	else if(istype(cell, /obj/item/weapon/cell/medium/excelsior))
		overlays += image(icon, "excel_cell")

	else if(istype(cell, /obj/item/weapon/cell/medium))
		overlays += image(icon, "guild_cell")

/obj/item/weapon/gun/energy/laser/mounted
	self_recharge = TRUE
	use_external_power = TRUE
	safety = FALSE
	restrict_safety = TRUE
	damage_multiplier = 0.7
	twohanded = FALSE

/obj/item/weapon/gun/energy/laser/mounted/cyborg
	name = "integrated \"Cog\" lasgun"
	desc = "A Greyson Positronic design, cheap and widely produced. In the distant past - this was the main weapon of low-rank police forces, billions of copies of this gun were made."
	recharge_time = 10 //Time it takes for shots to recharge (in ticks)

/obj/item/weapon/gun/energy/laser/practice
	name = "OT LG \"Lightfall\" - P"
	desc = "A modified version of \"Old Testament\" brand laser carbine, this one fires less concentrated energy bolts, designed for target practice."
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 2)
	price_tag = 500
	projectile_type = /obj/item/projectile/beam/practice

/obj/item/weapon/gun/energy/retro
	name = "\"Cog\" lasgun"
	icon = 'icons/obj/guns/energy/retro.dmi'
	icon_state = "retro"
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	desc = "A Greyson Positronic design, cheap and widely produced. In the distant past - this was the main weapon of low-rank police forces, billions of copies of this gun were made. They are ubiquitous."
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_HUGE
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 15, MATERIAL_GLASS = 5)
	projectile_type = /obj/item/projectile/beam
	fire_delay = 10 //old technology
	charge_cost = 50
	price_tag = 1000
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		WEAPON_NORMAL,
		BURST_2_ROUND
	)
	twohanded = TRUE

/obj/item/weapon/gun/energy/captain
	name = "\"Destiny\" energy pistol"
	icon = 'icons/obj/guns/energy/capgun.dmi'
	icon_state = "caplaser"
	item_state = "caplaser"
	item_charge_meter = TRUE
	desc = "This weapon is old, yet still robust and reliable. It's marked with an old Greyson Positronic brand, a distant reminder of what this corporation was, before it fell to ruin."
	force = WEAPON_FORCE_PAINFUL
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_NORMAL
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam
	origin_tech = null
	self_recharge = TRUE
	price_tag = 2250
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
	)
	twohanded = FALSE

/obj/item/weapon/gun/energy/lasercannon
	name = "\"Titanica\" laser cannon"
	desc = "A bulky outdated and now abandoned H&S design for an energy weapon that allows for it to shoot condenced laser beams to really burn a whole in anything. At its time it was compared to the \"Bull\" as one of the worst personal defence laser firearms created."
	icon = 'icons/obj/guns/energy/lascannon.dmi'
	icon_state = "lasercannon"
	item_state = "lasercannon"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/lasercannonfire.ogg'
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3, TECH_POWER = 3) //Shows that its not as high tech but still rather smartly designed
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BELT|SLOT_BACK
	projectile_type = /obj/item/projectile/beam/heavylaser
	charge_cost = 100
	fire_delay = 20
	matter = list(MATERIAL_STEEL = 25, MATERIAL_SILVER = 6)
	price_tag = 500
	one_hand_penalty = 5
	twohanded = TRUE
	init_firemodes = list(
		WEAPON_NORMAL
		)
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)

/obj/item/weapon/gun/energy/lasercannon/rnd
	name = "\"Solaris\" laser cannon"
	desc = "A outdated and abandoned design for an energy weapon, revamped by Soteria Institute. The lasing medium is enclosed in a tube lined with uranium-235 and subjected to high neutron flux in a nuclear reactor core. \
		This incredible technology packed inside let it stand on it's own has one of the markets best laser cannon for turret defense and firepower! "
	matter = list(MATERIAL_STEEL = 25, MATERIAL_SILVER = 4, MATERIAL_URANIUM = 1)
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	price_tag = 1500
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
		)

/obj/item/weapon/gun/energy/lasercannon/mounted
	name = "mounted laser cannon"
	self_recharge = TRUE
	use_external_power = TRUE
	damage_multiplier = 0.7 //Mounted cannon deals less do to being a mini-verson
	recharge_time = 10
	safety = FALSE
	restrict_safety = TRUE
	twohanded = FALSE

/obj/item/weapon/gun/energy/laser/mounted/blitz
	name = "SDF LR \"Strahl\""
	desc = "A miniaturized laser rifle, remounted for robotic use only."
	icon_state = "laser_turret"
	damage_multiplier = 0.9
	charge_meter = FALSE
	twohanded = FALSE

/obj/item/weapon/gun/energy/laser/railgun/mounted
	name = "SDF SC \"Schrapnell\""
	desc = "An energy-based railgun, employing a matter fabricator to pull shotgun rounds from thin air and energy before launching them at faster than light speeds."
	icon_state = "shrapnel"
	self_recharge = 1
	use_external_power = 1
	safety = FALSE
	restrict_safety = TRUE
	consume_cell = FALSE
	cell_type = /obj/item/weapon/cell/small/high //Two shots
	twohanded = FALSE
	init_firemodes = list(
		list(mode_name="Buckshot", mode_desc="Fires a buckshot synth-shell", projectile_type=/obj/item/projectile/bullet/pellet/shotgun, charge_cost=100, icon="kill"),
		list(mode_name="Beanbag", mode_desc="Fires a beanbag synth-shell", projectile_type=/obj/item/projectile/bullet/shotgun/beanbag, charge_cost=25, icon="stun"),
		list(mode_name="Blast", mode_desc="Fires a slug synth-shell", projectile_type=/obj/item/projectile/bullet/shotgun, charge_cost=null, icon="destroy"),
	)

/obj/item/weapon/gun/energy/firestorm
	name = "\"Firestorm\" assault SMG"
	desc = "A front loading laser SMG made more close quarters, compactness and its high rate of fire. Its downside revolves around its usage of small batteries.\
	On the side of the gun under the barrel appears to be an 'H&S' marking. Surprising considering the quality of the weapon!"
	icon = 'icons/obj/guns/energy/firestorm.dmi'
	icon_state = "firestorm"
	item_state = "firestorm"
	w_class = ITEM_SIZE_NORMAL
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/Laser.ogg'
	suitable_cell = /obj/item/weapon/cell/medium
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam/weak/smg
	projectile_color = "#0000FF"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 13, MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2, MATERIAL_GLASS = 4)
	price_tag = 650
	damage_multiplier = 0.8
	recoil_buildup = 2
	one_hand_penalty = 3
	projectile_type = /obj/item/projectile/beam
	suitable_cell = /obj/item/weapon/cell/small
	cell_type = /obj/item/weapon/cell/small
	charge_cost = 25
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		BURST_8_ROUND,
		FULL_AUTO_600
		)

/obj/item/weapon/gun/energy/lasercore
	name = "\"Laser Core\" laser carbine"
	desc = "A high-powered laser carbine made by H&S. It was hailed back in its prime for its high-powered shots and compactness. However, it really consumes power."
	icon = 'icons/obj/guns/energy/lasercore.dmi'
	icon_state = "lcore"
	item_state = "lcore"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_BULKY
	projectile_type = /obj/item/projectile/beam/heavylaser
	projectile_color = "#0000FF"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 8, MATERIAL_SILVER = 10, MATERIAL_GOLD = 2)
	charge_cost = 120
	fire_delay = 10
	price_tag = 1200
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		WEAPON_NORMAL
	)
	twohanded = TRUE
