--- STEAMODDED HEADER
--- MOD_NAME: Jt's Joker
--- MOD_ID: JTJOKER
--- MOD_AUTHOR: [Jt and Josh]
--- MOD_DESCRIPTION: Buh?
--- PREFIX: xmpl

SMODS.Atlas
{
	key = 'Jokers', 
	path = 'TestJoker.png',
	px = 71,
	py = 95
}

-- apparently this adds Talisman compatibility? I dunno but uh it was in the example so here we are
to_big = to_big or function(x) return x end

SMODS.Joker
{
	key = 'JtJoker',	
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	loc_txt = 
	{
		name = 'Jts Joker',
		text = 
	 {
		'When Blind is selected,',
		'create a {C:attention}Joker{}',
		'{X:mult,C:white}X#1#{} Mult',
		'Gain {C:money}50${} at end of round'
	 },
		-- so the way that the #number# syntax wroks is that in the config section it replaces 
		-- #1# with the value of the first variable returned by loc_vars, #2# with the second, and so on, 
		-- so since Xmult is 2.5 in the config, #1# will be replaced with 2.5 in the text, and 
		-- the colour of the X will be white because of the {C:white} tag
	},
	
	atlas = 'Jokers', 
	rarity = 1, 
	cost = 5, 
	unlocked = true,
	discovered = true,

	pos = {x = 0, y = 0},
	config = {
		extra = {
			Xmult = 2.5
				}
			},
	loc_vars = function(self, info_queue,center)
		info_queue[#info_queue+1] = G.P_CENTERS.j_joker
		return {vars = {center.ability.extra.Xmult}}
	end,
	
	calculate = function(self, card, context)
		if context.joker_main then 
		return {
			card = card,
			Xmult_mod = card.ability.extra.Xmult,
			message = 'X' .. card.ability.extra.Xmult,
			colour = G.C.MULT
			}
		end
		if context.setting_blind then
			local new_card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_joker')
			new_card:add_to_deck()
			G.jokers:emplace(new_card)
			end
		end,
		in_pool = function(self, wawa, wawa2)
			return true
		end,
		calc_dollar_bonus = function(self,card)
		return 50
	end,
	}

