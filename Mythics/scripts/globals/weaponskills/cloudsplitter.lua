-----------------------------------	
-- Rampage	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)	

	local wspack = player:getVar("wspack")
	local wscloudsplitter = player:getVar("wscloudsplitter")
	local mythic = player:getEquipID(SLOT_MAIN)
    local bstpoints = player:getVar("MythicBst")+1
	
	if (mythic == 18979)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicBst") <= 499 then
			player:setVar("MythicBst", (player:getVar("MythicBst")+1));
			player:PrintToPlayer(string.format("Beastmaster Mythic Point! %d/500 points", bstpoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Primal Rend is complete!");
		end
	end

	if (wscloudsplitter == 1 or wspack == 1) then
	
		local params = {};
        params.numHits = 4;
        params.ftp100 = 1.08; params.ftp200 = 1.08; params.ftp300 = 1.08;
        params.str_wsc = 0.7 + (player:getMerit(MERIT_RUINATOR) / 100); params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
        params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
        params.canCrit = false;
        params.acc100 = 0.8; params.acc200= 0.9; params.acc300= 1.0;
        params.atkmulti = 1.1;

		local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
		
		return tpHits, extraHits, criticalHit, damage;
		
    else
        player:PrintToPlayer("This Donation Weapon skill will miss 100% unless you donate for it");
	    return 0,0,0,0;			 
	end	

end;