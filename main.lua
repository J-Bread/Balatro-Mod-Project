--- STEAMODDED HEADER
--- MOD_NAME: Joker Test
--- MOD_ID: JOKETEST
--- MOD_AUTHOR: [Jt and Josh]
--- MOD_DESCRIPTION: testing face cards for joker test
--- PREFIX: tests

local PREFIX = "tests"

-- Icon Atlas
SMODS.Atlas {
    key = 'Test_icon',
    path = 'Test_icon.png',
    px = 32,
    py = 32,
}

-- Clubs Atlases
SMODS.Atlas{
    key = "testskin_clubs_lc",
    path = "Test_card_lc.png",
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "testskin_clubs_hc",
    path = "Test_card_hc.png",
    px = 71,
    py = 95,
}

-- Deck Skin
SMODS.DeckSkin {
    key = "TestClubs",
    suit = "Clubs",
    loc_txt = {
        name = "Club Test"
    },
    palettes = {
        {
            key = 'lc',
            ranks = {'Jack', 'Queen', 'King'},
            display_ranks = {'King', 'Queen', 'Jack'},
            atlas = PREFIX .. "_testskin_clubs_lc",
            pos_style = "deck"
        },
        {
            key = 'hc',
            ranks = {'Jack', 'Queen', 'King'},
            display_ranks = {'King', 'Queen', 'Jack'},
            atlas = PREFIX .. "_testskin_clubs_hc",
            pos_style = "deck"
        }
    },
}