extends Node2D

onready var camera = $PlayerCamera
onready var player = $Player
onready var background = $ParallaxBackground

var deathCounter = 0
var startPos = Vector2(56,106)

# Focusing camera on player position and death counter
func _process(_delta):
	camera.set_position(player.position)
	background.transform.y = player.transform.y
	if (player.position.y > 200):
		player.position.x = startPos.x
		player.position.y = startPos.y
		deathCounter+=1
		print("Death Counter: ",deathCounter)
	
# Escape key to pause Menu
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().change_scene("res://Menu/PauseMenu.tscn")
		
	



