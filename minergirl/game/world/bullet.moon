export class Bullet extends Sprite
	@speed: 100

	new: (x, y, direction) =>
		super x - 2, y - 2, "resource/bullet.png"

		@velocity.x = if direction == LEFT then -@@speed elseif direction == RIGHT then @@speed
		@velocity.y = if direction == UP then -@@speed elseif direction == DOWN then @@speed

	update: =>
		@destroy! if @touching\any!
		super!