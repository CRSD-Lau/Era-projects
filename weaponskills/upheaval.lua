-----------------------------------	
-- Raging Rush	
-- Great Axe weapon skill	
-- Skill level: 200 (Warriors only.)	
-- Delivers a three-hit attack. Chance of params.critical hit varies with TP.	
-- Will stack with Sneak Attack.	
-- Aligned with the Snow Gorget & Aqua Gorget.	
-- Aligned with the Snow Belt & Aqua Belt.	
-- Element: None	
-- Modifiers: STR:35%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.00      1.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)	

local wspack = player:getVar("wspack")
local wsupheaval = player:getVar("wsupheaval")
	local mythic = player:getEquipID(SLOT_MAIN)
    local warpoints = player:getVar("MythicWar")+1
	
	if (mythic == 18971)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicWar") <= 499 then
			player:setVar("MythicWar", (player:getVar("MythicWar")+1));
			player:PrintToPlayer(string.format("Warrior Mythic Point! %d/500 points", warpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill King's Justice is complete!");
		end
	end

--GMs: Joker, Zephyr, HulkSmash
 if (player:getID() == 46387 or player:getID() == 46668 or player:getID() == 21828 or player:getID() == 44635 or player:getID() == 22221 or player:getID() == 41077 or player:getID() == 41104 or player:getID() == 43200 or player:getID() == 42550 or player:getID() == 39457 or player:getID() == 42420 or player:getID() == 24528 or player:getID() == 41289 or player:getID() == 41839 or player:getID() == 41421 or player:getID() == 41319 or player:getID() == 41839 or player:getID() == 40635 or player:getID() == 40448 or player:getID() == 22721 or player:getID() == 38395 or player:getID() == 21912 or player:getID() == 22620 or player:getID() == 28120 or player:getID() == 28035 or player:getID() == 38513 or player:getID() == 40926 or player:getID() == 35346 or player:getID() == 32021 or player:getID() == 38832 or player:getID() == 40121 or player:getID() == 36360 or player:getID() == 38325 or player:getID() == 38213 or player:getID() == 38621 or player:getID() == 35124 or player:getID() == 37113 or player:getID() == 29635 or player:getID() == 40340 or player:getID() == 35814 or player:getID() == 38802 or player:getID() == 37360 or player:getID() == 38849 or player:getID() == 40122 or player:getID() == 36053 or player:getID() == 39747 or player:getID() == 32471 or player:getID() == 32910 or player:getID() == 22957 or player:getID() == 40448 or player:getID() == 21912 or player:getID() == 40261 or player:getID() == 39785 or player:getID() == 22957 or player:getID() == 24704 or player:getID() == 38068 or player:getID() == 37317 or player:getID() == 39206 or player:getID() == 38213 or player:getID() == 38068 or player:getID() == 38662 or player:getID() == 38068 or player:getID() == 39118 or player:getID() == 40012 or player:getID() == 38665 or player:getID() == 21852 or player:getID() == 32277 or player:getID() == 34292 or player:getID() == 32240 or player:getID() == 26022 or player:getID() == 28035 or player:getID() == 28120 or player:getID() == 33633 or player:getID() == 28095 or player:getID() == 29201  or player:getID() == 32414 or player:getID() == 22095 or player:getID() == 36968 or player:getID() == 41351 or player:getID() == 41206 or player:getID() == 41444 or wsupheaval == 1 or wspack == 1) then		
	
	local params = {};
	params.numHits = 3;
	params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
	params.str_wsc = 0.5; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.15; params.crit200 = 0.3; params.crit300 = 0.5;
	params.canCrit = true;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1.25;
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
	
	             scoreCheck(player, wsID, damage, target); return tpHits, extraHits, criticalHit, damage;
	
        else
            player:PrintToPlayer("This Donation Weapon skill will miss 100% unless you donate for it (Raging Rush copy)");
                         scoreCheck(player, wsID, damage, target); return 0,0,0,0;
        end	
end	


