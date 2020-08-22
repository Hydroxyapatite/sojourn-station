/******************************
	UPGRADE TYPES
******************************/
// 	 REINFORCEMENT: REDUCES TOOL DEGRADATION
//------------------------------------------------

//This can be attached to basically any long tool
//This includes most mechanical ones
/obj/item/weapon/tool_upgrade/reinforcement/stick
	name = "brace bar"
	desc = "A sturdy pole made of fiber tape and plasteel rods. Can be used to reinforce the shaft of many tools."
	icon_state = "brace_bar"

	price_tag = 120
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_PLASTIC = 1)

//list/tool_upgrades, list/required_qualities, list/negative_qualities, prefix, req_fuel, req_cell

/obj/item/weapon/tool_upgrade/reinforcement/stick/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
		UPGRADE_DEGRADATION_MULT = 0.65,
		UPGRADE_FORCE_MOD = 1,
		)

	I.required_qualities = list(QUALITY_BOLT_TURNING,QUALITY_PRYING, QUALITY_SAWING,QUALITY_SHOVELING,QUALITY_DIGGING,QUALITY_EXCAVATION)
	I.prefix = "braced"

//Heatsink can be attached to any tool that uses fuel or power
/obj/item/weapon/tool_upgrade/reinforcement/heatsink
	name = "heatsink"
	desc = "An array of plasteel fins which dissipates heat, reducing damage and extending the lifespan of power tools."
	icon_state = "heatsink"
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_PLASTIC = 1)

/obj/item/weapon/tool_upgrade/reinforcement/heatsink/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
		UPGRADE_DEGRADATION_MULT = 0.65,
		UPGRADE_HEALTH_THRESHOLD = 10
		)
	I.prefix = "heatsunk"
	I.req_fuel_cell = REQ_FUEL_OR_CELL

/obj/item/weapon/tool_upgrade/reinforcement/plating
	name = "reinforced plating"
	desc = "A sturdy bit of plasteel that can be bolted onto any tool to protect it. Tough, but bulky."
	icon_state = "plate"
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_STEEL = 2) //steel to compensate for metal rods used in crafting

/obj/item/weapon/tool_upgrade/reinforcement/plating/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_DEGRADATION_MULT = 0.55,
	UPGRADE_FORCE_MOD = 1,
	UPGRADE_PRECISION = -5,
	UPGRADE_BULK = 1,
	UPGRADE_HEALTH_THRESHOLD = 10)
	I.prefix = "reinforced"
	I.required_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PULSING, QUALITY_PRYING, QUALITY_WELDING, QUALITY_SCREW_DRIVING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_RETRACTING, QUALITY_DRILLING, QUALITY_HAMMERING, QUALITY_SAWING, QUALITY_CUTTING)

/obj/item/weapon/tool_upgrade/reinforcement/guard
	name = "metal guard"
	desc = "A bent piece of metal that wraps around sensitive parts of a tool, protecting it from impacts, debris, and stray fingers."
	icon_state = "guard"
	matter = list(MATERIAL_PLASTEEL = 5)

/obj/item/weapon/tool_upgrade/reinforcement/guard/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_DEGRADATION_MULT = 0.75,
	UPGRADE_PRECISION = 5,
	UPGRADE_HEALTH_THRESHOLD = 10
	)
	I.required_qualities = list(QUALITY_CUTTING,QUALITY_DRILLING, QUALITY_SAWING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_WELDING, QUALITY_HAMMERING)
	I.prefix = "shielded"

// Plasmablock can be attached to any tool that uses fuel or power
/obj/item/weapon/tool_upgrade/reinforcement/plasmablock
	name = "plasmablock"
	desc = "A plasmablock is way more efficient to dissipate heat than classic heatsinks or waterblocks thanks to the tremendous heat-transfer capacity of liquid phoron. The fluid that is actively pumped through a radiator and cooled by fans. It greatly extends the lifespan of power tools."
	icon_state = "plasmablock"
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_PLASTIC = 2, MATERIAL_PLASMA = 1)

/obj/item/weapon/tool_upgrade/reinforcement/plasmablock/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
		UPGRADE_DEGRADATION_MULT = 0.45,
		UPGRADE_HEALTH_THRESHOLD = 10,
		UPGRADE_POWERCOST_MULT = 1.05,
		UPGRADE_FUELCOST_MULT = 1.05
		)
	I.prefix = "plasma-cooled"
	I.req_fuel_cell = REQ_FUEL_OR_CELL

/obj/item/weapon/tool_upgrade/reinforcement/rubbermesh
	name = "rubber mesh"
	desc = "A rubber mesh that can wrapped around sensitive parts of a tool to protecting them from impacts and debris."
	icon_state = "rubbermesh"
	matter = list(MATERIAL_PLASTIC = 3)

/obj/item/weapon/tool_upgrade/reinforcement/rubbermesh/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_DEGRADATION_MULT = 0.7,
	UPGRADE_HEALTH_THRESHOLD = 5
	)
	I.required_qualities = list(QUALITY_CUTTING,QUALITY_DRILLING, QUALITY_SAWING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_WELDING, QUALITY_HAMMERING)
	I.prefix = "rubber-wrapped"

// 	 PRODUCTIVITY: INCREASES WORKSPEED
//------------------------------------------------
/obj/item/weapon/tool_upgrade/productivity/ergonomic_grip
	name = "ergonomic grip"
	desc = "A replacement grip for a tool which allows it to be more precisely controlled with one hand."
	icon_state = "ergonomic"
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 5)

/obj/item/weapon/tool_upgrade/productivity/ergonomic_grip/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.15
	)
	I.weapon_upgrades = list(
		GUN_UPGRADE_RECOIL = 0.9,
	)
	I.gun_loc_tag = GUN_GRIP
	I.required_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PULSING, QUALITY_PRYING, QUALITY_WELDING, QUALITY_SCREW_DRIVING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_RETRACTING, QUALITY_DRILLING, QUALITY_HAMMERING, QUALITY_SAWING, QUALITY_CUTTING)
	I.prefix = "ergonomic"

/obj/item/weapon/tool_upgrade/productivity/ratchet
	name = "ratcheting mechanism"
	desc = "A mechanical upgrade for wrenches and screwdrivers which allows the tool to only turn in one direction."
	icon_state = "ratchet"
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTEEL = 4, MATERIAL_PLASTIC = 1)

/obj/item/weapon/tool_upgrade/productivity/ratchet/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.25
	)
	I.required_qualities = list(QUALITY_BOLT_TURNING,QUALITY_SCREW_DRIVING)
	I.prefix = "ratcheting"

/obj/item/weapon/tool_upgrade/productivity/red_paint
	name = "red paint"
	desc = "Do red tools really work faster or is the effect purely psychological?"
	icon_state = "paint_red"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 1)

/obj/item/weapon/tool_upgrade/productivity/red_paint/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.20,
	UPGRADE_PRECISION = -10,
	UPGRADE_COLOR = "#FF4444"
	)
	I.prefix = "red"
	I.required_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PULSING, QUALITY_PRYING, QUALITY_WELDING, QUALITY_SCREW_DRIVING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_RETRACTING, QUALITY_DRILLING, QUALITY_HAMMERING, QUALITY_SAWING, QUALITY_CUTTING)

/obj/item/weapon/tool_upgrade/productivity/whetstone
	name = "sharpening block"
	desc = "A rough single-use block to sharpen a blade. The honed edge cuts smoothly."
	icon_state = "whetstone"
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_DIAMOND = 3)

/obj/item/weapon/tool_upgrade/productivity/whetstone/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.15,
	UPGRADE_PRECISION = 5,
	UPGRADE_FORCE_MULT = 1.15
	)
	I.required_qualities = list(QUALITY_CUTTING,QUALITY_SAWING, QUALITY_SHOVELING, QUALITY_WIRE_CUTTING)
	I.prefix = "sharpened"

/obj/item/weapon/tool_upgrade/productivity/diamond_blade
	name = "Lonestars \"Gleaming Edge\": diamond blade"
	desc = "An adaptable industrial grade cutting disc, with diamond dust worked into the metal. Exceptionally durable."
	icon_state = "diamond_blade"
	price_tag = 300
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_DIAMOND = 4)

/obj/item/weapon/tool_upgrade/productivity/diamond_blade/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.25,
	UPGRADE_DEGRADATION_MULT = 0.85,
	UPGRADE_FORCE_MULT = 1.10,
	)
	I.required_qualities = list(QUALITY_CUTTING, QUALITY_SHOVELING, QUALITY_SAWING, QUALITY_WIRE_CUTTING, QUALITY_PRYING)
	I.negative_qualities = list(QUALITY_WELDING, QUALITY_LASER_CUTTING)
	I.prefix = "diamond-edged"

/obj/item/weapon/tool_upgrade/productivity/oxyjet
	name = "oxyjet canister"
	desc = "A canister of pure, compressed oxygen with adapters for mounting onto a welding tool. Used alongside fuel, it allows for higher burn temperatures."
	icon_state = "oxyjet"
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_PLASTIC = 1)

/obj/item/weapon/tool_upgrade/productivity/oxyjet/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.20,
	UPGRADE_FORCE_MULT = 1.15,
	UPGRADE_DEGRADATION_MULT = 1.15,
	UPGRADE_HEALTH_THRESHOLD = -10
	)
	I.required_qualities = list(QUALITY_WELDING)
	I.prefix = "oxyjet"

//Enhances power tools majorly, but also increases costs
/obj/item/weapon/tool_upgrade/productivity/motor
	name = "high power motor"
	desc = "A motor for power tools with a higher horsepower than usually expected. Significantly enhances productivity and lifespan, but more expensive to run and harder to control."
	icon_state = "motor"
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTEEL = 4)

/obj/item/weapon/tool_upgrade/productivity/motor/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.5,
	UPGRADE_FORCE_MULT = 1.15,
	UPGRADE_DEGRADATION_MULT = 1.15,
	UPGRADE_POWERCOST_MULT = 1.35,
	UPGRADE_FUELCOST_MULT = 1.35,
	UPGRADE_PRECISION = -10,
	UPGRADE_HEALTH_THRESHOLD = -10
	)
	I.required_qualities = list(QUALITY_SCREW_DRIVING, QUALITY_DRILLING, QUALITY_SAWING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_HAMMERING)
	I.prefix = "high-power"
	I.req_fuel_cell = REQ_FUEL_OR_CELL

/obj/item/weapon/tool_upgrade/productivity/antistaining
	name = "anti-staining paint"
	desc = "Applying a thin coat of this paint on a tool prevents stains, dirt or dust to adhere to its surface. Everyone work better and faster with clean tools."
	icon_state = "antistaining"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 2)

/obj/item/weapon/tool_upgrade/productivity/antistaining/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.30,
	UPGRADE_PRECISION = 5,
	UPGRADE_ITEMFLAGPLUS = NOBLOODY
	)
	I.prefix = "anti-stain coated"

/obj/item/weapon/tool_upgrade/productivity/booster
	name = "booster"
	desc = "When you do not care about energy comsumption and just want to get shit done quickly. This device shunts the power safeties of your tool whether it uses fuel or electricity."
	icon_state = "booster"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 2, MATERIAL_GOLD = 1)

/obj/item/weapon/tool_upgrade/productivity/booster/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.35,
	UPGRADE_DEGRADATION_MULT = 1.15,
	UPGRADE_POWERCOST_MULT = 1.25,
	UPGRADE_FUELCOST_MULT = 1.25
	)
	I.prefix = "boosted"
	I.req_fuel_cell = REQ_FUEL_OR_CELL

/obj/item/weapon/tool_upgrade/productivity/injector
	name = "plasma injector"
	desc = "If the words \"safety regulations\" do not mean anything to you, you may consider installing this fine piece of technology on your tool. It injects small amounts of plasma in the fuel mix before combustion to greatly increase its power output, making all kinds of tasks easier to perform."
	icon_state = "injector"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 2, MATERIAL_PLASMA = 2)

/obj/item/weapon/tool_upgrade/productivity/injector/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.75,
	UPGRADE_DEGRADATION_MULT = 1.3,
	UPGRADE_POWERCOST_MULT = 1.3,
	UPGRADE_FUELCOST_MULT = 1.3,
	UPGRADE_HEALTH_THRESHOLD = -10
	)
	I.prefix = "plasma-fueled"
	I.req_fuel_cell = REQ_FUEL

// 	 REFINEMENT: INCREASES PRECISION
//------------------------------------------------
/obj/item/weapon/tool_upgrade/refinement/laserguide
	name = "Lonestars \"Guiding Light\" laser guide"
	desc = "A small visible laser which can be strapped onto any tool, giving an accurate representation of its target. Helps improve precision."
	icon_state = "laser_guide"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_URANIUM = 1)

/obj/item/weapon/tool_upgrade/refinement/laserguide/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_PRECISION = 10)
	I.weapon_upgrades = list(
	GUN_UPGRADE_RECOIL = 0.9)
	I.prefix = "laser-guided"

//Fits onto generally small tools that require precision, especially surgical tools
//Doesn't work onlarger things like crowbars and drills
/obj/item/weapon/tool_upgrade/refinement/stabilized_grip
	name = "gyrostabilized grip"
	desc = "A fancy mechanical grip that partially floats around a tool, absorbing tremors and shocks. Allows precise work with a shaky hand."
	icon_state = "stabilizing"
	matter = list(MATERIAL_PLASTIC = 3)

/obj/item/weapon/tool_upgrade/refinement/stabilized_grip/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_PRECISION = 10,
	UPGRADE_HEALTH_THRESHOLD = 10)
	I.weapon_upgrades = list(
		GUN_UPGRADE_FIRE_DELAY_MULT = 0.9,
	)
	I.gun_loc_tag = GUN_GRIP
	I.required_qualities = list(QUALITY_CUTTING,QUALITY_WIRE_CUTTING, QUALITY_SCREW_DRIVING, QUALITY_WELDING,QUALITY_PULSING, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_BONE_SETTING, QUALITY_LASER_CUTTING)
	I.prefix = "stabilized"

/obj/item/weapon/tool_upgrade/refinement/magbit
	name = "magnetic bit"
	desc = "Magnetises tools used for handling small objects, reducing instances of dropping screws and bolts."
	icon_state = "magnetic"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTEEL = 2)

/obj/item/weapon/tool_upgrade/refinement/magbit/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_PRECISION = 10
	)
	I.required_qualities = list(QUALITY_SCREW_DRIVING, QUALITY_BOLT_TURNING, QUALITY_CLAMPING, QUALITY_BONE_SETTING)
	I.prefix = "magnetic"

/obj/item/weapon/tool_upgrade/refinement/ported_barrel
	name = "ported barrel"
	desc = "A barrel extension for a welding tool (or gun) which helps manage gas pressure and keep the torch (or barrel) steady. When attached to a gun it allows for greater recoil control and a smaller flash at the cost of stopping power."
	icon_state = "ported_barrel"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTEEL = 2)

/obj/item/weapon/tool_upgrade/refinement/ported_barrel/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_PRECISION = 12,
	UPGRADE_DEGRADATION_MULT = 1.15,
	UPGRADE_BULK = 1,
	UPGRADE_HEALTH_THRESHOLD = 10
	)
	I.weapon_upgrades = list(
		GUN_UPGRADE_MUZZLEFLASH = 0.8,
		GUN_UPGRADE_RECOIL = 0.8,
		GUN_UPGRADE_DAMAGE_MULT = 0.8
		)
	I.req_gun_tags = list(GUN_PROJECTILE)
	I.gun_loc_tag = GUN_BARREL
	I.required_qualities = list(QUALITY_WELDING)
	I.prefix = "ported"

/obj/item/weapon/tool_upgrade/refinement/compensatedbarrel
	name = "gravity compensated barrel"
	desc = "A barrel extension for welding tools that integrates a miniaturized gravity generator that help keep the torch steady by compensating the weight of the tool. It can also be attached to guns both energy and projectile to offer greater recoil control at the cost of stopping power."
	icon_state = "compensatedbarrel"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_GOLD = 1)

/obj/item/weapon/tool_upgrade/refinement/compensatedbarrel/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_PRECISION = 20,
	UPGRADE_DEGRADATION_MULT = 1.15,
	UPGRADE_POWERCOST_MULT = 1.05,
	UPGRADE_FUELCOST_MULT = 1.05,
	UPGRADE_BULK = 1
	)
	I.weapon_upgrades = list(
		GUN_UPGRADE_RECOIL = 0.6,
		GUN_UPGRADE_DAMAGE_MULT = 0.8
		)
	I.gun_loc_tag = GUN_BARREL
	I.required_qualities = list(QUALITY_WELDING)
	I.prefix = "gravity-compensated"
	I.req_fuel_cell = REQ_FUEL_OR_CELL

/obj/item/weapon/tool_upgrade/refinement/vibcompensator
	name = "vibration compensator"
	desc = "A ground-breaking innovation that dampens the vibration of a tool by emitting sound waves in a frequency nobody can hear. It does not make any sense but neither will you by installing that on your tool."
	icon_state = "vibcompensator"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 1, MATERIAL_GOLD = 1)

/obj/item/weapon/tool_upgrade/refinement/vibcompensator/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_PRECISION = 15,
	UPGRADE_HEALTH_THRESHOLD = 5,
	UPGRADE_ITEMFLAGPLUS = SILENT
	)
	I.required_qualities = list(QUALITY_CUTTING, QUALITY_WIRE_CUTTING, QUALITY_SCREW_DRIVING, QUALITY_WELDING ,QUALITY_PULSING, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_BONE_SETTING, QUALITY_LASER_CUTTING)
	I.prefix = "vibration-compensated"

// 		AUGMENTS: MISCELLANEOUS AND UTILITY
//------------------------------------------------

//Allows the tool to use a cell one size category larger than it currently uses. Small to medium, medium to large, etc
/obj/item/weapon/tool_upgrade/augment/cell_mount
	name = "heavy cell mount"
	icon_state = "cell_mount"
	desc = "A bulky adapter which allows oversized power cells to be installed into small tools."
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTEEL = 2, MATERIAL_PLASTIC = 1)

/obj/item/weapon/tool_upgrade/augment/cell_mount/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BULK = 1,
	UPGRADE_DEGRADATION_MULT = 1.15,
	UPGRADE_HEALTH_THRESHOLD = -10,
	UPGRADE_CELLPLUS = 1
	)
	I.prefix = "medium-cell"
	I.req_fuel_cell = REQ_CELL

//Stores moar fuel!
/obj/item/weapon/tool_upgrade/augment/fuel_tank
	name = "expanded fuel tank"
	desc = "An auxiliary tank which stores 100 extra units of fuel at the cost of degradation."
	icon_state = "canister"
	matter = list(MATERIAL_PLASTEEL = 4, MATERIAL_PLASTIC = 1)

/obj/item/weapon/tool_upgrade/augment/fuel_tank/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BULK = 1,
	UPGRADE_DEGRADATION_MULT = 1.15,
	UPGRADE_HEALTH_THRESHOLD = -10,
	UPGRADE_MAXFUEL = 100)
	I.prefix = "expanded"
	I.req_fuel_cell = REQ_FUEL

//Greyson fuel mod
/obj/item/weapon/tool_upgrade/augment/holding_tank
	name = "expanded fuel tank of holding"
	desc = "Rare relic of Greyson uses the bluetech space to store additional 600 units of fuel at the cost of degradation."
	icon_state = "canister_holding"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 4, MATERIAL_PLATINUM = 4)

/obj/item/weapon/tool_upgrade/augment/holding_tank/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BULK = 1,
	UPGRADE_DEGRADATION_MULT = 1.30,
	UPGRADE_HEALTH_THRESHOLD = -20,
	UPGRADE_MAXFUEL = 600
	)
	I.prefix = "holding"
	I.req_fuel_cell = REQ_FUEL
	item_flags |= BLUESPACE

//Penalises the tool, but unlocks several more augment slots.
/obj/item/weapon/tool_upgrade/augment/expansion
	name = "expansion port"
	icon_state = "expand"
	desc = "A bulky adapter which more modifications to be attached to the tool. A bit fragile but you can compensate."
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 1)

/obj/item/weapon/tool_upgrade/augment/expansion/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BULK = 2,
	UPGRADE_DEGRADATION_MULT = 1.3,
	UPGRADE_PRECISION = -10,
	UPGRADE_HEALTH_THRESHOLD = -20,
	UPGRADE_MAXUPGRADES = 3
	)
	I.prefix = "custom"
	I.required_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PULSING, QUALITY_PRYING, QUALITY_WELDING, QUALITY_SCREW_DRIVING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_RETRACTING, QUALITY_DRILLING, QUALITY_HAMMERING, QUALITY_SAWING, QUALITY_CUTTING)

/obj/item/weapon/tool_upgrade/augment/spikes
	name = "spikes"
	icon_state = "spike"
	desc = "An array of sharp bits of steel, seemingly adapted for easy affixing to a tool. Would make it into a better weapon, but won't do much for productivity."
	matter = list(MATERIAL_STEEL = 2)

/obj/item/weapon/tool_upgrade/augment/spikes/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_FORCE_MOD = 4,
	UPGRADE_PRECISION = -5,
	UPGRADE_DEGRADATION_MULT = 1.15,
	UPGRADE_WORKSPEED = -0.15,
	UPGRADE_HEALTH_THRESHOLD = -10,
	UPGRADE_SHARP = TRUE
	)
	I.prefix = "spiked"
	I.required_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PULSING, QUALITY_PRYING, QUALITY_WELDING, QUALITY_SCREW_DRIVING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_RETRACTING, QUALITY_DRILLING, QUALITY_HAMMERING, QUALITY_SAWING, QUALITY_CUTTING)

/*
/obj/item/weapon/tool_upgrade/augment/hammer_addon
	name = "flat surface"
	icon_state = "hammer_addon"
	desc = "A attachment that fits on almost everything to create a simple flat surface for hammering."
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_STEEL = 2)

/obj/item/weapon/tool_upgrade/augment/hammer_addon/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = -0.5,
	UPGRADE_HEALTH_THRESHOLD = 5,
	tool_qualities = list(QUALITY_HAMMERING = 10)
	)
	I.prefix = "flattened"
	I.required_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PULSING, QUALITY_PRYING, QUALITY_WELDING, QUALITY_SCREW_DRIVING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_RETRACTING, QUALITY_DRILLING, QUALITY_HAMMERING, QUALITY_SAWING, QUALITY_CUTTING)
*/
//Vastly reduces tool sounds, for stealthy hacking
/obj/item/weapon/tool_upgrade/augment/dampener
	name = "aural dampener"
	desc = "This aural dampener is a cutting edge tool attachment which mostly nullifies sound waves within a tiny radius. It minimises the noise created during use, perfect for stealth operations."
	icon_state = "dampener"
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_PLASTEEL = 1, MATERIAL_PLATINUM = 1)

/obj/item/weapon/tool_upgrade/augment/dampener/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_COLOR = "#AAAAAA",
	UPGRADE_HEALTH_THRESHOLD = -10,
	UPGRADE_ITEMFLAGPLUS = SILENT
	)
	I.prefix = "silenced"
	I.required_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PULSING, QUALITY_PRYING, QUALITY_WELDING, QUALITY_SCREW_DRIVING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_RETRACTING, QUALITY_DRILLING, QUALITY_HAMMERING, QUALITY_SAWING, QUALITY_CUTTING)

/obj/item/weapon/tool_upgrade/augment/ai_tool
	name = "nanointegrated AI"
	desc = "A forgotten Greyson Positronic tech. Due to its unique installation method of \"slapping it hard enough onto anything should do the trick\", it is highly sought after. \
		A powerful AI will integrate itself into this tool with the aid of nanotechnology and improve it in every way possible."
	icon_state = "ai_tool"
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_PLASTEEL = 3, MATERIAL_PLATINUM = 3, MATERIAL_GOLD = 3, MATERIAL_DIAMOND = 1)

/obj/item/weapon/tool_upgrade/augment/ai_tool/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_POWERCOST_MULT = 1.20,
	UPGRADE_PRECISION = 14,
	UPGRADE_WORKSPEED = 14,
	UPGRADE_HEALTH_THRESHOLD = -10,
	)
	I.weapon_upgrades = list(
	GUN_UPGRADE_RECOIL = 0.8,
	GUN_UPGRADE_DAMAGE_MULT = 1.2,
	GUN_UPGRADE_PEN_MULT = 1.2,
	GUN_UPGRADE_FIRE_DELAY_MULT = 0.8,
	GUN_UPGRADE_MOVE_DELAY_MULT = 0.8,
	GUN_UPGRADE_MUZZLEFLASH = 0.8,
	GUN_UPGRADE_CHARGECOST = 0.8,
	GUN_UPGRADE_OVERCHARGE_MAX = 0.8,
	GUN_UPGRADE_OVERCHARGE_RATE = 1.2)
	I.prefix = "intelligent"
	I.req_fuel_cell = REQ_CELL

/obj/item/weapon/tool_upgrade/augment/ai_tool_excelsior
	name = "excelsior nanointegrated AI"
	desc = "An attempt by the excelsior to copy the superior grayson nano-AI for their weaponry. It isn't nearly as good, but its cheaper to produce and can fit any weapon, not just energy based, as it draws its power from excelsior teleporation technology."
	icon_state = "ai_tool_excelsior"
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_PLASTEEL = 3, MATERIAL_GOLD = 3)

/obj/item/weapon/tool_upgrade/augment/ai_tool_excelsior/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_POWERCOST_MULT = 1.10,
	UPGRADE_PRECISION = 7,
	UPGRADE_WORKSPEED = 7,
	UPGRADE_HEALTH_THRESHOLD = -20,
	)
	I.weapon_upgrades = list(
	GUN_UPGRADE_RECOIL = 0.9,
	GUN_UPGRADE_DAMAGE_MULT = 1.1,
	GUN_UPGRADE_PEN_MULT = 1.1,
	GUN_UPGRADE_FIRE_DELAY_MULT = 0.9,
	GUN_UPGRADE_MOVE_DELAY_MULT = 0.9,
	GUN_UPGRADE_MUZZLEFLASH = 0.9,
	GUN_UPGRADE_CHARGECOST = 0.9,
	GUN_UPGRADE_OVERCHARGE_MAX = 0.9,
	GUN_UPGRADE_OVERCHARGE_RATE = 1.1)
	I.prefix = "collective"

/obj/item/weapon/tool_upgrade/augment/repair_nano
	name = "repair nano"
	desc = "Very rare tool mod from Greyson powered by their nanomachines. It repairs the tool while in use and makes it near unbreakable."
	icon_state = "repair_nano"
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_PLASTEEL = 1, MATERIAL_PLATINUM = 1)

/obj/item/weapon/tool_upgrade/augment/repair_nano/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_DEGRADATION_MULT = 0.01,
	UPGRADE_HEALTH_THRESHOLD = 10
	)
	I.prefix = "self-healing"

/obj/item/weapon/tool_upgrade/augment/hydraulic
	name = "hydraulic circuits"
	desc = "A complex set of hydraulic circuits that can be installed on a tool to greatly improve its functions. It's loud as hell though so do not plan on being stealthy."
	icon_state = "hydraulic"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 3)

/obj/item/weapon/tool_upgrade/augment/hydraulic/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 1.0,
	UPGRADE_PRECISION = 10,
	UPGRADE_ITEMFLAGPLUS = LOUD
	)
	I.prefix = "hydraulic"

//Armor mods
/obj/item/weapon/tool_upgrade/armor/melee
	name = "melee plating"
	desc = "A sturdy bit of plasteel that can be bolted onto any armor to enhance its melee resistance."
	icon_state = "melee"
	matter = list(MATERIAL_STEEL = 30)

/obj/item/weapon/tool_upgrade/armor/melee/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_MELEE_ARMOR = 20
	)
	I.prefix = "reinforced"
	I.required_qualities = list(QUALITY_ARMOR)

/obj/item/weapon/tool_upgrade/armor/bullet
	name = "ballistic plating"
	desc = "A sturdy bit of plasteel that can be bolted onto any armor to enhance its ballistic resistance."
	icon_state = "bullet"
	matter = list(MATERIAL_PLASTEEL = 30)

/obj/item/weapon/tool_upgrade/armor/bullet/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BALLISTIC_ARMOR = 20
	)
	I.prefix = "kevlar-plated"
	I.required_qualities = list(QUALITY_ARMOR)

/obj/item/weapon/tool_upgrade/armor/energy
	name = "energy plating"
	desc = "A sturdy bit of plasteel that can be bolted onto any armor to enhance its energy resistance."
	icon_state = "energy"
	matter = list(MATERIAL_PLATINUM = 30)

/obj/item/weapon/tool_upgrade/armor/energy/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_ENERGY_ARMOR = 20
	)
	I.prefix = "ablative-plated"
	I.required_qualities = list(QUALITY_ARMOR)

/obj/item/weapon/tool_upgrade/armor/bomb
	name = "bomb proofing"
	desc = "A sturdy bit of plasteel that can be bolted onto any armor to enhance its bomb resistance."
	icon_state = "bomb"
	matter = list(MATERIAL_PLASTEEL = 20)

/obj/item/weapon/tool_upgrade/armor/bomb/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BOMB_ARMOR = 40
	)
	I.prefix = "bomb-proofed"
	I.required_qualities = list(QUALITY_ARMOR)
