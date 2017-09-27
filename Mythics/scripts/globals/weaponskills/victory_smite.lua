-----------------------------------
-- Asuran Fists
-- Hand-to-Hand weapon skill
-- Skill Level: 250
-- Delivers an eightfold attack. params.accuracy varies with TP.
-- In order to obtain Asuran Fists, the quest The Walls of Your Mind must be completed.
-- Due to the 95% params.accuracy cap there is only a 66% chance of all 8 hits landing, so approximately a one third chance of missing some of the hits at the cap.
-- Will stack with Sneak Attack.
-- Aligned with the Shadow Gorget, Soil Gorget & Flame Gorget.
-- Aligned with the Shadow Belt, Soil Belt & Flame Belt.
-- Element: None
-- Modifiers: STR:10% ; VIT:10%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

	local wspack = player:getVar("wspack")
	local wsvictorysmite = player:getVar("wsvictorysmite")
	local mythic = player:getEquipID(SLOT_MAIN)
    local mnkpoints = player:getVar("MythicMnk")+1
    local puppoints = player:getVar("MythicPup")+1
	
	if (mythic == 18972)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicMnk") <= 499 then
			player:setVar("MythicMnk", (player:getVar("MythicMnk")+1));
			player:PrintToPlayer(string.format("Monk Mythic Point! %d/500 points", mnkpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Ascetic's Fury is complete!");
		end
	elseif (mythic == 18988)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicPup") <= 499 then
			player:setVar("MythicPup", (player:getVar("MythicPup")+1));
			player:PrintToPlayer(string.format("Puppetmaster Mythic Point! %d/500 points", puppoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Stringing Pummel is complete!");
	end
end
	
	if (wsvictorysmite == 1 or wspack == 1) then	

    local params = {};
    params.numHits = 8;
    params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
    params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.2; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 2.5; params.acc200= 2.5; params.acc300= 2.5;
    params.atkmulti = 1.1;

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
    
    scoreCheck(player, wsID, damage, target); return tpHits, extraHits, criticalHit, damage;
    
	else
	
		player:PrintToPlayer("This Donation Weapon skill will miss 100% unless you donate for it");
		scoreCheck(player, wsID, damage, target); return 0,0,0,0;
	
	end
	
end