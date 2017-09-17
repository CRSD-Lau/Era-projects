-----------------------------------
-- Area: Rakaznar_Inner_Court
--  NPC: ??? (Spawn Pox Hound and Draftdance Fluturini)
-- !pos 179 -440 -140 276
-----------------------------------
package.loaded["scripts/zones/RaKaznar_Inner_Court/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/RaKaznar_Inner_Court/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if(player:hasKeyItem(LILAC_COLORED_SEAL) and GetMobAction(17907715) == 0) then
		
        SpawnMob(17907715):updateClaim(player); -- Pox Hound
		player:delKeyItem(LILAC_COLORED_SEAL) 
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;