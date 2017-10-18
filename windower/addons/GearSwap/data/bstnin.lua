function get_sets()                
    sets.precast = {}
    sets.precast.Charm = {main="Light Staff",body="Monster Jackcoat",neck="Beast Whistle",head="Beast Helm",feet="Beast Gaiters",hands="Trainer's Gloves",waist="Corsette"}
	
	sets.precast.Tame = {}
	sets.precast.Reward = {ammo="Pet Food Zeta",main="Zoraal Ja's Axe",body="Monster Jackcoat",feet="Beast Gaiters"}
	
	sets.precast.Waltz = {}
	sets.TP = {main="Zoraal Ja's Axe",sub="Tabar",ammo="Potestas Bomblet",head="Empress Hairpin",neck="Fang Necklace",
        ear1="Bone Earring",ear2="Bone Earring",body="Ogre Jerkin",hands="Ogre Gloves",
        ring1="Rajas Ring",ring2="Epona's Ring",back="Amemet Mantle",waist="Headlong Belt",legs="Quiahuiz Leggings",
        feet="Bounding Boots"}
	
	sets.idle = {}
	
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
