-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

   sets.obi = {Fire = {waist="Hachirin-no-Obi"},
      Earth = {waist="Hachirin-no-Obi"},
      Water = {waist="Hachirin-no-Obi"},
      Wind = {waist="Hachirin-no-Obi"},
      Ice = {main="Aquilo's Staff",waist="Hachirin-no-Obi"},
      Lightning = {waist="Hachirin-no-Obi"},
      Light = {waist="Hachirin-no-Obi"},
      Dark = {waist="Hachirin-no-Obi"}}
   
    
   sets.grips = {
      Fire = {sub="Fire Grip"},
      Earth = {sub="Earth Grip"},
      Water = {sub="Water Grip"},
      Wind = {sub="Wind Grip"},
      Ice = {sub="Ice Grip"},
      Lightning = {sub="Thunder Grip"},
      Light = {sub="Light Grip"},
      Dark = {sub="Dark Grip"}}	
	  
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Saboteur = buffactive.saboteur or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Melee')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')

    gear.default.obi_waist = "Sekhmet Corset"
    
    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {body="Vitivation Tabard"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Atrophy Chapeau +1",
        body="Errant Houppelande",hands="Yaoyotl Gloves",
        back="Prism Cape",legs="Mahatma Slops",feet="Hagondes Sabots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    -- 80% Fast Cast (including trait) for all spells, plus 5% quick cast
    -- No other FC sets necessary.
    sets.precast.FC = {sub="Vivid Strap +1",
        head="Warlock's Chapeau +1",ear2="Loquacious Earring",
        body="Duelist's Tabard +1"}

    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Scorpion Harness",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Headlong Belt",legs="Duelist's Tights +1",feet="Crimson Greaves"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, 
        {neck="Soil Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        ring1="Aquasoul Ring",ring2="Aquasoul Ring",waist="Soil Belt"})

    sets.precast.WS['Sanguine Blade'] = {ammo="Witchstone",
        head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Acumen Ring",
        back="Toro Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}

    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {sub="Vivid Strap +1",
        head="Warlock's Chapeau +1",ear2="Loquacious Earring",
        body="Duelist's Tabard +1",hands="Dusk Gloves",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Headlong Belt",legs="Hagondes Pants",feet="Dusk Ledelsens"}

    sets.midcast.Cure = {main="Chatoyant Staff",
        head="Duelist's Chapeau +1",neck="Colossus's Torque",ear1="Magnetic Earring",ear2="Loquacious Earring",
        body="Duelist's Tabard +1",hands="Bokwus Gloves",ring1="Tamas Ring",ring2="Sirona's Ring",
        back="Prism Cape",waist="Witful Belt",legs="Warlock's Tights +1 +1 +1",feet="Errant Pigaches"}
        
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = {ring1="Kunaji Ring",ring2="Asklepian Ring"}

    sets.midcast['Enhancing Magic'] = {main="Kirin's Pole",
        head="Duelist Chapeau +1",neck="Colossus's Torque",
        body="Errant Houppelande",hands="Duelist's Gloves +1",ring1="Tamas Ring",
        back="Prism Cape",waist="Penitent's Rope",legs="Warlock's Tights +1",feet="Duelist's Boots +1"}

    sets.midcast.Refresh = {legs="Duelist's Chapeau +1", body="Dalmatica"}

    sets.midcast.Stoneskin = {waist="Siegel Sash", main="Kirin's Pole"}
    
    sets.midcast['Enfeebling Magic'] = {main="Chatoyant Staff",ammo="Kalboron Stone",
        head="Duelist's Chapeau +1",neck="Mohbwa Scarf +1",ear1="Magnetic Earring",ear2="Loquacious Earring",
        body="Warlock's Tabard +1",hands="Yaoyotl Gloves",ring1="Tamas Ring",ring2="Snow Ring",
        back="Prism Cape",waist="Penitent's Rope",legs="Errant Slops",feet="Avacat Pigaches"}

    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})

    sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})
    
    sets.midcast['Elemental Magic'] = {main="Chatoyant Staff",sub="Zuuxowu Grip",ammo="Phantom Tathlum",
        head="Warlock's Chapeau +1",neck="Elemental Torque",ear1="Moldavite Earring",ear2="Novio Earring",
        body="Errant Houppelande",hands="Zenith Mitts",ring1="Tamas Ring",ring2="Snow Ring",
        back="Prism Cape",waist=gear.ElementalObi,legs="Duelist's Tights +1",feet="Duelist's Boots +1"}
        
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    sets.midcast['Dark Magic'] = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Kalboron Stone",
        head="Atrophy Chapeau +1",neck="Dark Torque",ear1="Abyssal Earring",ear2="Loquacious Earring",
        body="Errant Houppelande",hands="Crimson Finger Gauntlets",ring1="Prolix Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Goading Belt",legs="Mahatma Slops",feet="Bokwus Boots"}

    --sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ring1="Excelsis Ring", waist="Fucho-no-Obi"})

    sets.midcast.Aspir = sets.midcast.Drain


    -- Sets for special buff conditions on spells.

    sets.midcast.EnhancingDuration = {hands="Atrophy Gloves +1",back="Estoqueur's Cape",feet="Estoqueur's Houseaux +2"}
        
    sets.buff.ComposureOther = {head="Estoqueur's Chappel +2",
        body="Estoqueur's Sayon +2",hands="Estoqueur's Gantherots +2",
        legs="Estoqueur's Fuseau +2",feet="Estoqueur's Houseaux +2"}

    sets.buff.Saboteur = {hands="Estoqueur's Gantherots +2"}
    

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Chatoyant Staff",
        head="Vitivation Chapeau",neck="Beak Necklace +1",
        body="Errant Houppelande",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Austerity Belt",legs="Nares Trews",feet="Avacat Pigaches"}
    

    -- Idle sets
    sets.idle = {main="Chatoyant Staff",sub="Bugard Leather Strap",ammo="Morion Tathlum",neck="Orochi Nodowa",ear1="Magnetic Earring",ear2="Loquacious Earring",
        body="Dalmatica",head="Duelist's Chapeau +1", hands="Garden Bangles",ring1="Astral Ring",ring2="Ether Ring",
        back="Prism Cape",waist="Penitent's Rope",legs="Crimson Cuisses",feet="Crimson Greaves"}

    sets.idle.Town = {main="Iridal Staff",sub="Bugard Leather Strap",ammo="Morion Tathlum",neck="Philomath Stole",ear1="Morion Earring",ear2="Loquacious Earring",
        body="Duelist's Tabard +1",head="Duelist's Chapeau",hands="Garrison Gloves",ring1="Astral Ring",ring2="Ether Ring",
        back="Prism Cape",waist="Penitent's Rope",legs="Crimson Cuisses",feet="Garrison Boots"}
    
    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
        head="Vitivation Chapeau",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Atrophy Tabard +1",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Crimson Cuisses",feet="Hagondes Sabots"}

    sets.idle.PDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Demonry Stone",
        head="Gendewitha Caubeen +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Gendewitha Bliaut +1",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Osmium Cuisses",feet="Gendewitha Galoshes"}

    sets.idle.MDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Demonry Stone",
        head="Gendewitha Caubeen +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Gendewitha Caubeen +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Osmium Cuisses",feet="Gendewitha Galoshes"}
    
    
    -- Defense sets
    sets.defense.PDT = {
        head="Atrophy Chapeau +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Hagondes Pants",feet="Gendewitha Galoshes"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Atrophy Chapeau +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Atrophy Tabard +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {legs="Crimson Cuisses"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
	sets.engaged = {main="Joyeuse", sub="Genbu's Shield",
        head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Scorpion Harness",hands="Atrophy Gloves +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Goading Belt",legs="Osmium Cuisses",feet="Crimson Greaves"}
		
    sets.engaged.Melee = {main="Joyeuse", sub="Genbu's Shield",
        head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Scorpion Harness",hands="Atrophy Gloves +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Goading Belt",legs="Osmium Cuisses",feet="Crimson Greaves"}

    sets.engaged.Defense = {ammo="Demonry Stone",
        head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Atrophy Tabard +1",hands="Atrophy Gloves +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Kayapa Cape",waist="Goading Belt",legs="Osmium Cuisses",feet="Atrophy Boots"}

	sets.midcast.thunder = {main="Chatoyant Staff"}
   
   sets.midcast.earth = {main="Chatoyant Staff"}
   
   sets.midcast.water = {main="Chatoyant Staff"}
   
   sets.midcast.wind = {main="Chatoyant Staff"}
   
   sets.midcast.fire = {main="Chatoyant Staff"}
   
   sets.midcast.ice = {main="Chatoyant Staff"}
   
   sets.midcast.dark = {main="Chatoyant Staff"}
   
   sets.midcast.light = {main="Chatoyant Staff"}	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
        equip(sets.buff.Saboteur)
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.midcast.EnhancingDuration)
        if buffactive.composure and spell.target.type == 'PLAYER' then
            equip(sets.buff.ComposureOther)
        end
    elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Melee' then
            disable('main','sub','range')
        else
            enableable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

function job_post_midcast(spell, action, spellMap, eventArgs)
   if spell.action_type == "Magic" then
      equip(sets.grips[spell.element])
   end 
   if spell.skill == 'Elemental Magic' and spell.element == "Earth" then
      equip(sets.midcast.earth)
   elseif spell.element == "Water" then
      equip(sets.midcast.water)
   elseif spell.element == "Wind" then
      equip(sets.midcast.wind)
   elseif spell.element == "Fire" then
      equip(sets.midcast.fire)
   elseif spell.element == "Ice" then
      equip(sets.midcast.ice)
   elseif spell.element == "Lightning" then
      equip(sets.midcast.thunder)
   elseif spell.element == "Dark" then
      equip(sets.midcast.dark)
   elseif spell.element == "Light" then
      equip(sets.midcast.light)
   end
end

-- obis and grips
function job_post_midcast(spell, action, spellMap, eventArgs)
   if spell.action_type == "Magic" then
      if spell.element == world.weather_element or spell.element == world.day_element then
         equip(sets.obi[spell.element])
        end
      end
end

function job_aftercast(spell)
    if spell.english == 'Drain' or spell.english == 'Aspir' then
       send_command('@wait 50;input /echo ------- '..spell.english..' is Ready!!! -------')
   end   
   if spell.english == 'Stun' then
       send_command('@wait 37;input /echo ------- '..spell.english..' is Ready!!! -------')
   end   
   if spell.english == 'Sleep' or spell.english == 'Sleepga' then
      send_command('@wait 50;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
      send_command('@wait 55;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
      send_command('@wait 57;input /echo ------- '..spell.english..' is wearing off in 3 seconds -------')
   elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
      send_command('@wait 80;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
      send_command('@wait 85;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
      send_command('@wait 87;input /echo ------- '..spell.english..' is wearing off in 3 seconds -------')
   end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 3)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 3)
    elseif player.sub_job == 'THF' then
        set_macro_page(4, 3)
    else
        set_macro_page(1, 3)
    end
end
