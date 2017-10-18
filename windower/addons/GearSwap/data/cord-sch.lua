-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
        Custom commands:
        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.
                                        Light Arts              Dark Arts
        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
        gs c scholar power              Rapture                 Ebullience
        gs c scholar duration           Perpetuance
        gs c scholar accuracy           Altruism                Focalization
        gs c scholar enmity             Tranquility             Equanimity
        gs c scholar skillchain                                 Immanence
        gs c scholar addendum           Addendum: White         Addendum: Black
--]]



-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

   sets.obi = {Fire = {waist="Karin Obi"},
      Earth = {waist="Dorin Obi"},
      Water = {waist="Suirin Obi"},
      Wind = {waist="Furin Obi"},
      Ice = {main="Aquilo's Staff",waist="Hyorin Obi"},
      Lightning = {waist="Rairin Obi"},
      Light = {waist="Korin Obi"},
      Dark = {waist="Anrin Obi"}}
   
    
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
    info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
        "Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
    update_active_strategems()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant', 'TH')
    state.IdleMode:options('Normal', 'PDT')


    info.low_nukes = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder"}
    info.mid_nukes = S{"Stone II", "Water II", "Aero II", "Fire II", "Blizzard II", "Thunder II",
                       "Stone III", "Water III", "Aero III", "Fire III", "Blizzard III", "Thunder III",
                       "Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",}
    info.high_nukes = S{"Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

    gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}

    send_command('bind !a input /ja Sublimation me')
	send_command('bind !s input //gs c scholar addendum')
	send_command('bind !x input //gs c scholar aoe')
	send_command('bind !n input /ja Light Arts me')
	send_command('bind !m input /ja Dark Arts me')
	send_command('bind !v input //gs c scholar accuracy')
	send_command('bind !c input //gs c scholar cost')
	send_command('bind !z input //gs c scholar power')
	send_command('bind !d input //gs c scholar speed')
	send_command('bind !b input /ja Enlightenment me')

    select_default_macro_book()
end

function user_unload()
    send_command('unbind !x')
	send_command('unbind !c')
	send_command('unbind !v')
	send_command('unbind !a')
	send_command('unbind !s')
	send_command('unbind !d')
	send_command('unbind !n')
	send_command('unbind !m')
	send_command('unbind !d')
	send_command('unbind !b')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}


    -- Fast cast sets for spells

    sets.precast.FC = {feet = "Scholar's Loafers", head = "Argute Mortarboard +1", ear2 = "Loquacious Earring"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris",back="Pahtli Cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})


    -- Midcast Sets

    sets.midcast.FastRecast = {ammo="Incantor Stone",ear2="Loquacious Earring",back="Swith Cape +1",feet="Scholar's Loafers"}

    sets.midcast.Cure = {main = "Chatoyant Staff", sub = "Light Grip", ammo = "Phantom Tathlum",
		head = "Argute Mortarboard +1", neck = "Fylgja Torque +1", ear1 = "Magnetic Earring", ear2 = "Loquacious Earring",
		body = "Mahatma Houppelande", hands = "Argute Bracers", ring1 = "Tamas Ring", ring2 = "Bomb Queen Ring",
		back = "Prism Cape", waist = "Argute Belt", legs = "Mahatma Slops", feet = "Scholar's Loafers"}

    sets.midcast.CureWithLightWeather = {main = "Chatoyant Staff", sub = "Light Grip", ammo = "Phantom Tathlum",
		head = "Argute Mortarboard +1", neck = "Fylgja Torque +1", ear1 = "Magnetic Earring", ear2 = "Loquacious Earring",
		body = "Mahatma Houppelande", hands = "Argute Bracers", ring1 = "Tamas Ring", ring2 = "Bomb Queen Ring",
		back = "Prism Cape", waist = "Argute Belt", legs = "Mahatma Slops", feet = "Scholar's Loafers"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Regen = {main="Bolelabunga",head="Savant's Bonnet +2"}

    sets.midcast.Cursna = {
        neck="Malison Medallion",
        hands="Hieros Mittens",ring1="Ephedra Ring",
        feet="Gendewitha Galoshes"}

    sets.midcast['Enhancing Magic'] = {main = "Kirin's Pole", sub = "Bugard Leather Strap", ammo = "Phantom Tathlum",
		head = "Argute Mortarboard +1", neck = "Beak Necklace +1", ear1 = "Magnetic Earring",
		ear2 = "Loquacious Earring", body = "Argute Gown", hands = "Argute Bracers",
		ring1 = "Tamas Ring", ring2 = "Bomb Queen Ring", back = "Prism Cape", waist = "Argute Belt",
		legs = "Mahatma Slops", feet = "Errant Pigaches"}

    sets.midcast.Stoneskin = {main = "Kirin's Pole", sub = "Raptor Leather Strap +1",
		ammo = "Phantom Tathlum", head = "Argute Mortarboard +1", neck = "Beak Necklace +1",
		ear1 = "Magnetic Earring", ear2 = "Loquacious Earring", body = "Mahatma Houppelande",
		hands = "Scholar's Bracers", ring1 = "Tamas Ring", ring2 = "Bomb Queen Ring",
		back = "Prism Cape", waist = "Argute Belt", legs = "Mahatma Slops", feet = "Errant Pigaches"}

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Pedagogy Loafers"})

    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes
    sets.midcast.MndEnfeebles = {main = "Chatoyant Staff", ammo = "Sturm's Report",
		head = "Argute Mortarboard +1", neck = "Lemegeton Medallion +1", ear1 = "Star Earring", ear2 = "Star Earring",
		body = "Mahatma Houppelande", hands = "Argute Bracers +1", ring1 = "Tamas Ring", ring2 = "Snow Ring",
		back = "Prism Cape", waist = "Argute Belt", legs = "Mahatma Slops", feet = "Avocat Pigaches"}

    sets.midcast.IntEnfeebles = {main = "Chatoyant Staff", ammo = "Phantom Tathlum",
		neck = "Lemegeton Medallion +1", ear1 = "Star Earring", ear2 = "Star Earring",
		body = "Ixion Cloak", hands = "Argute Bracers +1", ring1 = "Tamas Ring", ring2 = "Snow Ring",
		back = "Prism Cape", waist = "Argute Belt", legs = "Mahatma Slops", feet = "Avocat Pigaches"}

    sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles

    sets.midcast['Dark Magic'] = {main = "Chatoyant Staff", sub = "Dark Grip", ammo = "Phantom Tathlum",
		neck = "Dark Torque", ear1 = "Magnetic Earring",
		ear2 = "Abyssal Earring", body = "Ixion Cloak", hands = "Argute Bracers +1", ring1 = "Tamas Ring",
		ring2 = "Snow Ring", back = "Errant Cape", waist = "Argute Belt", legs = "Argute Pants +1",
		feet = "Scholar's Loafers"}

    sets.midcast.Kaustra = {main = "Chatoyant Staff", sub = "Bugard Leather Strap",
		ammo = "Phantom Tathlum", neck = "Elemental Torque", ear1 = "Moldavite Earring",
		ear2 = "Novio Earring", body = "Ixion Cloak", hands = "Vicious Mufflers", ring1 = "Tamas Ring",
		ring2 = "Snow Ring", back = "Prism Cape", waist = "Argute Belt", legs = "Argute Pants +1",
		feet = "River Gaiters"}

    sets.midcast.Drain = {main = "Chatoyant Staff", sub = "Dark Grip", ammo = "Sturm's Report",
		neck = "Dark Torque", ear1 = "Magnetic Earring",
		ear2 = "Abyssal Earring", body = "Ixion Cloak", hands = "Argute Bracers +1", ring1 = "Tamas Ring",
		ring2 = "Snow Ring", back = "Errant Cape", waist = "Argute Belt", legs = "Argute Pants +1",
		feet = "Scholar's Loafers"}

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {main = "Chatoyant Staff", sub = "Dark Grip", ammo = "Sturm's Report",
		head = "Argute Mortarboard +1", neck = "Dark Torque", ear1 = "Magnetic Earring",
		ear2 = "Abyssal Earring", body = "Errant Houppelande", hands = "Errant Cuffs", ring1 = "Tamas Ring",
		ring2 = "Snow Ring", back = "Errant Cape", waist = "Swift Belt", legs = "Argute Pants",
		feet = "Scholar's Loafers"}

    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main="Lehbrailg +2"})


    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {main = "Chatoyant Staff", ammo = "Phantom Tathlum",
		neck = "Elemental Torque", ear1 = "Moldavite Earring",
		ear2 = "Abyssal Earring", body = "Ixion Cloak", hands = "Vicious Mufflers",
		ring1 = "Tamas Ring", ring2 = "Snow Ring", back = "Prism Cape", waist = "Argute Belt",
		legs = "Mahatma Slops", feet = "Numerist Pumps"}

    sets.midcast['Elemental Magic'].Resistant = {main = "Lotus Katana", sub = "Bugard Leather Strap", ammo = "Sturm's Report",
		head = "Argute Mortarboard +1", neck = "Elemental Torque", ear1 = "Moldavite Earring",
		ear2 = "Abyssal Earring", body = "Mahatma Houppelande", hands = "Vicious Mufflers",
		ring1 = "Tamas Ring", ring2 = "Snow Ring", back = "Prism Cape", waist = "Argute Belt",
		legs = "Mahatma Slops", feet = "Numerist Pumps"}
		
	sets.midcast['Elemental Magic'].TH = {main = "Lotus Katana", sub = "Bugard Leather Strap", ammo = "Phantom Tathlum",
		head = "Argute Mortarboard +1", neck = "Elemental Torque", ear1 = "Moldavite Earring",
		ear2 = "Abyssal Earring", body = "Mahatma Houppelande", hands = "Vicious Mufflers",
		ring1 = "Tamas Ring", ring2 = "Snow Ring", back = "Prism Cape", waist = "Argute Belt",
		legs = "Mahatma Slops", feet = "Numerist Pumps"}

    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {main = "Chatoyant Staff", sub = "Light Grip", ammo = "Bibiki Seashell",
		head = "Scholar's Mortarboard +1", neck = "Beak Necklace +1", ear1 = "Magnetic Earring", ear2 = "Relaxing Earring",
		body = "Mahatma Houppelande", hands = "Genie Gages", ring1 = "Star Ring", ring2 = "Star Ring",
		back = "Errant Cape", waist = "Hierarch Belt", legs = "Hydra Brais", feet = "Avocat Pigaches"}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle.Town = {main = "Chatoyant Staff", sub = "Bugard Leather Strap", ammo = "Sturm's Report",
		neck = "Orochi Nodowa", ear1 = "Magnetic Earring", ear2 = "Loquacious Earring", body = "Ixion Cloak",
		hands = "Garden Bangles", ring1 = "Tamas Ring", ring2 = "snow Ring", back = "Prism Cape",
		waist = "Argute Belt", legs = "Argute Pants", feet = "Herald's Gaiters"}

    sets.idle.Field = {main = "Chatoyant Staff", sub = "Bugard Leather Strap", ammo = "Phantom Tathlum",
		neck = "Orochi Nodowa", ear1 = "Magnetic Earring", ear2 = "Loquacious Earring", body = "Ixion Cloak",
		hands = "Garden Bangles", ring1 = "Tamas Ring", ring2 = "Snow Ring", back = "Prism Cape",
		waist = "Argute Belt", legs = "Argute Pants", feet = "Herald's Gaiters"}

    sets.idle.Field.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",ammo="Incantor Stone",
        head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Hierarch Belt",legs="Nares Trews",feet="Herald's Gaiters"}

    sets.idle.Field.Stun = {main="Apamajas II",sub="Mephitis Grip",ammo="Incantor Stone",
        head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",ring2="Sangoma Ring",
        back="Swith Cape +1",waist="Goading Belt",legs="Bokwus Slops",feet="Herald's Gaiters"}

    sets.idle.Weak = {main="Kerykeion",sub="Genbu's Shield",ammo="Incantor Stone",
        head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Sheltered Ring",ring2="Meridian Ring",
        back="Umbra Cape",waist="Hierarch Belt",legs="Nares Trews",feet="Herald's Gaiters"}

    -- Defense sets

    sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",ammo="Incantor Stone",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",ammo="Incantor Stone",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Tuilha Cape",waist="Hierarch Belt",legs="Bokwus Slops",feet="Hagondes Sabots"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        head="Zelus Tiara",
        body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Rajas Ring",
        waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}



    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Savant's Bonnet +2"}
    sets.buff['Rapture'] = {head="Savant's Bonnet +2"}
    sets.buff['Perpetuance'] = {hands="Savant's Bracers +2"}
    sets.buff['Immanence'] = {hands="Savant's Bracers +2"}
    sets.buff['Penury'] = {legs="Savant's Pants +2"}
    sets.buff['Parsimony'] = {legs="Savant's Pants +2"}
    sets.buff['Celerity'] = {feet="Argute Loafers +1 +1"}
    sets.buff['Alacrity'] = {feet="Argute Loafers +1 +1"}
    sets.buff['Klimaform'] = {feet="Savant's Loafers +2"}
	
	sets.buff['dark arts'] = {body = "Scholar's Gown +1"}
	sets.buff['light arts'] = {legs = "Scholar's Pants"}
	sets.buff['addendum: dark'] = {body = "Scholar's Gown +1"}
	sets.buff['addendum: light'] = {legs = "Scholar's Pants"}

     sets.buff.FullSublimation = {main = "Chatoyant Staff", sub = "Light Grip", ammo = "Phantom Tathlum",
		head = "Scholar's Mortarboard +1", neck = "Orochi Nodowa", ear1 = "Magnetic Earring",
		ear2 = "Loquacious Earring", body = "Argute Gown", hands = "Argute Bracers +1",
		ring1 = "Tamas Ring", ring2 = "Snow Ring", back = "Gigant Mantle", waist = "Ocean Sash",
		legs = "Argute Pants", feet = "Herald's Gaiters" }
    sets.buff.PDTSublimation = {head="Academic's Mortarboard",ear1="Savant's Earring",body="Errant Houppelande"}

	sets.darkarts = {main="Chatoyant Staff", body = "Scholar's Gown +1"}
	sets.lightarts = {legs = "Scholar's Pants"}
	
  end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff == "Sublimation: Activated" then
        handle_equipping_gear(player.status)
    end
end



-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
            if world.weather_element == 'Light' then
                return 'CureWithLightWeather'
            end
        elseif spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
		end
	end
end

function customize_idle_set(idleSet)
    if state.Buff['Sublimation: Activated'] then
        if state.IdleMode.value == 'Normal' then
            idleSet = set_combine(idleSet, sets.buff.FullSublimation)
        elseif state.IdleMode.value == 'PDT' then
            idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
        end
    end

    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end

    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not (buffactive['light arts']      or buffactive['dark arts'] or
                       buffactive['addendum: white'] or buffactive['addendum: black']) then
        if state.IdleMode.value == 'Stun' then
            send_command('@input /ja "Dark Arts" <me>')
        else
            send_command('@input /ja "Light Arts" <me>')
        end
    end

    update_active_strategems()
    update_sublimation()
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'scholar' then
        handle_strategems(cmdParams)
        eventArgs.handled = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Reset the state vars tracking strategems.
function update_active_strategems()
    state.Buff['Ebullience'] = buffactive['Ebullience'] or false
    state.Buff['Rapture'] = buffactive['Rapture'] or false
    state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
    state.Buff['Immanence'] = buffactive['Immanence'] or false
    state.Buff['Penury'] = buffactive['Penury'] or false
    state.Buff['Parsimony'] = buffactive['Parsimony'] or false
    state.Buff['Celerity'] = buffactive['Celerity'] or false
    state.Buff['Alacrity'] = buffactive['Alacrity'] or false
    state.Buff['Klimaform'] = buffactive['Klimaform'] or false

end

function update_sublimation()
    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end

function job_post_midcast(spell, action, spellMap, eventArgs)
   if spell.action_type == "Magic" then
		  equip(sets.grips[spell.element])
   end
      if spell.element == world.weather_element or spell.element == world.day_element then
         equip(sets.obi[spell.element])
   end
	 if spell.skill == 'Enfeebling Magic' and buffactive['addendum: black'] then
			equip(sets.darkarts)
		end
	if spell.skill == 'Enfeebling Magic' and buffactive['dark arts'] then
			equip(sets.darkarts)
		end
	if spell.skill == 'Dark Magic' and	buffactive['dark arts'] then
			equip(sets.darkarts)
		end	
	if spell.skill == 'Dark Magic' and buffactive['addendum: black'] then
			equip(sets.darkarts)
		end	
	if spell.skill == 'Enhancing Magic' and buffactive['light arts'] then
			equip(sets.lightarts)
		end
	if spell.skill == 'Enhancing Magic' and buffactive['addendum: light'] then
			equip(sets.lightarts)
		end
	if spell.skill == 'Enfeebling Magic' and buffactive['light arts'] then
			equip(sets.lightarts)
		end
	if spell.skill == 'Enfeebling Magic' and buffactive['addendum: light'] then
			equip(sets.lightarts)
		end
	if spell.skill == 'Healing Magic' and buffactive['light arts'] then
			equip(sets.lightarts)
		end
	if spell.skill == 'Healing Magic' and buffactive['addendum: light'] then
			equip(sets.lightarts)
		end
	if spell.skill == 'Divine Magic' and buffactive['light arts'] then
			equip(sets.lightarts)
		end
	if spell.skill == 'Divine Magic' and buffactive['addendum: light'] then
			equip(sets.lightarts)
		end
	end

-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
    if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
        equip(sets.buff['Perpetuance'])
    end
    if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.buff['Rapture'])
    end
    if spell.skill == 'Elemental Magic' and spellMap ~= 'ElementalEnfeeble' then
        if state.Buff.Ebullience and spell.english ~= 'Impact' then
            equip(sets.buff['Ebullience'])
        end
        if state.Buff.Immanence then
            equip(sets.buff['Immanence'])
        end
        if state.Buff.Klimaform and spell.element == world.weather_element then
            equip(sets.buff['Klimaform'])
        end
    end

    if state.Buff.Penury then equip(sets.buff['Penury']) end
    if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
    if state.Buff.Celerity then equip(sets.buff['Celerity']) end
    if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
	end
	

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

-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
    -- cmdParams[1] == 'scholar'
    -- cmdParams[2] == strategem to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
    local strategem = cmdParams[2]:lower()

    if strategem == 'light' then
        if buffactive['light arts'] then
            send_command('input /ja "Addendum: White" <me>')
        elseif buffactive['addendum: white'] then
            add_to_chat(122,'Error: Addendum: White is already active.')
        else
            send_command('input /ja "Light Arts" <me>')
        end
    elseif strategem == 'dark' then
        if buffactive['dark arts'] then
            send_command('input /ja "Addendum: Black" <me>')
        elseif buffactive['addendum: black'] then
            add_to_chat(122,'Error: Addendum: Black is already active.')
        else
            send_command('input /ja "Dark Arts" <me>')
        end
    elseif buffactive['light arts'] or buffactive['addendum: white'] then
        if strategem == 'cost' then
            send_command('input /ja Penury <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Celerity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Accession <me>')
        elseif strategem == 'power' then
            send_command('input /ja Rapture <me>')
        elseif strategem == 'duration' then
            send_command('input /ja Perpetuance <me>')
        elseif strategem == 'accuracy' then
            send_command('input /ja Altruism <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Tranquility <me>')
        elseif strategem == 'skillchain' then
            add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: White" <me>')
        end
		
    elseif buffactive['dark arts']  or buffactive['addendum: black'] then
        if strategem == 'cost' then
            send_command('input /ja Parsimony <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Alacrity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Manifestation <me>')
        elseif strategem == 'power' then
            send_command('input /ja Ebullience <me>')
        elseif strategem == 'duration' then
            add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
        elseif strategem == 'accuracy' then
            send_command('input /ja Focalization <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Equanimity <me>')
        elseif strategem == 'skillchain' then
            send_command('input /ja Immanence <me>')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: Black" <me>')
        end
	end
	if strategem == 'helix' then
		if world.weather_element == 'Lightning' then
        send_command('@input /ma "Ionohelix" <t>')
    elseif world.weather_element == 'Fire' then
        send_command('@input /ma "Pyrohelix" <t>')
	elseif world.weather_element == 'Water' then
		send_command('@input /ma "Hydrohelix" <t>')
	elseif world.weather_element == 'Light' then
		send_command('@input /ma "Luminohelix" <t>')
	elseif world.weather_element == 'Dark' then
		send_command('@input /ma "Noctohelix" <t>')
    elseif world.weather_element == 'Wind' then
		send_command('@input /ma "Anemohelix" <t>')
	elseif world.weather_element == 'Earth' then
		send_command('@input /ma "Geohelix" <t>')
	elseif world.weather_element == 'Ice' then
		send_command('@input /ma "Cryohelix" <t>')
	elseif world.day_element == 'Lightning' then
        send_command('@input /ma "Ionohelix" <t>')
    elseif world.day_element == 'Fire' then
        send_command('@input /ma "Pyrohelix" <t>')
	elseif world.day_element == 'Water' then
		send_command('@input /ma "Hydrohelix" <t>')
	elseif world.day_element == 'Light' then
		send_command('@input /ma "Luminohelix" <t>')
	elseif world.day_element == 'Dark' then
		send_command('@input /ma "Noctohelix" <t>')
    elseif world.day_element == 'Wind' then
		send_command('@input /ma "Anemohelix" <t>')
	elseif world.day_element == 'Earth' then
		send_command('@input /ma "Geohelix" <t>')
	elseif world.day_element == 'Ice' then
		send_command('@input /ma "Cryohelix" <t>')	
	end	
end
end


-- Gets the current number of available strategems based on the recast remaining
-- and the level of the sch.
function get_current_strategem_count()
    -- returns recast in seconds.
    local allRecasts = windower.ffxi.get_ability_recasts()
    local stratsRecast = allRecasts[231]

    local maxStrategems = (player.main_job_level + 10) / 20

    local fullRechargeTime = 4*60

    local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)

    return currentCharges
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 20)
end