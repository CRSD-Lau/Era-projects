-----------------------------------
-- Area: Rakaznar_Inner_Court
--  NPC: ??? (Spawn Whitenoise Bats)
-- !pos 811 89 60 276
-- ID 17908258
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

    if(player:hasKeyItem(DAWN_PHANTOM_GEM) and GetMobAction(17907757) == 0) then
		
        SpawnMob(17907757):updateClaim(player); -- Whitenoise Bats
		player:delKeyItem(DAWN_PHANTOM_GEM) 
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