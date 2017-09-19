-----------------------------------
-- Area: Rakaznar_Inner_Court
-- MOB: Draftdance Fluturini
-- POS: !pos -168 -440 -140 276
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
    SetDropRate(7001,18971,250); --war
	SetDropRate(7001,18982,250); --sam
	SetDropRate(7001,18969,250); --dnc
	SetDropRate(7001,18975,250); --rdm
	SetDropRate(7001,18973,250); --whm
	SetDropRate(7001,18970,250); --sch
	SetDropRate(7001,18979,250); --bst
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
	--	if (hpp < 47) then
	--		mob:setMod(MOD_REGEN, math.floor(mob:getMaxHP()/50));
	--	end
	end
	
	if (hpp < 26) and ((GetMobAction(17907715) == 0) == false) then
		mob:addHP(mob:getMaxHP() * .75);
		mob:setLocalVar("flutterboom", 0);
	end
	if (hpp < 50) then
	    mob:addMod(MOD_SLEEPRES,100);
		mob:addMod(MOD_LULLABYRES,100);
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