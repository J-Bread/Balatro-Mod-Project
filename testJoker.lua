SMODS.Atlas
{
    key = 'TestJoker',
    path = 'TestJoker.png',
    px = 71,
    py = 95
}

SMODS.JOKER
{
    key = 'TestJoker',
    loc_txt = {
        "When blind is selected,", 
        "create a {C:attention}Joker{}",
        "{X:mult, C:white}x#1#{}{} Mult"
    },

    atlas = "TJoker",
    pos = {x = 0, y = 0},
    config = {
        extra = {
            Xmult = 50
        }
    },
    loc_vars = function(self, info_queue, center)
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

    end
    }
    





