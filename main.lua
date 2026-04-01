
--- STEAMODDED HEADER
--- MOD_NAME: Joker Test
--- MOD_ID: JOKETEST
--- PREFIX: J
--- MOD_AUTHORS: [Jonathan Andrews and Joshua Sano]
--- MOD_DESCRIPTION: Test for learning how Jokers Work
--- PRIORITY: 
--- BADGE_COLOR: 
--- DISPLAY_NAME: 
--- VERSION: 0.1

SMODS.Atlas {
    key = 'Wha',
    px = 32,
    py = 32,
    path = 'Wha.png'
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
