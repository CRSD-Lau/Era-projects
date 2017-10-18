-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
    
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false


    blue_magic_maps = {}
    
    -- Mappings for gear sets to use for various blue magic spells.
    -- While Str isn't listed for each, it's generally assumed as being at least
    -- moderately signficant, even for spells with other mods.
    
    -- Physical Spells --
    
    -- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{
        'Bilgestorm'
    }

    -- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }

    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
        'Battle Dance','Bloodrake','Death Scissors','Dimensional Death',
        'Empty Thrash','Quadrastrike','Sinker Drill','Spinal Cleave',
        'Uppercut','Vertical Cleave'
    }
        
    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{
        'Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone','Disseverment',
        'Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad',
        'Seedspray','Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault',
        'Vanity Dive'
    }
        
    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
        'Body Slam','Delta Thrust','Glutinous Dart','Grand Slam',
        'Power Attack','Quad. Continuum','Sprout Smack','Sub-zero Smash'
    }
        
    -- Physical spells with Vit and Def stat mod
    blue_magic_maps.PhysicalVitDef = S{
        'Cannonball'
    }
	
    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
        'Benthic Typhoon','Feather Storm','Helldive','Hydro Shot','Jet Stream',
        'Pinecone Bomb','Spiral Spin','Wild Oats'
    }

    -- Physical spells with Int stat mod
    blue_magic_maps.PhysicalInt = S{
        'Mandibular Bite','Queasyshroom'
    }

    -- Physical spells with Mnd stat mod
    blue_magic_maps.PhysicalMnd = S{
        'Ram Charge','Screwdriver','Tourbillion'
    }

    -- Physical spells with Chr stat mod
    blue_magic_maps.PhysicalChr = S{
        'Bludgeon'
    }

    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{
        'Final Sting'
    }

    -- Magical Spells --

    -- Magical spells with the typical Int mod
    blue_magic_maps.Magical = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Dark Orb','Death Ray',
        'Diffusion Ray','Droning Whirlwind','Embalming Earth','Firespit','Foul Waters',
        'Ice Break','Leafstorm','Maelstrom','Rail Cannon','Regurgitation','Rending Deluge',
        'Retinal Glare','Subduction','Tem. Upheaval','Water Bomb'
    }

    -- Magical spells with a primary Mnd mod
    blue_magic_maps.MagicalMnd = S{
        'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast'
    }

    -- Magical spells with a primary Chr mod
    blue_magic_maps.MagicalChr = S{
        'Eyes On Me','Mysterious Light'
    }

    -- Magical spells with a Vit stat mod (on top of Int)
    blue_magic_maps.MagicalVit = S{
        'Thermal Pulse'
    }

    -- Magical spells with a Dex stat mod (on top of Int)
    blue_magic_maps.MagicalDex = S{
        'Charged Whisker','Gates of Hades'
    }
            
    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
        'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
        'Cimicine Discharge','Cold Wave','Corrosive Ooze','Demoralizing Roar','Digest',
        'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
        'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance',
        'Lowing','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind',
        'Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn'
    }
        
    -- Breath-based spells
    blue_magic_maps.Breath = S{
        'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath','Self-Destruct',
        'Thunder Breath','Vapor Spray','Wind Breath'
    }

    -- Stun spells
    blue_magic_maps.Stun = S{
        'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
        'Thunderbolt','Whirl of Rage'
    }
        
    -- Healing spells
    blue_magic_maps.Healing = S{
        'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','White Wind',
        'Wild Carrot'
    }
    
    -- Buffs that depend on blue magic skill
    blue_magic_maps.SkillBasedBuff = S{
        'Barrier Tusk','Diamondhide','Magic Barrier','Metallic Body','Plasma Charge',
        'Pyric Bulwark','Reactor Cool',
    }

    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
        'Memento Mori','Nat. Meditation','Occultation','Orcish Counterstance','Refueling',
        'Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promyvion',
        'Zephyr Mantle'
    }
    
    
    -- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{
        'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
        'Crashing Thunder','Droning Whirlwind','Gates of Hades','Harden Shell','Polar Roar',
        'Pyric Bulwark','Thunderbolt','Tourbillion','Uproot'
    }
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Breath', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
	state.PhysicalDefenseMode:options('PDT', 'MDT', 'Breath')
    state.IdleMode:options('Normal', 'DW', 'PDT', 'Breath')

  
    -- Additional local binds
    send_command('bind !x input /ja "Chain Affinity" <me>')
    send_command('bind !c input /ja "Burst Affinity" <me>')

    update_combat_form()
    select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind !x')
    send_command('unbind !c')
end


-- Set up gear sets.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    sets.buff['Burst Affinity'] = {feet="Mavi Basmak +2"}
    sets.buff['Chain Affinity'] = {head="Mavi Kavuk +2", feet="Assimilator's Charuqs"}
    sets.buff.Convergence = {head="Luhlaza Keffiyeh"}
    sets.buff.Diffusion = {feet="Luhlaza Charuqs"}
    sets.buff.Enchainment = {body="Luhlaza Jubbah"}
    sets.buff.Efflux = {legs="Mavi Tayt +2"}

    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Azure Lore'] = {hands="Mirage Bazubands +1 +2"}

	sets.midcast.Enmity = {ear1="Hades Earring +1",ear2="Hades Earring +1",waist="Trance Belt",
        neck="Ritter Gorget",ring1="Sattva Ring",ring2="Corneus Ring",hands="Homam Manopolas",back="Cerberus Mantle"}
    
	sets.midcast.Provoke = sets.midcast.Enmity
	sets.midcast['Animated Flourish'] = sets.midcast.Enmity

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Bibiki Seashell",head="Mirage Keffiyeh +1",ring1="Sattva Ring",ring2="Light Ring",waist="Steppe Sash"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
	sets.precast.Step = {neck="Peacock Amulet",body="Homam Corazza",head="Enkidu's Cap",legs="Mirage Shalwar +1"}
    
	
    -- Fast cast sets for spells
    
    sets.precast.FC = {ear2="Loquacious Earring", Legs="Homam Cosciales"}
        
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Mavi Mintan +2"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Homam Zucchetto",neck="Fotia Gorget",
        body="Magus Jubbah +1",hands="Enkidu's Mittens",ring2="Toreador's Ring",ring1="Flame Ring",
        back="Cerberus Mantle",legs="Enkidu's Subligar",feet="Marine M Boots"}
    
    sets.precast.WS.acc = set_combine(sets.precast.WS, {hands="Buremte Gloves"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = {
        head="Homam Zucchetto",neck="Fotia Gorget",
        body="Magus Jubbah +1",hands="Enkidu's Mittens",ring2="Toreador's Ring",ring1="Flame Ring",
        back="Cerberus Mantle",legs="Enkidu's Subligar",feet="Marine M Boots"}

    sets.precast.WS['Savage Blade'] = {
        head="Homam Zucchetto",neck="Fotia Gorget",
        body="Magus Jubbah +1",hands="Enkidu's Mittens",ring2="Toreador's Ring",ring1="Flame Ring",
        back="Cerberus Mantle",legs="Enkidu's Subligar",feet="Marine M Boots"}
    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Walahra Turban",ear2="Loquacious Earring",hands="Homam Manopolas",
        waist="Velocious Belt",legs="Homam Cosciales",feet="Dusk Ledelsens +1"}
        
    sets.midcast['Blue Magic'] = {}
    
    -- Physical Spells --
    
    sets.midcast['Blue Magic'].Physical = {ammo="Bibiki Seashell",
        head="Mirage Keffiyeh +1",neck="Peacock Amulet",ear1="Brutal Earring",ear2="Pixie Earring",
        body="Magus Jubbah +1",hands="Enkidu's Mittens",ring1="Rajas Ring",ring2="Flame Ring",
        back="Cerberus Mantle",waist="Ocean Sash",legs="Mirage Shalwar +1",feet="Enkidu's Leggings"}

    sets.midcast['Blue Magic'].PhysicalAcc = {ammo="Bibiki Seashell",
        head="Homam Zucchetto",neck="Peacock Amulet",ear1="Brutal Earring",ear2="Pixie Earring",
        body="Magus Jubbah +1",hands="Homam Manopolas",ring1="Rajas Ring",ring2="Flame Ring",
        back="Mirage Mantle",waist="Ocean Sash",legs="Homam Cosciales",feet="Enkidu's Leggings"}

    sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical,
        {body="Iuitl Vest",hands="Assimilator's Bazubands +1",legs="Enkidu's Subligar",ear1="Harmonius Earring"})

    sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical,
        {ammo="Jukukik Feather",head="Enkidu's Cap",body="Iuitl Vest",hands="Mirage Bazubands +1 +1",
         waist="Chaac Belt",legs="Magus Shalwar +1",ring2="Thunder Ring",feet="Blood Greaves"})

    sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical,
        {head="Mirage Keffiyeh +1",legs="Magus Shalwar +1",ring2="Soil Ring",neck="Fortitude Torque",waist="Ocean Sash"})
		
    sets.midcast['Blue Magic'].PhysicalVitDef = set_combine(sets.midcast['Blue Magic'].Physical,
        {head="Crimson Mask",body="Crimson Scale Mail",back="Shadow Mantle",neck="Ritter Gorget",
		hands="Crimson Finger Gauntlets",waist="Ocean Sash",legs="Blood Cuisses",feet="Blood Greaves",
		ring1="Krousis Ring +1",ring2="Krousis Ring +1",ammo="Bibiki Seashell",ear1="Intruder Earring",ear2="Cassie Earring"})

    sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical,
        {body="Vanir Cotehardie",hands="Iuitl Wristbands",ring2="Stormsoul Ring",
         waist="Chaac Belt",legs="Magus Shalwar +1",feet="Blood Greaves"})

    sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical,
        {neck="Philomath Stole",body="Crimson Scale Mail",ring2="Snow Ring",back="Prism Cape",
		legs="Mahatma Slops",hands="Errant Cuffs"})

    sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical,
        {ear1="Lifestorm Earring",body="Crimson Scale Mail",hands="Mirage Bazubands +1",legs="Mahatma Slops",
         ring2="Aqua Ring",back="Prism Cape"})

    sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical,
        {body="Mahatma Houppelande",hands="Assimilator's Bazubands +1",back="Refraction Cape",
         waist="Chaac Belt", ring2="Light Ring"})

    sets.midcast['Blue Magic'].PhysicalHP = 
		{ammo="Bibiki Seashell",head="Saurian Helm",neck="Ritter Gorget",hands="Crimson Finger Gauntlets",
		ear1="Harmonius Earring", ear2="Cassie Earring", body="Crimson Scale Mail", ring1="Bloodbead Ring", ring2="Bomb Queen Ring",
		back="Gigant Mantle", waist="Ocean Sash", legs="Homam Cosciales", feet="Marine M Boots"}

    -- Magical Spells --
    
    sets.midcast['Blue Magic'].Magical = {head="Homam Zucchetto",ear1="Moldavite Earring",ear2="Loquacious Earring",
        body="Magus Jubbah +1", back="Prism Cape",waist="Caudata Belt",legs="Mahatma Slops",ammo="Sturm's Report"}

    sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
        {body="Vanir Cotehardie",ring1="Sangoma Ring",legs="Iuitl Tights",feet="Mavi Basmak +2"})
    
    sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical,
        {body="Mahatma Houppelande",hands="Mirage Bazubands +1",ring2="Aqua Ring",back="Prism Cape",
		legs="Mahatma Slops"})

    sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical,
		{body="Mahatma Houppelande",legs="Mahatma Slops",back="Prism Cape",ring2="Light Ring"})
		
    sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical,
        {legs="Magus Shalwar +1",ring2="Soil Ring"})

    sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical,
		{legs="Magus Shalwar +1",hands="Mirage Bazubands +1",ring2="Thunder Ring"})

    sets.midcast['Blue Magic'].MagicAccuracy = {head="Homam Zucchetto",body="Nashira Manteel",
        back="Mirage Mantle",legs="Mirage Shalwar +1"}

    -- Breath Spells --
    
    sets.midcast['Blue Magic'].Breath = {ammo="Bibiki Seashell",head="Saurian Helm",neck="Ritter Gorget",hands="Crimson Finger Gauntlets",
		ear1="Harmonius Earring", ear2="Cassie Earring", body="Crimson Scale Mail", ring1="Bloodbead Ring", ring2="Bomb Queen Ring",
		back="Gigant Mantle", waist="Ocean Sash", legs="Homam Cosciales", feet="Marine M Boots"}

    -- Other Types --
    
    sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy,
        {body="Magus Jubbah +1"})
        
    sets.midcast['Blue Magic'].Healing = {ear2="Loquacious Earring",ammo="Bibiki Seashell",
        body="Crimson Scale Mail",hands="Mirage Bazubands +1", back="Prism Cape",legs="Mahatma Slops",
		neck="Fortitude Torque",ring1="Soil Ring",ring2="Aqua Ring",head="Magus Keffiyeh"}

    sets.midcast['Blue Magic'].SkillBasedBuff = {head="Mirage Keffiyeh +1",body="Magus Jubbah +1"}

    sets.midcast['Blue Magic'].Buff = {}
    
    
    -- Sets to return to when not performing an action.

    -- Gear for learning spells: +skill and AF hands.
    sets.Breath = {ammo="Bibiki Seashell",head="Saurian Helm",neck="Ritter Gorget",hands="Crimson Finger Gauntlets",
		ear1="Harmonius Earring",ear2="Cassie Earring", body="Crimson Scale Mail", ring1="Bloodbead Ring", ring2="Bomb Queen Ring",
		back="Gigant Mantle", waist="Ocean Sash", legs="Homam Cosciales", feet="Marine M Boots"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Resting sets
    sets.resting = {main="Chatoyant Staff", ammo="Bibiki Seashell",head="Mirror Tiara",body="Mahatma Houppelande",
		feet="Numerist Pumps"}
    
    -- Idle sets
    sets.idle = {main="Tizona", ammo="Bibiki Seashell",
        head="Crimson Mask",neck="Orochi Nodowa",ear1="Merman's Earring",ear2="Ethereal Earring",
        body="Mirage Jubbah +1",hands="Garden Bangles",ring1="Jelly Ring",ring2="Defending Ring",
        back="Shadow Mantle",waist="Ocean Sash",legs="Blood Cuisses",feet="Blood Greaves", sub="Genbu's Shield"}

	sets.idle.DW = {main="Tizona", ammo="Bibiki Seashell",
        head="Crimson Mask",neck="Orochi Nodowa",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Mirage Jubbah +1",hands="Garden Bangles",ring1="Jelly Ring",ring2="Soil Ring",
        back="Shadow Mantle",waist="Velocious Belt",legs="Blood Cuisses",feet="Blood Greaves", sub="Beast Slayer"}
    
	sets.idle.PDT = {main="Tizona",ammo="Bibiki Seashell",head="Darksteel Cap +1",neck="Ritter Gorget",hands="Darksteel Mittens +1",
		ear1="Ethereal Earring", ear2="Cassie Earring", body="Darksteel Harness +1", ring1="Jelly Ring", ring2="Defending Ring",
		back="Shadow Mantle", waist="Ocean Sash", legs="Darksteel Subligar +1", feet="Darksteel Leggings +1", sub="Genbu's Shield"}

    sets.idle.Town = {main="Buramenk'ah",ammo="Bibiki Seashell",
        head="Saurian Helm",neck="Fortitude Torque",ear1="Brutal Earring",ear2="Ethereal Earring",
        body="Homam Corazza",hands="Assimilator's Bazubands +1",ring1="Sheltered Ring",ring2="Toreador's Ring",
        back="Shadow Mantle",waist="Velocious Belt",legs="Blood Cuisses",feet="Luhlaza Charuqs"}

    sets.idle.Breath = {ammo="Bibiki Seashell",head="Saurian Helm",neck="Ritter Gorget",hands="Crimson Finger Gauntlets",
		ear1="Bloodbead Earring",ear2="Cassie Earring", body="Crimson Scale Mail", ring1="Bloodbead Ring", ring2="Bomb Queen Ring",
		back="Gigant Mantle", waist="Ocean Sash", legs="Homam Cosciales", feet="Marine M Boots"}

    
    -- Defense sets
    sets.defense.PDT = {ammo="Bibiki Seashell",head="Saurian Helm",neck="Ritter Gorget",hands="Darksteel Mittens +1",
		ear1="Ethereal Earring", ear2="Cassie Earring", body="Darksteel Harness +1", ring1="Jelly Ring", ring2="Defending Ring",
		back="Shadow Mantle", waist="Ocean Sash", legs="Darksteel Subligar +1", feet="Darksteel Leggings +1"}

    sets.defense.MDT = {ammo="Bibiki Seashell",
        head="Walahra Turban",neck="Fortitude Torque",ear1="Merman's Earring",ear2="Merman's Earring",
        body="Crimson Scale Mail",hands="Homam Manopolas",ring1="Shadow Ring",ring2="Defending Ring",
        back="Shadow Mantle",waist="Velocious Belt",legs="Homam Cosciales",feet="Dusk Ledelsens +1"}
		
	sets.defense.Breath = {ammo="Bibiki Seashell",head="Saurian Helm",neck="Ritter Gorget",hands="Crimson Finger Gauntlets",
		ear1="Bloodbead Earring",ear2="Cassie Earring", body="Crimson Scale Mail", ring1="Bloodbead Ring", ring2="Bomb Queen Ring",
		back="Gigant Mantle", waist="Ocean Sash", legs="Homam Cosciales", feet="Marine M Boots"}

    sets.Kiting = {legs="Blood Cuisses"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {main="Tizona", ammo="Bibiki Seashell",
        head="Walahra Turban",neck="Fortitude Torque",ear1="Brutal Earring",ear2="Ethereal Earring",
        body="Mirage Jubbah +1",hands="Dusk Gloves +1",ring1="Rajas Ring",ring2="Toreador's Ring",
        back="Cerberus Mantle",waist="Velocious Belt",legs="Homam Cosciales",feet="Dusk Ledelsens +1", sub="Genbu's Shield"}

    sets.engaged.Acc = {ammo="Jukukik Feather",
        head="Walahra Turban",neck="Peacock Amulet",ear1="Brutal Earring",ear2="Pixie Earring",
        body="Homam Corazza",hands="Homam Manopolas",ring1="Rajas Ring",ring2="Toreador's Ring",
        back="Mirage Mantle",waist="Velocious Belt",legs="Homam Cosciales",feet="Dusk Ledelsens +1"}

    sets.engaged.DW = {main="Tizona", ammo="Bibiki Seashell",
        head="Walahra Turban",neck="Fortitude Torque",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Mirage Jubbah +1",hands="Homam Manopolas",ring1="Rajas Ring",ring2="Toreador's Ring",
        back="Cerberus Mantle",waist="Velocious Belt",legs="Homam Cosciales",feet="Dusk Ledelsens +1", sub="Beast Slayer"}

    sets.engaged.DW.Acc = {ammo="Jukukik Feather",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
        body="Luhlaza Jubbah",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Letalis Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Qaaxo Leggings"}

    sets.engaged.DW.Refresh = {ammo="Jukukik Feather",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
        body="Luhlaza Jubbah",hands="Assimilator's Bazubands +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Letalis Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Qaaxo Leggings"}

    sets.engaged.Breath = {main="Tizona", ammo="Bibiki Seashell",head="Saurian Helm",neck="Ritter Gorget",hands="Crimson Finger Gauntlets",
		ear1="Bloodbead Earring",ear2="Cassie Earring", body="Crimson Scale Mail", ring1="Bloodbead Ring", ring2="Bomb Queen Ring",
		back="Gigant Mantle", waist="Ocean Sash", legs="Homam Cosciales", feet="Marine M Boots", sub="Genbu's Shield"}
		
    sets.engaged.DW.Breath = {main="Tizona", ammo="Bibiki Seashell",head="Saurian Helm",neck="Ritter Gorget",hands="Crimson Finger Gauntlets",
		ear1="Bloodbead Earring",ear2="Cassie Earring", body="Crimson Scale Mail", ring1="Bloodbead Ring", ring2="Bomb Queen Ring",
		back="Gigant Mantle", waist="Ocean Sash", legs="Homam Cosciales", feet="Marine M Boots", sub="Beast Slayer"}

	sets.engaged.PDT = {ammo="Bibiki Seashell",head="Saurian Helm",neck="Ritter Gorget",hands="Darksteel Mittens +1",
		ear1="Ethereal Earring", ear2="Cassie Earring", body="Darksteel Harness +1", ring1="Jelly Ring", ring2="Defending Ring",
		back="Shadow Mantle", waist="Ocean Sash", legs="Darksteel Subligar +1", feet="Darksteel Leggings +1"}
		
    sets.self_healing = {ring1="Kunaji Ring",ring2="Asklepian Ring"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if unbridled_spells:contains(spell.english) and not state.Buff['Unbridled Learning'] then
        eventArgs.cancel = true
        windower.send_command('@input /ja "Unbridled Learning" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
    end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Add enhancement gear for Chain Affinity, etc.
    if spell.skill == 'Blue Magic' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
        if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
            equip(sets.self_healing)
        end
    end

    -- If in learning mode, keep on gear intended to help with that, regardless of action.
    if state.OffenseMode.value == 'Breath' then
        equip(sets.Breath)
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        state.Buff[buff] = gain
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
-- Return custom spellMap value that can override the default spell mapping.
-- Don't return anything to allow default spell mapping to be used.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Blue Magic' then
        for category,spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
                return category
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
    -- Check for H2H or single-wielding
    if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
        state.CombatForm:set('DW')
    else
        state.CombatForm:reset()
    end
end



-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 16)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 16)
	else
        set_macro_page(3, 16)
    end
end
