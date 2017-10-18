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

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Haste', 'Acc', 'DD','Eva')
    state.HybridMode:options('Normal', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT', 'HP')
    state.MagicalDefenseMode:options('MDT', 'HP')
    
	send_command('bind !a input /ja "Chocobo Jig" <me>')
	send_command('bind !s input /ja "Spectral Jig" <me>')
	send_command('bind !z input /ja Reverse Flourish <me>')
	
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
    sets.precast.JA['Violent Flourish'] = {Body="Etoile Casaque +1"}

	sets.precast.Step = {head="Enkidu's Cap",hands="Dancer's Bangles",body="Etoile Casaque +1",
	feet="Etoile Toe Shoes +1",waist="Potent Belt",legs="Dancer's Tights",neck="Peacock Amulet",back="Etoile Cape"}
	
    sets.precast.JA['Box Step'] = sets.precast.Step
	sets.precast.JA['Quickstep'] = sets.precast.Step
	sets.precast.JA['Stutter Step'] = sets.precast.Step
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Bibiki Seashell",neck="Fortitude Torque",
        head="Etoile Tiara +1",legs="Etoile Tights +1",
        body="Dancer's Casaque",ring1="Light Ring",ring2="Soil Ring",back="Etoile Cape"}
		
	sets.precast.Jig = {legs="Etoile Tights",feet="Dancer's Shoes"}
	
	sets.precast.Samba = {head="Dancer's Tiara"}
	
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
 
    -- Fast cast sets for spells
    
    sets.precast.FC = {ear2="Loquacious Earring"}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Ginsen",
        head="Etoile Tiara +1",neck="Fotia Gorget",ear1="Ethereal Earring",ear2="Pixie Earring",
        body="Enkidu's Harness",hands="Enkidu's Mittens",ring1="Rajas Ring",ring2="Strigoi Ring",
        back="Cerberus Mantle",waist="Potent Belt",legs="Enkidu's Subligar",feet="Enkidu's Leggings"}

    sets.precast.WS.Acc = {ammo="Ginsen",
        head="Yaoyotl Helm",neck="Fotia Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Enkidu's Harness",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Patricius Ring",
        back="Atheling Mantle",waist=gear.ElementalBelt,legs="Cizin Breeches",feet="Whirlpool Greaves"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	-- Dex Chr
    sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS, {ring1="Rajas Ring",head="Dancer's Tiara",
	ring2="Toreador's Ring",waist="Potent Belt",neck="Fotia Gorget",ear1="Ethereal Ring"})
	--Dex
	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {head="Enkidu's Cap",neck="Fotia Gorget",
	feet="Etoile Toe Shoes"})
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Walahra Turban",
        body="Rapparee Harness",hands="Dusk Gloves +1",ear1="Loquacious Earring",
        waist="Velocious Belt",legs="Etoile Tights",feet="Dusk Ledelsens +1"}        
	
	sets.midcast['Ninjutsu'] = sets.midcast.FastRecast
	
	sets.midcast.Enmity = {ear1="Hades Earring +1",ear2="Hades Earring +1",waist="Trance Belt",
        neck="Ritter Gorget",ring1="Sattva Ring",back="Cerberus Mantle"}
    
	sets.midcast.Provoke = sets.midcast.Enmity
	sets.midcast['Animated Flourish'] = sets.midcast.Enmity
    
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    sets.resting = {neck="Creed Collar",
        ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Austerity Belt"}
    

    -- Idle sets
    sets.idle = {ammo="Bibiki Seashell",
        head="Walahra Turban",neck="Orochi Nodowa",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Scorpion Harness +1",hands="Garden Bangles",ring1="Jelly Ring",ring2="Defending Ring",
        back="Shadow Mantle",waist="Velocious Belt",legs="Enkidu's Subligar",feet="Enkidu's Leggings"}

    
    sets.Kiting = {legs="Crimson Cuisses"}

    sets.latent_refresh = {waist="Fucho-no-obi"}


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
    
    sets.engaged.Haste = {ammo="Bibiki Seashell",
        head="Walahra Turban",neck="Love Torque",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Rapparee Harness",hands="Dusk Gloves +1 +1",ring1="Rajas Ring",ring2="Toreador's Ring",
        back="Etoile Cape",waist="Velocious Belt",legs="Etoile Tights +1",feet="Dusk Ledelsens +1"}

    sets.engaged.Acc = {ammo="Bibiki Seashell",
        head="Walahra Turban",neck="Peacock Amulet",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Etoile Casaque +1",hands="Enkidu's Mittens",ring1="Rajas Ring",ring2="Toreador's Ring",
        back="Etoile Cape",waist="Potent Belt",legs="Etoile Tights +1",feet="Etoile Shoes"}
		
	sets.engaged.DD = {ammo="Bibiki Seashell",
        head="Walahra Turban",neck="Love Torque",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Enkidu's Harness",hands="Dusk Gloves +1",ring1="Rajas Ring",ring2="Toreador's Ring",
        back="Cerberus Mantle",waist="Velocious Belt",legs="Etoile Tights +1",feet="Dusk Ledelsens +1"}	

	sets.engaged.Eva = {ammo="Bibiki Seashell",
        head="Walahra Turban",neck="Evasion Torque",ear1="Suppanomimi",ear2="Ethereal Earring",
        body="Scorpion Harness +1",hands="Dusk Gloves +1 +1",ring1="Jelly Ring",ring2="Defending Ring",
        back="Shadow Mantle",waist="Velocious Belt",legs="Etoile Tights +1",feet="Dusk Ledelsens +1"}
    sets.engaged.PDT = {ammo="Bibiki Seashell",
        head="Darksteel Cap +1",neck="Ritter Gorget",ear1="Cassie Earring",ear2="Brutal Earring",
        body="Darksteel Harness +1",hands="Darksteel Mittens +1",ring1="Jelly Ring",ring2="Sattva Ring",
        back="Shadow Mantle",waist="Ocean Sash",legs="Darksteel Subligar +1",feet="Darksteel Leggings +1"}
    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, {body="Crimson Scale Mail",neck="Twilight Torque",ring1="Defending Ring"})

end



-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(1, 19)
    elseif player.sub_job == 'WAR' then
        set_macro_page(2, 19)
    elseif player.sub_job == 'RDM' then
        set_macro_page(3, 19)
     else
        set_macro_page(1, 19)
    end
end

