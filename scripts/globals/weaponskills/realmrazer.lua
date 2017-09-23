-----------------------------------	
-- Hexa Strike	
-- Club weapon skill	
-- Skill level: 220	
-- Delivers a six-hit attack. Chance of params.critical varies with TP.	
-- Will stack with Sneak Attack.	
-- Aligned with the Flame Gorget & Light Gorget.	
-- Aligned with the Flame Belt & Light Belt.	
-- Element: None	
-- Modifiers: STR:20% ; MND:20%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.00      1.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)	

local wspack = player:getVar("wspack")
local wsrealmrazer = player:getVar("wsrealmrazer")
	local mythic = player:getEquipID(SLOT_MAIN)
    local whmpoints = player:getVar("MythicWhm")+1
	
	if (mythic == 18973)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicWhm") <= 499 then
			player:setVar("MythicWhm", (player:getVar("MythicWhm")+1));
			player:PrintToPlayer(string.format("White Mage Mythic Point! %d/500 points", whmpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Mystic Boon is complete!");
		end
	end

	 if (wsrealmrazer == 1 or wspack == 1) then
	
	local params = {};
	params.numHits = 6;
	params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
	params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.2; params.chr_wsc = 0.0;
	params.crit100 = 0.1; params.crit200 = 0.3; params.crit300 = 0.5;
	params.canCrit = true;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1.1;
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
	
	             scoreCheck(player, wsID, damage, target); return tpHits, extraHits, criticalHit, damage;
	
    else
	player:PrintToPlayer("This Donation Weapon skill will miss 100% unless you donate for it (Hexa Strike copy)");
	             scoreCheck(player, wsID, damage, target); return 0,0,0,0;
	end			
end	
