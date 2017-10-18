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
    send_command('bind ^z input /ma Stun <t>')
    send_command('bind ^x gs c activate MagicBurst')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^z')
    send_command('unbind ^x')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    

    -- Fast cast sets for spells

    sets.precast.FC = {sub="Vivid Strap +1", ear2="Loquacious Earring",feet="Rostrum Pumps"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Penitent's Rope", main="Kirin's Pole", body="Errant Houppelande"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris", back="Pahtli Cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Hagondes Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Icesoul Ring",
        back="Refraction Cape",waist="Cognition Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {ammo="Dosis Tathlum",
        head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Toro Cape",waist="Thunder Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
    
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = {ear2="Loquacious Earring",waist="Headlong Belt",feet="Rostrum Pumps"}

    sets.midcast.Cure = {main="Chatoyant Staff",
        head="Zenith Crown",neck="Colossus's Torque",ear1="Magnetic Earring",ear2="Loquacious Earring",
        body="Errant Houppelande",hands="Bokwus Gloves",ring1="Tamas Ring",ring2="Sirona's Ring",
        back="Pahtli Cape",waist="Penitent's Rope",legs="Mahatma Slops",feet="Errant Pigaches"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {main="Chatoyant Staff",
        head="Zenith Crown",neck="Colossus's Torque",ear1="Magnetic Earring",ear2="Loquacious Earring",
        body="Errant Houppelande",hands="Bokwus Gloves",ring1="Tamas Ring",ring2="Aqua Ring",
        back="Pahtli Cape",waist="Penitent's Rope",legs="Mahatma Slops",feet="Errant Pigaches"}
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast['Enfeebling Magic'] = {main="Chatoyant Staff",
        head="Zenith Crown",neck="Morgana's Choker",ear1="Magnetic Earring",ear2="Loquacious Earring",
        body="Errant Houppelande",hands="Oracle's Gloves",ring1="Tamas Ring",ring2="Aqua Ring",
        back="Prism Cape",waist="Penitent's Rope",legs="Mahatma Slops",feet="Avocat Pigaches"}
        
    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

    sets.midcast['Dark Magic'] = {main="Chatoyant Staff",sub="Dark Grip",ammo="Sturm's Report",
        head="Nahtirah Hat",neck="Dark Torque",ear1="Abyssal Earring",ear2="Loquacious Earring",
        body="Errant Houppelande",hands="Sorcerer's Gloves +1",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Sorcerer's Belt",legs="Wizard's Tonban",feet="Rostrum Pumps"}

    sets.midcast.Drain = {main="Chatoyant Staff",sub="Dark Grip",ammo="Sturm's Report",
        head="Nahtirah Hat",neck="Dark Torque",ear1="Abyssal Earring",ear2="Loquacious Earring",
        body="Errant Houppelande",hands="Sorcerer's Gloves +1",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Sorcerer's Belt",legs="Wizard's Tonban",feet="Rostrum Pumps"}
    
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = sets.midcast.Drain

    sets.midcast.BardSong = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Sturm's Report",
        head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Refraction Cape",legs="Bokwus Slops",feet="Bokwus Boots"}


    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {main="Chatoyant Staff",sub="Bugard Leather Strap",ammo="Phantom Tathlum",
        head="Sorcerer's Petasos +1",neck="Lemegeton Medallion +1",ear1="Moldavite Earring",ear2="Novio Earring",
        body="Oracle's Robe",hands="Zenith Mitts",ring1="Tamas Ring",ring2="Snow Ring",
        back="Prism Cape",waist="Sorcerer's Belt",legs="Mahatma Slops",feet="Sorcerer's Sabots +1"}

    sets.midcast['Elemental Magic'].Resistant = {main="Chatoyant Staff",sub="Bugard Leather Strap",ammo="Phantom Tathlum",
        head="Sorcerer's Petasos +1",neck="Lemegeton Medallion +1",ear1="Moldavite Earring",ear2="Novio Earring",
        body="Oracle's Robe",hands="Wizard's Gloves +1",ring1="Tamas Ring",ring2="Snow Ring",
        back="Prism Cape",waist="Sorcerer's Belt",legs="Mahatma Slops",feet="Sorcerer's Sabots +1"}

 

    -- Minimal damage gear for procs.
    sets.midcast['Elemental Magic'].Proc = {main="Lotus Katana",sub="Bugard Leather Strap",ammo="Phantom Tathlum",
        head="Sorcerer's Petasos +1",neck="Lemegeton Medallion +1",ear1="Moldavite Earring",ear2="Novio Earring",
        body="Oracle's Robe",hands="Sorcerer's Gloves +1",ring1="Tamas Ring",ring2="Snow Ring",
        back="Prism Cape",waist="Sorcerer's Belt",legs="Mahatma Slops",feet="Sorcerer's Sabots +1"}

	sets.midcast['Enfeebling Magic'].Resistant = {main="Chatoyant Staff",
        head="Sorcerer's Petasos",neck="Enfeebling Torque",ear1="Abyssal Earring",ear2="Loquacious Earring",
        body="Oracle's Robe",hands="Errant Cuffs",ring1="Tamas Ring",ring2="Sirona's Ring",
        back="Prism Cape",waist="Sorcerer's Belt",legs="Mahatma Slops",feet="Avocat Pigaches"}
    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Chatoyant Staff",ammo="Clarus Stone",
        head="Oracle's Cap",neck="Beak Necklace +1",
        body="Oracle's Robe",hands="Oracle's Gloves",ear1="Magnetic Earring",ring2="Paguroidea Ring",
        waist="Austerity Belt",legs="Oracle's Braconi",feet="Avocat Pigaches"}
    

    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {main="Chatoyant Staff", sub="Thunder Grip",ammo="Phantom Tathlum",
        head="Sorcerer's Petasos +1",neck="Orochi Nodowa",ear1="Magnetic Earring",ear2="Loquacious Earring",
        body="Dalmatica",hands="Garden Bangles",ring1="Tamas Ring",ring2="Snow Ring",
        back="Prism Cape",waist="Sorcerer's Belt",legs="Mahatma Slops",feet="Herald's Gaiters"}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {main="Earth Staff", sub="Zuuxowu Grip",ammo="Impatiens",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Herald's Gaiters"}

    -- Idle mode scopes:
    -- Idle mode when weak.
    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
        head="Hagondes Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Hierarch Belt",legs="Nares Trews",feet="Hagondes Sabots"}
    
    -- Town gear.
    sets.idle.Town = {main="Lehbrailg +2", sub="Zuuxowu Grip",ammo="Impatiens",
        head="Hagondes Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Vermillion Cloak",hands="Yaoyotl Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Herald's Gaiters"}
        
    -- Defense sets

    sets.defense.PDT = {main="Earth Staff",sub="Zuuxowu Grip",
        head="Nahtirah Hat",neck="Twilight Torque",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Nahtirah Hat",neck="Twilight Torque",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Tuilha Cape",waist="Hierarch Belt",legs="Bokwus Slops",feet="Hagondes Sabots"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {feet="Goetia Sabots +2"}

    sets.magic_burst = {neck="Mizukage-no-Kubikazari"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        head="Zelus Tiara",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hagondes Coat",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Umbra Cape",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)

end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
   if spell.action_type == "Magic" then
		  equip(sets.grips[spell.element])
   end
      if spell.element == world.weather_element or spell.element == world.day_element then
         equip(sets.obi[spell.element])
   end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.


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
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------


-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
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

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 2)
end