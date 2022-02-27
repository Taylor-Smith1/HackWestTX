extends ParallaxLayer

export(float) var couldSpeed = -15

func _process(delta):
	self.motion_offset.x += couldSpeed * delta
