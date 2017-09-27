-----------------------------------
-- Guillotine
-- Scythe weapon skill
-- Skill level: 200
-- Delivers a four-hit attack. Duration varies with TP.
-- Modifiers: STR:25% ; MND:25%
-- 100%TP     200%TP     300%TP
-- 0.875    0.875    0.875
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------
function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
	local mythic = player:getEquipID(SLOT_MAIN)
    local drkpoints = player:getVar("MythicDrk")+1
	
	if (mythic == 18978)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicDrk") <= 499 then
			player:setVar("MythicDrk", (player:getVar("MythicDrk")+1));
			player:PrintToPlayer(string.format("Dark Knight Mythic Point! %d/500 points", drkpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Insurgency is complete!");
		end
	end
    local params = {};
    params.numHits = 4;
    -- ftp damage mods (for Damage Varies with TP; lines are calculated in the function
    params.ftp100 = 0.875; params.ftp200 = 0.875; params.ftp300 = 0.875;
    -- wscs are in % so 0.2=20%
    params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.5; params.chr_wsc = 0.0;
    -- critical mods, again in % (ONLY USE FOR critICAL HIT VARIES WITH TP)
    params.crit100 = 0.0; params.crit200=0.0; params.crit300=0.0;
    params.canCrit = true;
    -- accuracy mods (ONLY USE FOR accURACY VARIES WITH TP) , should be the params.acc at those %s NOT the penalty values. Leave 0 if acc doesnt vary with tp.
    params.acc100 = 0; params.acc200=0; params.acc300=0;
    -- attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.3; params.mnd_wsc = 0.5;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);

    if (damage > 0) then
        local duration = (tp/1000 * 30) + 30;
        if (target:hasStatusEffect(EFFECT_SILENCE) == false) then
            target:addStatusEffect(EFFECT_SILENCE, 1, 0, duration);
        end
    end
    scoreCheck(player, wsID, damage, target); return tpHits, extraHits, criticalHit, damage;

end
