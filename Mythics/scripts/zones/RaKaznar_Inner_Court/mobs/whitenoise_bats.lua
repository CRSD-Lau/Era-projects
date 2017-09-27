---------------------------------------------------
-- Area: Inner Ra'kaznar Court
-- Mob: Whitenoise Bats
-- custom THF NM
-- Pos: !pos 811 90 68 276
-- groupid 5443, groupid, 14205, famid 394
-- MobID: !spawnmob 17907757
---------------------------------------------------

require("scripts/globals/settings"); 
require("scripts/globals/status"); -- needed so we can access effects and mods by name instead of number
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic"); -- needed so we can access the resist function

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    mob:setMobMod(MOBMOD_RAGE, 3600); -- 1 hour 3600
	mob:setMobMod(MOBMOD_ADD_EFFECT,1); -- can't do add effects without this
	mob:setMobMod(MOBMOD_HP_STANDBACK,-1); -- no standback
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    SetDropRate(7001,18976,50); --tfh
	SetDropRate(7001,18983,50); --nin
	SetDropRate(7001,18981,50); --rng
	SetDropRate(7001,18988,50); --pup
	SetDropRate(7001,18987,50); --cor
	SetDropRate(7001,18985,50); --smn
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    local hpp = mob:getHPP();
	
	if (hpp < 80 and mob:getLocalVar("Breath") == 0) then
       	mob:setLocalVar("Breath", 1);
		mob:useMobAbility(349); -- Bad Breath
	elseif (hpp < 55 and mob:getLocalVar("Breath") == 1) then
       	mob:setLocalVar("Breath", 2);
		mob:useMobAbility(800); -- heat breath
        mob:resetEnmity(target);
	elseif (hpp < 30 and mob:getLocalVar("Breath") == 2) then
       	mob:setLocalVar("Breath", 3);
		mob:useMobAbility(557); -- Level 5 Petrify
        mob:resetEnmity(target);
	elseif (hpp < 10 and mob:getLocalVar("Breath") == 3) then
       	mob:setLocalVar("Breath", 4);
		mob:useMobAbility(2028); -- Fulmination
        mob:resetEnmity(target);
	elseif (hpp == 100) then
	    mob:setLocalVar("Breath", 0);
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
	
    if (shield == 1) then
		mob:delStatusEffect(EFFECT_ARROW_SHIELD);
		mob:delStatusEffect(EFFECT_MAGIC_SHIELD);
        mob:addStatusEffect(EFFECT_PHYSICAL_SHIELD,1,0,duration);
--      mob:resetEnmity(target);
--		mob:teleport(pos, battletarget);
--		skill:setMsg(0);
    elseif (shield == 2) then
		mob:delStatusEffect(EFFECT_PHYSICAL_SHIELD);
		mob:delStatusEffect(EFFECT_MAGIC_SHIELD);
        mob:addStatusEffect(EFFECT_ARROW_SHIELD,1,0,duration);
--		mob:resetEnmity(target);
--		mob:teleport(pos, battletarget);
--		skill:setMsg(0);
    elseif (shield == 3) then
		mob:delStatusEffect(EFFECT_PHYSICAL_SHIELD);
		mob:delStatusEffect(EFFECT_ARROW_SHIELD);
        mob:addStatusEffect(EFFECT_MAGIC_SHIELD,1,0,duration);
--		mob:resetEnmity(target);
--		mob:teleport(pos, battletarget);
--		skill:setMsg(0);
	elseif (shield == 4) then
		mob:delStatusEffect(EFFECT_PHYSICAL_SHIELD);
        mob:addStatusEffect(EFFECT_MAGIC_SHIELD,1,0,duration);
		mob:addStatusEffect(EFFECT_ARROW_SHIELD,1,0,duration);
--		mob:resetEnmity(target);
--		mob:teleport(pos, battletarget);
--		skill:setMsg(0);
	elseif (shield == 5) then
		mob:delStatusEffect(EFFECT_MAGIC_SHIELD);
        mob:addStatusEffect(EFFECT_PHYSICAL_SHIELD,1,0,duration);
		mob:addStatusEffect(EFFECT_ARROW_SHIELD,1,0,duration);
--		mob:resetEnmity(target);
--		mob:teleport(pos, battletarget);
--		skill:setMsg(0);
	end
end;


-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob,player)
local chance = 20;
local effect = math.random(1,5)
-- apply a random status effect from thf bolts (resets enmity so it can apply it to the next player if the player already has the status effect)
	if (effect == 1) then
		if player:hasStatusEffect(EFFECT_PLAGUE) then
			mob:resetEnmity(target);
		else
			local resistPlague = applyResistanceAddEffect(mob,player,ELE_WATER,EFFECT_PLAGUE);
			if (math.random(0,99) >= chance or resistPlague <= 0.5) then
				return 0,0,0;
			else
				local duration = 5 * resistPlague;
				if (not player:hasStatusEffect(EFFECT_PLAGUE)) then
					player:addStatusEffect(EFFECT_PLAGUE, 1, 0, duration);
				end
				return SUBEFFECT_PLAGUE, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_PLAGUE;
			end	
		end
	end

	if (effect == 2) then
		if player:hasStatusEffect(EFFECT_SLEEP_I) then
			mob:resetEnmity(target);
		else
			local resistSLEEP = applyResistanceAddEffect(mob,player,ELE_DARK,EFFECT_SLEEP_I);
			if (math.random(0,99) >= chance or resistSLEEP <= 0.5) then
				return 0,0,0;
			else
			local duration = 5 * resistSLEEP;
				if (player:hasStatusEffect(EFFECT_SLEEP_I) == false) then
					player:addStatusEffect(EFFECT_SLEEP_I, 1, 0, duration);
				end
				return SUBEFFECT_SLEEP_I, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_SLEEP_I;
			end
		end
	end

	if (effect == 3) then
		if (player:hasStatusEffect(EFFECT_SILENCE)) then
			mob:resetEnmity(target);
		else
			local resistSILENCE = applyResistanceAddEffect(mob,player,ELE_WIND,EFFECT_SILENCE);
			if (math.random(0,99) >= chance or resistSILENCE <= 0.5) then
				return 0,0,0;
			else
			local duration = 5 * resistSILENCE;
			if (player:hasStatusEffect(EFFECT_SILENCE) == false) then
				player:addStatusEffect(EFFECT_SILENCE, 1, 0, duration);
			end
			return SUBEFFECT_SILENCE, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_SILENCE;
			end
		end
	end
	
	if (effect == 4) then
		if player:hasStatusEffect(EFFECT_POISON) then
			mob:resetEnmity(target);
		else
			local resistPOISON = applyResistanceAddEffect(mob,player,ELE_WATER,EFFECT_POISON);
			if (math.random(0,99) >= chance or resistPOISON <= 0.5) then
				return 0,0,0;
				end
			local duration = 5 * resistPOISON;
			if (player:hasStatusEffect(EFFECT_POISON) == false) then
				player:addStatusEffect(EFFECT_POISON, 4, 3, duration);
			end
			return SUBEFFECT_POISON, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_POISON;
		end
	end
	
	if (effect == 5) then
		if player:hasStatusEffect(EFFECT_BLIND) then
			mob:resetEnmity(target);
		else
			local resistSTUN = applyResistanceAddEffect(mob,player,ELE_LIGHTNING,EFFECT_STUN);
			if (math.random(0,99) >= chance or resistSTUN <= 0.5) then
				return 0,0,0;
				end
			local duration = 5 * resistSTUN;
			if (player:hasStatusEffect(EFFECT_STUN) == false) then
				player:addStatusEffect(EFFECT_STUN, 1, 0, duration);
			end
			return SUBEFFECT_STUN, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_STUN;
		end
	end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
