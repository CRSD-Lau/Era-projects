-----------------------------------
-- Area: Rakaznar_Inner_Court
-- MOB: Draftdance Fluturini
-- POS: @pos -345 -501 92 276
-- MOB ID: 17907714
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(MOD_BINDRES,100);
	mob:addMod(MOD_SLEEPRES,100);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)


	if (GetMobAction(17907715) == 0) and mob:getLocalVar("flutterboom") == 0 then
        mob:useMobAbility(731); -- Mijin_Gakure
		mob:setLocalVar("flutterboom", 1);
	elseif (GetMobAction(17907715) == 0) and mob:getAnimation(0) and mob:getLocalVar("flutterboom") == 1 then
        mob:useMobAbility(731); -- Mijin_Gakure
		mob:setLocalVar("flutterboom", 2);
	elseif (GetMobAction(17907715) == 0)  and mob:getLocalVar("flutterboom") == 2 then
        mob:useMobAbility(731); -- Mijin_Gakure
		mob:setLocalVar("flutterboom", 3);
	elseif (GetMobAction(17907715) == 0)  and mob:getLocalVar("flutterboom") == 3 then
        mob:useMobAbility(731); -- Mijin_Gakure
		mob:setLocalVar("flutterboom", 4);
	elseif mob:getLocalVar("flutterboom") == 4 then
		mob:setHP(0);
		mob:setLocalVar("flutterboom",0);
	end

end;	
	
-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    mob:setMod(MOD_REGAIN, 25);
end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)
    mob:setMod(MOD_REGAIN,0);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob,target)
			mob:setLocalVar("flutterboom", 0);
end;