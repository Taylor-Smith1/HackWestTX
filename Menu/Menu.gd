extends Control

func _ready():
	pass

func _on_Start_pressed():
	get_tree().change_scene("res://World/Main.tscn")

func _on_Quit_pressed():
	get_tree().quit()

func _on_Exit_pressed():
	get_tree().quit()
