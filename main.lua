--- STEAMODDED HEADER
--- MOD_NAME: Joker Test
--- MOD_ID: JOKETEST
--- MOD_AUTHOR: [Jt and Josh]
--- MOD_DESCRIPTION: testing face cards for joker test
--- PREFIX: VidGame

local PREFIX = "VidGame"

-- Icon Atlas
SMODS.Atlas {
    key = 'Test_icon',
    path = 'Test_icon.png',
    px = 32,
    py = 32,
}

-- ( Test, Clubs ) 

local atlas_OW_clubs_lc = SMODS.Atlas {
    key = "Overwatch_clubs_lc",
    path = "Overwatch_Clubs_lc.png",
    px = 71,
    py = 95,
}
local atlas_OW_clubs_hc = SMODS.Atlas {
    key = "Overwatch_clubs_hc",
    path = "Overwatch_Clubs_hc.png",
    px = 71,
    py = 95,
}

-- Deck Skin
SMODS.DeckSkin {
    key = "OverwatchClubs",
    suit = "Clubs",
    loc_txt = {
        ['en-us'] = "Overwatch Clubs"
    },
    palettes = {
        {
            key = 'lc',
			ranks = {'Jack', 'Queen', "King"},
            display_ranks = {"King", "Queen", "Jack"},
            atlas = atlas_OW_clubs_lc.key,
            pos_style = "ranks"
        },
        {
            key = 'hc',
			ranks = {'Jack', 'Queen', "King",},
            display_ranks = {"King", "Queen", "Jack"},
            atlas = atlas_OW_clubs_hc.key,
            pos_style = "ranks"
        }
    },
}