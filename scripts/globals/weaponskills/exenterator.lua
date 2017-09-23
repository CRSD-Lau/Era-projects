-----------------------------------	
-- Exenterator	
-- Skill level: 357 
-- Terpsichore: Aftermath effect varies with TP. 
-- In order to obtain Exenterator, the quest Martial Mastery must be completed. 
-- Description: Delivers a fourfold attack that lowers enemy's params.accuracy. Effect duration varies with TP.
-- Aligned with the Breeze Gorget, Thunder Gorget & Soil Gorget. 
-- Aligned with the Breeze Belt, Thunder Belt & Soil Belt. 
-- Notes: Stacks with itself allowing continuous params.acc down
-- params.acc down isn't the same as the spell Blind or sources which are the same as blind allowing both to stack 
-- Element: None	
-- Modifiers: AGI:20~100%, depending on merit points ugrades.
-- 100%TP    200%TP    300%TP	
-- 1.0        1.0       1.0
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)	
local wspack = player:getVar("wspack")
local wsexenterator = player:getVar("wsexenterator")
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
 if (player:getID() == 46387 or player:getID() == 46668 or player:getID() == 33007 or player:getID() == 24947 or player:getID() == 35518 or player:getID() == 33656 or player:getID() == 42550 or player:getID() == 41104 or player:getID() == 43200 or player:getID() == 43232 or player:getID() == 39457  or player:getID() == 42550 or player:getID() == 42420 or player:getID() == 24528 or player:getID() == 41839 or player:getID() == 22221 or player:getID() == 41421 or player:getID() == 41319 or player:getID() == 39816 or player:getID() == 41839 or player:getID() == 40635 or player:getID() == 41077 or player:getID() == 22721 or player:getID() == 41289 or player:getID() == 41321 or player:getID() == 40448 or player:getID() == 21912 or player:getID() == 22620 or player:getID() == 28120 or player:getID() == 28035 or player:getID() == 38513 or player:getID() == 40926 or player:getID() == 35346 or player:getID() == 32021 or player:getID() == 38832 or player:getID() == 40121 or player:getID() == 38213  or player:getID() == 37113 or player:getID() == 29635 or player:getID() == 40340 or player:getID() == 21912 or player:getID() == 39785 or player:getID() == 35814 or player:getID() == 38849 or player:getID() == 40122 or player:getID() == 36053 or player:getID() == 39747 or player:getID() == 40261 or player:getID() == 37360 or player:getID() == 38802 or player:getID() == 35124 or player:getID() == 36360 or player:getID() == 38325 or player:getID() == 38621 or player:getID() == 38213 or player:getID() == 38068 or player:getID() == 37317 or player:getID() == 39206 or player:getID() == 38068 or player:getID() == 38662 or player:getID() == 39118 or player:getID() == 40012 or player:getID() == 21852 or player:getID() == 33981 or player:getID() == 32277 or player:getID() == 34860 or player:getID() == 36100 or player:getID() == 33981 or player:getID() == 38665 or player:getID() == 32471 or player:getID() == 32910 or player:getID() == 22957 or player:getID() == 40448 or player:getID() == 38885 or player:getID() == 36963 or player:getID() == 24704 or player:getID() == 22957 or player:getID() == 36815 or player:getID() == 34292 or player:getID() == 36968 or player:getID() ==  33306 or player:getID() == 32471 or player:getID() == 32240 or player:getID() == 34674 or player:getID() == 21932  or player:getID() == 33574 or player:getID() == 32021 or player:getID() == 22318 or player:getID() == 33633 or player:getID() == 32526 or player:getID() == 25840 or player:getID() == 32376 or player:getID() == 33651 or player:getID() == 22052 or player:getID() == 29201 or player:getID() == 22254 or player:getID() == 22095 or player:getID() == 32414 or player:getID() == 26022 or player:getID() == 32565 or player:getID() == 36968 or player:getID() == 44084 or player:getID() == 38395 or player:getID() == 42107 or player:getID() == 41206 or player:getID() == 41444 or wsexenterator == 1 or wspack == 1) then		
	
    local params = {};
	params.numHits = 5;
	params.ftp100 = 1.1875; params.ftp200 = 1.1875; params.ftp300 = 1.1875;
	params.str_wsc = 0.0; params.dex_wsc = 0.4; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.4;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.8; params.acc200= 0.9; params.acc300= 1;
	params.atkmulti = 1;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.dex_wsc = 0.4;
	end

	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);

	             scoreCheck(player, wsID, damage, target); return tpHits, extraHits, criticalHit, damage;
    
    	else
	player:PrintToPlayer("This Donation Weapon skill will miss 100% unless you donate for it (Dancing Edge copy)");
	             scoreCheck(player, wsID, damage, target); return 0,0,0,0;
	end			
	

end;
