--- STEAMODDED HEADER
--- MOD_NAME: Joker Test
--- MOD_ID: JOKETEST
--- MOD_AUTHOR: [Jt and Josh]
--- MOD_DESCRIPTION: testing face cards for joker test
--- PREFIX: aplle

--- assert(SMODS.load_file("testJoker.lua"))()

SMODS.Atlas {
    key = 'Test_icon',
    path = 'Test_icon.png',
    px = 32,
    py = 32,
}

-- ( Test, Clubs ) 

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
            key = 'default',
            ranks = {'Jack', 'Queen', 'King'},
            display_ranks = {'King', 'Queen', 'Jack'},
            lc_atlas = "testskin_clubs_lc",
            hc_atlas = "testskin_clubs_hc",
            pos_style = "suit"
        }
    },
}