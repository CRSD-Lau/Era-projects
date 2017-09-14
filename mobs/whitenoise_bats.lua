---------------------------------------------------
-- Area: Inner Ra'kaznar Court
-- Mob: Whitenoise Bats
-- custom THF NM
-- Pos: @pos -200 -500 320 276
-- MobID: 17907757
---------------------------------------------------

require("scripts/globals/settings"); 
require("scripts/globals/status"); -- needed so we can access effects and mods by name instead of number
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic"); -- needed so we can access the resist function

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
	mob:setMobMod(MOBMOD_ADD_EFFECT,1); -- can't do add effects without this
	mob:setMobMod(MOD_REGAIN, 200); -- 200/3000tp tick regain
	mob:setMobMod(MOD_EVASION,50); -- base evasion is from mob family table, this will directly add to it
	mob:setMobMod(MOBMOD_HP_STANDBACK,-1); -- no standback
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
local shield = math.random(1,5)
    -- spawn with a random shield (physical,ranged, or magic) and sometimes a combination of two of the shields
    if (shield == 1) then
        mob:addStatusEffect(EFFECT_PHYSICAL_SHIELD,1,0,duration);
        mob:getStatusEffect(EFFECT_PHYSICAL_SHIELD):setFlag(32); -- Makes effect unable to be dispelled
    elseif (shield == 2) then
        mob:addStatusEffect(EFFECT_ARROW_SHIELD,1,0,duration);
        mob:getStatusEffect(EFFECT_ARROW_SHIELD):setFlag(32); -- Makes effect unable to be dispelled
    elseif (shield == 3) then
        mob:addStatusEffect(EFFECT_MAGIC_SHIELD,1,0,duration);
        mob:getStatusEffect(EFFECT_MAGIC_SHIELD):setFlag(32); -- Makes effect unable to be dispelled
    elseif (shield == 4) then
        mob:addStatusEffect(EFFECT_ARROW_SHIELD,1,0,duration);
        mob:addStatusEffect(EFFECT_MAGIC_SHIELD,1,0,duration);
        mob:getStatusEffect(EFFECT_ARROW_SHIELD):setFlag(32); -- Makes effect unable to be dispelled
        mob:getStatusEffect(EFFECT_MAGIC_SHIELD):setFlag(32); -- Makes effect unable to be dispelled
    elseif (shield == 5) then
        mob:addStatusEffect(EFFECT_ARROW_SHIELD,1,0,duration);
        mob:addStatusEffect(EFFECT_PHYSICAL_SHIELD,1,0,duration);
        mob:getStatusEffect(EFFECT_ARROW_SHIELD):setFlag(32); -- Makes effect unable to be dispelled
        mob:getStatusEffect(EFFECT_PHYSICAL_SHIELD):setFlag(32); -- Makes effect unable to be dispelled
    end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
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
end;


-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob,target,player,damage)
local chance = 50;
local effect = math.random(6,11)
-- apply a random status effect from thf bolts (resets enmity so it can apply it to the next player if the player already has the status effect)
	if (effect == 6) then
		if (player:hasStatusEffect(EFFECT_BLIND) == true) then
			mob:resetEnmity(target);
		else
			local resistBLIND = applyResistanceAddEffect(mob,player,ELE_DARK,0);
			if (math.random(0,99) >= chance or resistBLIND <= 0.5) then
				return 0,0,0;
			else
				local duration = 5 * resistBLIND;
				if (player:hasStatusEffect(EFFECT_BLIND) == false) then
					player:addStatusEffect(EFFECT_BLIND, 10, 0, duration);
				end
				return SUBEFFECT_BLIND, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_BLIND;
			end	
		end
	elseif (effect == 7) then
		if (player:hasStatusEffect(EFFECT_SLEEP_I) == true) then
			mob:resetEnmity(target);
		else
			local resistSLEEP = applyResistanceAddEffect(mob,player,ELE_DARK,0);
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
	elseif (effect == 8) then
		if (player:hasStatusEffect(EFFECT_SILENCE)) then
			mob:resetEnmity(target);
		else
			local resistSILENCE = applyResistanceAddEffect(mob,player,ELE_DARK,0);
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
	elseif (effect == 9) then
		if (player:hasStatusEffect(EFFECT_HP_DRAIN) == true) then
			mob:resetEnmity(target);
		else
			if (math.random(0,99) >= chance) then
				return 0,0,0;
			else
				local diff = mob:getStat(MOD_INT) - target:getStat(MOD_INT);
				if (diff > 20) then
					diff = 20 + (diff - 20) / 2;
				end
				local drain = diff + (mob:getMainLvl() - target:getMainLvl()) + damage/2;
				local params = {};
				params.bonusmab = 0;
				params.includemab = false;
				drain = addBonusesAbility(mob, ELE_DARK, target, drain, params);
				drain = drain * applyResistanceAddEffect(mob,target,ELE_DARK,0);
				drain = adjustForTarget(target,drain,ELE_DARK);
				if (drain < 0) then
					drain = 0
				end
				drain = finalMagicNonSpellAdjustments(mob,target,ELE_DARK,drain);
				return SUBEFFECT_HP_DRAIN, MSGBASIC_ADD_EFFECT_HP_DRAIN,mob:addHP(drain);
			end
		end
	elseif (effect == 10) then
		if (player:hasStatusEffect(EFFECT_POISON) == true) then
			mob:resetEnmity(target);
		else
			local resistPOISON = applyResistanceAddEffect(mob,player,ELE_WATER,0);
			if (math.random(0,99) >= chance or resistPOISON <= 0.5) then
				return 0,0,0;
				end
			local duration = 5 * resistPOISON;
			if (player:hasStatusEffect(EFFECT_POISON) == false) then
				player:addStatusEffect(EFFECT_POISON, 4, 3, duration);
			end
			return SUBEFFECT_POISON, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_POISON;
		end 
	elseif (effect == 11) then
		if (player:hasStatusEffect(EFFECT_BLIND) == true) then
			mob:resetEnmity(target);
		else
			if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WIND,0) <= 0.5) then
			return 0,0,0;
			else
				target:delStatusEffect(EFFECT_DEFENSE_BOOST);
				target:addStatusEffect(EFFECT_DEFENSE_DOWN, 1, 0, 60);
				return SUBEFFECT_DEFENSE_DOWN, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_DEFENSE_DOWN;
			end
		end
	end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    -- mob will lose effects on death automatic, no need to delete them
end;