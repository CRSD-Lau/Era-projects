-----------------------------------
-- Area: Rakaznar_Inner_Court
-- MOB: Pox Hound
-- POS: !pos -179 -440 -152 276
-- MOB ID: 17907715
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings"); 
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(MOD_BINDRES,20);
	mob:addMod(MOD_SLEEPRES,100);
	mob:addMod(MOD_MDEF,50);
	mob:addMod(MOD_TRIPLE_ATTACK,30);
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
    local hpp = mob:getHPP();
	local useBreath = false;
	
    if (GetMobAction(17907714) == 0) then
        GetMobByID(17907714):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
        SpawnMob(17907714, 300):updateEnmity(target);
	end;
	
	if (hpp < 80 and mob:getLocalVar("Breath") == 0) then
       	mob:setLocalVar("Breath", 1);
		useBreath = true;
        mob:resetEnmity(target);
	elseif (hpp < 55 and mob:getLocalVar("Breath") == 1) then
       	mob:setLocalVar("Breath", 2);
		useBreath = true;
        mob:resetEnmity(target);
	elseif (hpp < 30 and mob:getLocalVar("Breath") == 2) then
       	mob:setLocalVar("Breath", 3);
		useBreath = true;
        mob:resetEnmity(target);
	elseif (hpp < 10 and mob:getLocalVar("Breath") == 3) then
       	mob:setLocalVar("Breath", 4);
		useBreath = true;
        mob:resetEnmity(target);
	elseif (hpp == 100) then
	    mob:setLocalVar("Breath", 0);
	end
	
	if (useBreath == true) then
        mob:useMobAbility(269); -- Petribreath
	end
end;	

----------------------------------------------
-- onMobWeaponSkill 
----------------------------------------------

function onMobWeaponSkill(target, mob, skill)
	GetMobByID(17907714):updateEnmity(target);
end;
	
-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    mob:setMobMod(MOBMOD_RAGE, 3600); -- 1 hour 3600
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

function onMobDespawn(mob)
end;