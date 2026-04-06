--- STEAMODDED HEADER
--- MOD_NAME: Leshy Joker
--- MOD_ID: LESHYJOKER
--- MOD_AUTHOR: [Jt and Josh]
--- MOD_DESCRIPTION: A mod that adds a leshy joker, with a unique ability
--- PREFIX: LeshyJoker


--- acts more or less as a dictionary for LeshyJoker
SMODS.Atlas
{
key = 'Jokers',
path = 'Leshy_deathcard.png',
px = 71,
py = 95,
}

--- idk it's needed for talismen so uh yeah
to_big = to_big or function(x) return x end

---  Creates the joker and defines all of its properties and abilities
SMODS.Joker{
    key = 'Leshy',

    --- these compats define if the joker can be used with blueprint, can be eternal, or can be perishable.
    --- blueprint_compat just means it can work with the blueprint joker, eternal_compat means it can be eternal, etc.
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_txt = 
    {
        name = 'Leshy',
        text = 
        {
            'When Boss Blind is selected, create a copy of the {C:attention}Joker{} to the right of {C:attention}Leshy{}',
            'Lose {C:money}$#1#{} at the end of every round',
            '{C:green, s:0.4}Wait, how did Leshy get in this game?{}'
        },
    },
    --- binds the atlas to the joker
        atlas = 'Jokers',
    
        --- defines the rarity, 1 is common and 4 is legendary
        rarity = 2,

        --- the cost of the joker
        cost = 7,

        --- defines whether the joker is unlocked at the start, and if it is already discovered. 
        --- This is done already so the joker can instantly be used
        unlocked = true,
        discovered = true,
        pos = {x = 0, y = 0},
        config = {
            extra = {
                --- variable for determining how much money to take from the player. It's used both in the text and the in the calculating function
                LostMoney = 5,
            },
        },

        --- this allows the lostMoney variable to be both defined and used in the text, so the text will update if the variable is changed in the config
       loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.LostMoney}}
end,


-- the check for if the joker should do something
        calculate = function(self, card, context)
            
        --- makes sure that the blind where Leshy's ability activates is specifically the boss blind, and that the blind exists
            if context.setting_blind and G.GAME.blind and G.GAME.blind.boss then
                
                --- the index so Leshy can find the next joker
                local leshy_index = nil

                ---loops thorugh all joker slots to find where Leshy is, so it can place the new card to the right of it
                for i, c in ipairs(G.jokers.cards) do
                    if c == card then
                        leshy_index = i
                        break
                    end
                end

                --- if the index exists and there is a joker in the slot to the right of Leshy, creates a copy of that Joker, and adds it to the jokers. If there isn't a joker to the right of Leshy, it doesn't do anything, so it won't cause an error by trying to copy a nonexistant card
                if leshy_index and G.jokers.cards[leshy_index + 1] then
                    local target = G.jokers.cards[leshy_index + 1]
                    local new_card = copy_card(target)
                    ---adds the new card to the deck and then places the joker in the joker area, and starts the materialize animation
                    new_card:add_to_deck()
                    G.jokers:emplace(new_card)
                    new_card:start_materialize()

                    --- once it does that, it returns a qwip and finishes up
                return{ message = "Photographed!"}
            end
        end

        --- Checks for if it's the end of the round. If it is, and Leshy is in the joker area, it takes money away equal to LostMoney and lets the user know 
       if context.end_of_round and context.cardarea == G.jokers then
        return {
            dollars = -card.ability.extra.LostMoney,
            message = "Film Costs Money!",
        }
    end
end
            }           


