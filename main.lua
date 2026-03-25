
--- STEAMODDED HEADER
--- MOD_NAME: 
--- MOD_ID: 
--- PREFIX: 
--- MOD_AUTHOR: []
--- MOD_DESCRIPTION: 
--- PRIORITY: 
--- BADGE_COLOR: 
--- DISPLAY_NAME: 
--- VERSION: 0.1

SMODS.Atlas {
    key = '',
    px = 32,
    py = 32,
    path = '.png'
}

-- ( , Clubs ) 

SMODS.Atlas {
    key = "_clubs_lc",
    path = "_clubs_lc.png",
    px = 71,
    py = 95,
}
SMODS.Atlas {
    key = "_clubs_hc",
    path = "_clubs_hc.png",
    px = 71,
    py = 95,
}

SMODS.DeckSkin {
    key = "Clubs",
    suit = "Clubs",
    loc_txt = "",
    palettes = {
        {
            key = 'lc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
            display_ranks = {"King", "Queen", "Jack"},
            atlas = "",
            pos_style = "suit"
        },
        {
            key = 'hc',
			ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",},
            display_ranks = {"King", "Queen", "Jack"},
            atlas = "",
            pos_style = "suit"
        }
    },
}
