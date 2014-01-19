require "minergirl.game.world.world"
require "minergirl.game.world.bullet"

export class Mine extends Sprite
	new: (x, y) =>
		super x * World.TILE_SIZE, y * World.TILE_SIZE, "resource/mine.png", 8, 8

		@height = 6
		@offset.y = 2

		@timers\add 0.5, 1, (-> @explode!)

	explode: =>
		axel\state!\add_bullet Bullet @center.x, @center.y, LEFT
		axel\state!\add_bullet Bullet @center.x, @center.y, RIGHT
		axel\state!\add_bullet Bullet @center.x, @center.y, DOWN
		axel\state!\add_bullet Bullet @center.x, @center.y, UP
		@destroy!