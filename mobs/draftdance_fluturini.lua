-----------------------------------
-- Area: Rakaznar_Inner_Court
-- MOB: Draftdance Fluturini
-- POS: !pos -345 -501 92 276
-- MOB ID: !spawnmob 17907714
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- Constant Initializations
-----------------------------------

local Fluturini = 17907714;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setUnkillable(true);
--	mob:setLocalVar("FluturiniDespawnTime", os.time + 10);  -- 3600 1 hour
    SetDropRate(7001,18971,333); --war
	SetDropRate(7001,18982,333); --sam
	SetDropRate(7001,18969,333); --dnc
	SetDropRate(7001,18975,333); --rdm
	SetDropRate(7001,18973,333); --whm
	SetDropRate(7001,18970,333); --sch
	SetDropRate(7001,18979,333); --bst
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    local hpp = mob:getHPP();
	local useBlowup = false;
	local battletarget = mob:getTarget();
	local t = battletarget:getPos();
	t.rot = battletarget:getRotPos();
	local angle = math.random() * math.pi
	local pos = NearLocation(t, 1.5, angle);
--	local depopTime = mob:getLocalVar("FluturiniDespawnTime");
	
--	if (os.time(t) > depopTime) then
--	DespawnMob(Fluturini); 
--	end
	
	if (GetMobAction(17907715) == 0) then
        mob:setMod(MOD_REGEN, math.floor(mob:getMaxHP()/200));	-- if main mob is dead regen 1% / 2 ticks
	else mob:setMod(MOD_REGEN, math.floor(mob:getMaxHP()/-100)); -- if main mob is alive -1% hp / tick until it reaches set hp
		if (hpp < 47) then
			mob:setMod(MOD_REGEN, math.floor(mob:getMaxHP()/200));
		end
	end
	
    if (GetMobAction(17907715) == 0) then           
        mob:setUnkillable(false);
    end

	if (hpp < 75 and mob:getLocalVar("flutterboom") == 0) then
	    mob:resetEnmity(target);
		mob:delStatusEffect(EFFECT_SLEEP_I);
		mob:delStatusEffect(EFFECT_SLEEP_II);
		mob:delStatusEffect(EFFECT_LULLABY);
       	mob:setLocalVar("flutterboom", 1);
		mob:teleport(pos, battletarget);
		useBlowup = true;
	elseif (hpp < 50 and mob:getLocalVar("flutterboom") == 1) then
	    mob:resetEnmity(target);
		mob:delStatusEffect(EFFECT_SLEEP_I);
		mob:delStatusEffect(EFFECT_SLEEP_II);
		mob:delStatusEffect(EFFECT_LULLABY);
		mob:setLocalVar("flutterboom", 2);
		mob:teleport(pos, battletarget);
		useBlowup = true;
	elseif (hpp < 25  and mob:getLocalVar("flutterboom") == 2) then
	    mob:resetEnmity(target);
		mob:setLocalVar("flutterboom", 3);
		mob:teleport(pos, battletarget);
		useBlowup = true;
	elseif (hpp < 5  and mob:getLocalVar("flutterboom") == 3) then
	    mob:setLocalVar("flutterboom", 4);
	    mob:resetEnmity(target);
		mob:teleport(pos, battletarget);
		useBlowup = true;
	end
	
	if (useBlowup == true) then
        mob:useMobAbility(731); -- Mijin Gakure
	end
end;	
	
	
-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)
    mob:setUnkillable(true);
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