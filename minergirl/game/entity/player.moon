require "minergirl.game.entity.character"

export class Player extends Character
	new: (x, y) =>
		super x, y, "resource/girl.png"

	update: =>
		@input!
		super!

	input: =>
		@velocity.x = if axel.keys\held "a" then -@speed! elseif axel.keys\held "d" then @speed! else 0
		@velocity.y = if axel.keys\held "w" then -@speed! elseif axel.keys\held "s" then @speed! else 0
		@velocity.y = 0 if @velocity.x != 0

		@lay_mine! if axel.keys\pressed " "