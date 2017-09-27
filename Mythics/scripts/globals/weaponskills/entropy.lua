-----------------------------------
-- Guillotine    
-- Scythe weapon skill
-- Skill level: 200
-- Delivers a four-hit attack. Duration varies with TP.
-- Modifiers: STR:25% ; MND:25% 
-- 100%TP 	200%TP 	300%TP
-- 0.875	0.875	0.875
-----------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/weaponskills");
function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

local wspack = player:getVar("wspack")
local wsentropy = player:getVar("wsentropy")
	local mythic = player:getEquipID(SLOT_MAIN)
    local drkpoints = player:getVar("MythicDrk")+1
	
	if (mythic == 18978)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicDrk") <= 499 then
			player:setVar("MythicDrk", (player:getVar("MythicDrk")+1));
			player:PrintToPlayer(string.format("Dark Knight Mythic Point! %d/500 points", drkpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Insurgency is complete!");
		end
	end

	 if (player:getID() == 46387 or player:getID() == 46668 or player:getID() == 21828 or player:getID() == 41077 or player:getID() == 41104 or player:getID() == 43200 or player:getID() == 42550 or player:getID() == 42420 or player:getID() == 24528 or player:getID() == 39457 or player:getID() == 22221 or player:getID() == 41839 or player:getID() == 41839 or player:getID() == 41421 or player:getID() == 41319 or player:getID() == 40635 or player:getID() == 40448 or player:getID() == 22721 or player:getID() == 41289 or player:getID() == 21912 or player:getID() == 22620 or player:getID() == 28120 or player:getID() == 28035 or player:getID() == 38513 or player:getID() == 40926 or player:getID() == 35346 or player:getID() == 32021 or player:getID() == 38832 or player:getID() == 40121 or player:getID() == 38213 or player:getID() == 36360 or player:getID() == 38325 or player:getID() == 38213 or player:getID() == 38068 or player:getID() == 37113 or player:getID() == 29635 or player:getID() == 40340 or player:getID() == 35814 or player:getID() == 38802 or player:getID() == 37360 or player:getID() == 38849 or player:getID() == 40122 or player:getID() == 36053 or player:getID() == 39747 or player:getID() == 32471 or player:getID() == 32910 or player:getID() == 22957 or player:getID() == 40448 or player:getID() == 21912 or player:getID() == 40261 or player:getID() == 39785 or player:getID() == 22957 or player:getID() == 24704 or player:getID() == 35124 or player:getID() == 38621 or player:getID() == 37317 or player:getID() == 39206 or player:getID() == 38068 or player:getID() == 38662 or player:getID() == 39118 or player:getID() == 38665 or player:getID() == 40012 or player:getID() == 21852 or player:getID() == 32277 or player:getID() == 33641 or player:getID() == 34292 or player:getID() == 32240 or player:getID() == 26022 or player:getID() == 31984 or player:getID() == 28035 or player:getID() == 28120 or player:getID() == 33633 or player:getID() == 28095 or player:getID() == 33633 or player:getID() == 32021 or player:getID() ==  22221 or player:getID() == 29201 or player:getID() == 22095 or player:getID() == 24257 or player:getID() == 32414 or player:getID() == 36968 or player:getID() == 42107 or player:getID() == 41206 or player:getID() == 41444 or wsentropy == 1 or wspack == 1) then		

	local params = {};
	params.numHits = 4;
	--ftp damage mods (for Damage Varies with TP; lines are calculated in the function
	params.ftp100 = 0.875; params.ftp200 = 0.875; params.ftp300 = 0.875;
	--wscs are in % so 0.2=20%
	params.str_wsc = 0.25; params.dex_wsc = 0.25; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	--critical mods, again in % (ONLY USE FOR critICAL HIT VARIES WITH TP)
	params.crit100 = 0.0; params.crit200=0.0; params.crit300=0.0;
	params.canCrit = true;
	--accuracy mods (ONLY USE FOR accURACY VARIES WITH TP) , should be the params.acc at those %s NOT the penalty values. Leave 0 if acc doesnt vary with tp.
	params.acc100 = 0; params.acc200=0; params.acc300=0;
	--attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
	params.atkmulti = 1;
	
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
	
	if damage > 0 then
		local tp = player:getTP();
		local duration = (tp/100 * 30) + 30;
		if(target:hasStatusEffect(EFFECT_SILENCE) == false) then
			target:addStatusEffect(EFFECT_SILENCE, 1, 0, duration);
		end
	end	
	             scoreCheck(player, wsID, damage, target); return tpHits, extraHits, criticalHit, damage;
    
    else
	player:PrintToPlayer("This Donation Weapon skill will miss 100% unless you donate for it (guillotine copy)");
	             scoreCheck(player, wsID, damage, target); return 0,0,0,0;
	end	
end
