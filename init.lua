-- CHESS MOD
-- ======================================
-- chess/init.lua
-- ======================================
-- Registers the basic chess stuff
--
-- Contents:
--
-- [regis] Spawn Block
-- [craft] Spawn Block
-- [regis] board_black
-- [regis] board_white
-- ======================================

dofile(minetest.get_modpath("chess").."/pieces.lua")
dofile(minetest.get_modpath("chess").."/rules.lua")

-- Register the spawn block
minetest.register_node(":chess:spawn",{
    description = "Chess Board",
    tile_images = {"chess_spawn.png"},
    inventory_image = "chess_spawn.png",
	groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
    after_place_node = function(pos)
        
        local size = 20
        local alternate = true
        
        for i = size, 0, -1 do
            for ii = size, 0, -1 do
            
                local p = {x=pos.x+i+1, y=pos.y, z=pos.z+ii+1}
                
                if alternate then
                    minetest.env:add_node(p, {name="chess:board_black"})
                    alternate = false
                else
                    minetest.env:add_node(p, {name="chess:board_white"})
                    alternate = true
                end
            end
            
            if (math.floor(size/2) ~= size/2) then
                if alternate then
                    alternate = false
                else
                    alternate = true
                end
            end
            
        end
	end,
})

-- Add crafting for the spawn block
minetest.register_craft({
    output="chess:spawn",
    recipe = {
        {'default:mese','default:mese','default:mese'},
        {'default:mese','default:mese','default:mese'},
        {'default:mese','default:mese','default:mese'},
    }
})

--Register the Board Blocks: white
minetest.register_node(":chess:board_white",{
    description = "White Chess Board Piece",
    tile_images = {"chess_white.png"},
    inventory_image = "chess_white.png",
    groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
})

--Register the Board Blocks: black
minetest.register_node(":chess:board_black",{
    description = "Black Chess Board Piece",
    tile_images = {"chess_black.png"},
    inventory_image = "chess_black.png",
    groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
})
