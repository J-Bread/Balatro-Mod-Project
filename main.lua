assert(SMODS.load_file("testJoker.lua"))()

--- STEAMODDED HEADER
--- MOD_NAME: Joker Test
--- MOD_ID: JOKETEST
--- PREFIX: J
--- MOD_AUTHORS: [Jonathan Andrews and Joshua Sano]
--- MOD_DESCRIPTION: Test for learning how Jokers Work
--- PRIORITY:1000
--- BADGE_COLOR: 
--- DISPLAY_NAME: 
--- VERSION: 0.1

SMODS.Atlas {
    key = 'Test_icon',
    px = 32,
    py = 32,
    path = 'Test_icon.png'
}

-- ( Test, Clubs ) 

SMODS.Atlas {
    key = "Test_clubs_lc",
    path = "Test_card_lc.png",
    px = 71,
    py = 95,
}
SMODS.Atlas {
    key = "Test_clubs_hc",
    path = "Test_card_hc.png",
    px = 71,
    py = 95,
}

SMODS.DeckSkin {
    key = "TestClubs",
    suit = "Clubs",
    loc_txt = "Test",
    palettes = {
        {
            key = 'lc',
			ranks = {'Jack', 'Queen', "King"},
            display_ranks = {"King", "Queen", "Jack"},
            atlas = "custom_atlas",
            pos_style = "suit"
        },
        {
            key = 'hc',
			ranks = {'Jack', 'Queen', "King", "Ace"},
            display_ranks = {"King", "Queen", "Jack"},
            atlas = "custom_atlas",
            pos_style = "suit"
        }
    },
}
