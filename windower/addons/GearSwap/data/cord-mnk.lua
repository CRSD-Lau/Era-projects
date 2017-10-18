-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function job_setup()

	state.Buff['Counterstance'] = buffactive['Counterstance'] or false
	state.Buff['Footwork'] = buffactive['Footwork'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Haste', 'Acc', 'DD','Eva')
    state.HybridMode:options('Normal', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT', 'HP')
    state.MagicalDefenseMode:options('MDT', 'HP')
    
	send_command('bind !x input /ja "Footwork" <me>')
	send_command('bind !a input /ja "Spectral Jig" <me>')
	send_command('bind !z input /ja "Counterstance" <me>')
	
    select_default_macro_book()
end

function user_unload()
    send_command('unbind !s')
	send_command('unbind !z')
	send_command('unbind !a')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------
    
    -- Precast sets to enhance JAs

	sets.precast.Step = {}
	
    sets.precast.JA['Box Step'] = sets.precast.Step
	sets.precast.JA['Quickstep'] = sets.precast.Step
	sets.precast.JA['Stutter Step'] = sets.precast.Step
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
		
	sets.precast.Jig = {}
	
	sets.precast.Samba = {}
	
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Dodge = {}
	sets.precast.Focus = {}
	-- Add VIT
	sets.precast.JA['Chakra'] = {hands="Melee Gloves"}
	-- Add MND and Boost
	sets.precast.JA['Chi Blast'] = {}
	sets.precast.Counterstance = {}
	sets.precast.JA['Footwork'] = {feet="Kyoshu Kyahan"}
	sets.precast.JA['Formless Strikes'] = {}
    -- Fast cast sets for spells
    
    sets.precast.FC = {ear2="Loquacious Earring"}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    main="Shlng. Baghnakhs",
    ammo="Black Tathlum",
    head="Melee Crown",
    body="Hachiryu Haramaki",
    hands="Enkidu's Mittens",
    legs="Shura Haidate",
    feet="Marine M Boots",
    neck="Fotia Gorget",
    waist="Black Belt",
    left_ear="Harmonius Earring",
    right_ear={ name="Brutal Earring", augments={'"Dual Wield"+3','"Dbl.Atk."+3',}},
    left_ring="Rajas Ring",
    right_ring="Strigoi Ring",
    back="Cerberus Mantle",
}

    sets.precast.WS.Acc = set_combine{sets.precast.WS, {head="Hissho Hachimaki"}}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	-- Dex Chr
    sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {neck="Fotia Gorget"})
	    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {}        
	
	sets.midcast['Ninjutsu'] = sets.midcast.FastRecast
	
	sets.midcast.Enmity = {}
    
	sets.midcast.Provoke = sets.midcast.Enmity
	sets.midcast['Animated Flourish'] = sets.midcast.Enmity
    
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {
    main="Shlng. Baghnakhs",
    ammo="Black Tathlum",
    head={ name="Walahra Turban", augments={'"Store TP"+10',}},
    body="Kirin's Osode",
    hands="Garden Bangles",
    legs="Byakko's Haidate",
    feet="Hermes' Sandals",
    neck="Orochi Nodowa",
    waist="Potent Belt",
    left_ear="Merman's Earring",
    right_ear="Merman's Earring",
    left_ring="Jelly Ring",
    right_ring="Defending Ring",
    back="Shadow Mantle",
}

    
    sets.Kiting = {feet="Hermes' Sandals",}

     -- Basic defense sets.
        
    sets.defense.PDT = {}
    sets.defense.HP = {
		main="Shlng. Baghnakhs",
		ammo={ name="Bibiki Seashell", augments={'HP recovered while healing +3','MP recovered while healing +3','Phys. dmg. taken -3%',}},
		head="Melee Crown",
		body="Hachiryu Haramaki",
		hands="Melee Gloves",
		legs="Melee Hose",
		feet="Marine M Boots",
		neck="Peacock Amulet",
		waist="Ocean Sash",
		left_ear="Harmonius Earring",
		right_ear="Cassie Earring",
		left_ring="Bomb Queen Ring",
		right_ring="Bloodbead Ring",
		back="Gigant Mantle",}
 
    sets.defense.MDT = {}
		
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    sets.engaged.Haste = {
    main="Shlng. Baghnakhs",
    ammo="Black Tathlum",
    head={ name="Walahra Turban", augments={'"Store TP"+10',}},
    body="Hachiryu Haramaki",
    hands="Enkidu's Mittens",
    legs="Byakko's Haidate",
    feet="Enkidu's Leggings",
    neck="Peacock Amulet",
    waist="Black Belt",
    left_ear="Harmonius Earring",
    right_ear={ name="Brutal Earring", augments={'"Dual Wield"+3','"Dbl.Atk."+3',}},
    left_ring="Strigoi Ring",
    right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Water resistance+3',}},
    back="Cerberus Mantle",
}

    sets.engaged.Acc = {}
		
	sets.engaged.DD = {}	

	sets.engaged.Eva = {}
    sets.engaged.PDT = {}
    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, {ring1="Defending Ring"})
    sets.engaged.Haste.Footwork = {
    main="Shlng. Baghnakhs",
    ammo="Black Tathlum",
    head={ name="Walahra Turban", augments={'"Store TP"+10',}},
    body="Hachiryu Haramaki",
    hands="Enkidu's Mittens",
    legs="Melee Hose",
    feet="Kyoshu Kyahan",
    neck="Peacock Amulet",
    waist="Black Belt",
    left_ear="Harmonius Earring",
    right_ear={ name="Brutal Earring", augments={'"Dual Wield"+3','"Dbl.Atk."+3',}},
    left_ring="Strigoi Ring",
    right_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Water resistance+3',}},
    back="Cerberus Mantle",
}
    sets.engaged.Haste.Counterstance = set_combine(sets.engaged.Haste, {feet="Melee Gaiter"})
end

function job_buff_change(name,gain)
	
	if name == 'Footwork' or name == 'Counterstance' then
		state.Buff[name] = gain
		adjust_melee_groups()
		handle_equipping_gear(player.status)
	end

end

function adjust_melee_groups()

	classes.CustomMeleeGroups:clear()
	
	if state.Buff['Footwork'] then
		classes.CustomMeleeGroups:append('Footwork')
	elseif state.Buff['Counterstance'] then
		classes.CustomMeleeGroups:append('Counterstance')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(2, 2)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'DNC' then
        set_macro_page(3, 2)
     else
        set_macro_page(1, 2)
    end
end

