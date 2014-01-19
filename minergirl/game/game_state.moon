require "minergirl.game.entity.player"
require "minergirl.game.world.world"
require "minergirl.game.world.rock"
require "minergirl.game.world.spire"

export class GameState extends State
	new: =>
		super!

		@objects = Group!
		@characters = Group!
		@mines = Group!
		@spires = Group!
		@rocks = Group!
		@bullets = Group!

		@player = Player 8, 32
		@world = World!
		@add_obstacles!

		@objects\add @player
		@add_all { @world, @mines, @objects, @bullets }

		@y_sort = (a, b) -> a.y + a.height < b.y + b.height

		@grid = GridCollider @world.width, @world.height

	update: =>
		super!
		table.sort @objects.members, @y_sort
		axel\collide @player, @world
		axel\collide @bullets, @world
		axel\collide @player, @objects, nil, @grid
		axel\collide @bullets, @objects, @bullet_callback, @grid

	bullet_callback: (bullet, object) =>
		bullet\destroy!
		object\destroy! if object.__class == Rock

	add_obstacles: =>
		for y = 0, World.HEIGHT
			for x = 0, World.WIDTH
				continue if @world\get_tile_at(x + 1, y + 1) != 0

				if x % 2 == 0 and y % 2 == 1
					@objects\add Spire x * World.TILE_SIZE, y * World.TILE_SIZE
				elseif (x < 3 and y < 6) or (x > World.WIDTH - 4 and y < 6) or (x < 3 and y > World.HEIGHT - 4) or (x > World.WIDTH - 4 and y > World.HEIGHT - 4) or (math.random! < 0.15)
					nil
				else
					@objects\add Rock x * World.TILE_SIZE, y * World.TILE_SIZE

	add_mine: (mine) =>
		@mines\add mine

	add_bullet: (bullet) =>
		@bullets\add bullet