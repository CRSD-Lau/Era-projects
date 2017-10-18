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
    state.OffenseMode:options('Haste', 'TH', 'Acc', 'Eva', 'MDT')
    state.WeaponskillMode:options('Normal', 'Acc')
    

    send_command('bind !a input /ja Flee')
	send_command('bind !x input /ja Trick Attack')
	send_command('bind !c input /ja hide')
	send_command('bind !z input /ja Sneak Attack')

    select_default_macro_book()
end

function user_unload()
    send_command('unbind !x')
	send_command('unbind !c')
	send_command('unbind !a')
	send_command('unbind !z')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Steal'] = {hands="Rogue's Armlets", head="Rogue's Bonnet", legs="Rogue's Culottes"}
    sets.precast.JA['Flee'] = {feet="Rogue's Poulaines"}
    sets.precast.JA['Mug'] = {head="Assassin's Bonnet"}
    sets.precast.JA['Hide'] = {body="Rogue's Vest"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ring1="Sattva Ring",ring2="Soil Ring"}
		
	sets.precast.Step = {neck="Peacock Amulet",body="Homam Corazza",head="Homam Zucchetto",
	hands="Dancer's Bangles",feet="Etoile Shoes"}

	sets.precast.Samba = {head="Dancer's Tiara"}
	
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
	sets.precast.Ninjutsu = {head="Walahra Turban",ear1="Suppanomimi",ear2="Loquacious Earring",
        body="Rapparee Harness",hands="Dusk Gloves",
        waist="Velocious Belt",legs="Homam Cosciales",feet="Dusk Ledelsens +1"}
    -- Fast cast sets for spells
    
    sets.precast.FC = {ear2="Loquacious Earring",legs="Homam Cosciales"}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {head="Homam Zucchetto",neck="Fotia Gorget",
        body="Hecatomb Harness",hands="Hecatomb Mittens +1",ring1="Thunder Ring",ring2="Rajas Ring",
        back="Assassin's Cape",waist="Potent Belt",legs="Enkidu's Subligar",feet="Hecatomb Leggings"}

    sets.precast.WS.Acc = {head="Homam Zucchetto",neck="Fotia Gorget",ear1="Ethereal Earring",ear2="Brutal Earring",
        body="Hecatomb Harness",hands="Hecatomb Mittens +1",ring1="Thunder Ring",ring2="Rajas Ring",
        back="Assassin's Cape",waist="Scouter's Rope",legs="Enkidu's Subligar",feet="Hecatomb Leggings"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {ring1="Flame Ring",back="Cerberus Mantle",
	head="Enkidu's Cap"})
	
	sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS, {ring1="Thunder Ring",back="Assassin's Cape",
	head="Enkidu's Cap",feet="Assassin's Poulaines",hands="Assassin's Armlets +1"})
	
	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ring1="Thunder Ring",back="Assassin's Cape",
	head="Enkidu's Cap",feet="Hecatomb Leggings",hands="Hecatomb Mittens +1"})
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Walahra Turban",
        body="Rapparee Harness",hands="Dusk Gloves",ear1="Loquacious Earring",
        waist="Velocious Belt",legs="Homam Cosciales",feet="Dusk Ledelsens +1"}        
	
	sets.midcast['Ninjutsu'] = sets.midcast.FastRecast
    
	--------------------------------------
	--  Engaged Sets --
	--------------------------------------
	
	sets.engaged.Haste = {
        head="Walahra Turban",neck="Peacock Amulet",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Rapparee Harness",hands="Dusk Gloves",ring1="Thunder Ring",ring2="Rajas Ring",
        back="Assassin's Cape",waist="Velocious Belt",legs="Homam Cosciales",feet="Dusk Ledelsens +1"}
		
    sets.engaged.TH = {main = "Mandau",Sub = "Thief's Knife",range="Raider's Bmrng.",
        head="Walahra Turban",neck="Peacock Amulet",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Rapparee Harness",hands="Assassin's Armlets +1",ring1="Thunder Ring",ring2="Rajas Ring",
        back="Assassin's Cape",waist="Velocious Belt",legs="Homam Cosciales",feet="Dusk Ledelsens +1"}
		
	sets.engaged.Acc = {range="Raider's Bmrng.",
        head="Homam Zucchetto",neck="Peacock Charm",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Homam Corazza",hands="Enkidu's Mittens",ring1="Thunder Ring",ring2="Rajas Ring",
        back="Assassin's Cape",waist="Velocious Belt",legs="Homam Cosciales",feet="Enkidu's Leggings"}
		
	sets.engaged.Eva = {main = "Mandau",sub = "Thief's Knife",
        head="Empress Hairpin",neck="Peacock Amulet",ear1="Suppanomimi Earring",ear2="Brutal Earring",
        body="Scorpion Harness +1",hands="Enkidu's Mittens",ring1="Breeze Ring",ring2="Breeze Ring",
        back="Boxer's Mantle",waist="Scouter's Rope",legs="Homam Cosciales",feet="Enkidu's Leggings"}
		
	sets.engaged.MDT = {}
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

     
 

    -- Idle sets
    sets.idle = {head="Walahra Turban",neck="Peacock Amulet",ear1="Suppanomimi Earring",ear2="Brutal Earring",
        body="Scorpion Harness +1",hands="Assassin's Armlets +1",ring1="Breeze Ring",ring2="Rajas Ring",
        back="Boxer's Mantle",waist="Scouter's Belt",legs="Homam Cosciales",feet="Trotter Boots"}

    
    
     sets.Kiting = {feet="Trotter Boots"}

end






-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(1, 6)
    elseif player.sub_job == 'DNC' then
        set_macro_page(2, 6)
    elseif player.sub_job == 'BST' then
        set_macro_page(3, 6)
     else
        set_macro_page(1, 6)
    end
end

