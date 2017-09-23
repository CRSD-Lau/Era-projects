-----------------------------------
-- Raging Rush
-- Great Axe weapon skill
-- Skill level: 200 (Warriors only.)
-- Delivers a three-hit attack. Chance of params.critical hit varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Snow Gorget & Aqua Gorget.
-- Aligned with the Snow Belt & Aqua Belt.
-- Element: None
-- Modifiers: STR:50%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
	local mythic = player:getEquipID(SLOT_MAIN)
    local warpoints = player:getVar("MythicWar")+1
	
	if (mythic == 18971)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicWar") <= 499 then
			player:setVar("MythicWar", (player:getVar("MythicWar")+1));
			player:PrintToPlayer(string.format("Warrior Mythic Point! %d/500 points", warpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill King's Justice is complete!");
		end
	end

    local params = {};
    params.numHits = 3;
    params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
    params.str_wsc = 0.5; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.15; params.crit200 = 0.3; params.crit300 = 0.5;
    params.canCrit = true;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1.25;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.crit100 = 0.15;
        params.str_wsc = 0.5;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
    scoreCheck(player, wsID, damage, target); return tpHits, extraHits, criticalHit, damage;

end
