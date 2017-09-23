-----------------------------------	
-- Requiescat
-- Sword weapon skill	
-- Skill level: MERIT
-- Delivers a five-hit attack. Attack power varies with TP.	
-- Element: None	
-- Modifiers: MND:100%	
-- 100%TP    200%TP    300%TP	
-- 		ALL 1.0
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)	

local wspack = player:getVar("wspack")
local wsrequiescat = player:getVar("wsrequiescat")
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

	if (player:getID() == 46387 or player:getID() == 46668 or player:getID() == 40557 or player:getID() == 42107 or player:getID() == 36815 or player:getID() == 21836 or player:getID() == 41648 or player:getID() == 22199 or player:getID() == 40386 or player:getID() == 41223 or player:getID() == 31964 or player:getID() == 41199 or player:getID() == 43253 or player:getID() == 32196 or player:getID() == 36923 or player:getID() == 22221 or player:getID() == 41104 or player:getID() == 39328 or player:getID() == 43200 or player:getID() == 42420 or player:getID() == 42550 or player:getID() == 39457 or player:getID() == 24528 or player:getID() == 42060 or player:getID() == 41319 or player:getID() == 30142 or player:getID() == 41077 or player:getID() == 41421 or player:getID() == 36404 or player:getID() == 41839 or player:getID() == 40635 or player:getID() == 22721 or player:getID() == 41289 or player:getID() == 41322 or player:getID() == 22620 or player:getID() == 28035 or player:getID() == 38513 or player:getID() == 40926 or player:getID() == 35346 or player:getID() == 32021 or player:getID() == 38832 or player:getID() == 40121 or player:getID() == 38849 or player:getID() == 40122 or player:getID() == 36053 or player:getID() == 32910 or player:getID() == 24704 or player:getID() == 39785 or player:getID() == 38956 or player:getID() == 40261 or player:getID() == 38621 or player:getID() == 35814 or player:getID() == 38940 or player:getID() == 37360 or player:getID() == 35124 or player:getID() == 37113 or player:getID() == 21912 or player:getID() == 40340 or player:getID() == 29635 or player:getID() == 40448 or player:getID() == 38342 or player:getID() == 38213 or player:getID() == 38068 or player:getID() == 40012 or player:getID() == 39118 or player:getID() == 38662 or player:getID() == 38665 or player:getID() == 21852 or player:getID() == 22957 or player:getID() == 32277 or player:getID() == 36963 or player:getID() == 35046 or player:getID() == 37298 or player:getID() == 34292 or player:getID() == 34860 or player:getID() == 33306 or player:getID() == 28528 or player:getID() == 26022 or player:getID() == 32471 or player:getID() == 32240 or player:getID() == 28120 or player:getID() == 22318 or player:getID() == 33633 or player:getID() == 32526 or player:getID() == 32801 or player:getID() == 29201 or player:getID() == 21835 or player:getID() == 22199 or player:getID() == 21973 or player:getID() == 25328 or player:getID() == 32414 or player:getID() == 31829 or player:getID() == 22095 or player:getID() == 36968 or player:getID() == 42107 or player:getID() == 41206 or player:getID() == 41444 or player:getID() == 32604 or wsrequiescat == 1 or wspack == 1) then
	
	local params = {};
	params.numHits = 4;
	params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
	params.str_wsc = 0.6; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.1; params.crit200 = 0.3; params.crit300 = 0.5;
	params.canCrit = true;
	params.acc100 = 0.0; params.acc200 = 0.0; params.acc300 = 0.0;
	params.atkmulti = 1;
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
	
           scoreCheck(player, wsID, damage, target); return tpHits, extraHits, criticalHit, damage;
	else
	player:PrintToPlayer("This Donation Weapon skill will miss 100% unless you donate for it (Vorpal Blade copy)");
	             scoreCheck(player, wsID, damage, target); return 0,0,0,0;
	end		
end





