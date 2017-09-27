-----------------------------------
-- Vorpal Blade
-- Sword weapon skill
-- Skill Level: 200
-- Delivers a four-hit attack. Chance of params.critical varies with TP.
-- Stacks with Sneak Attack.
-- Aligned with the Soil Gorget & Thunder Gorget.
-- Aligned with the Soil Belt & Thunder Belt.
-- Element: None
-- Modifiers: STR:60%
-- 100%TP    200%TP    300%TP
-- 1.375      1.375      1.375
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
local mythic = player:getEquipID(SLOT_MAIN)
local blupoints = player:getVar("MythicBlu")+1
local pldpoints = player:getVar("MythicPld")+1
local rdmpoints = player:getVar("MythicRdm")+1
	
	if (mythic == 18986)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicBlu") <= 499 then
			player:setVar("MythicBlu", (player:getVar("MythicBlu")+1));
			player:PrintToPlayer(string.format("Bluemage Mythic Point! %d/500 points", blupoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Expiacion is complete!");
		end
	elseif (mythic == 18977)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicPld") <= 499 then
			player:setVar("MythicPld", (player:getVar("MythicPld")+1));
			player:PrintToPlayer(string.format("Paladin Mythic Point! %d/500 points", pldpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Atonement is complete!");
		end
	elseif (mythic == 18975)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicRdm") <= 499 then
			player:setVar("MythicRdm", (player:getVar("MythicRdm")+1));
			player:PrintToPlayer(string.format("Redmage Mythic Point! %d/500 points", rdmpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Death Blossom is complete!");
	end
end
    local params = {};
    params.numHits = 4;
    params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
    params.str_wsc = 0.6; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.1; params.crit200 = 0.3; params.crit300 = 0.5;
    params.canCrit = true;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 1.375; params.ftp200 = 1.375; params.ftp300 = 1.375;
        params.str_wsc = 0.6;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
    scoreCheck(player, wsID, damage, target); return tpHits, extraHits, criticalHit, damage;

end
