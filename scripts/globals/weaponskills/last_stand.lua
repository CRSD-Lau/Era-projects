-----------------------------------
-- Slug Shot
-- Marksmanship weapon skill
-- Skill Level: 175
-- Delivers an inparams.accurate attack that deals quintuple damage. params.accuracy varies with TP.
-- Despite the lack of a STR weaponskill mod, STR is still the most potent stat for increasing this weaponskill's damage to the point at which fSTR2 is capped.
-- Aligned with the Aqua Gorget, Light Gorget & Breeze Gorget.
-- Aligned with the Aqua Belt, Light Belt & Breeze Belt.
-- Element: None
-- Modifiers: AGI:70%
-- 100%TP    200%TP    300%TP
-- 5.00      5.00      5.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

local wspack = player:getVar("wspack")
local wslaststand = player:getVar("wslaststand")
	local mythic = player:getEquipID(SLOT_RANGED)
    local corpoints = player:getVar("MythicCor")+1
    local rngpoints = player:getVar("MythicRng")+1
	
	if (mythic == 18987)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicCor") <= 499 then
			player:setVar("MythicCor", (player:getVar("MythicCor")+1));
			player:PrintToPlayer(string.format("Corsair Mythic Point! %d/500 points", corpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Leaden Salute is complete!");
		end
	elseif (mythic == 18981)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicRng") <= 499 then
			player:setVar("MythicRng", (player:getVar("MythicRng")+1));
			player:PrintToPlayer(string.format("Ranger Mythic Point! %d/500 points", rngpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Trueflight is complete!");
		end
	end

 if (wslaststand == 1 or wspack == 1) then	
    local params = {};
    params.numHits = 1;
    params.ftp100 = 5; params.ftp200 = 5; params.ftp300 = 5;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.3; 
    params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.8; params.acc200= 0.9; params.acc300= 1;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.agi_wsc = 0.7;
    end

    local damage, criticalHit, tpHits, extraHits = doRangedWeaponskill(player, target, wsID, params, tp, primary);
	--scoreCheck(player, wsID, damage, target);       
    scoreCheck(player, wsID, damage, target); return tpHits, extraHits, criticalHit, damage;
	
	     
	end

end