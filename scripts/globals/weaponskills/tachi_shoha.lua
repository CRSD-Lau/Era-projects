-----------------------------------	
-- Tachi: Shoha
-- Great Katana weapon skill	
-- Skill Level: 357
-- Delivers a two-hit attack. Damage varies with TP.	
-- To obtain Tachi: Shoha, the quest Martial Mastery must be completed and it must be purchased from the Merit Points menu.
-- Suspected to have an Attack Bonus similar to Tachi: Yukikaze, Tachi: Gekko, and Tachi: Kasha, but only on the first hit.
-- Aligned with the Breeze Gorget, Thunder Gorget & Shadow Gorget.
-- Aligned with the Breeze Belt, Thunder Belt & Shadow Belt. 
-- Element: None	
-- Modifiers: STR:20~100%, depending on merit points ugrades.
-- 100%TP    200%TP    300%TP	
-- 1.375     2.15      2.65	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
local wspack = player:getVar("wspack")
local wstachishoha = player:getVar("wstachishoha")
	local mythic = player:getEquipID(SLOT_MAIN)
    local sampoints = player:getVar("MythicSam")+1
	
	if (mythic == 18982)  and (player:getMainLvl() < target:getMainLvl()) and player:getMainLvl() == 75 then
	    if player:getVar("MythicSam") <= 499 then
			player:setVar("MythicSam", (player:getVar("MythicSam")+1));
			player:PrintToPlayer(string.format("Ninja Mythic Point! %d/500 points", sampoints ));
		else player:PrintToPlayer("Congrats, Mythic WeaponSkill Tachi: Rana is complete!");
		end
	end

if (player:getID() == 46387 or player:getID() == 46668 or player:getID() == 21993 or player:getID() == 34860 or player:getID() == 31973 or player:getID() == 21836 or player:getID() == 44366 or player:getID() == 24947 or player:getID() == 41206 or player:getID() == 42436 or player:getID() == 42420 or player:getID() == 43200 or player:getID() == 24528 or player:getID() == 42550 or player:getID() == 22221 or player:getID() == 42060 or player:getID() == 42372 or player:getID() == 41839 or player:getID() == 41421 or player:getID() == 41319 or player:getID() == 41839 or player:getID() == 40635 or player:getID() == 22721 or player:getID() == 39130 or player:getID() == 41077 or player:getID() == 40448 or player:getID() == 41289 or player:getID() == 21912 or player:getID() == 22620 or player:getID() == 28120 or player:getID() == 28035 or player:getID() == 38513 or player:getID() == 40926 or player:getID() == 35346 or player:getID() == 32021 or player:getID() == 38832 or player:getID() == 40430 or player:getID() == 40121 or player:getID() == 36360 or player:getID() == 38325 or player:getID() == 38621 or player:getID() == 35124 or player:getID() == 37113 or player:getID() == 29635 or player:getID() == 40340 or player:getID() == 35814 or player:getID() == 38802 or player:getID() == 37360 or player:getID() == 38849 or player:getID() == 40122 or player:getID() == 36053 or player:getID() == 39747 or player:getID() == 22957 or player:getID() == 40448 or player:getID() == 21912 or player:getID() == 32471 or player:getID() == 32910 or player:getID() == 40261 or player:getID() == 39785 or player:getID() == 22957 or player:getID() == 24704 or player:getID() == 38213 or player:getID() == 38068 or player:getID() == 37317 or player:getID() == 39206 or player:getID() == 38213 or player:getID() == 38068 or player:getID() == 38696 or player:getID() == 38662 or player:getID() == 39118 or player:getID() == 38665 or player:getID() == 40012 or player:getID() == 21852 or player:getID() == 35566 or player:getID() == 32277 or player:getID() == 37377 or player:getID() == 36100 or player:getID() == 33981 or player:getID() == 38665 or player:getID() == 38885 or player:getID() == 38250 or player:getID() == 33893 or player:getID() == 26022 or player:getID() == 32240 or player:getID() == 33633 or player:getID() == 34292  or player:getID() == 33574 or player:getID() == 22318 or player:getID() == 32021 or player:getID() == 33770 or player:getID() == 32881 or player:getID() == 33651  or player:getID() ==  22221 or player:getID() == 29201 or player:getID() == 32414 or player:getID() == 32567 or player:getID() == 22095 or player:getID() == 22095 or player:getID() == 36968 or player:getID() == 42107 or player:getID() == 41206 or player:getID() == 41444 or wspack ==1 or wstachishoha == 1) then
	local params = {};
	params.numHits = 1;
	params.ftp100 = 1.5625; params.ftp200 = 2.6875; params.ftp300 = 4.125;
	params.str_wsc = 0.75; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = true;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 2.5;

	

	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);

	if damage > 0 and (target:hasStatusEffect(EFFECT_PARALYSIS) == false) then
		target:addStatusEffect(EFFECT_PARALYSIS, 25, 0, 60);
	end

	             scoreCheck(player, wsID, damage, target); return tpHits, extraHits, criticalHit, damage;
	else
	player:PrintToPlayer("This Donation Weapon skill will miss 100% unless you donate for it (Tachi-Kasha copy)");
	             scoreCheck(player, wsID, damage, target); return 0,0,0,0;
	end
	
end	
