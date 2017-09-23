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
	    if (player:hasKeyItem(2988) == false) then
	        player:addKeyItem(2988);
		    player:tradeComplete(trade);
		    player:messageSpecial(KEYITEM_OBTAINED,2988);-- pop item
		else player:PrintToPlayer("You already have a pop item in your possession");
		end
	elseif (trade:getGil() == 1000) then
	    if (player:getAnimation() == 44) then
		player:PrintToPlayer('You cannot do that while crafting. Cheater.');
		return;
		end
		player:tradeComplete(trade);
	    player:setPos(749,120,19,0,276);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:PrintToPlayer("Welcome to your ERA Custom Mythic Weaponskills Quest!");
	player:PrintToPlayer("Trade 1000 Gil to be warped to Zone");
	player:PrintToPlayer("Trade 500000 Gil to recieve Key Item to partake in the event!");
	if (player:hasKeyItem(1918) == false) then
	    player:addKeyItem(1918); --map
		player:messageSpecial(KEYITEM_OBTAINED,1918);
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

