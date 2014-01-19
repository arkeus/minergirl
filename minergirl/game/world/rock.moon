export class Rock extends Sprite
	new: (x, y) =>
		super x, y, "resource/rock.png"

		@height = 8
		@offset.y = 8