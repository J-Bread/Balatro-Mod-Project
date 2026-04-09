--- STEAMODDED HEADER
--- MOD_NAME: Majoker
--- MOD_ID: MAJOKER
--- MOD_AUTHOR: [Jt and Josh]
--- MOD_DESCRIPTION: A joker that gives you +.25x mult for every lucky face card you have in your deck
--- MOD_PREFIX: Majoker

--- the "dictionary" for the joker, it tells the game where the images are, the size, etc.
SMODS.Atlas
{
    key = 'Majoker',
    path = 'Majoker.png',
    px = 71, 
    py = 95
}

--- just here for talisman compatibility
to_big = to_big or function(x) return x end

--- creates the joker and defines all of its stuff
SMODS.Joker
{
    --- the reference to the joker
key = 'Majoke',

--- defines compatibility with blueprint, eternal, and to be perishable
blueprint_compat = true,
eternal_compat = true,
perishable_compat = true,

--- the name of the joker and the description, the #1# and #2# are used to insert variables into the description
loc_txt = 
{
    name = 'Majora\'s Joker',
    text = 
    {
        'Adds {X:mult,C:white}X#1#{} Mult for every Lucky Face Card in your deck',
          'Current Multiplier: {X:mult,C:white}X#2#{}',
        '{C:green, s:0.4} You\'ve met with a terrible fate, haven\'t you?{}'
    },
},

--- references the atlas defined earlier
atlas = 'Majoker',

--- the rarity of the joker, 1 is common and 4 is legendary, so this joker is rare
rarity = 3,

--- how much the joker costs in the shop
cost = 7,

--- whether the joker is unlocked at the start and if it is already discovered, both are true so it can be used right away
unlocked = true,
discovered = true, 

-- the position of the joker's image on the .png reference
pos = {x = 0, y = 0},

--- the extra variables used for both the text and calculation function of the joker's ability
config = {
    extra = {
        xMult = .25
    }
    },

    --- how the card description both gets its variables and defines them
loc_vars = function(self, info_queue, center)

    --- keeps a running total of how many lucky face cards are in the deck
    local luckyFaceCards = 0

    --- for every lucky face card in the deck, adds one to the luckyFaceCard variable in the description
    --- the if is necessary to make sure it doesn't try and run the calculations when not in a blind, which would break the game
    if G.playing_cards then
        for _, c in ipairs(G.playing_cards) do
            if c.ability.name == 'Lucky Card' and 
               (c.base.value == 'Jack' or c.base.value == 'Queen' or c.base.value == 'King') then
                luckyFaceCards = luckyFaceCards + 1
            end
        end
    end

    --- returns how many lucky face cards there are as a variable for the text and calculation, as well as the total mult, which is 1 + the xMult config
    local total = 1 + (center.ability.extra.xMult * luckyFaceCards)
    return {vars = {center.ability.extra.xMult, total}}
end,

--- the function that checks how many lucky face cards you have and gives you the appropriate mult
    calculate = function(self, card, context)
        --- only runs during the joker main phase
        if context.joker_main then
            local luckyFaceCards = 0
            --- like earlier, checks if the game is running before doing the calculations to avoid errors
            if G.playing_cards then
            for _, c in pairs(G.playing_cards) do
                --- only adds to luckyFaceCards if the card is both a lucky card and a face card, which is determined by the value being Jack, Queen, or King
                if c.ability.name == "Lucky Card" and 
                (c.base.value == 'Jack' or c.base.value == 'Queen' or c.base.value == 'King') then
                    luckyFaceCards = luckyFaceCards + 1
                end
            end

            --- if there's at least one lucky face card, gives the xMult and shows the message to the player of how much mult it gives
            if luckyFaceCards > 0 then
                return 
                {
                    card = card,
                    Xmult_mod = 1 + (card.ability.extra.xMult * luckyFaceCards),
                    message = 'x' .. (card.ability.extra.xMult * luckyFaceCards) .. 'X',
                    colour = G.C.MULT
                }
            end
        end
    end
end,
}
