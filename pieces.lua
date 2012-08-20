--This file declares all the pieces for the game

--Pawns
minetest.register_node(":chess:pawn",
{
    description = 'pawn',
    groups = {snappy = 2},
    tiles = {"chess_black.png"},
    drawtype = "nodebox",
    sunlight_propagates = true,
    paramtype = 'light',
    paramtype2 = "facedir",
    light_source = 8, --max light is 18
    node_box = {
    type = "fixed",
    fixed = {
    {-0.2, -0.5, -0.3, 0.2, -0.4, 0.3},
    {-0.3, -0.5, -0.2, 0.2, -0.4, 0.3},
    {-0.1, -0.4, -0.2, 0.1, -0.3, 0.2},
    {-0.2, -0.4, -0.1, 0.2, -0.3, 0.1},
    {-0.1, -0.3, -0.1, 0.1, 0.2, 0.1},
    {-0.2, -0.1, -0.1, 0.2, 0.1, 0.1},
    {-0.1, -0.1, -0.2, 0.1, 0.1, 0.2},
    },
    },
    selection_box = {
    type = "fixed",
    fixed = {-0.3, -0.5, -0.3, 0.3, 0.2, 0.3},
    },
    groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2}
})
