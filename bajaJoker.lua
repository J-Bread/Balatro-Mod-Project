--- STEAMODDED HEADER
--- MOD_NAME: Baja Blast Joker
--- MOD_ID: BAJABLAST
--- MOD_AUTHOR: [Jt and Josh]
--- MOD_DESCRIPTION: Adds the best joker in the game, which is Baja Blast! (Creates a Jimbo Joker when playing a blind, gives you 2.5x mult, and gives you $50 at the end of the round)
--- PREFIX: BajaBlast


--- the "dictionary" for the joker, it tells the game where the images are, the size, etc.
SMODS.Atlas
{
	key = 'Jokers', 
	path = 'bajaJoker.png',
	px = 71,
	py = 95
}

-- apparently this adds Talisman compatibility? I dunno but uh it was in the example so here we are
to_big = to_big or function(x) return x end

--- the actual joker creation
SMODS.Joker
{
	--- how the game references the joker
	key = 'BajaBlast',	

	--- defines compatibility with blueprint, eternal, and to be perishable
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	--- contains the name and description of the joker
	loc_txt = 
	{
		name = 'Baja Blast',
		text = 
	 {
		'When Blind is selected,',
		'create a {C:attention}Joker{}',
		'{X:mult,C:white}X#1#{} Mult',
		'Gain {C:money}50${} at end of round',
		'{C:green, s:0.4}Do the Dew!!{}'
	 },
		--- so the way that the #number# syntax works is that in the config section it replaces 
		--- #1# with the value of the first variable returned by loc_vars, #2# with the second, and so on, 
		--- so since Xmult is 2.5 in the config, #1# will be replaced with 2.5 in the text, and 
		--- the colour of the X will be white because of the {C:white} tag
	},
	
	--- references the atlas defined earlier
	atlas = 'Jokers', 

	--- the rarity of the joker, 1 is common and 4 is legendary, so this joker is legendary
	rarity = 4, 

	--- how much the joker costs in the shop
	cost = 5, 

	--- whether the joker is unlocked at the start and if it is already discovered, both are true so it can be used right away
	unlocked = true,
	discovered = true,

	--- the position of the joker's image on the .png reference
	pos = {x = 0, y = 0},

	--- the extra variables used for both the text and calculation function of the joker's ability
	config = {
		extra = {
			Xmult = 2.5
				}
			},
	--- how the card description both gets its variables and defines them
	loc_vars = function(self, info_queue,center)
		info_queue[#info_queue+1] = G.P_CENTERS.j_joker
		return {vars = {center.ability.extra.Xmult}}
	end,
	
	--- how the joker does its 2.5x mult and creates the jimbo joker when you play a blind, and gives you $50 at the end of the round
	calculate = function(self, card, context)
		--- joker_main just means will only run during when joker could play
		if context.joker_main then 
		return {
			--- the card to apply the mult to, in this case the joker itself
			card = card,
			--- the multiplier, which is defined in the config as 2.5
			Xmult_mod = card.ability.extra.Xmult,
			--- the message to show the player they get the xmult
			message = 'X' .. card.ability.extra.Xmult .. ' ' .. 'Baja BLAST!',
			colour = G.C.MULT
			}
		end
		--- creates a Jimbo Joker when you start a blind
		if context.setting_blind then
			--- creates the new card, which is a Jimbo 
			local new_card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_joker')
			--- adds the card to the deck and the joker slots
			new_card:add_to_deck()
			G.jokers:emplace(new_card)
			end
		end,
		in_pool = function(self, wawa, wawa2)
			return true
		end,
		--- provides the 50 dollar bonus at the end of the round
		calc_dollar_bonus = function(self,card)
		return 50
	end,
	}

