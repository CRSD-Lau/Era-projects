-----------------------------------
-- Area: Rakaznar_Inner_Court
-- MOB: Wayward Bhoot
-- POS: @pos -340 -500 85 276
-- MOB ID: 17907733
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob,target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	
	if mob:getStatusEffect(EFFECT_STUN) then
	    mob:delStatusEffect(EFFECT_STUN);
		mob:setMobMod(MOBMOD_DRAW_IN, 2);
	    mob:useMobAbility(2198);
	elseif mob:getStatusEffect(EFFECT_SILENCE) then
	    mob:delStatusEffect(EFFECT_SILENCE);
		mob:setMobMod(MOBMOD_DRAW_IN, 2);
	    mob:useMobAbility(1356);
	elseif mob:getStatusEffect(EFFECT_SLEEP_I) then
	    mob:delStatusEffect(EFFECT_SLEEP_I);
		mob:setMobMod(MOBMOD_DRAW_IN, 2);
	    mob:useMobAbility(2195);
	elseif mob:getStatusEffect(EFFECT_SLEEP_II) then
	    mob:delStatusEffect(EFFECT_SLEEP_II);
		mob:setMobMod(MOBMOD_DRAW_IN, 2);
	    mob:useMobAbility(2195);
	elseif mob:getStatusEffect(EFFECT_LULLABY) then
	    mob:delStatusEffect(EFFECT_LULLABY);
		mob:setMobMod(MOBMOD_DRAW_IN, 2);
	    mob:useMobAbility(2195);
	end	
end;

------------------------------------
-- onCheckForDrawnIn
------------------------------------

function CheckForDrawnIn(centerX,centerY,centerZ,playerX,playerY,playerZ,Rayon,maxRayon)
    local PX = target:getXPos();
    local PY = target:getYPos();
    local PZ = target:getZPos();
    local MX = mob:getXPos();
    local MY = mob:getYPos();
    local MZ = mob:getZPos();
    local distanceMin = 10;
    local distanceMax = 25;
    local difX = playerX-centerX;
    local difY = playerY-centerY;
    local difZ = playerZ-centerZ;
    local Distance = math.sqrt( math.pow(difX,2) + math.pow(difY,2) + math.pow(difZ,2) );
 
--   print(Distance);
    if (Distance > Rayon and Distance < maxRayon) then
        return true;
    else
        return false;
    end
	if (CheckForDrawnIn(MX,MY,MZ,PX,PY,PZ,distanceMin,distanceMax) == true) then
        target:setPos(mob:getXPos(),mob:getYPos(),mob:getZPos());
    end
end;

-----------------------------------
-- onMobDrawIn
-----------------------------------

function onMobDrawIn(mob, target)
    mob:addTP(3000); -- Uses a mobskill upon drawing in a player. Not necessarily on the person drawn in.
end;

	
-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	GetMobByID(17907735):updateEnmity(target);
    mob:addMod(MOD_AQUAVEIL_COUNT,20);
	mob:addMod(MOD_BINDRES,20);
	mob:addMod(MOD_SLEEPRES,-100);
	mob:addMod(MOD_GRAVITYRES,30);
	mob:addMod(MOD_REFRESH,300);
	mob:addMod(MOD_REGEN,5);
	mob:addMod(MOD_SILENCERES,-100);
	mob:addMod(MOD_STUNRES,-100);
	
end;

-----------------------------------
-- onSpellCast
-----------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    mob:setMod(MOD_AQUAVEIL_COUNT,20);
end;
	
-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)
    mob:setMod(MOD_BINDRES,0);
	mob:setMod(MOD_SLEEPRES,0);
	mob:setMod(MOD_GRAVITYRES,0);
	mob:setMod(MOD_REFRESH,0);
	mob:setMod(MOD_REGEN,0);
	mob:setMod(MOD_AQUAVEIL_COUNT,0);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
--	 if (GetMobAction(17907735) == 0) then 
--        SetDropRate(dropid,itemid,droprate);
--        SetDropRate(dropid,itemid,droprate);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
     UpdateNMSpawnPoint(mob:getID());
end;