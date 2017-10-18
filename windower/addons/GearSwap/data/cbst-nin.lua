function get_sets()                
    sets.precast = {}
    sets.precast.Charm = {Main="Iridal Staff",
        head="Totemic Helm +1",neck="Beast Whistle",ear1="Enchanter's Earring",ear2="Reverie Earring +1",
        body="Monster Jackcoat",hands="Trainer's Gloves",ring1="Loyalty Ring +1",ring2="Pearl Ring",
        back="Aisance Mantle +1",waist="Corsette",legs="Ankusa Trousers +1",feet="Dance Shoes"}
	sets.precast.Reward = {ammo="Pet Food Zeta",
        head="Stout Bonnet",neck="Aife's Medal",ear1="Lifestorm Earring",ear2="Neptune's Pearl",
        body="Monster Jackcoat",hands="Ogre Gloves",ring1="Aquasoul Ring",ring2="Aquasoul Ring",
        back="Pastoralist's Mantle",waist="Crudelis Belt",legs="Ankusa Trousers +1",feet="Beast Gaiters"}	
    sets.precast.Chakra = {ammo="Iron Gobbet",body="Anchorite's Cyclas",hands="Melee Gloves +2",ring2="Dark Ring"}
    sets.precast.Counterstance = {feet="Melee Gaiters +2"}
    sets.precast.Dodge = {feet="Anchorite's Gaiters"}
    sets.precast.Mantra = {feet="Melee Gaiters +2"}
    sets.precast.Waltz = {head="Anwig Salade",neck="Dualism Collar",ring1="Valseur's Ring",ring2="Veela Ring",
        waist="Aristo Belt",legs="Desultor Tassets",feet="Dance Shoes"}
        
    sets.precast['Victory Smite'] = {main="Oatixur",ammo="Potestas Bomblet",head="Uk'uxkaj Cap",neck="Light Gorget",
        ear1="Moonshade Earring",ear2="Brutal Earring",body="Manibozho Jerkin",hands="Otronif Gloves",
        ring1="Pyrosoul Ring",ring2="Epona's Ring",back="Rancorous Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",
        feet="Manibozho Boots"}
        
    sets.precast.WS = {main="Oatixur",ammo="Potestas Bomblet",head="Whirlpool Mask",neck="Justiciar's Torque",
        ear1="Steelflash Earring",ear2="Bladeborn Earring",body="Manibozho Jerkin",hands="Mel. Gloves +2",
        ring1="Rajas Ring",ring2="Pyrosoul Ring",back="Atheling Mantle",waist="Black Belt",legs="Manibozho Brais",
        feet="Manibozho Boots"}
    
    sets.TP = {}
    sets.TP.DD = {ammo="Paeapua",main="Zoraal Ja's Axe",Sub="Zoraal Ja's Axe",
        head="Walahra Turban",neck="Fang Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Ogre Jerkin",hands="Dusk Gloves",ring1="Fluorite Ring",ring2="Fluorite Ring",
        back="Atheling Mantle",waist="Headlong Belt",legs="Xaddi Cuisses",feet="Dusk Ledelsens"}
	
    sets.TP.Acc = {main="Oatixur",ammo="Potestas Bomblet",head="Whirlpool Mask",neck="Asperity Necklace",
        ear1="Steelflash Earring",ear2="Bladeborn Earring",body="Manibozho Jerkin",hands="Otronif Gloves",
        ring1="Defending Ring",ring2="Epona's Ring",back="Letalis Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",
        feet="Anchorite's Gaiters"}
        
    sets.TP.Solo = {main="Oatixur",ammo="Potestas Bomblet",head="Whirlpool Mask",neck="Twilight Torque",
        ear1="Steelflash Earring",ear2="Bladeborn Earring",body="Thaumas Coat",hands="Otronif Gloves",
        ring1="Rajas Ring",ring2="Epona's Ring",back="Atheling Mantle",waist="Black Belt",legs="Quiahuiz Leggings",
        feet="Anchorite's Gaiters"}
    
    sets.DT = {ammo="Iron Gobbet",neck="Twilight Torque",ear1="Merman's Earring",body="Manibozho Jerkin",
        hands="Otronif Gloves",ring1="Defending Ring",ring2="Dark Ring",back="Mollusca Mantle",waist="Black Belt"}  
    sets.aftercast.Idle = {ammo="Demonry Core",head="Empress Hairpin",neck="Fang Necklace",ear1="Dodge Earring",ear2="Dodge Earring",
        body="Ogre Jerkin",hands="Trainer's Gloves",ring1="Paguroidea Ring",ring2="Sheltered Ring",
        back="Pastoralist's Mantle",waist="Muscle Belt +1",legs="Ferine Quijotes +2",feet="Dance Shoes"}
end

function precast(spell)
    if player.equipment.head == 'Reraise Hairpin' then disable('head')
    else enable('head') end
    if player.equipment.left_ear == 'Reraise Earring' then disable('ear1')
    else enable('ear1') end
    if sets.precast[spell.english] then
        equip(sets.precast[spell.english])
    elseif spell.type=="WeaponSkill" then
        equip(sets.precast.WS)
    elseif string.find(spell.english,'Waltz') then
        equip(sets.precast.Waltz)
    end
end

function midcast(spell)
end

function aftercast(spell)
    if player.status =='Engaged' then
        equip(sets.aftercast.TP)
    else
        equip(sets.aftercast.Idle)
    end
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        equip(sets.aftercast.Idle)
    elseif new == 'Engaged' then
        equip(sets.aftercast.TP)
    end
end

function self_command(command)
    if command == 'toggle TP set' then
        if sets.aftercast.TP == sets.TP.DD then
            sets.aftercast.TP = sets.TP.Solo
            send_command('@input /echo SOLO SET')
        elseif sets.aftercast.TP == sets.TP.Solo then
            sets.aftercast.TP = sets.TP.DD
            send_command('@input /echo DD SET')
        end
    elseif command == 'DT' then
        equip(sets.DT)
    end
end