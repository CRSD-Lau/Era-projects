-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.

function get_sets()
    mote_include_version = 2
   
   sets.obi = {Fire = {waist="Karin Obi"},
      Earth = {waist="Dorin Obi"},
      Water = {waist="Suirin Obi"},
      Wind = {waist="Furin Obi"},
      Ice = {main="Chatoyant Staff",waist="Hyorin Obi"},
      Lightning = {waist="Rairin Obi"},
      Light = {waist="Korin Obi"},
      Dark = {waist="Anrin Obi"}}
   
    sets.tonban = {legs="Sorcerer's Tonban +1"}
   
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

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.

function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant', 'Proc')
    state.IdleMode:options('Normal', 'PDT')
    
    state.MagicBurst = M(false, 'Magic Burst')
    
    -- Additional local binds
  
    send_command('bind ^` gs c toggle MagicBurst')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)

function user_unload()
    send_command('unbind ^`')    
end

-- Define sets and vars used by this job file.

function init_gear_sets()

    
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    ---- Precast Sets ----
   
   sets.precast.FC = {
       head="Zenith Crown",
      neck="Uggalepih Pendant",
      body="Dalmatica",
      hands="Zenith Mitts +1",
      waist="Sorcerer's Belt",
        back="Hecate's Cape",
      legs="Zenith Slacks",
      ring1="Serket Ring",
      ring2="Ether Ring",
      ear2="Astral Earring",
      ear1="Loquacious Earring",
      feet="Rostrum Pumps"}

    ---- Midcast Sets ----
   
   sets.midcast.Cure = {
       main="Chatoyant Staff",
        body="Errant Houppelande",
      head="Walahra Turban",
        back="Prism Cape",
      legs="Mahatma Slops",
      ring1="Star Ring",
      ring2="Tamas Ring",
      ear1="Loquacious Earring",
      ear2="Static Earring",
      feet="Errant Pigaches",
      neck="Justice Badge"}

    sets.midcast.Curaga =  sets.midcast.Cure 
   
   sets.midcast['Enhancing Magic'] = {
      main="Chatoyant Staff",
       head="Walahra Turban",
        body="Errant Houppelande",
      back="Merciful Cape",
      legs="Mahatma Slops",
      ring1="Snow Ring",
      ring2="Tamas Ring",
      ear1="Loquacious Earring",
      ear2="Static Earring",
      feet="Rostrum Pumps",
      neck="Justice Badge"}

    sets.midcast.Stoneskin = {
       main="Kirin's Pole",sub="Bugard Leather Strap +1",
      head="Walahra Turban",
        body="Errant Houppelande",
      back="Merciful Cape",
      legs="Mahatma Slops",
      ring1="Star Ring",
      ring2="Tamas Ring",
      ear1="Loquacious Earring",
      ear2="Static Earring",
      feet="Rostrum Pumps",
      neck="Justice Badge"}
    
   sets.midcast.IntEnfeebles =  {
       main="Chatoyant Staff",
       head="Igqira Tiara",
      waist="Sorcerer's Belt",
      body="Errant Houppelande",
      legs="Mahatma Slops",
      hands="Oracle's Gloves",
      neck="Spider Torque",
      ring1="Snow Ring",
      ring2="Tamas Ring",
      ear2="Abyssal Earring",
      ear1="Loquacious Earring",
      back="Prism Cape",
      feet="Avocat Pigaches"}
      
   sets.midcast.MndEnfeebles =  {
       main="Chatoyant Staff",
       head="Igqira Tiara",
      waist="Sorcerer's Belt",
      body="Errant Houppelande",
      legs="Mahatma Slops",
      hands="Oracle's Gloves",
      neck="Spider Torque",
      ring1="Star Ring",
      ring2="Tamas Ring",
      ear2="Static Earring",
      ear1="Loquacious Earring",
      back="Prism Cape",
      feet="Avocat Pigaches"}
   
   sets.midcast.ElementalEnfeeble = {
      main="Chatoyant Staff",
      head="Sorcerer's Petasos +1",
      body="Oracle's Robe",
      hands="Wizard's Gloves",
      waist="Sorcerer's Belt",
      back="Merciful Cape",
       legs="Mahatma Slops",
      neck="Elemental Torque",
      ring1="Snow Ring",
      ring2="Tamas Ring",
      ear2="Abyssal Earring",
      ear1="Loquacious Earring",
      feet="Sorcerer's Sabots"}
      
   sets.midcast['Dark Magic'] = {
       main="Chatoyant Staff",
       head="Walahra Turban",
      waist="Sorcerer's Belt",
      body="Errant Houppelande",
      legs="Wizard's Tonban",
      hands="Sorcerer's Gloves +1",
      neck="Lemegeton Medallion +1",
      ring1="Snow Ring",
      back="Merciful Cape",
      ring2="Tamas Ring",
      ear2="Abyssal Earring",
      ear1="Loquacious Earring",
      feet="Sorcerer's Sabots"}

    sets.midcast.Drain = {
       main="Chatoyant Staff",
       head="Walahra Turban",
      waist="Sorcerer's Belt",
      body="Errant Houppelande",
      legs="Wizard's Tonban",
      hands="Sorcerer's Gloves +1",
      neck="Lemegeton Medallion +1",
      ring1="Snow Ring",
      back="Merciful Cape",
      ring2="Tamas Ring",
      ear2="Abyssal Earring",
      ear1="Loquacious Earring",
      feet="Sorcerer's Sabots"}
    
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {
       main="Chatoyant Staff",
       head="Walahra Turban",
      waist="Sorcerer's Belt",
      body="Errant Houppelande",
      legs="Wizard's Tonban",
      hands="Sorcerer's Gloves +1",
      ring1="Snow Ring",
      back="Merciful Cape",
      ring2="Tamas Ring",
      ear2="Abyssal Earring",
      ear1="Loquacious Earring",
      neck="Lemegeton Medallion +1",
      feet="Sorcerer's Sabots"}
      
   -- Elemental Magic Sets
   
   sets.midcast.thunder = {main="Chatoyant Staff"}
   
   sets.midcast.earth = {main="Chatoyant Staff"}
   
   sets.midcast.water = {main="Chatoyant Staff"}
   
   sets.midcast.wind = {main="Chatoyant Staff"}
   
   sets.midcast.fire = {main="Chatoyant Staff"}
   
   sets.midcast.ice = {main="Aquilo's Staff"}
   
   sets.midcast.dark = {main="Chatoyant Staff"}
   
   sets.midcast.light = {main="Chatoyant Staff"}
   
   sets.midcast.ring = {ring1="Sorcerer's Ring"}
   
    sets.midcast['Elemental Magic'] = { 
       sub="Bugard Leather Strap",
        head="Sorcerer's Petasos +1",
      neck="Elemental Torque",
      body="Oracle's Robe",
      hands="Zenith Mitts",
      waist="Sorcerer's Belt",
        back="Prism Cape",
      legs="Mahatma Slops",
      ring1="Snow Ring",
      ring2="Tamas Ring",
      ear2="Loquacious Earring",
      ear1="Moldavite Earring",
      feet="Sorcerer's Sabots"}
      
   sets.midcast['Elemental Magic'].Resistant = { 
        head="Sorcerer's Petasos +1",
      neck="Elemental Torque",
      body="Igqira Weskit",
      hands="Wizard's Gloves",
      waist="Sorcerer's Belt",
        back="Prism Cape",
      legs="Mahatma Slops",
      ring1="Snow Ring",
      ring2="Tamas Ring",
      ear2="Loquacious Earring",
      ear1="Abyssal Earring",
      feet="Numerist Pumps"}
    
    -- Resting Set
    
   sets.resting = {
       main="Dorje",sub="Bugard Leather Strap +1",
        body="Oracle's Robe",
        waist="Qiqirn Sash +1",
      neck="Beak Necklace +1",
      hands="Oracle's Gloves",
      legs="Oracle's Braconi",
      ear2="Relaxing Earring",
      ear1="Rapture Earring",
      head="Oracle's Cap",
      ring1="Star Ring",
      ring2="Star Ring",
      feet="Avocat Pigaches"}

    -- Normal Refresh Idle Set
   
    sets.idle = { 
       main="Terra's Staff",sub="Bugard Leather Strap",
        body="Dalmatica",
      ear2="Loquacious Earring",
      ear1="Static Earring",
      neck="Orochi Nodowa",
      waist="Sorcerer's Belt",
      back="Prism Cape",
      legs="Mahatma Slops",
      head="Sorcerer's Petasos +1",
      hands="Zenith Mitts",
      ring1="Insect Ring",
      ring2="Tamas Ring",
      feet="Herald's Gaiters",
      ammo="Phantom Tathlum"}

    -- Town gear
   
   sets.idle.Town =  { 
       main="Dorje",sub="Thunder Grip",
        body="Oracle's Robe",
      ear2="Novio Earring",
      ear1="Loquacious Earring",
      neck="Prudence Torque",
      waist="Sorcerer's Belt",
      back="Hecate's Cape",
      legs="Shadow Trews",
      head="Sorcerer's Petasos +1",
      hands="Zenith Mitts",
      ring1="Snow Ring",
      ring2="Tamas Ring",
      feet="Herald's Gaiters",
      ammo="Phantom Tathlum"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
   
   sets.magic_burst = {hands="Sorcerer's Gloves +1",ear1="Static Earring"}
   
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.

function job_midcast(spell, action, spellMap, eventArgs)
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

function job_post_midcast(spell, action, spellMap, eventArgs)
   if spell.action_type == "Magic" then
      if spell.element == world.weather_element or spell.element == world.day_element then
         equip(sets.obi[spell.element])
        end
      end
   if player.hpp < 76 and spell.skill == 'Elemental Magic' then
         equip(sets.midcast.ring)
      end
    if spell.skill == 'Elemental Magic' then
      if spell.element == world.day_element then
         equip(sets.tonban)
        end
   if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
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

function job_state_change(stateField, newValue, oldValue)
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- gain == true if the buff was gained, false if it was lost.

function job_buff_change(buff, gain)
    if name == "silence" and gain =="True" then
      send_command('@input /item "Echo Drops" <me>')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        end
    end
end
function display_current_job_state(eventArgs)
    local msg = 'Offense'
    msg = msg .. ': [' .. state.OffenseMode.value .. '], '
    msg = msg .. 'Casting'
    msg = msg .. ': [' .. state.CastingMode.value .. '], '
    msg = msg .. 'Idle'
    msg = msg .. ': [' .. state.IdleMode.value .. '], '

    if state.MagicBurst.value == true then
        msg = msg .. 'Magic Burst: [On]'
    elseif state.MagicBurst.value == false then
        msg = msg .. 'Magic Burst: [Off]'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-- Function to display the current relevant user state when doing an update.

function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.

function select_default_macro_book()
    set_macro_page(1, 1)
end