-----------------------------------
-- Rampage
-- Axe weapon skill
-- Skill level: 175
-- Delivers a five-hit attack. Chance of params.critical varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Soil Gorget.
-- Aligned with the Soil Belt.
-- Element: None
-- Modifiers: STR:50%
-- 100%TP    200%TP    300%TP
--   1         1         1
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
	local mythic = player:getEquipID(SLOT_MAIN)
    local bstpoints = player:getVar("MythicBst")+1
	
	if (mythic == 18979)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicBst") <= 499 then
			player:setVar("MythicBst", (player:getVar("MythicBst")+1));
			player:PrintToPlayer(string.format("Beastmaster Mythic Point! %d/500 points", bstpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Primal Rend is complete!");
		end
	end

    local params = {};
    params.numHits = 5;
    params.ftp100 = 0.5; params.ftp200 = 0.5; params.ftp300 = 0.5;
    params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.10; params.crit200 = 0.30; params.crit300 = 0.50;
    params.canCrit = true;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
        params.str_wsc = 0.5;
        params.crit100 = 0.0; params.crit200 = 0.20; params.crit300 = 0.40;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
    scoreCheck(player, wsID, damage, target); return tpHits, extraHits, criticalHit, damage;

end
