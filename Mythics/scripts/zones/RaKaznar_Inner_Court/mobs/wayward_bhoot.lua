-----------------------------------
-- Area: Rakaznar_Inner_Court
-- MOB: Wayward Bhoot
-- POS: !pos -199 -450 -214 276
-- MOB ID: 17907733
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/settings"); 
require("scripts/globals/monstertpmoves");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob,target)
    if (GetMobAction(17907735)==0) then
        SpawnMob(17907735, 300);
	end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    if (GetMobAction(17907735) == 0) then
        GetMobByID(17907735):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
        SpawnMob(17907735, 300):updateEnmity(target);
	end;
	local hpp = mob:getHPP();
	
	if (hpp < 80 and mob:getLocalVar("Breath") == 0) then
       	mob:setLocalVar("Breath", 1);
		mob:useMobAbility(1709); -- abasive tranara
	elseif (hpp < 50 and mob:getLocalVar("Breath") == 1) then
       	mob:setLocalVar("Breath", 2);
		mob:useMobAbility(1836); -- Nerve gas
        mob:resetEnmity(target);
	elseif (hpp < 30 and mob:getLocalVar("Breath") == 2) then
       	mob:setLocalVar("Breath", 3);
		mob:useMobAbility(1356); -- voiceless stream
        mob:resetEnmity(target);
	elseif (hpp < 10 and mob:getLocalVar("Breath") == 3) then
       	mob:setLocalVar("Breath", 4);
		mob:useMobAbility(1283); -- inferno blast
        mob:resetEnmity(target);
	elseif (hpp == 100) then
	    mob:setLocalVar("Breath", 0);
	end
    if (mob:hasStatusEffect(EFFECT_ICE_SPIKES) == true) then
        mob:addStatusEffect(EFFECT_PHYSICAL_SHIELD,1,0,duration);
		mob:addStatusEffect(EFFECT_ARROW_SHIELD,1,0,duration);
		mob:setMod(MOD_REGEN, math.floor(mob:getMaxHP()/100));
	else mob:delStatusEffect(EFFECT_PHYSICAL_SHIELD);
		mob:delStatusEffect(EFFECT_ARROW_SHIELD);
		mob:setMod(MOD_REGEN, 0);
	end
	
	if mob:getStatusEffect(EFFECT_STUN) then
	    mob:delStatusEffect(EFFECT_STUN);
	    mob:useMobAbility(2198);
	elseif mob:getStatusEffect(EFFECT_SILENCE) then
	    mob:delStatusEffect(EFFECT_SILENCE);
	    mob:useMobAbility(1356);
	elseif mob:getStatusEffect(EFFECT_SLEEP_I) then
	    mob:delStatusEffect(EFFECT_SLEEP_I);
	    mob:useMobAbility(2195);
	elseif mob:getStatusEffect(EFFECT_SLEEP_II) then
	    mob:delStatusEffect(EFFECT_SLEEP_II);
	    mob:useMobAbility(2195);
	elseif mob:getStatusEffect(EFFECT_LULLABY) then
	    mob:delStatusEffect(EFFECT_LULLABY);
	    mob:useMobAbility(2195);
	end	
end;

----------------------------------------------
-- onMobWeaponSkill 
----------------------------------------------

function onMobWeaponSkill(target, mob, skill)
	local shield = math.random(1,5)
	local battletarget = mob:getTarget();
	local t = battletarget:getPos();
	local angle = math.random() * math.pi
	local pos = NearLocation(t, 1.5, angle);
	
	t.rot = battletarget:getRotPos();
    mob:resetEnmity(target);
	mob:teleport(pos, battletarget);
	skill:setMsg(0);
	GetMobByID(17907735):updateEnmity(target);
end;
	
-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	GetMobByID(17907735):updateEnmity(target);
	mob:setMobMod(MOBMOD_RAGE, 3600); -- 1 hour 3600
	mob:addMod(MOBMOD_NO_STANDBACK, -1); 
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
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
