--- acts as a dictionary for the joker, it tells the game where to find the image and how big it is
SMODS.Atlas
{
    key = 'Triple7s',
    path = 'Triple7s.png',
    px = 71,
    py = 95
}

--- this is needed for talisman compatibility, it just makes sure that the to_big function exists
to_big = to_big or function(x) return x end

--- creates the joker and defines all of its properties and abilities
SMODS.Joker
{
key = 'Trip7s',
--- these compats define if the joker can be used with blueprint, can be eternal, or can be perishable.
blueprint_compat = true,
eternal_compat = true, 
perishable_compat = true,
--- defines the name and description of the joker, the #1# syntax is used to insert variables into the text, which are defined later in loc_vars
loc_txt =
{
name = 'Triple 7s',
text =
{
    'When 3 or more 7s are played,',
    'gives {X:mult,C:white}X#1#{} Mult',
    '{C:green, s:0.4}Mama needs a new car!{}'
},
},
--- referneces the atlas defined earlier
atlas = 'Triple7s',
--- defines the rarity, 1 is common and 4 is legendary, so this joker is rare
rarity = 3,
--- how much the joker costs
cost = 8,
--- both unlocked and discovered are set to true so the joker can be used right away
unlocked = true,
discovered = true,
--- the position of the joker's png on its reference image
pos = {x = 0, y = 0},
--- the extra variables used for both the text and calculation function of the joker's ability
config = {
    extra = {
        xmult = 7
    }
},

--- how the card description gets its variables
loc_vars = function(self, info_queue, center)
    return {vars = {center.ability.extra.xmult}}
end, 

--- the function to check if you have 3 or more 7s in your hand, and if so gives you the xmult
calculate = function(self, card, context)
    --- joker_main jsut means will only run during when joker could play
    if context.joker_main then
        --- keeps track of how many 7s are in the hand
        local seven_count = 0
        --- loops through the hand and counts how many 7s the player has
        for _, played_card in ipairs(context.scoring_hand) do
            --- if the card is a 7, add 1 to the count
            if played_card:get_id() == 7 then
                seven_count = seven_count + 1
            end
        end  -- closes the for loop
        --- if there are 3 or more 7s, return the xmult and the message to show the player
        if seven_count >= 3 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
end
}