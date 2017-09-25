-----------------------------------
-- Evisceration
-- Dagger weapon skill
-- Skill level: 230
-- In order to obtain Evisceration, the quest Cloak and Dagger must be completed.
-- Delivers a fivefold attack. Chance of params.critical hit varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Shadow Gorget, Soil Gorget & Light Gorget.
-- Aligned with the Shadow Belt, Soil Belt & Light Belt.
-- Element: None
-- Modifiers: DEX:30%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local mythic = player:getEquipID(SLOT_MAIN)
    local thfpoints = player:getVar("MythicThf")+1
    local brdpoints = player:getVar("MythicBrd")+1
    local dncpoints = player:getVar("MythicDnc")+1
	
	if (mythic == 18976)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicThf") <= 499 then
			player:setVar("MythicThf", (player:getVar("MythicThf")+1));
			player:PrintToPlayer(string.format("Thief Mythic Point! %d/500 points", thfpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Mandalic Stab is complete!");
		end
	elseif (mythic == 18980)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicBrd") <= 499 then
			player:setVar("MythicBrd", (player:getVar("MythicBrd")+1));
			player:PrintToPlayer(string.format("Bard Mythic Point! %d/500 points", brdpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Mordant Rime is complete!");
		end
	elseif (mythic == 18969)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicDnc") <= 499 then
			player:setVar("MythicDnc", (player:getVar("MythicDnc")+1));
			player:PrintToPlayer(string.format("Dancer Mythic Point! %d/500 points", dncpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Pyrrhic Kleos is complete!");
	end
end

    local params = {};
    params.numHits = 5;
    params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
    params.str_wsc = 0.0; params.dex_wsc = 0.3; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.1; params.crit200 = 0.3; params.crit300 = 0.5;
    params.canCrit = true;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 1.25; params.ftp200 = 1.25; params.ftp300 = 1.25;
        params.crit200 = 0.25;
        params.dex_wsc = 0.5;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
    scoreCheck(player, wsID, damage, target); return tpHits, extraHits, criticalHit, damage;

end;