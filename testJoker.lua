--- STEAMMODDED HEADER
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

SMODS.Joker
{
	key = 'JtJoker',
	loc_txt = 
	{
		name = 'JtsJoker',
		text = 
	 {
		'When Blind is selected,',
		'create a {C:attention}Joker{}',
		'{X:mult,C:white}X#1#{} Mult',
		'Gain {C:money}50${} at end of round'
	 },
		
	},
	
	atlas = 'Jokers', 
	rarity = '1', 
	cost = 5, 
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
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
	check_for_unlock = function(self, args)
		if args.type == 'idk the types',
			unlock_card(self)
		end, 
		unlock_card(self)
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

