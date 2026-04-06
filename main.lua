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

-- ( Overwatch, Clubs ) 

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

-- ( Overwatch, Spades ) 

local atlas_OW_spades_lc = SMODS.Atlas {
    key = "Overwatch_spades_lc",
    path = "Overwatch_Spades_lc.png",
    px = 71,
    py = 95,
}
local atlas_OW_spades_hc = SMODS.Atlas {
    key = "Overwatch_spades_hc",
    path = "Overwatch_Spades_hc.png",
    px = 71,
    py = 95,
}

-- Deck Skin
SMODS.DeckSkin {
    key = "OverwatchSpades",
    suit = "Spades",
    loc_txt = {
        ['en-us'] = "Overwatch Spades"
    },
    palettes = {
        {
            key = 'lc',
			ranks = {'Jack', 'Queen', "King"},
            display_ranks = {"King", "Queen", "Jack"},
            atlas = atlas_OW_spades_lc.key,
            pos_style = "ranks"
        },
        {
            key = 'hc',
			ranks = {'Jack', 'Queen', "King",},
            display_ranks = {"King", "Queen", "Jack"},
            atlas = atlas_OW_spades_hc.key,
            pos_style = "ranks"
        }
    },
}

-- ( Overwatch, Hearts ) 

local atlas_OW_hearts_lc = SMODS.Atlas {
    key = "Overwatch_hearts_lc",
    path = "Overwatch_Hearts_lc.png",
    px = 71,
    py = 95,
}
local atlas_OW_hearts_hc = SMODS.Atlas {
    key = "Overwatch_hearts_hc",
    path = "Overwatch_Hearts_hc.png",
    px = 71,
    py = 95,
}

-- Deck Skin
SMODS.DeckSkin {
    key = "OverwatchHearts",
    suit = "Hearts",
    loc_txt = {
        ['en-us'] = "Overwatch Hearts"
    },
    palettes = {
        {
            key = 'lc',
			ranks = {'Jack', 'Queen', "King"},
            display_ranks = {"King", "Queen", "Jack"},
            atlas = atlas_OW_hearts_lc.key,
            pos_style = "ranks"
        },
        {
            key = 'hc',
			ranks = {'Jack', 'Queen', "King",},
            display_ranks = {"King", "Queen", "Jack"},
            atlas = atlas_OW_hearts_hc.key,
            pos_style = "ranks"
        }
    },
}

-- ( Overwatch, Diamonds ) 

local atlas_OW_diamonds_lc = SMODS.Atlas {
    key = "Overwatch_diamonds_lc",
    path = "Overwatch_Diamonds_lc.png",
    px = 71,
    py = 95,
}
local atlas_OW_diamonds_hc = SMODS.Atlas {
    key = "Overwatch_diamonds_hc",
    path = "Overwatch_Diamonds_hc.png",
    px = 71,
    py = 95,
}

-- Deck Skin
SMODS.DeckSkin {
    key = "OverwatchDiamonds",
    suit = "Diamonds",
    loc_txt = {
        ['en-us'] = "Overwatch Diamonds"
    },
    palettes = {
        {
            key = 'lc',
			ranks = {'Jack', 'Queen', "King"},
            display_ranks = {"King", "Queen", "Jack"},
            atlas = atlas_OW_diamonds_lc.key,
            pos_style = "ranks"
        },
        {
            key = 'hc',
			ranks = {'Jack', 'Queen', "King",},
            display_ranks = {"King", "Queen", "Jack"},
            atlas = atlas_OW_diamonds_hc.key,
            pos_style = "ranks"
        }
    },
}

