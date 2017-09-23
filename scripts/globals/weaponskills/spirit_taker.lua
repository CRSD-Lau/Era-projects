-----------------------------------
-- Spirit Taker
-- Staff weapon skill
-- Skill Level: 215
-- Converts damage dealt to own MP. Damage varies with TP.
-- Will stack with Sneak Attack.
-- Not aligned with any "elemental gorgets" or "elemental belts" due to it's absence of Skillchain properties.
-- It is a physical weapon skill, and is affected by the user's params.accuracy and the enemy's evasion. It may miss completely.
-- Element: None
-- Modifiers: INT:50% ; MND:50%
-- 100%TP    200%TP    300%TP
-- 1.00      1.50      2.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
	local mythic = player:getEquipID(SLOT_MAIN)
local blmpoints = player:getVar("MythicBlm")+1
local smnpoints = player:getVar("MythicSmn")+1
local schpoints = player:getVar("MythicSch")+1
	
	if (mythic == 18974)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicBlm") <= 499 then
			player:setVar("MythicBlm", (player:getVar("MythicBlm")+1));
			player:PrintToPlayer(string.format("Blackmage Mythic Point! %d/500 points", blmpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Vidohunir is complete!");
		end
	elseif (mythic == 18985)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicSmn") <= 499 then
			player:setVar("MythicSmn", (player:getVar("MythicSmn")+1));
			player:PrintToPlayer(string.format("Summoner Mythic Point! %d/500 points", smnpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Garland of Bliss is complete!");
		end
	elseif (mythic == 18970)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicSch") <= 499 then
			player:setVar("MythicSch", (player:getVar("MythicSch")+1));
			player:PrintToPlayer(string.format("Scholar Mythic Point! %d/500 points", schpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Omniscience is complete!");
	end
end

    local params = {};
    params.numHits = 1;
    params.ftp100 = 1; params.ftp200 = 1.5; params.ftp300 = 2;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.5; params.mnd_wsc = 0.5; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;
    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
    player:addMP(damage);
    scoreCheck(player, wsID, damage, target); return tpHits, extraHits, criticalHit, damage;

end
