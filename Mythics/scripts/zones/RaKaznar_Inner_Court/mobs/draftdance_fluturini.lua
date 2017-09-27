-----------------------------------
-- Area: Rakaznar_Inner_Court
-- MOB: Draftdance Fluturini
-- POS: !pos -168 -440 -140 276
-- MOB ID: !spawnmob 17907714
-----------------------------------

require("scripts/globals/settings"); 
require("scripts/globals/status"); -- needed so we can access effects and mods by name instead of number
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic"); -- needed so we can access the resist function

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
        SetDropRate(7001,18971,50); --war
	SetDropRate(7001,18982,50); --sam
	SetDropRate(7001,18969,50); --dnc
	SetDropRate(7001,18975,50); --rdm
	SetDropRate(7001,18973,50); --whm
	SetDropRate(7001,18970,50); --sch
	SetDropRate(7001,18979,50); --bst
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
	
	if (GetMobAction(17907715) == 0) then
        mob:setMod(MOD_REGEN, math.floor(mob:getMaxHP()/200));	-- if main mob is dead regen 1% / 2 ticks
	else mob:setMod(MOD_REGEN, math.floor(mob:getMaxHP()/-100)); -- if main mob is alive -1% hp / tick until it reaches set hp
		if (hpp < 47) then
			mob:setMod(MOD_REGEN, math.floor(mob:getMaxHP()/50));
		end
	end
	
	if (hpp < 26) and ((GetMobAction(17907715) == 0) == false) then
		mob:addHP(mob:getMaxHP() * .75);
		mob:setLocalVar("flutterboom", 0);
	end
	if (hpp < 50) then
	    mob:addMod(MOD_SLEEPRES,100);
		mob:addMod(MOD_LULLABYRES,100);
		mob:addMod(MOD_TRIPLE_ATTACK,30);
		mob:addMod(MOD_ACC,30);
		mob:addMod(MOD_MDEF,100);
		if (mob:hasStatusEffect(EFFECT_BIND) == true) then
		    mob:delStatusEffect(EFFECT_BIND);
			mob:resetEnmity(target);
		end
	end
	
	if (hpp < 25) then
    	mob:addStatusEffect(EFFECT_ARROW_SHIELD,1,0,duration);
	else mob:delStatusEffect(EFFECT_ARROW_SHIELD);
	end
	
    if (GetMobAction(17907715) == 0) then           
        mob:setUnkillable(false);
    end

	if (hpp < 75 and mob:getLocalVar("flutterboom") == 0) then
	    mob:resetEnmity(target);
		mob:delStatusEffect(EFFECT_SLEEP_I);
		mob:delStatusEffect(EFFECT_SLEEP_II);
		mob:delStatusEffect(EFFECT_LULLABY);
		GetMobByID(17907715):updateEnmity(target);
       	mob:setLocalVar("flutterboom", 1);
		mob:teleport(pos, battletarget);
		useBlowup = true;
	elseif (hpp < 50 and mob:getLocalVar("flutterboom") == 1) then
	    mob:resetEnmity(target);
		mob:delStatusEffect(EFFECT_SLEEP_I);
		mob:delStatusEffect(EFFECT_SLEEP_II);
		mob:delStatusEffect(EFFECT_LULLABY);
		GetMobByID(17907715):updateEnmity(target);
		mob:setLocalVar("flutterboom", 2);
		mob:teleport(pos, battletarget);
		useBlowup = true;
	elseif (hpp < 25  and mob:getLocalVar("flutterboom") == 2) then
	    mob:resetEnmity(target);
		GetMobByID(17907715):updateEnmity(target);
		mob:setLocalVar("flutterboom", 3);
		mob:teleport(pos, battletarget);
		useBlowup = true;
	elseif (hpp < 5  and mob:getLocalVar("flutterboom") == 3) then
	    mob:setLocalVar("flutterboom", 4);
	    mob:resetEnmity(target);
		GetMobByID(17907715):updateEnmity(target);
		mob:teleport(pos, battletarget);
		useBlowup = true;
	elseif (hpp == 100) then
	    mob:setLocalVar("flutterboom", 0);
	end
	
	if (useBlowup == true) then
        mob:useMobAbility(731); -- Mijin Gakure
	end
end;	

----------------------------------------------
-- onMobWeaponSkill 
----------------------------------------------

function onMobWeaponSkill(target, mob, skill)
	GetMobByID(17907715):updateEnmity(target);
end;
	
	
-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    mob:setMobMod(MOBMOD_RAGE, 3600); -- 1 hour 3600
    mob:setMobMod(MOBMOD_ADD_EFFECT,1);
	mob:addMod(MOD_ACC, 50);
	mob:addMod(MOD_GRAVITYRES, 100);
end;

-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob,player)
local chance = 40;
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
end;
