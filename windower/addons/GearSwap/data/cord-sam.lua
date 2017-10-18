-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

function job_setup()

	state.Buff['Seigan'] = buffactive['Seigan'] or false
	state.Buff['Hasso'] = buffactive['Hasso'] or false
end

function user_setup()
    state.OffenseMode:options('STP','Haste', 'Acc','Tank')
    state.HybridMode:options('Normal', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT', 'HP')
    state.MagicalDefenseMode:options('MDT', 'HP')
    
	send_command('bind !c input /ja "Seigan" <me>')
	send_command('bind !x input /ja "Hasso" <me>')
	send_command('bind !z input /ja "Meditate" <me>')
	
    select_default_macro_book()
end

function user_unload()
    send_command('unbind !c')
	send_command('unbind !x')
	send_command('unbind !z')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------
    
    -- Precast sets to enhance JAs

	sets.precast.Step ={} -- Acc
	
    sets.precast.JA['Box Step'] = sets.precast.Step
	sets.precast.JA['Quickstep'] = sets.precast.Step
	sets.precast.JA['Stutter Step'] = sets.precast.Step
    
	-- Waltz set (chr and vit)
    sets.precast.Waltz = {}
		
	 
    -- Fast cast sets for spells
    
    sets.precast.FC = {ear2="Loquacious Earring"}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    main="Amanomurakumo",
    sub="Rose Strap",
    range="Cerberus Bow",
    ammo="Kabura Arrow",
    head="Enkidu's Cap",
    body="Hachiryu Haramaki",
    legs="Shura Haidate",
    feet="Marine M Boots",
    neck="Fotia Gorget",
    waist="Potent Belt",
    left_ear="Bushinomimi",
    right_ear="Harmonius Earring",
    left_ring="Rajas Ring",
    right_ring="Strigoi Ring",
    back="Cerberus Mantle",
}

    sets.precast.WS.Acc = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	-- Str 75, Aqua Gorget & Aqua Belt, Snow Gorget & Snow Belt
    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {})
	-- Str 75, Snow Gorget & Snow Belt, Breeze Gorget & Breeze Belt
	sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {})
	-- Str 75, Flame Light Shadow
	sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {})
	-- Str 80, Breeze Thunder Light
	sets.precast.WS['Tachi: Kaiten'] = set_combine(sets.precast.WS, {})
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Walahra Turban",hands="Dusk Gloves +1",ear1="Loquacious Earring",
        waist="Velocious Belt",feet="Dusk Ledelsens +1"}        
	
	sets.midcast['Ninjutsu'] = sets.midcast.FastRecast
	
	sets.midcast.Enmity = {head="Aegishjalmr",hands="Saotome Kote",legs="Saotome Haidate",neck="Ritter Gorget",
        waist="Trance Belt",left_ear="Hades Earring +1",right_ear="Hades Earring +1",back="Cerberus Mantle",}
    
	sets.midcast.Provoke = sets.midcast.Enmity
	sets.midcast['Animated Flourish'] = sets.midcast.Enmity
    sets.midcast.Meditate = {hands="Saotome Kote"}
	
	sets.midcast.RA = {}
	
	sets.midcast['Blade Bash'] = {head="Enkidu's Cap",body="Hachiryu Haramaki",hands="Enkidu's Mittens",
        legs="Shura Haidate",neck="Peacock Amulet",waist="Potent Belt",left_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Water resistance+3',}},
        right_ring="Sniper's Ring +1",}
		
		
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    sets.resting = {neck="Creed Collar",
        ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Austerity Belt"}
    

    -- Idle sets
    sets.idle.Field = {main="Amanomurakumo",sub="Rose Strap",range="Cerberus Bow",ammo="Kabura Arrow",
        head={ name="Walahra Turban", augments={'"Store TP"+10',}},body="Hachiryu Haramaki",hands="Hachiman Kote",legs="Byakko's Haidate",
        feet="Hachiryu Sune-Ate",neck="Peacock Amulet",waist={ name="Velocious Belt", augments={'DEX+1','Wind resistance+20','Wind resistance+26',}},
        left_ear="Harmonius Earring",right_ear={ name="Brutal Earring", augments={'"Dual Wield"+3','"Dbl.Atk."+3',}},
        left_ring="Jelly Ring",right_ring="Defending Ring",back="Shadow Mantle",}

        
    -- Basic defense sets.
        
    sets.defense.PDT = {ammo="Bibiki Seashell",
        head="Darksteel Cap +1",neck="Ritter Gorget",ear1="Cassie Earring",ear2="Brutal Earring",
        body="Darksteel Harness +1",hands="Darksteel Mittens +1",ring1="Jelly Ring",ring2="Defending Ring",
        back="Shadow Mantle",waist="Ocean Sash",legs="Darksteel Subligar +1",feet="Darksteel Leggings +1"}
    sets.defense.HP = {ammo="Iron Gobbet",
        head="Koenig Schaller",neck="Fortified Chain",ear1="Knight's Earring",ear2="Brutal Earring",
        body="Koenig Cuirass",hands="Koenig Handschuhs",ring1="Jelly Ring",ring2="Soil Ring",
        back="Gigant Mantle",waist="Creed Baudrier",legs="Aurum Cuisses",feet="Aurum Sabatons"}
    -- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.MDT = {ammo="Bibiki Seashell",
        head="Koenig Schaller",neck="Fortified Chain",ear1="Merman's Earring",ear2="Merman's Earring",
        body="Crimson Scale Mail",hands="Koenig Handschuhs",ring1="Merman's Ring",ring2="Defending Ring",
        back="Gigant Mantle",waist="Velocious Belt",legs="Koenig Diechlings",feet="Koenig Schuhs"}
		
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    sets.engaged.STP = {main="Amanomurakumo",sub="Rose Strap",range="Cerberus Bow",ammo="Kabura Arrow",
        head={ name="Walahra Turban", augments={'"Store TP"+10',}},body="Hachiryu Haramaki",hands="Hachiman Kote",
        legs="Byakko's Haidate",feet="Hachiryu Sune-Ate",neck="Peacock Amulet",waist={ name="Velocious Belt", augments={'DEX+1','Wind resistance+20','Wind resistance+26',}},
        left_ear="Bushinomimi",right_ear={ name="Brutal Earring", augments={'"Dual Wield"+3','"Dbl.Atk."+3',}},
        left_ring="Rajas Ring",right_ring="Strigoi Ring",back="Cerberus Mantle"}

    sets.engaged.Acc = {head="Enkidu's Cap",body="Hachiryu Haramaki",hands="Enkidu's Mittens",
        legs="Shura Haidate",neck="Peacock Amulet",waist="Potent Belt",left_ring={ name="Toreador's Ring", augments={'"Triple Atk."+2','Water resistance+3',}},
        right_ring="Sniper's Ring +1",}
		
	sets.engaged.Haste = {main="Amanomurakumo",sub="Rose Strap",range="Cerberus Bow",ammo="Kabura Arrow",
        head={ name="Walahra Turban", augments={'"Store TP"+10',}},body="Hachiryu Haramaki",hands="Dusk Gloves +1",
        legs="Byakko's Haidate",feet="Dusk Ledelsens +1",neck="Peacock Amulet",
        waist={ name="Velocious Belt", augments={'DEX+1','Wind resistance+20','Wind resistance+26',}},
        left_ear="Bushinomimi",right_ear={ name="Brutal Earring", augments={'"Dual Wield"+3','"Dbl.Atk."+3',}},
        left_ring="Rajas Ring",right_ring="Strigoi Ring",back="Cerberus Mantle",}

	sets.engaged.Tank = {main="Amanomurakumo",sub="Rose Strap",ammo="Bibiki Seashell",
        head="Saurian Helm",body="Enkidu's Harness",hands="Enkidu's Mittens",legs="Saotome Haidate",
        feet="Dusk Ledelsens +1",neck="Peacock Amulet",waist={ name="Velocious Belt", augments={'DEX+1','Wind resistance+20','Wind resistance+26',}},
        left_ear="Bushinomimi",right_ear={ name="Brutal Earring", augments={'"Dual Wield"+3','"Dbl.Atk."+3',}},
        left_ring="Jelly Ring",right_ring="Defending Ring",back="Shadow Mantle",}
		
    sets.engaged.PDT = {ammo="Bibiki Seashell",	
        head="Darksteel Cap +1",neck="Ritter Gorget",ear1="Cassie Earring",ear2="Brutal Earring",
        body="Darksteel Harness +1",hands="Darksteel Mittens +1",ring1="Jelly Ring",ring2="Sattva Ring",
        back="Shadow Mantle",waist="Ocean Sash",legs="Darksteel Subligar +1",feet="Darksteel Leggings +1"}
		
	sets.engaged.STP.Seigan = {main="Amanomurakumo",sub="Rose Strap",range="Cerberus Bow",ammo="Kabura Arrow",
        head={ name="Walahra Turban", augments={'"Store TP"+10',}},body="Hachiryu Haramaki",hands="Hachiman Kote",
        legs="Saotome Haidate",feet="Hachiryu Sune-Ate",neck="Peacock Amulet",waist={ name="Velocious Belt", augments={'DEX+1','Wind resistance+20','Wind resistance+26',}},
        left_ear="Bushinomimi",right_ear={ name="Brutal Earring", augments={'"Dual Wield"+3','"Dbl.Atk."+3',}},
        left_ring="Rajas Ring",right_ring="Strigoi Ring",back="Cerberus Mantle"}
		
	sets.engaged.Seigan = {main="Amanomurakumo",sub="Rose Strap",range="Cerberus Bow",ammo="Kabura Arrow",
        head={ name="Walahra Turban", augments={'"Store TP"+10',}},body="Hachiryu Haramaki",hands="Hachiman Kote",
        legs="Saotome Haidate",feet="Hachiryu Sune-Ate",neck="Peacock Amulet",waist={ name="Velocious Belt", augments={'DEX+1','Wind resistance+20','Wind resistance+26',}},
        left_ear="Bushinomimi",right_ear={ name="Brutal Earring", augments={'"Dual Wield"+3','"Dbl.Atk."+3',}},
        left_ring="Rajas Ring",right_ring="Strigoi Ring",back="Cerberus Mantle"}	
end

function job_buff_change(name,gain)
	
	if name == 'Seigan' or name == 'Hasso'then
		state.Buff[name] = gain
		adjust_melee_groups()
		handle_equipping_gear(player.status)
	end

end

function adjust_melee_groups()

	classes.CustomMeleeGroups:clear()
	
	if state.Buff['Seigan'] then
		classes.CustomMeleeGroups:append('Seigan')
	elseif state.Buff['Hasso'] then
		classes.CustomMeleeGroups:append('Hasso')
	end
end

--function job_buff_change(buff, gain)
--    if buff == Seigan then
--        handle_equipping_gear(player.status)
--    end
--end

--function customize_engaged_set(engagedSet)
--    if state.Buff.Seigan then
--        if state.EngagedMode.value == 'STP' then
--           engagedSet = set_combine(engagedSet, sets.buff['Seigan'])
--        end
--    end
--end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(2, 7)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'DRG' then
        set_macro_page(3, 7)
     else
        set_macro_page(1, 7)
    end
end

