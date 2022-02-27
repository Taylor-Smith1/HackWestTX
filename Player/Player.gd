extends KinematicBody2D

const SPEED = 180
const JUMPFORCE = -400
const GRAVITY = 30
const FRICTION = 3

const timePeriod = 3
var time = 0

var velocity = Vector2(0,0)
var SPEED2 = SPEED
var NumJumps = 1

var slideSpeed = 0
var t = Timer.new()


var numCoin = 0

#var jumping = false
onready var animationPlayer = $AnimationPlayer

func _physics_process(_delta):
	velocity.y = velocity.y + GRAVITY
	# Movement up
	if Input.is_action_just_pressed("ui_up") and NumJumps < 2:
		velocity.y = JUMPFORCE
		NumJumps += 1
		if velocity.y != 30:
			animationPlayer.play("Jump")
	# Movement down(slide)------------------------------------------------------
	elif Input.is_action_pressed("ui_down"):
		$CollisionShape2D2.disabled = false
		$CollisionShape2D.disabled = true
		if $Sprite.flip_h == false:
			velocity.x = SPEED2 + slideSpeed
			
		else:
			velocity.x = -SPEED2 + slideSpeed
		
		animationPlayer.play("Slide")
	#movement Right
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$Sprite.flip_h = false
		animationPlayer.play("RunRight")
	# movement left
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$Sprite.flip_h = true
		animationPlayer.play("RunLeft")
	else:# (Input.is_action_pressed("ui_left") == false || Input.is_action_pressed("ui_right") == false):
		#if velocity.y != 30:
			#animationPlayer.play("Jump")
		if velocity.y == 30:
			animationPlayer.play("IdleRight")
	if(is_on_floor()):
		NumJumps = 1
	if !Input.is_action_pressed("ui_down"):
		$CollisionShape2D2.disabled = true
		$CollisionShape2D.disabled = false
	if(SPEED2 <= 0):
		SPEED2 = SPEED
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.2)
	
	if numCoin == 6:
		get_tree().change_scene("res://Scenes/Level-1-BG.tscn")
	
func addCoin():
	numCoin = numCoin + 1
	print("Coins: ", numCoin)
