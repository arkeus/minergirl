export class Spire extends Sprite
	new: (x, y) =>
		super x, y, "resource/spire.png"

		@height = 8
		@offset.y = 8