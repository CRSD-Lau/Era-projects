function get_sets()                
    sets.precast = {}
    sets.precast.Charm = {Main="Iridal Staff",
        head="Totemic Helm +1",neck="Beast Whistle",ear1="Enchanter's Earring",ear2="Reverie Earring +1",
        body="Monster Jackcoat",hands="Trainer's Gloves",ring1="Loyalty Ring +1",ring2="Pearl Ring",
        back="Aisance Mantle +1",waist="Corsette",legs="Ankusa Trousers +1",feet="Dance Shoes"}
	sets.precast.Tame = {}
	sets.precast.Reward = {ammo="Pet Food Zeta",
        head="Stout Bonnet",neck="Aife's Medal",ear1="Lifestorm Earring",ear2="Neptune's Pearl",
        body="Monster Jackcoat",hands="Ogre Gloves",ring1="Aquasoul Ring",ring2="Aquasoul Ring",
        back="Pastoralist's Mantle",waist="Crudelis Belt",legs="Ankusa Trousers +1",feet="Beast Gaiters"}

	sets.precast.Waltz = {}
	sets.TP = {ammo="Paeapua",main="Zoraal Ja's Axe",Sub="Zoraal Ja's Axe",
        head="Walahra Turban",neck="Fang Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Ogre Jerkin",hands="Dusk Gloves",ring1="Fluorite Ring",ring2="Fluorite Ring",
        back="Atheling Mantle",waist="Headlong Belt",legs="Xaddi Cuisses",feet="Dusk Ledelsens"}

	sets.idle = {ammo="Demonry Core",Main="Earth Staff",
        head="Empress Hairpin",neck="Fang Necklace",ear1="Dodge Earring",ear2="Dodge Earring",
        body="Ogre Jerkin",hands="Trainer's Gloves",ring1="Paguroidea Ring",ring2="Sheltered Ring",
        back="Pastoralist's Mantle",waist="Muscle Belt +1",legs="Ferine Quijotes +2",feet="Dance Shoes"}

end
	
function aftercast(spell)
    if player.status =='Engaged' then
        equip(sets.aftercast.TP)
    else
        equip(sets.aftercast.Idle)
    end
end

function aftercast(spell)
    if player.status =='Engaged' then
        equip(sets.TP)
    else
        equip(sets.Idle)
    end
end
