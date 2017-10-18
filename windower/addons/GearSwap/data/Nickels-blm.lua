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
	
	sets.precast.JA['Elemental Seal'] = {}

    -- Fast cast sets for spells

    sets.precast.FC = {ear2="Loquacious Earring"}


    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Spirit Taker'] = {}
    
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = {ear2="Loquacious Earring",waist="Headlong Belt",feet="Rostrum Pumps"}

    sets.midcast.Cure = {
		main="Chatoyant Staff",
		sub="Light Grip",
		head="Morrigan's Coron.",
		body="Errant Hpl.",
		hands="Seer's Mitts",
		legs="Errant Slops",
		feet="Seer's Pumps +1",
		waist="Penitent's Rope",
		left_ear="Loquac. Earring",
		ring1="Tamas Ring",
		back="Rainbow Cape",}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {main="Chatoyant Staff",
        head="Zenith Crown",neck="Colossus's Torque",ear1="Magnetic Earring",ear2="Loquacious Earring",
        body="Errant Houppelande",hands="Bokwus Gloves",ring1="Tamas Ring",ring2="Aqua Ring",
        back="Pahtli Cape",waist="Penitent's Rope",legs="Mahatma Slops",feet="Errant Pigaches"}
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {main="Alkalurops", waist="Siegel Sash"})

    sets.midcast['Enfeebling Magic'] = {
		main="Chatoyant Staff",
		sub="Light Grip",
		head="Morrigan's Coron.",
		body="Errant Hpl.",
		hands="Oracle's Gloves",
		legs="Errant Slops",
		feet="Seer's Pumps +1",
		neck="Philomath Stole",
		waist="Penitent's Rope",
		left_ear="Loquac. Earring",
		ring1="Tamas Ring",
		ring2="Snow Ring",
		back="Rainbow Cape",}
		
	sets.midcast['Enfeebling Magic'].Resistant = {}
        
    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

    sets.midcast['Dark Magic'] = {
		main="Chatoyant Staff",
		sub="Dark Grip",
		ammo="Sweet Sachet",
		head="Morrigan's Coron.",
		body="Errant Hpl.",
		hands="Errant Cuffs",
		legs="Errant Slops",
		feet="Garrison Boots",
		neck="Philomath Stole",
		waist="Penitent's Rope",
		left_ear="Loquac. Earring",
		left_ring="Tamas Ring",
		right_ring="Snow Ring",
		back="Rainbow Cape",}

    sets.midcast.Drain = {
		main="Chatoyant Staff",
		sub="Dark Grip",
		ammo="Sweet Sachet",
		head="Morrigan's Coron.",
		body="Errant Hpl.",
		hands="Vicious Mufflers",
		legs="Errant Slops",
		feet="Garrison Boots",
		neck="Philomath Stole",
		waist="Penitent's Rope",
		left_ear="Loquac. Earring",
		left_ring="Tamas Ring",
		right_ring="Snow Ring",
		back="Rainbow Cape",}
    
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = sets.midcast['Dark Magic']


    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {
		main="Chatoyant Staff",
		sub="Dark Grip",
		ammo="Sweet Sachet",
		head="Morrigan's Coron.",
		body="Igqira Weskit",
		hands="Zenith Mitts +1",
		legs="Errant Slops",
		feet="Garrison Boots",
		neck="Philomath Stole",
		waist="Penitent's Rope",
		left_ear="Loquac. Earring",
		left_ring="Tamas Ring",
		right_ring="Snow Ring",
		back="Rainbow Cape",}

    sets.midcast['Elemental Magic'].Resistant = {}


    -- Minimal damage gear for procs.
    sets.midcast['Elemental Magic'].Proc = {}

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
		main="Chatoyant Staff",
		sub="Dark Grip",
		head="Oracle's Cap",
		body="Errant Hpl.",
		hands="Oracle's Gloves",
		feet="Avocat Pigaches",}
    

    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {
		main="Chatoyant Staff",
		sub="Dark Grip",
		ammo="Sweet Sachet",
		body="Royal Cloak",
		hands="Oracle's Gloves",
		legs="Errant Slops",
		feet="Desert Boots",
		neck="Chocobo Whistle",
		waist="Penitent's Rope",
		left_ear="Loquac. Earring",
		left_ring="Vivian Ring",
		right_ring="Astral Ring",
		back="Prism Cape",}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {main="Earth Staff", sub="Zuuxowu Grip",ammo="Impatiens",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Herald's Gaiters"}

    -- Idle mode scopes:
    -- Idle mode when weak.
    sets.idle.Weak = {}
    
    -- Town gear.
    sets.idle.Town = {
		main="Chatoyant Staff",
		sub="Dark Grip",
		ammo="Sweet Sachet",
		body="Royal Cloak",
		hands="Oracle's Gloves",
		legs="Errant Slops",
		feet="Desert Boots",
		neck="Chocobo Whistle",
		waist="Penitent's Rope",
		left_ear="Loquac. Earring",
		left_ring="Vivian Ring",
		right_ring="Astral Ring",
		back="Rainbow Cape",}
        
    -- Defense sets

    sets.defense.PDT = {}

    sets.defense.MDT = {}

    sets.Kiting = {feet="Desert Boots"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.magic_burst = {neck="Mizukage-no-Kubikazari"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {}
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
    set_macro_page(1, 1)
end