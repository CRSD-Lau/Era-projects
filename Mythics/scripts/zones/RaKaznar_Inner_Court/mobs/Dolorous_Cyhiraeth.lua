-----------------------------------
-- Area: Rakaznar_Inner_Court
-- MOB: Dolorous Cyhiraeth
-- POS: !pos -185 -450 -199 276
-- MOB ID: 17907735
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

function onMobSpawn(mob)
    mob:setUnkillable(true);
        SetDropRate(7001,18972,50); --mnk
	SetDropRate(7001,18974,50); --blm
	SetDropRate(7001,18977,50); --pld
	SetDropRate(7001,18978,50); --drk
	SetDropRate(7001,18980,50); --brd
	SetDropRate(7001,18984,50); --drg
	SetDropRate(7001,18986,50); --blu
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	local hpp = mob:getHPP();
	
	if (hpp < 75 and mob:getLocalVar("Breath") == 0) then
       	mob:setLocalVar("Breath", 1);
		mob:useMobAbility(984); -- electro charge
	elseif (hpp < 50 and mob:getLocalVar("Breath") == 1) then
       	mob:setLocalVar("Breath", 2);
		mob:useMobAbility(676); -- ice break
        mob:resetEnmity(target);
	elseif (hpp < 30 and mob:getLocalVar("Breath") == 2) then
       	mob:setLocalVar("Breath", 3);
		mob:useMobAbility(314); -- silence gas
        mob:resetEnmity(target);
	elseif (hpp < 10 and mob:getLocalVar("Breath") == 3) then
       	mob:setLocalVar("Breath", 4);
		mob:useMobAbility(1533); -- pile pitch
        mob:resetEnmity(target);
	elseif (hpp == 100) then
	    mob:setLocalVar("Breath", 0);
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
    if (mob:hasStatusEffect(EFFECT_BLAZE_SPIKES) == true) then
        mob:addStatusEffect(EFFECT_PHYSICAL_SHIELD,1,0,duration);
		mob:addStatusEffect(EFFECT_ARROW_SHIELD,1,0,duration);
		mob:setMod(MOD_REGEN, math.floor(mob:getMaxHP()/100));
	else mob:delStatusEffect(EFFECT_PHYSICAL_SHIELD);
		mob:delStatusEffect(EFFECT_ARROW_SHIELD);
		mob:setMod(MOD_REGEN, 0);
	end
	if (GetMobAction(17907733) == 0) then           
        mob:setUnkillable(false);
    end
end;

----------------------------------------------
-- onMobWeaponSkill 
----------------------------------------------

function onMobWeaponSkill(target, mob, skill)
 -- so mob can warp around hitting whoever hits the mob last
	mob:resetEnmity(target);
 -- Eald's (Apoc Nigh) warp ability without the animation(animation doesn't allow other mob skills)
	local battletarget = mob:getTarget();
	local t = battletarget:getPos();
	t.rot = battletarget:getRotPos();
	local angle = math.random() * math.pi
	local pos = NearLocation(t, 1.5, angle);
	mob:teleport(pos, battletarget);
	skill:setMsg(0);
	GetMobByID(17907733):updateEnmity(target);
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	GetMobByID(17907733):updateEnmity(target);
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
	mob:addMod(MOD_LULLABYRES,-100);
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
    mob:setUnkillable(true);
    mob:setMod(MOD_BINDRES,0);
	mob:setMod(MOD_SLEEPRES,0);
	mob:setMod(MOD_GRAVITYRES,0);
	mob:setMod(MOD_REFRESH,0);
	mob:setMod(MOD_REGEN,0);
	mob:setMod(MOD_AQUAVEIL_COUNT,0);
	mob:addMod(MOD_LULLABYRES,0);
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
