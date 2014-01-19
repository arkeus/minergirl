require "axel.library"
require "minergirl.title.title_state"
require "minergirl.game.game_state"

axel.create = =>
	axel\set_background_color Color 195, 156, 77

axel\initialize GameState, 4