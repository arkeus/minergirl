require "minergirl.game.world.world"
require "minergirl.game.entity.mine"

export class Character extends Sprite
	new: (x, y, resource) =>
		super x, y, resource, 8, 16

		anim_walk_speed = 4
		@flip = NONE
		@direction = "down"

		@width = 6
		@offset.x = 1
		@height = 4
		@offset.y = 12

		with @animations
			\add "walk-up", { 1, 0, 1, 2 }, anim_walk_speed
			\add "walk-right", { 4, 3, 4, 5 }, anim_walk_speed
			\add "walk-down", { 7, 6, 7, 8 }, anim_walk_speed
			\add "walk-left", { 10, 9, 10, 11 }, anim_walk_speed
			\add "stand-up", { 1 }
			\add "stand-right", { 4 }
			\add "stand-down", { 7 }
			\add "stand-left", { 10 }
			\play "stand-down"

	update: =>
		@animate!
		super!

	lay_mine: =>
		mine_x = math.floor @center.x / World.TILE_SIZE
		mine_y = math.floor @center.y / World.TILE_SIZE
		game = axel\state!
		game\add_mine Mine mine_x, mine_y

	animate: =>
		@direction = if @velocity.y < 0
			"up"
		elseif @velocity.y > 0
			"down"
		elseif @velocity.x > 0
			"right"
		elseif @velocity.x < 0
			"left"

		anim_type = if @velocity\is_zero! then "stand" else "walk"
		@animations\play anim_type .. "-" .. @direction 

	speed: => 50