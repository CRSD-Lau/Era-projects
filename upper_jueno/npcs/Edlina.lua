-----------------------------------
-- Area: Upper Jeuno
-- NPC: Edlina
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:getGil() == 500000) then
	    player:addKeyItem(2988); -- pop item
	elseif (trade:getGil() == 2000) then
	    player:addKeyItem(1918); --map
	elseif (trade:getGil() == 1000) then
	    if (player:getAnimation() == 44) then
		player:PrintToPlayer('You cannot do that while crafting. Cheater.');
		return;
		end
	    player:setPos(749,120,19,0,276);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	PrintToPlayer("Your ERA Custom Mythic Weaponskills Quest!");
    PrintToPlayer("Trade me 1000 Gil for map of zone");
	PrintToPlayer("Trade me 2000 Gil to be warped to Zone");
	PrintToPlayer("Trade me 500000 Gil to recieve Key Item to partake in event!");
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

